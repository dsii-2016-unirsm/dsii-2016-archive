

// Social_interactions
// © Daniele @ Fupete for the course dsii-2016 @ UnirSM
// © Alex Alessi
// github.com/fupete — github.com/dsii-2016-unirsm
// Made for educational purposes, MIT License, March 2016, San Marino


// Social_Interactions 0.1 by Alex Alessi [friendship, interpersonal ties]
// 2016 © Alex Alessi, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino
// —
// Data collected in a doc on Google Drive, and take them to modify different orbits, 
// the planets' size, color and rotation speed..
// GD doc link https://docs.google.com/spreadsheets/d/1IFxpUHc3_o1rpELL6j2jy5HHrJ01E824E8Y6PL3qg48/edit#gid=0
int MESE=0;

import controlP5.*;
ControlP5 cp5;
 
import processing.pdf.*;
import java.util.Calendar;

boolean vediOrbite = true, pause = false, info = false, salva = false, salvaIMG = false;

float rotationX, rotationY, zoomi, zoom;
ArrayList<Planet> p = new ArrayList();


//***************************************

String A_title, B_title, C_title, D_title, E_title, 
       F_title, G_title, H_title, I_title, J_title, K_title, L_title; // < holders for column titles, first row, ex. title will be the content from A1, B1, ...

//*** VALORI COLONNE *** ///
StringList nomi = new StringList(); // < column A, strings, names 
IntList diametri = new IntList(); // < column B,C,D,E,F, integers, interactions
IntList diametri1 = new IntList();
IntList diametri2 = new IntList();
IntList diametri3 = new IntList();
IntList diametri4 = new IntList();
FloatList vel = new FloatList(); // < column G,H,I,J,K, floats, chat-time
FloatList vel1 = new FloatList();
FloatList vel2 = new FloatList();
FloatList vel3 = new FloatList();
FloatList vel4 = new FloatList();
IntList orbite = new IntList(); // < column L, int, valutazione

//***************************************

