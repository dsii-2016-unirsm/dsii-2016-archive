// Unities 0.1 by Alex Alessi [friendship, interpersonal ties]
// 2016 © Alex Alessi, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino
// —
// Data collected in a doc on Google Drive, and take them to modify different orbits, 
// the planets' size, color and rotation speed..
// GD doc link https://docs.google.com/spreadsheets/d/1IFxpUHc3_o1rpELL6j2jy5HHrJ01E824E8Y6PL3qg48/edit#gid=0

int MESE = 0;
int size = 175; //dimensione righe del documento

import controlP5.*;
ControlP5 cp5;
RadioButton r1, r2, r3, r4;
float Zoomz = 130;  //per ZOOM

import processing.pdf.*;
import java.util.Calendar;

boolean vediOrbite = true, pause = false, info = false, salva = false, salvaIMG = false;

float rotationX, rotationY;
ArrayList<Planet> p = new ArrayList();

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

ArrayList<IntList> allDiametri = new ArrayList<IntList>();
ArrayList<FloatList> allVel = new ArrayList<FloatList>();

//***************************************



PImage sfondo;

void setup() {
  
  fullScreen(P3D, 2);

  sfondo = loadImage("sfondo.jpg");
  
  allDiametri.add(diametri);
  allDiametri.add(diametri1);
  allDiametri.add(diametri2);
  allDiametri.add(diametri3);
  allDiametri.add(diametri4);
  
  allVel.add(vel);
  allVel.add(vel1);
  allVel.add(vel2);
  allVel.add(vel3);
  allVel.add(vel4);
  
  
  cp5 = new ControlP5(this);              //riga bottoni 1
  r1 = cp5.addRadioButton("radioButton")
          .setPosition(20,20)
         .setSize(50,40)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(5)
         .setSpacingColumn(50)
         .addItem("Gennaio",1)
         .addItem("Febbraio",2)
         .addItem("Marzo",3)
         .addItem("Aprile",4)
         .addItem("Maggio",5)
         ;
          
  cp5 = new ControlP5(this);            //riga bottoni 2
  r2 = cp5.addRadioButton("radioButtonB")
          .setPosition(20,80)
         .setSize(50,40)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(0)
         .addItem("Pausa",1)
         ;
         
   cp5 = new ControlP5(this);           //riga bottoni 3
   r3 = cp5.addRadioButton("radioButtonC")
          .setPosition(110,80)
         .setSize(50,40)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(0)
         .addItem("Nomi",1)
         ;
       
 
         
    
    cp5 = new ControlP5(this);
    cp5.addSlider("ZOOM")
     .setPosition(20,140)
     .setSize(200,40)
     .setRange(0,100)
     .setValue(50)
     ;
     
     

         
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

  creaPianeti();
  // Mese(MESE);
  
 
} //fine setup


 
void creaPianeti() {                           
  for (int i=0; i<size; i++) {

    println("diametri.size()");
        println(diametri.size());

    // caratteristiche intrinsiche pianeta
    String nome = nomi.get(i);
    float rot = random(-95, -55);
    int diametro = (int)map(diametri.get(i), 0, diametri.max(), 2, 30); //3, 7);
    colorMode(HSB);
    Float H = (Float)map(vel.get(i), 0, vel.max(), 160, 255);  //Tonalità data dalla velocità di rotazione, interazioni
    int S = (int)map(diametri.get(i), 0, diametri.max(),  40, 250);  //Saturazione data dalla variazione diametro, tempo di chat
    //int S = 220;
    int B = 255;  //255;
    color col = color(H, S, B);
    colorMode(RGB);
    // generi pianeta
    p.add(new Planet(nome, rot, diametro, col));
   }
}

void update_dati(int a){  //funzione che aggiorna i dati in base ad a(variabile contenente il valore del pulsante attivo)
  int index = a-1;       
  MESE = index;
 
}

