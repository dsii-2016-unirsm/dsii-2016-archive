

// ONDA
int xspacing = 20;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
float theta = 0.0;  // Start angle at 0
float periodo = 1;
float amplitude = 50;  // Height of wave
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

// COLORE
int minL = 380;
int maxL = 780;
float R, G, B, factor;
float Gamma = 0.80;


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

void setup() {
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  fullScreen();
  textAlign(CENTER);

  w = width+16;
  yvalues = new float[w/xspacing];
  amplitude = height/2;
}

int pause=0;
int timer=0;
float valoreOnda =0;
  
  
void draw() {

  //LEGGE E SCRIVE I VALORI DEL SENSORE PIEZOELETTRICO DA ARDUINO
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
  }
 println(val);
  
  colorMode(RGB);
  
// PER IL FUNZIONAMENTO DELLO SKETCH SENZA SENSORE
//  float valoreOnda = map(mouseX, 0, width, maxL, minL); 

  timer++;
  if(timer>4){
  // DEFINISCE VALORE ONDA:MAPPA I VALORI LETTI DAL SENSORE SU UN RANGE DA minL A maxL
    valoreOnda = map(val, 0, 50, maxL,  minL);
      timer=0;
   }
  
  // DISEGNA L'ONDA PER IL VIDEO
  periodo = valoreOnda;
  dx = (TWO_PI / periodo) * xspacing;

  //CONVERSIONE LUNGHEZZA D'ONDA-RGB      COLORE SCHERMO PER IL VIDEO O COLORE DEL LED
  if (valoreOnda >= 380 && valoreOnda < 440) {
    R =  -1 * (valoreOnda - 440) / (440 - 380);
    G= 0;
    B = 1;
  } else if (valoreOnda >= 440 && valoreOnda < 490) {
    R = 0;
    G = (valoreOnda - 440) / (490 - 440);
    B = 1;
  } else if (valoreOnda >= 490 && valoreOnda < 510) {
    R = 0;
    G  = 1;
    B = -1 * (valoreOnda - 510) / (510 - 490);
  } else if (valoreOnda >= 510 && valoreOnda < 580) {
    R = (valoreOnda - 510) / (580 - 510);
    G = 1;
    B= 0;
  } else if (valoreOnda >= 580 && valoreOnda < 645) {
    R = 1;
    G = -1*(valoreOnda - 645) / (645 - 580);
    B = 0;
  } else if (valoreOnda >= 645 && valoreOnda <= 780) {
    R = 1;
    G = 0;
    B = 0;
  } else {
    R = 0;
    G = 0;
    B = 0;
  }
 // intensty is lower at the edges of the visible spectrum.
 if (valoreOnda >= 380 && valoreOnda <420) {
    factor = 0.3 + 0.7*(valoreOnda - 380) / (420 - 380);
  } else if (valoreOnda >= 420 && valoreOnda <701) {
    factor = 1.0;
  } else if (valoreOnda >= 701 && valoreOnda <781) {
    factor = 0.3 + 0.7*(780 - valoreOnda) / (780 - 700);
  } else {
    factor = 0.0;
  };
  if (R != 0) {
    R = round( 255 * pow(R * factor, Gamma));
  }
  if (G != 0) {
    G = round(255 * pow(G * factor, Gamma));
  }
  if (B != 0) {
    B = round(255 * pow(B * factor, Gamma));
  }

// PER IL VIDEO
  background(R, G, B);
  
// PER IL LED_PASSA I VALORI DI R, G, B AD ARDUINO  
if(R>0)
    myPort.write('R');         
  if(G>0)
    myPort.write('G');    
      if(B>0)
    myPort.write('B');    
//} else {
  //background(255);
//}

  calcWave();
  renderWave();

 // TESTO PER IL VIDEO
  text("R " + R+ " / G " + G + "/ B " + B, width/2, height/2);
  text("Lungh. " + valoreOnda + " nanometri "+ val, width/2, height/2-30);
} 

void calcWave() {

  theta += 0.02;
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {

  strokeWeight(8);
  for (int x = 0; x < yvalues.length; x++) {
  fill(0);
  point(x*xspacing, height/2+yvalues[x]);
  }
}
