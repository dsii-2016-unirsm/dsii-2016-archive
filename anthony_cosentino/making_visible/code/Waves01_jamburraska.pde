// Waves 01 by anthonycosentino [electromagnetics, sound]
// 2016 © anthonycosentino, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm 
// Educational purposes, MIT License, 2016, San Marino
// —
// Transforms the electromagnetic frequencies into the equivalent binary value, 
// and shows the value as a set of black and white lines, like a barcode.

import netP5.*;
import oscP5.*;
import processing.serial.*;

//Porte comunicazione arduino
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port

//Librerie correlate OSC
OscP5 oscP5;
NetAddress myRemoteLocation;

//Clip Ableton
int suono = 0;
IntList clips;

//Porte di comunicazione OSC
int inPort = 9001;
int outPort = 9000;

// Valore linee
String valoreBinario;
int valore = 50;
int x=0;
int y=0;



void setup() {
  //setup arduino 
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  println(Serial.list());
  myPort = new Serial(this, portName, 9600); 

  //OSC Server
  oscP5 = new OscP5(this, inPort);
  //Indirizzo remoto
  myRemoteLocation = new NetAddress("localhost", 9000);
  smooth();
  clips = new IntList();
  for (int i=0; i<5; i++) {
    clips.append(0);
  }

  frameRate(100);
  fullScreen(P3D);
  //size(500, 500);
  println(valore);
}


void draw() {

  if ( myPort.available() > 0) 
  {  // If data is available,
    val = myPort.readStringUntil('\n');
  } 
  if (val == null) val = "0";
  println(sensore);

  if (sensore<=30) {
    stopMusic();
  }
  if (sensore>30) {

    //durata singola riga
    //delay(1000);
    valoreBinario = binary(int(sensore));
    valoreBinario = valoreBinario.substring(25, 29);


    int larghezzalinea=10;
    int attuale = frameCount%valoreBinario.length();
    char currentValue = valoreBinario.charAt(attuale);

    println(valoreBinario, attuale);
    if (currentValue == '1') {

      stroke(255);
      fill(255);

      //Istruzioni audio - messaggi Ableton
      //Riproduco clip della traccia 2 
      OscMessage myMessage = new OscMessage("/live/play/clip"); //quando premo un pulsante qualsiasi fai partire una clip
      myMessage.add(1); //traccia 2 Ableton
      myMessage.add(suono); //clip all'interno della traccia
      oscP5.send(myMessage, myRemoteLocation);
      clips.set(suono, 1); //parte la clip "quale" dalla traccia 2
      println("played clip: " + suono);
      suono++;
      if (suono == 3) suono = 0;
    } else {
      stroke(0);
      fill(0);
      println("clicked stop");
      //Metto in stop la traccia 2 lasciando invariate le altre
      OscMessage myMessage = new OscMessage("/live/stop/track"); //quando premo un pulsante qualsiasi fai partire una clip
      myMessage.add(1); //traccia 2 Ableton
      oscP5.send(myMessage, myRemoteLocation);
      //stopMusic();
    }

    //linee codice a barre
    rect(x, y, larghezzalinea, 2000);
    x+=larghezzalinea;
    if (x>=width) {
      x=0;
    }
  }// controllo sensore
} // draw

int sensore=0;

//porta seriale arduino
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String val = myPort.readStringUntil('\n');
  if (val != null) {
    // trim off any whitespace:
    val = trim(val);
    // convert to an int and map to the screen height:
    float radius = float(val);
    radius = map(radius, 0, 100, 0, 100);
    // draw the line:
    sensore=int(val);
  }
}



void stopMusic() {

  OscMessage myMessage = new OscMessage("/live/stop");
  myMessage.add(1); //numero traccia 3
  boolean trovato = false;
  for (int i=0; i<clips.size(); i++) {
    if (clips.get(i) == 1) {
      if (!trovato) {
        myMessage.add(i);
        clips.set(i, 0);
        trovato = true;
        println("stopped clip:" + i);
      }
    }
  }
  // numero clip
  oscP5.send(myMessage, myRemoteLocation);
}
