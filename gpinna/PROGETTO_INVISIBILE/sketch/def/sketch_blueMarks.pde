// - //<>//
// Sketch_blueMarks 0.1 by GiovannaPinna [tracce, petrolio]
// 2016 © GiovannaPinna, Giovip @giovip and the course DSII2016 @UniRSM  
// github.com/giovip — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino
// —
// Credits to Fupete url
// —
//
// Help:
// [press key] flicker
// [press key and drag] change speed
//



import processing.serial.*;

Serial myPort;
String valori; 

int min = -100;
int max = 100;

boolean vibra = false; 

int conta = 0;
float radius, angle, angleP;
int numPoints;
boolean cresci = true;
int vel = 1;
int data;

IntList Valori;
int totValori = 100;  // < numero di valori a caso da generare
int quale = 0;
int valore = 0, valoreP = 0;

int ora, prima = 0;

PGraphics accade;     // < schermo virtuale


void setup() {
  //fullScreen();
  size(600, 700);
  String portName = Serial.list()[2];
  myPort = new Serial(this, Serial.list()[2], 9600);

  accade = createGraphics(width, height); // < disegnamo in uno schermo "virtuale"...

  accade.beginDraw();
  accade.background(250);
  accade.strokeWeight(2);
  accade.stroke(0, 0, 255);
  accade.endDraw();

  radius = width/2;
  numPoints = 60;
  angle = (PI/2) / (float) numPoints;
  angleP = angle*0 + PI/2 + PI/4 + PI;

  // genera totValori valori a caso per test
  Valori = new IntList();
  String[] valoriStringhe = loadStrings("dati_petrolio.txt");
  //int data = (int) trim (valore); 

  for (int i=0; i<valoriStringhe.length; i++) {
    float valore = float(valoriStringhe[i]);
    float valoreRimappato = map (valore*20, min, max, 0, 60); 
    println(valore + ":" + valoreRimappato);
    Valori.append(int(valoreRimappato));
  }

  /*for (int i = 0; i < totValori; i++) {
   Valori.append( (int) random( 0, 59) ); // < funziona solo con valori tra 0 e 59... 
   // per restare nell'intervallo di 1sec in caso rimapparli 
   // così durante la lettura o il riempimento dell'array!
   } */
}

void draw() {


  if (myPort.available() > 0) 
  {  // If data is available,
    valori = myPort.readStringUntil('\n');         // read it and store it in val
  } 

  /* if (mousePressed == true) 
   {                           //if we clicked in the window
   myPort.write('1');         //send a 1
   println("1");   
   } else 
   {                           //otherwise
   myPort.write('0');          //send a 0
   }  */

  println(valori); //print it out in the console 

  background(250);

  ora = millis()/1000;          // < istante corrente

  if (mousePressed)             // < con il mouse controlli la velocità, premi e vai su/giù
    vel = (int) map(mouseY, 0, height, 1, 50);

  if (ora - prima >= 1) {       // < se è passato almeno 1 secondo dal dato precedente
    valoreP = valore;           // il valore precedente
    valore = Valori.get(quale); // il nuovo valore
    quale++;                    // l'indice del prossimo valore
    if (quale >= Valori.size()) quale = 0;   // se è l'ultimo valore disponibile nell'array torna al primo
    if (valoreP >= valoreP) {
      cresci = false;
      /* +++ */
      // motore vs destra setta velocità
      /* +++ */
    }  // vedi se crescere o decrescere...
    else {
      cresci = true;
      /* +++ */
      // motore vs sinistra setta velocità
      /* +++ */
    } 
    prima = ora;                // riparti il conteggio di 1 secondo
  }

  //motore.parti velocità 1

  accade.beginDraw();

  /* scritta in alto 
   accade.pushStyle();
   accade.noStroke();
   accade.fill(0);
   accade.rect(0, height-25, width, height);
   accade.fill(200);
   accade.textSize(30);
   accade.text("Blue Marks", 20, height-650);
   accade.popStyle(); */

  /* dettagli info in basso */
  accade.pushStyle();
  accade.noStroke();
  accade.fill(0);
  accade.rect(0, height-25, width, height);
  accade.fill(255);
  accade.textSize(14);
  accade.text("Valore: " + valore 
    + "     Tempo: " + ora + "sec"
    + "     Velocità carta: " + vel, 
    20, height-7);
  accade.popStyle();


  accade.pushMatrix();
  accade.translate(width/2, width/30);    // < ora spostiamoci al centro dell'ago di disegno

  float a = angle*conta + PI/2 + PI/4 + PI;
  accade.line(radius*sin(a), radius*cos(a), radius*sin(angleP), radius*cos(angleP));

  if (cresci) // < senso antiorario, verso sinistra cresce
  {
    if (vibra) conta++; // continua a crescere
    if (conta >= valore) {
      cresci = false; // < sei arrivato!
      /* +++ */
      // motore stop();
      /* +++ */
    } else conta++;
  } else {    // < senso orario, verso destra decresce
    if (vibra) conta--; // continua a decrescere
    if (conta <= valore) {
      cresci = true;  // < sei arrivato!
      /* +++ */
      // motore stop();
      /* +++ */
    } else conta--;
  }

  //ora la carta scorre verso il basso...
  PImage statoImg = accade.get(0, 0, width, height-30);
  accade.set(0, vel, statoImg);

  accade.popMatrix();

  //ed ecco la simulazione della gomma...
  accade.pushStyle();
  accade.fill(250, 150);
  accade.noStroke();
  accade.rect(conta*width/60, height-200, 30, 80);
  accade.popStyle();

  accade.endDraw();

  image(accade, 0, 0); // < infine stampo lo schermo virtuale

  // infine stampo sullo schermo reale l'ago e la gomma...
  pushMatrix();
  stroke(0);
  noFill();
  strokeWeight(3);
  translate(width/2, width/30); 
  ellipse(0, 0, 20, 20);
  line(0, 0, radius*sin(a), radius*cos(a));
  ellipse(radius*sin(a), radius*cos(a), 20, 20);

  popMatrix();
  line( conta*width/60+15, height, conta*width/60+15, 600); 
  //line(conta*width/60+15, height/8+40, conta*width/60+15, 0);
  rect(conta*width/60, height-180, 30, 80);

  // memorizzo l'angolo attuale come precedente per il prossimo giro di loop...
  angleP = a;
}

void keyPressed() {
  vibra = !vibra;
}
