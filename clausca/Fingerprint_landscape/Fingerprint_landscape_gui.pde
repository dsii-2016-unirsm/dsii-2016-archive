// Fingerprint landscape by clausca_claudia scandura
// 2016 © clausca, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino
// —
// Credits to Anastasis Chasandras / Original code inspired on http://www.openprocessing.org/sketch/9290 / Original code by Anastasis Chasandras
// Credits to Daniel Shiffman / https://github.com/shiffman/Video-Lesson-Materials/tree/master/code_challenges/PerlinNoiseTerrain
// —

// Fingerprint heightmap to wireframe mesh. 
// Load a b/n fingerprint image scan and extrudes whitepixels into a 3D Mesh.
// The altitude of each vertex will be calculated depending on the colour of each 
// of the image pixels. Black colour will represent the lowest value and white the highest one.
// —

// keys:
// [mouse LEFT/RIGHT] ... rotates camera
// [mouse UP/DOWN] ...... zooms out/in
// Key [r] ... export .OBJ
// key [s] ... save frame 
// —


import nervoussystem.obj.*;   //export obj
boolean record;
boolean toggle = true;
boolean toggle2 = true;

//SOUND
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer mySound;
AudioMetaData meta;

import controlP5.*;
Textarea myTextarea; 

//GUI

ControlP5 gui;
ControlP5 cp5;
float altitude = 20;             //height pixel

int fill_v1 = 255;               //fingerprint color
int fill_v2 = 255;  
int fill_v3 = 255;
int background_v1 = 64;        //background color
int background_v2 = 64;
int background_v3 = 64;
boolean rgbFlag = true;
//END GUI

PImage img ;
float a; //linea scanner
//PFont font;

float rotationY = 0; 
float rotationX = 0;
float rotationZ = 0;
float hgt=0;

float increment = 0.02;
float zoff = 0.0;  

//TERRAIN
int meshSize = 3;
int W = 200;                                  //fingerprint grid/terrain width
int H = 200;                                 //fingerprint grid/terrain height
float[][] finger = new float[W][H];         //fingerprint grid



