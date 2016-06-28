/* .. */
// -
// AboutMe by Francesca Romana Rossi [pulse, hologram]
// 2016 © Francesca Romana Rossi, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino
// —
//
/*-----------------------------------
 3d visualization engine based on example 
 IsoSkeleton from library ComputationalGeometry 
 by: Mark Collins & Toru Hasegawa
 ------------------------------------*/
import processing.pdf.*;
import ComputationalGeometry.*;
IsoSkeleton skeleton;

/*import processing.serial.*;
 
 Serial myPort;  // Create object from Serial class
 int val;      // Data received from the serial port
 */

PGraphicsPDF pdf; 

int b = 0, bpm = 0, t;
boolean battito = false, cresci = true;
int battitoTempo;
int maxRate = 200;
float d;

float y = 0.01, x = 0.01, z = 0.01;






void setup() {
  //fullScreen(P3D);
  size(900, 900, P3D);
  noSmooth();
  
  

// GO FIND THE ARDUINO
  println(Serial.list());    // print a list of available serial ports
  // choose the number between the [] that is connected to the Arduino
  port = new Serial(this, Serial.list()[1], 115200);  // make sure Arduino is talking serial at this baud rate
  port.clear();            // flush buffer
  port.bufferUntil('\n');  // set buffer full flag on receipt of carriage return
  
  
  
  


  /*  // Data received from the serial port
   String portName = Serial.list()[1]; // numero della porta in questione presa da arduino
   myPort = new Serial(this, portName, 9600);
   println(Serial.list() );//vedere tutte le porte usb
  /*sopra^ : indica la porta di comunicazione*/

  // Create iso-skeleton
  skeleton = new IsoSkeleton(this);

  // Create points to make the network
  PVector[] pts = new PVector[10];
  for (int i=0; i<pts.length; i++) {
    pts[i] = new PVector(random(-100, 100), random(-100, 100), random(-100, 100) );
    //pts[i] = new PVector(50, -20, 75 );
  }  

  for (int i=0; i<pts.length; i++) {
    for (int j=i+1; j<pts.length; j++) {
      if (pts[i].dist( pts[j] ) < 150) {
        skeleton.addEdge(pts[i], pts[j]);
      }
    }
  }
}

float pulsazione=10;
float temperatura=36.5;
int pulsazioneMap, temperaturaMap;
int varE = 0, varN = 0;

void keyReleased() {
  if (key == ' ') {
    beat();
  }
}

void beat() {
  if (battito == false) {
    b++;
    battito=true;
    battitoTempo=frameCount;
  }
}

void draw() {
 //frameRate(100);  
  background(0);
  lights(); 
  
  
  if (beat == true){   // move the heart rate line over one pixel every time the heart beats 
     println("beat");
   beat();
   beat = false;      // clear beat flag (beat flag waset in serialEvent tab)

// then limit and scale the BPM value
   BPM = min(BPM,200);                     // limit the highest BPM value to 200
   float dummy = map(BPM,0,200,555,215);   // map it to the heart rate window Y
      // set the rightmost pixel to the new data point value
 } 
  

  /*if ( myPort.available() > 0) {  // If data is available,
   val = myPort.read();          // read it and store it in val
   }
   println(val);
   pulsazione=val;
   */

  //pulsazioneMap=map(pulsazione,minSensore,0,800);
  //float pulsazioneMap=map(pulsazione, 0, 1, 400, 800);
  float temperaturaMap=map(temperatura, 35, 42, 100, 255);

  float zm = 200;
  float sp = 0.001 * frameCount;
  //camera(zm * cos(sp), zm * sin(sp), zm, width/2, height/2, 0, 0, 0, -1);
  //camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

  x += .01;
  y += .01;


  //bpm massimo = 200
  if (bpm >= 200) bpm = 200;

  //orologio
  t=(int) millis()/1000;

  // calcola i bpm ogni 15 secondi
  if (frameCount%(60*15) == 0) {
    bpm = b*4;
    b=0;
  }
  //text(frameRate+"\nbattiti: " + b +"\nbpm: " + bpm + "\ntempo: " + t, width/2, height/2-30);

  // per simulazione usare il mouse:
  /*varE = (int) map(mouseX, 0, width, 0, 4000);
   varN = (int) map(mouseY, 0, width, 0, 2)*1500;
   */

  // battito in tempo reale
  if (battito) {
    varN=300;
    if (frameCount-battitoTempo > (60*60)/maxRate) 
    {
      battito = false;
    }
  } else {
    varN=0;
  }

  // battito bpm
  if (bpm > 0) {
    int min = 0;
    int var = 1000;
    int frameNecessari = int(( 60 * 60 / bpm ) / 2);
    float delta = var / frameNecessari;
    if (cresci) varE += delta; 
    else varE -= delta;
    if (varE>=min+var) cresci = false;
    if (varE<=min) cresci = true;
  }


  pushMatrix();
  translate(3*width/4 + 50, height/2, 0);
  //translate(3*width/4 - 150, height/2, 0);
  noStroke();
  fill(230, 30, 90, 90);
  rotateZ(0);
  rotateX(x);
  rotateY(y);
  skeleton.plot(10.f * varE / (2.0f*width), varN / (2.0*height));  // Thickness as parameter
  popMatrix();

  pushMatrix();
  translate(width/2, 3*height/4 + 50, 0);
  //translate(width/2, 3*height/4, 0);
  noStroke();
  //fill(temperaturaMap);
  fill(230, 30, 90, 90);
  rotateZ(PI/2);
  rotateX(x);
  rotateY(y);
  skeleton.plot(10.f * varE / (2.0f*width), varN / (2.0*height));
  popMatrix();

  pushMatrix();
  translate(width/4 - 50, height/2, 0);
  //translate(width/4 + 150, height/2, 0);
  noStroke();
  //fill(temperaturaMap);
  fill(230, 30, 90, 90);
  rotateZ(PI);
  rotateX(x);
  rotateY(y);
  skeleton.plot(10.f * varE / (2.0f*width), varN / (2.0*height));
  popMatrix();

  pushMatrix();
  translate(width/2, height/4 - 50, 0);
  //translate(width/2, height/4, 0);
  noStroke();
  //fill(temperaturaMap);
  fill(230, 30, 90, 90);
  rotateZ(3*PI/2);
  rotateX(x);
  rotateY(y);
  skeleton.plot(10.f * varE / (2.0f*width), varN / (2.0*height));
  popMatrix();
}
