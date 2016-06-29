// Social_interactions
// © Daniele @ Fupete for the course dsii-2016 @ UnirSM
// © Alex Alessi
// github.com/fupete — github.com/dsii-2016-unirsm
// Made for educational purposes, MIT License, March 2016, San Marino



import processing.pdf.*;
boolean record;

//AGGIUNGO IO
 
  int boxSize = 150;
  boolean overBox = false;
  boolean locked = false;
  float xOffset = 0.0; 
  float yOffset = 0.0;

//AGGIUNGO IO

boolean vediOrbite = true;
IntList diametri, orbiteX, orbiteY;
FloatList vel;

float rotationX, rotationY, zoomi;
ArrayList<Planet> p = new ArrayList();


//***************************************

String A_title, B_title, C_title, D_title; // < holders for column titles, first row, ex. title will be the content from A1, B1, ...

//*** VALORI COLONNE *** ///
StringList A_values = new StringList(); // < column A, strings, names 
FloatList B_values = new FloatList(); // < column B, integers, interactions
IntList C_values = new IntList(); // < column C, floats, chat-time
IntList D_values = new IntList(); // < column D, int, valutazione

//***************************************

void setup() {
  
  rectMode(RADIUS);  

  String url = "https://spreadsheets.google.com/feeds/cells/15BEVns9VaB1pbMuelLiAM7L87BRKUUK_V2XgXDnBmro/od6/public/basic?alt=json"; // < the spreadsheet must be published and available to a public url.
  load_G_Spreadsheet(url);

  // are they loaded&parsed?
  println (A_title);  
  println (A_values);  // < column A, integers, names
  println (B_title);  
  println (B_values);  // < column B, strings, names
  println (C_title);  
  println (C_values);  // < column C, strings, names
  println (D_title);  
  println (D_values);  // < column C, strings, names
  
  
  

  diametri = new IntList();
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  diametri.append(C_values);
  
  orbiteX = new IntList();
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);
  orbiteX.append(D_values);

  orbiteY = new IntList();
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  orbiteY.append(D_values);
  
  
  vel = new FloatList();
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);
  vel.append(B_values);



  fullScreen(P3D, 2);
  //size(800,600,P3D);



  
  
    // si creano pianeti
  for (int i=0; i<diametri.size(); i++) {
    
    // caratteristiche intrinsiche pianeta
    float rot = random(0,360);
    float diametro = map(diametri.get(i), 0, diametri.max(), 2, 13);
    //color col = color(random(0,255), random(0,255), random(0,255)); // #123144; ...
    color col = color(125, 20, 215);
    // generi pianeta  
    p.add(new Planet(rot, diametro, col));
      
  }//for
    
 

} //setup

  

void draw() {
  //EXPORT PDF
   if (record) {
    beginRaw(PDF, "output.pdf");
  }
  

  background(0);
  lights();
  translate(width/2, height/2);
  scale(width/400+zoomi);

  // girare col mouse
  rotateY(-rotationY); 
  rotateX(rotationX);
  
  

  // muovere e disegnare i pianeti
  for (int i=0; i<40; i++) {    //i<p.size()
    
    // parametri di movimen
    float velocita = map(vel.get(i),0,vel.max(),0,2);  //vel.max() è il valore massimo nella tabella     //map(vel.get(i),0,vel.max(),0,3);
    int oX = (orbiteX.get(i)+3)*10;
    int oY = (orbiteY.get(i)+3)*10;
    
    // allora muovi il pianeta
    p.get(i).orbit(oX,oY,velocita,vediOrbite);
  }
  
  
  //FINE EXPORT PDF
  if (record) {
    endRaw();
    record = false;
  }
  
} //draw



void mouseDragged()
{
  rotationY+= map(mouseX-pmouseX, 0, 100, 0, 2);
  rotationX+= map(mouseY-pmouseY, 0, 100, 0, 2);
}




class Planet {
  float planetOffset;
  float planetRadius;
  color surface;
  float angle;
  boolean isPathVisible;

  Planet(float planetOffset, float planetRadius, color  surface) {
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
    popMatrix();
    /* fine 3D */
    angle+=orbitSpeed;
  }

  void drawOrbit(float ellipticalRadiusX, float ellipticalRadiusY) {
    stroke(255, 50);
    float angle=0;
    for (int i=0; i<360; i++) {
      point(cos(radians(angle))*ellipticalRadiusX, 
        sin(radians(angle++))*ellipticalRadiusY);
    }
  }
}


//***************************************

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
    if (index.equals("A1") == true) { A_title = value; } else
      if (index.equals("B1") == true) { B_title = value; } else 
      if (index.equals("C1") == true) { C_title = value; } else
      if (index.equals("D1") == true) { D_title = value; } else// *** CONTENUTI COLONNE
      if (current_column == 'A') { A_values.append(value); } else // per gli interi
      if (current_column == 'B') { B_values.append(float(value)); } else
      if (current_column == 'C') { C_values.append(int(value)); } else// per i valori stringa 
      if (current_column == 'D') { D_values.append(int(value.replaceAll(",", ".")));
      
      } // < per i float
  }
  }
  
//**************************************



// Hit 'r' to record a single frame
void keyPressed() {
  if (key == 'r') {
    record = true;
  }
}