void setup() {

  //MUSIC_OPTIONAL
   minim = new Minim(this);
   mySound = minim.loadFile("s.mp3");
   mySound.play();
   meta = mySound.getMetaData();
   mySound.loop(); 
   
  //CP5
  cp5 = new ControlP5(this);

  //CP5 change the original colors
  cp5.setColorForeground(#67bfcb);    
  cp5.setColorBackground(#017787);   
  cp5.setColorActive(#99d4dc);      

  // TEXT CP5 
  myTextarea = cp5.addTextarea("txt")
    .setPosition(width/2, 30)
    .setSize(400, 400)
    .setFont(createFont("Courier", 13))
    ;

  fullScreen(P3D);
  //size(1024, 758, P3D);
  colorMode(RGB, 255, 255, 255);
  noSmooth();

  // create a toggle //change visualization wireframe_shading
  cp5.addToggle("toggle")
    .setPosition(52, 85+30)
    .setSize(50, 15)
    .setCaptionLabel("visualization")
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;
  // create a toggle //rotation over X, Y, Z axis
  cp5.addToggle("toggle2")
    .setPosition(52, 120+30)
    .setSize(50, 15)
    .setCaptionLabel("rotation")
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;

  a= height-150; //line scanner

  gui = new ControlP5(this);
  setupGui();
  load();
}

//LOAD IMAGE
void load() {
  img = loadImage("1.jpg");
  img.loadPixels();
  println(img.width+" "+img.height);
}

void draw() {
  lights();
  //background(color(background_v1, background_v2, background_v3));
  background(0);
  noiseSeed(10);
  noiseDetail(18, 0.3);

  if (record) {
    beginRecord("nervoussystem.obj.OBJExport", "finger.obj");
  }

  float xoff = 0.0; 

  for (int x = 0; x < W; x++) {
    xoff += increment;   
    float yoff = 0.0;   
    for (int y = 0; y < H; y++) {
      yoff += increment; 
      float z = noise(xoff, yoff, zoff)*100;
      finger[x][y] = -map(brightness(img.get(x, y)), 0, 255, z, altitude);
    }
  }

  pushMatrix();

  translate(width/2, height/2, mouseY); 
  if (toggle2==true) {   //stop the rotation over X, Y, Z axis
    rotateY(rotationY);
    rotateX(rotationX);
    rotateZ(rotationZ);
    rotateX(radians(60));
  } else {               //rotation over X, Y, Z axis
    rotateY(rotationY);
    rotateX(rotationX);
    rotateZ(rotationZ);
    rotateY(frameCount * 0.005); //dynamic frameCount-based rotation over the Y axis
    rotateX(radians(60));       // fixed rotation of 60 degrees over the X axis
    rotateZ(frameCount*0.005); // dynamic frameCount-based rotation over the Z axis
  }


  translate(-W/2*meshSize, -H/2*meshSize);

  for (int x = 0; x < W-1; x++) {
    for (int y = 0; y < H-1; y++) {

      beginShape(QUADS);

      vertex(x*meshSize, y*meshSize, finger[x][y] );                //up point vertex (the first) coodinate (x,y,z)
      vertex((x+1)*meshSize, y*meshSize, finger[x+1][y] );         //up point vertex(the second)  coodinate (x+1,y,z)
      vertex((x+1)*meshSize, (y+1)*meshSize, finger[x+1][y+1] );  //down point vertex(the second) coodinate (x+1,y+1,z) 
      vertex(x*meshSize, (y+1)*meshSize, finger[x][y+1] );       //down point vertex (the first) coodinate (x,y+1,z) 
      endShape(CLOSE);

      if (toggle==true) {
        noStroke();      
        fill(finger[x][y]+100+fill_v1, x*meshSize-250+fill_v2, fill_v3); 
      } else {
        noFill();
        stroke(color(fill_v1, fill_v2, fill_v3));
      }
    }
  }

  popMatrix();
  zoff += increment; // Increment zoff

  //EXPORT OBJ.
  if (record) {
    endRecord();
    record = false;
  }
  drawImage();
}
//end Draw

void drawImage() {
  image(img, width-150, height-150, 150, 150); //image scan
  stroke(color(#cc0909));  //line scanner 
  line(width-150, a, width, a);
  a = a + 2;
  if (a > height) { 
    a = height-150;
  }
}

void mouseDragged()
{
  rotationY+= map(mouseX-pmouseX, 0, 100, 0, 2);
  rotationX+= map(mouseY-pmouseY, 0, 100, 0, 2);
  rotationZ+= map(mouseY-pmouseY, 0, 100, 0, 2);
}


//GUI
void setupGui() {
  cp5 = new ControlP5(this);

  Group g1 = gui.addGroup("gui")
    .setPosition(52, 180+30)
    .setSize(100, 50)
    ;

  gui.addSlider("altitude")
    .setPosition(0, 20)
    .setRange(10, 500)
    .setHeight(15)
    .setGroup(g1)
    ;

  gui.addSlider("fill_v1")
    .setPosition(0, 50)
    .setRange(0, 255)
    .setValue(74)
    .setHeight(15)
    .setCaptionLabel("fill red")
    .setGroup(g1)
    ;

  gui.addSlider("fill_v2")
    .setPosition(0, 80)
    .setRange(0, 255)
    .setValue(90)
    .setHeight(15)
    .setCaptionLabel("fill green")
    .setGroup(g1)
    ;

  gui.addSlider("fill_v3")
    .setPosition(0, 110)
    .setRange(0, 255)
    .setValue(255)
    .setHeight(15)
    .setCaptionLabel("fill blue")
    .setGroup(g1)
    ;

  /*gui.addSlider("background_v1")
   .setPosition(0, 180)
   .setRange(0, 255)
   .setValue(0)
   .setHeight(15)
   .setCaptionLabel("background red")
   .setGroup(g1)
   ;
   
   gui.addSlider("background_v2")
   .setPosition(0, 210)
   .setRange(0, 255)
   .setValue(0)
   .setHeight(15)
   .setCaptionLabel("background green")
   .setGroup(g1)
   ;
   
   gui.addSlider("background_v3")
   .setPosition(0, 240)
   .setRange(0, 255)
   .setValue(0)
   .setHeight(15)
   .setCaptionLabel("background blue")
   .setGroup(g1)
   ;*/

  //BUTTON TO CHANGE FINGERPRINT
  cp5.addButton("F_01")
    .setValue(0)
    .setPosition(0+52, 30)
    .setSize(50, 20)
    ;
  cp5.addButton("F_02")
    .setValue(0)
    .setPosition(52+52, 30)
    .setSize(50, 20)
    ;
  cp5.addButton("F_03")
    .setValue(0)
    .setPosition(104+52, 30)
    .setSize(50, 20)
    ;
  cp5.addButton("F_04")
    .setValue(0)
    .setPosition(0+52, 22+30)
    .setSize(50, 20)
    ;
  cp5.addButton("F_05")
    .setValue(0)
    .setPosition(52+52, 22+30)
    .setSize(50, 20)
    ;
  cp5.addButton("F_06")
    .setValue(0)
    .setPosition(104+52, 22+30)
    .setSize(50, 20)
    ;
  cp5.addButton("F_07")
    .setValue(0)
    .setPosition(0+52, 44+30)
    .setSize(50, 20)
    ;
  cp5.addButton("F_08")
    .setValue(0)
    .setPosition(52+52, 44+30)
    .setSize(50, 20)
    ;
  cp5.addButton("F_09")
    .setValue(0)
    .setPosition(104+52, 44+30)
    .setSize(50, 20)
    ;
}

public void F_01(int theValue) {
  println("a button event from change: "+theValue);
  img=loadImage("1.jpg");
  img.loadPixels();
  myTextarea.setText("anthony fingerprint");
}
public void F_02(int theValue) {
  println("a button event from change: "+theValue);
  img=loadImage("2.jpg");
  img.loadPixels();
  myTextarea.setText("claudia fingerprint");
}
public void F_03(int theValue) {
  println("a button event from change: "+theValue);
  img=loadImage("3.jpg");
  img.loadPixels();
  myTextarea.setText("caterina fingerprint");
}
public void F_04(int theValue) {
  println("a button event from change: "+theValue);
  img=loadImage("4.jpg");
  img.loadPixels();
  myTextarea.setText("giovanna fingerprint");
}
public void F_05(int theValue) {
  println("a button event from change: "+theValue);
  img=loadImage("5.jpg");
  img.loadPixels();
  myTextarea.setText("raffaella fingerprint");
}

public void F_06(int theValue) {
  println("a button event from change: "+theValue);
  img=loadImage("6.jpg");
  img.loadPixels();
  myTextarea.setText("michele fingerprint");
}
public void F_07(int theValue) {
  println("a button event from change: "+theValue);
  img=loadImage("7.jpg");
  img.loadPixels();
  myTextarea.setText("anonimo1 fingerprint");
}
public void F_08(int theValue) {
  println("a button event from change: "+theValue);
  img=loadImage("8.jpg");
  img.loadPixels();
  myTextarea.setText("anonimo2 fingerprint");
}

public void F_09(int theValue) {
  println("a button event from change: "+theValue);
  img=loadImage("9.jpg");
  img.loadPixels();
  myTextarea.setText("anonimo fingerprint");
}


void keyPressed() {

  if (key == 'r') {           //export .OBJ
    record = true;
  }

  switch(key) {              //save frame .tif
  case 's':
    //noLoop();
    saveFrame();
    break;
  }
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}