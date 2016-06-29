// -
// Nomefile 0.1 by Raffaella Barone [colore, onda]
// 2016 © Raffaella Barone, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino
// —
// Credits to / Original code inspired on / Sine Wave by Daniel Shiffman. 
// https://processing.org/examples/sinewave.html
// —
// Il codice associa a intensità di vibrazione, rilevate da un sensore piezoelettrico,
// valori RGB in base alla lunghezza d'onda dei colori dello spettro visibile
// 
// —

//  ONDA
int xspacing = 20;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
float theta = 0.0;  // Start angle at 0
float periodo = 1;
float amplitude = 50;  // Height of wave
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
  w = width+16;
  yvalues = new float[w/xspacing];
  amplitude = height/2;
  
// COLORE
int minL = 380;
int maxL = 780;
float R, G, B, factor;
float Gamma = 0.80;

//ARDUINO
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

void setup() {
  //size(800, 270);
  fullScreen();
  textAlign(CENTER);
  
  //PORTA SERIALE
  arduino = new Arduino(this, Arduino.list()[0], 57600);
    

  
}

int vibrazione=0;

void draw() {
  colorMode(RGB);
  if(arduino.analogRead(0)>0){
  vibrazione=arduino.analogRead(0);
  println(arduino.analogRead(0));
  
  }
 
//MAPPA I VALORI DI VIBRAZIONE SU maxL - minL ( 780 - 380)
 float valoreOnda = map(vibrazione*40, 0, width,  maxL, minL);
  periodo = valoreOnda;
  dx = (TWO_PI / periodo) * xspacing;

//ASSOCIA VALORI SU MAPPATI A VALORI RGB
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
//PASSA VALORI RGB AD ARDUINO
  arduino.analogWrite(11, int(R));
  arduino.analogWrite(10, int(G));
  arduino.analogWrite(9, int(B));
  background(R, G, B);

  calcWave();
  renderWave();


  text("R " + R+ " / G " + G + "/ B " + B, width/2, height/2);
  text("Lungh. " + valoreOnda + " nanometri ", width/2, height/2-30);
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