void  Mese(int index){
    
    for (int i=0; i<size; i++) {    

    // parametri di movimento
    Float velocita = map(allVel.get(index).get(i), 0, allVel.get(index).max(), 0.25, 4);  //1, 10);
    int oX = (orbite.get(i)+3)*30; //+3)*30;
    int oY = (orbite.get(i)+3)*30; //+3)*20

    int diametro = (int)map(allDiametri.get(index).get(i), 0, allDiametri.get(index).max(), 2, 30); //3, 7);
    colorMode(HSB);
    int H = (int)map(allVel.get(index).get(i), 0, allVel.get(index).max(), 160, 255);  //Tonalità data dalla velocità di rotazione, interazioni
    int S = (int)map(allDiametri.get(index).get(i), 0, allDiametri.get(index).max(), 40, 250);  //Saturazione data dalla variazione diametro, tempo di chat
    //int S = 220;
    int B = 255;  //255;
    color col = color(H, S, B);
    colorMode(RGB);
    
    p.get(i).setDiameterAndSurface(diametro, col);
    p.get(i).orbit(oX, oY, velocita, vediOrbite);
  }
}


void bot2(int b){  
  if (b == 1) {
   pause = !pause;
   }else 
  pause = false;
}

void bot3(int c){  
  if (c == 1) {
    info = !info;
  } else 
  info = false;
}


void draw() {
 
lights();
  
//**** Salva immagini
  if (salva) {
    beginRaw(PDF, "pdf/output"+timeStamp()+".pdf");
    textMode(SHAPE);
    hint(ENABLE_DEPTH_SORT);
    fill(0);
    rect(0, 0, width, height);
  }
//**** Salva immagini

  pushMatrix();
  translate(0,0, -height);
  imageMode(CENTER);
  image(sfondo, width/2, height/2, width*2.5, height*2.5);  
  popMatrix();
  
  
  pushMatrix();
 
   translate(width/2, height/2);    //scale(width/600+zoomi);

   translate(0, 0, Zoomz); 
   rotateY(-rotationY);    // girare col mouse
   rotateX(rotationX);
   Mese(MESE);

  popMatrix();


//**** Salva immagini fine
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
//**** Salva immagini fine

} //draw



void mouseDragged(){
  rotationY+= map(mouseX-pmouseX, 0, 100, 0, 2);
  rotationX+= map(mouseY-pmouseY, 0, 100, 0, 2);
}



void keyPressed(){
  if (key == 'p' || key == 'P') {
    pause = !pause;
  } else if ( key == 'i' ||key == 'I') {
    info = !info;
  } else if (key =='s' ) {
    salva = true;
  } else if (key =='a' ) {
    salvaIMG = true;
  }
  
    switch(key) {                           
    //case('0'): r1.deactivateAll(); break;
    case('1'): r1.activate(0); break;
    case('2'): r1.activate(1); break;
    case('3'): r1.activate(2); break;
    case('4'): r1.activate(3); break;
    case('5'): r1.activate(4); break;
    
    
  }
    switch(key) {                           
   //riga 2 bottoni
    case('1'): r2.activate(1); break;
    }
    
     switch(key) {                           
   //riga 2 bottoni
    case('1'): r3.activate(1); break;
     }
     
}



//****

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
  
  void setDiameterAndSurface(float planetRadius, color  surface){  //funzione di aggiornamento valori diametro e colore
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
    textSize(12);
    translate(3, 3, 20); //0,0,20
    rotateX(-PI/4);
    fill(255);
    if (info)  text(planetName, 0, 0); 
    else text(" ", 0, 0);

    popMatrix();
    /* fine 3D */
    if (!pause) {
      angle+=orbitSpeed;
    }
  }

  void drawOrbit(float ellipticalRadiusX, float ellipticalRadiusY) {
    stroke(250);
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



void radioButton(int a) {
  println("a radio Button event: "+a);
  update_dati(a);
}

void radioButtonB(int b) {
  println("b radio Button event: "+b);
  bot2(b);
}

void radioButtonC(int c) {
  println("c radio Button event: "+c);
  bot3(c);
}


void ZOOM(float slider) {
  Zoomz = map(slider, 0,100,-400,400);
  println("slider event "+slider); 
  
}


