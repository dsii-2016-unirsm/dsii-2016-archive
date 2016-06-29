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
// key [0,1,2,3,4,5,6,7,8]......change fingerprint
// Key [r] ... export .OBJ
// key [s] ... save frame 
// key [ ] ... stop the dynamic rotation over X, Y, Z axis
// —

import nervoussystem.obj.*;   //export obj
boolean record;
boolean toggle = true;

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
float altezzaP = 20;            //height pixel
float move = 20;
int fill_v1 = 255;              //fingerprint color
int fill_v2 = 255;  
int fill_v3 = 255;
int background_v1 = 64;         //background color
int background_v2 = 64;
int background_v3 = 64;
boolean rgbFlag = true;
//END GUI

PImage img ;
float a;     //line scanner


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
float[][] finger = new float[W][H];         //fingerprint grid: two array


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
    .setPosition(width/2, 35)
    .setSize(400, 400)
    .setFont(createFont("Courier", 13))
    ;

  myTextarea.setText("A fingerprint");

  //size(1200, 800, P3D);
  fullScreen(P3D);
  colorMode(RGB, 255, 255, 255);
  noSmooth();
  
  // create a toggle //change visualization wireframe_shading
  cp5.addToggle("toggle")
    .setPosition(50, 65)
    .setSize(50, 15)
    .setCaptionLabel("visualization")
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;

  a = height - 150; //line scanner

  gui = new ControlP5(this);
  setupGui();
  load();
} //END SETUP

//LOAD IMAGE
void load() {
  img = loadImage("1.jpg");
  img.loadPixels();
  println(img.width+" "+img.height);
}

void draw() {
  lights();
  background(color(background_v1, background_v2, background_v3));
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

      finger[x][y] = -map(brightness(img.get(x, y)), 0, 255, z, altezzaP);
    }
  }

  //image(img, width-150, height-150, 150, 150); //image scan
  hint(ENABLE_DEPTH_TEST);

  pushMatrix();

  translate(width/2, height/2, mouseY); 
 
 if (key == ' ' ) {       //if key pressed is ' ' (space) stop the rotation over X, Y, Z axis
    rotateY(rotationY);
    rotateX(rotationX);
    rotateZ(rotationZ);
    rotateX(radians(60));
  } else {                //if I press another key restarts the rotation over X, Y, Z axis
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

      beginShape(); 
      
      vertex(x*meshSize, y*meshSize, finger[x][y] );                 //up point vertex (the first) coodinate (x,y,z)
      vertex((x+1)*meshSize, y*meshSize, finger[x+1][y] );          //up point vertex(the second)  coodinate (x+1,y,z)
      vertex((x+1)*meshSize, (y+1)*meshSize, finger[x+1][y+1] );   //down point vertex(the second) coodinate (x+1,y+1,z)
      vertex(x*meshSize, (y+1)*meshSize, finger[x][y+1] );        //down point vertex (the first) coodinate (x,y+1,z) 
      endShape(CLOSE);
      
   if (toggle==true) {
        noStroke();      
        //fill(finger[x][y] + x*meshSize-50, 0, 255);
        fill(finger[x][y] + x*meshSize-200, 20, 255);
      } else {
        noFill();
        stroke(color(fill_v1, fill_v2, fill_v3));
      }
      
    }
  }
  popMatrix();
  zoff += increment;           // Increment zoff

  //EXPORT OBJ.
  if (record) {
    endRecord();
    record = false;
  }
  stroke(color(#cc0909));      //line scanner 
  line(width-150, a, width, a);
  a = a + 2;
  if (a > height) { 
    a = height-150;
  }
  image(img, width-150, height-150, 150, 150); //immage scan
}

//end Draw


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
    .setPosition(50, 50)
    .setSize(100, 50)
    ;

  gui.addSlider("altezzaP")
    .setPosition(0, 50)
    .setRange(10, 500)
    .setHeight(15)
    .setGroup(g1)
    ;

  gui.addSlider("fill_v1")
    .setPosition(0, 80)
    .setRange(0, 255)
    .setValue(74)
    .setHeight(15)
    .setCaptionLabel("fill red")
    .setGroup(g1)
    ;
  gui.addSlider("fill_v2")
    .setPosition(0, 111)
    .setRange(0, 255)
    .setValue(90)
    .setHeight(15)
    .setCaptionLabel("fill green")
    .setGroup(g1)
    ;

  gui.addSlider("fill_v3")
    .setPosition(0, 140)
    .setRange(0, 255)
    .setValue(255)
    .setHeight(15)
    .setCaptionLabel("fill blue")
    .setGroup(g1)
    ;

  gui.addSlider("background_v1")
    .setPosition(0, 170)
    .setRange(0, 255)
    .setValue(0)
    .setHeight(15)
    .setCaptionLabel("background red")
    .setGroup(g1)
    ;

  gui.addSlider("background_v2")
    .setPosition(0, 200)
    .setRange(0, 255)
    .setValue(0)
    .setHeight(15)
    .setCaptionLabel("background green")
    .setGroup(g1)
    ;

  gui.addSlider("background_v3")
    .setPosition(0, 230)
    .setRange(0, 255)
    .setValue(0)
    .setHeight(15)
    .setCaptionLabel("background blue")
    .setGroup(g1)
    ;
}

void keyPressed() {

  if (key == '0') {

    // change fingerprint
    img=loadImage("1.jpg");
    img.loadPixels();
    myTextarea.setText("A fingerprint");
  }

  if (key == '1') {

    // change fingerprint
    img=loadImage("2.jpg");
    img.loadPixels();
    myTextarea.setText("B fingerprint");
  }

  if (key == '2') {
    // change fingerprint
    img=loadImage("3.jpg");
    img.loadPixels();
    myTextarea.setText("C fingerprint");
  }

  if (key == '3') {
    // change fingerprint
    img=loadImage("4.jpg");
    img.loadPixels();
    myTextarea.setText("D fingerprint");
  }

  if (key == '4') {
    // change fingerprint
    img=loadImage("5.jpg");
    img.loadPixels();
    myTextarea.setText("E fingerprint");
  }
  if (key == '5') {
    // change fingerprint
    img=loadImage("6.jpg");
    img.loadPixels();
    myTextarea.setText("F fingerprint");
  }

  if (key == '6') {
    // change fingerprint
    img=loadImage("7.jpg");
    img.loadPixels();
    myTextarea.setText("G fingerprint");
  }

  if (key == '7') {
    // change fingerprint
    img=loadImage("8.jpg");
    img.loadPixels();
    myTextarea.setText("H fingerprint");
  }

  if (key == '8') {
    // change fingerprint
    img=loadImage("9.jpg");
    img.loadPixels();
    myTextarea.setText("I fingerprint");
  }


  if (key == 'r') {   //export .OBJ
    record = true;
  }

  switch(key) {       //save frame .tif

  case 's':
    saveFrame();
    break;
  }
}