void setup() {

  cp5 = new ControlP5(this);

  //CP5 change the original colors
  cp5.setColorForeground(#67bfcb);    
  cp5.setColorBackground(#017787);   
  cp5.setColorActive(#99d4dc);     
  
   setupBot();

  String url = "https://spreadsheets.google.com/feeds/cells/1IFxpUHc3_o1rpELL6j2jy5HHrJ01E824E8Y6PL3qg48/od6/public/basic?alt=json"; // < the spreadsheet must be published and available to a public url.
  load_G_Spreadsheet(url);

  // are they loaded&parsed?
  println (A_title + "nomi");  
  println (nomi);  
  println (B_title + "diametri");  
  println (diametri);  
  println (C_title + "diametri1");  
  println (diametri1);  
  println (D_title + "diametri2");  
  println (diametri2); 
  println (E_title + "diametri3");  
  println (diametri3);  
  println (F_title + "diametri4");  
  println (diametri4);  
  println (G_title + "vel");  
  println (vel);  
  println (H_title + "vel1");  
  println (vel1);  
  println (I_title + "vel2");  
  println (vel2);  
  println (J_title + "vel3");  
  println (vel3);  
  println (K_title + "vel4");  
  println (vel4);  
  println (L_title + "orbite");  
  println (orbite);  

  fullScreen(P3D, 2);

  creaPianeti();
  creaPianeti1();
  creaPianeti2();
  creaPianeti3();
  creaPianeti4();
  
  Gennaio();
  Febbraio();
  Marzo();
  Aprile();
  Maggio();
  
 
} //setup


 
void creaPianeti() {
  for (int i=0; i<diametri.size(); i++) {

    // caratteristiche intrinsiche pianeta
    String nome = nomi.get(i);
    float rot = random(0, 40);
    int diametro = (int)map(diametri.get(i), 0, diametri.max(), 2, 13); //3, 7);
    colorMode(HSB);
    int H = (int)map(vel.get(i), 0, vel.max(), 200, 240);  //Tonalità data dalla velocità di rotazione, interazioni
    int S = (int)map(diametri.get(i), 0, diametri.max(), 40, 255);  //Saturazione data dalla variazione diametro, tempo di chat
    int B = 255;  //255;
    color col = color(H, S, B);//random(100, 255), random(100, 255));//color(random(0, 255), random(0, 255), random(0, 255)); // #123144; ...
    colorMode(RGB);
    // generi pianeta
    p.add(new Planet(nome, rot, diametro, col));
   }
}


void creaPianeti1() {
  for (int i=0; i<diametri1.size(); i++) {

    // caratteristiche intrinsiche pianeta
    String nome = nomi.get(i);
    float rot = random(0, 40);
    int diametro1 = (int)map(diametri1.get(i), 0, diametri1.max(), 2, 13); //3, 7);
    colorMode(HSB);
    int H = (int)map(vel1.get(i), 0, vel1.max(), 200, 240);  //Tonalità data dalla velocità di rotazione, interazioni
    int S = (int)map(diametri1.get(i), 0, diametri1.max(), 40, 255);  //Saturazione data dalla variazione diametro, tempo di chat
    int B = 255;  //255;
    color col = color(H, S, B);//random(100, 255), random(100, 255));//color(random(0, 255), random(0, 255), random(0, 255)); // #123144; ...
    colorMode(RGB);
    // generi pianeta
    p.add(new Planet(nome, rot, diametro1, col));
   }
}

void creaPianeti2() {
  for (int i=0; i<diametri2.size(); i++) {

    // caratteristiche intrinsiche pianeta
    String nome = nomi.get(i);
    float rot = random(0, 40);
    int diametro2 = (int)map(diametri2.get(i), 0, diametri2.max(), 2, 13); //3, 7);
    colorMode(HSB);
    int H = (int)map(vel2.get(i), 0, vel2.max(), 200, 240);  //Tonalità data dalla velocità di rotazione, interazioni
    int S = (int)map(diametri2.get(i), 0, diametri2.max(), 40, 255);  //Saturazione data dalla variazione diametro, tempo di chat
    int B = 255;  //255;
    color col = color(H, S, B);//random(100, 255), random(100, 255));//color(random(0, 255), random(0, 255), random(0, 255)); // #123144; ...
    colorMode(RGB);
    // generi pianeta
    p.add(new Planet(nome, rot, diametro2, col));
  }
}

void creaPianeti3() {
  for (int i=0; i<diametri3.size(); i++) {

    // caratteristiche intrinsiche pianeta
    String nome = nomi.get(i);
    float rot = random(0, 40);
    int diametro3 = (int)map(diametri3.get(i), 0, diametri3.max(), 2, 13); //3, 7);
    colorMode(HSB);
    int H = (int)map(vel3.get(i), 0, vel3.max(), 200, 240);  //Tonalità data dalla velocità di rotazione, interazioni
    int S = (int)map(diametri3.get(i), 0, diametri3.max(), 40, 255);  //Saturazione data dalla variazione diametro, tempo di chat
    int B = 255;  //255;
    color col = color(H, S, B);//random(100, 255), random(100, 255));//color(random(0, 255), random(0, 255), random(0, 255)); // #123144; ...
    colorMode(RGB);
    // generi pianeta
    p.add(new Planet(nome, rot, diametro3, col));
  }
}

void creaPianeti4() {
  for (int i=0; i<diametri4.size(); i++) {

    // caratteristiche intrinsiche pianeta
    String nome = nomi.get(i);
    float rot = random(0, 40);
    int diametro4 = (int)map(diametri4.get(i), 0, diametri4.max(), 2, 13); //3, 7);
    colorMode(HSB);
    int H = (int)map(vel4.get(i), 0, vel4.max(), 200, 240);  //Tonalità data dalla velocità di rotazione, interazioni
    int S = (int)map(diametri4.get(i), 0, diametri4.max(), 40, 255);  //Saturazione data dalla variazione diametro, tempo di chat
    int B = 255;  //255;
    color col = color(H, S, B);//random(100, 255), random(100, 255));//color(random(0, 255), random(0, 255), random(0, 255)); // #123144; ...
    colorMode(RGB);
    // generi pianeta
    p.add(new Planet(nome, rot, diametro4, col));
  }
}



void  Gennaio(){
    // muovere e disegnare i pianeti
  for (int i=0; i<201; i++) {    //i<p.size()

    // parametri di movimento
    Float velocita = map(vel.get(i), 1, vel.max(), 0.5, 3);  //1, 10);
    int oX = (orbite.get(i)+3)*30; //+3)*30;
    int oY = (orbite.get(i)+3)*30; //+3)*20;


    // allora muovi il pianeta
    p.get(i).orbit(oX, oY, velocita, vediOrbite);
  }
}
void  Febbraio(){
  for (int i=0; i<201; i++) {

    // parametri di movimento
    Float velocita1 = map(vel1.get(i), 1, vel1.max(), 0.5, 3);  //1, 10);
    int oX = (orbite.get(i)+3)*30; //+3)*30;
    int oY = (orbite.get(i)+3)*30; //+3)*20;  
    p.get(i).orbit(oX, oY, velocita1, vediOrbite);
  }
}
void  Marzo(){
  for (int i=0; i<201; i++) {

    // parametri di movimento
    Float velocita2 = map(vel2.get(i), 1, vel2.max(), 0.5, 3);  //1, 10);
    int oX = (orbite.get(i)+3)*30; //+3)*30;
    int oY = (orbite.get(i)+3)*30; //+3)*20;  
    p.get(i).orbit(oX, oY, velocita2, vediOrbite);
  }
}
void  Aprile(){
   for (int i=0; i<201; i++) {
    
    // parametri di movimento
    Float velocita3 = map(vel3.get(i), 1, vel3.max(), 0.5, 3);  //1, 10);
    int oX = (orbite.get(i)+3)*30; //+3)*30;
    int oY = (orbite.get(i)+3)*30; //+3)*20;  
    p.get(i).orbit(oX, oY, velocita3, vediOrbite);
  }
}
void  Maggio(){
    for (int i=0; i<201; i++) {

    // parametri di movimento
    Float velocita4 = map(vel4.get(i), 1, vel4.max(), 0.5, 3);  //1, 10);
    int oX = (orbite.get(i)+3)*30; //+3)*30;
    int oY = (orbite.get(i)+3)*30; //+3)*20;  
    p.get(i).orbit(oX, oY, velocita4, vediOrbite);
  }
}



void draw() {

  background(0);
  lights();
  
  
//INIZIO SALVA IMAMGINI
//***************************************
  if (salva) {
    beginRaw(PDF, "pdf/output"+timeStamp()+".pdf");
    textMode(SHAPE);
    hint(ENABLE_DEPTH_SORT);
    fill(0);
    rect(0, 0, width, height);
  }
//***************************************



  pushMatrix();
  translate(width/2, height/2);
  //scale(width/600+zoomi);

  // girare col mouse
  rotateY(-rotationY); 
  rotateX(rotationX);
  
  // zoommare col mouse
  translate(0, 0, zoom);
  if (keyPressed && key==' ') {
    zoom = map(mouseY, 0, height, -400, 400);
  }
 
/*  
  for (int i=0; i<201; i++) {    
    Float velocita = map(vel.get(i), 1, vel.max(), 0.5, 3);  //1, 10);
     Float velocita1 = map(vel1.get(i), 1, vel1.max(), 0.5, 3);
      Float velocita2 = map(vel2.get(i), 1, vel2.max(), 0.5, 3);
       Float velocita3 = map(vel3.get(i), 1, vel3.max(), 0.5, 3);
        Float velocita4 = map(vel4.get(i), 1, vel4.max(), 0.5, 3);
    int oX = (orbite.get(i)+3)*30; //+3)*30;
    int oY = (orbite.get(i)+3)*30; //+3)*20;

     if (MESE == 1){
    p.get(i).orbit(oX, oY, velocita, vediOrbite);
    }
    if (MESE == 2){
    p.get(i).orbit(oX, oY, velocita1, vediOrbite);
    }
    if (MESE == 3){
    p.get(i).orbit(oX, oY, velocita2, vediOrbite);
    }
    if (MESE == 4){
    p.get(i).orbit(oX, oY, velocita3, vediOrbite);
    }
    if (MESE == 5){
    p.get(i).orbit(oX, oY, velocita4, vediOrbite);
    }
  }
*/

if (MESE == 1){
    Gennaio();
    }
    if (MESE == 2){
    Febbraio();
    }
    if (MESE == 3){
    Marzo();
    }
    if (MESE == 4){
    Aprile();
    }
    if (MESE == 5){
    Maggio();
    }


popMatrix();



//FINE SALVA IMMAGINI
//***************************************
  if (salva) {
    endRaw();
    salva = false;
    hint(DISABLE_DEPTH_SORT);
    textMode(SHAPE);
  }
  
  if (salvaIMG) {
   saveFrame("img/output-"+timeStamp()+"-######.jpg"); 
   salvaIMG = false;
  }
//***************************************

} //draw




void mouseDragged()
{
  rotationY+= map(mouseX-pmouseX, 0, 100, 0, 2);
  rotationX+= map(mouseY-pmouseY, 0, 100, 0, 2);
}

void keyPressed()
{
  if (key == 'p' || key == 'P') {
    pause = !pause;
  } else if ( key == 'i' ||key == 'I') {
    info = !info;
  } else if (key =='s' ) {
    salva = true;
  } else if (key =='a' ) {
    salvaIMG = true;
  }

}



class Planet {
  float planetOffset;
  float planetRadius;
  color surface;
  float angle;
  boolean isPathVisible;
  String planetName;

  Planet(String planetName, float planetOffset, float planetRadius, color  surface) {
    this.planetName = planetName;
    angle = planetOffset;
    this.planetRadius = planetRadius;
    this.surface = surface;
  }

  void orbit(float ellipticalRadiusX, float ellipticalRadiusY, 
    float orbitSpeed, boolean isPathVisible) {
    // draw ellipse first, so it's under the planet
    if (isPathVisible) {
      drawOrbit(ellipticalRadiusX, ellipticalRadiusY);
    }

    float px = cos(radians(angle))*ellipticalRadiusX;
    float py = sin(radians(angle))*ellipticalRadiusY;
    fill(surface);
    noStroke();
    // 2D
    //ellipse(px, py, planetRadius*2, planetRadius*2);
    /* 3D */
    pushMatrix();
    translate(px, py);
    sphere(planetRadius*2);

    textAlign(LEFT);
    textSize(10);
    translate(0, 0, 20);
    rotateX(-PI/4);
    if (info)  text(planetName, 0, 0); 
    else text(" ", 0, 0);

    popMatrix();
    /* fine 3D */
    if (!pause) {
      angle+=orbitSpeed;
    }
  }

  void drawOrbit(float ellipticalRadiusX, float ellipticalRadiusY) {
    stroke(50);
    strokeWeight(2);
    float angle=0;
    for (int i=0; i<360; i++) {
      point(cos(radians(angle))*ellipticalRadiusX, 
        sin(radians(angle++))*ellipticalRadiusY);
    }
  }
}

// timestamp
String timeStamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}





void load_G_Spreadsheet(String url) {

  JSONObject G_Spreadsheet_data = null;

  try 
  { 
    G_Spreadsheet_data = loadJSONObject(url);
  } 
  catch(Exception el) 
  { 
    println("Error loading JSON"); 
    exit();
  }

  if (G_Spreadsheet_data == null) 
  { 
    println("No data"); 
    exit();
  } else 
  parse_G_Spreadsheet_JSON(G_Spreadsheet_data); // < this start the magic
} 


void parse_G_Spreadsheet_JSON(JSONObject jdata) {

  JSONObject feed = jdata.getJSONObject("feed");
  JSONArray entries = feed.getJSONArray("entry");

  for (int i = 0; i < entries.size(); i++) {
    JSONObject entry = entries.getJSONObject(i);
    JSONObject entry_title = entry.getJSONObject("title");
    JSONObject entry_value = entry.getJSONObject("content");

    // cell content index
    String index = entry_title.getString("$t");
    char current_column = index.charAt(0); // < 'empiric' but works :)

    // cell content value
    String value = entry_value.getString("$t");

    // fill the right title/List values <<<< modify to your needs! <<<<
    // *** TITOLI COLONNE
    if (index.equals("A1") == true) { 
      A_title = value;
    } else if (index.equals("B1") == true) { 
      B_title = value;
    } else if (index.equals("C1") == true) { 
      C_title = value;
    } else if (index.equals("D1") == true) { 
      D_title = value;
    } else if (index.equals("E1") == true) { 
      E_title = value;
    } else if (index.equals("F1") == true) { 
      F_title = value;
    } else if (index.equals("G1") == true) { 
      G_title = value;
    } else if (index.equals("H1") == true) { 
      H_title = value;
    } else if (index.equals("I1") == true) { 
      I_title = value;
    } else if (index.equals("J1") == true) { 
      J_title = value;
    } else if (index.equals("K1") == true) { 
      K_title = value;
    } else if (index.equals("L1") == true) { 
      L_title = value;
    } else // *** CONTENUTI COLONNE
    if (current_column == 'A') { 
      nomi.append(value);
      
    } else if (current_column == 'B') {  // < per gli interi
      diametri.append(int(value));
    } else if (current_column == 'C') {  
      diametri1.append(int(value));
    } else if (current_column == 'D') {  
      diametri2.append(int(value));
    } else if (current_column == 'E') {  
      diametri3.append(int(value));
    } else if (current_column == 'F') {  
      diametri4.append(int(value));
      
    } else if (current_column == 'G') { 
      vel.append(float(value.replaceAll(",", ".")));
    } else if (current_column == 'H') { 
      vel1.append(float(value.replaceAll(",", ".")));      
    } else if (current_column == 'I') { 
      vel2.append(float(value.replaceAll(",", ".")));
    } else if (current_column == 'J') { 
      vel3.append(float(value.replaceAll(",", ".")));      
    } else if (current_column == 'K') { 
      vel4.append(float(value.replaceAll(",", ".")));
      
    } else if (current_column == 'L') { 
      orbite.append(int(value));
    } // < per i float
  }
}



void setupBot() {
  cp5 = new ControlP5(this);

//BUTTON CAMBIA MESE
cp5.addButton("GENNAIO")
    .setValue(0)
    .setPosition(0+52, 30)
    .setSize(50, 20)
    ;
   
  cp5.addButton("FEBBRAIO")
    .setValue(0)
    .setPosition(52+52, 30)
    .setSize(50, 20)
    ;
   
  cp5.addButton("MARZO")
    .setValue(0)
    .setPosition(104+52, 30)
    .setSize(50, 20)
    ;
    
  cp5.addButton("APRILE")
    .setValue(0)
    .setPosition(0+52, 22+30)
    .setSize(50, 20)
    ;
  
  cp5.addButton("MAGGIO")
    .setValue(0)
    .setPosition(52+52, 22+30)
    .setSize(50, 20)
    ;
       
}

public void GENNAIO() {  //GENNAIO(int theValue)
   MESE=1;
   creaPianeti(); 
}
  
public void FEBBRAIO() {
   MESE=2;
   creaPianeti1(); 
}

public void MARZO() {
  MESE=3;
  creaPianeti2();   
}

public void APRILE() {
    MESE=4;
    creaPianeti3();
}

public void MAGGIO() {
    MESE=5;
    creaPianeti4();
}








public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}
