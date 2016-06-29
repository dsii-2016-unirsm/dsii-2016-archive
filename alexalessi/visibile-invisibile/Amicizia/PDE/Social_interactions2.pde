// Social_interactions
// © Daniele @ Fupete for the course dsii-2016 @ UnirSM
// © Alex Alessi
// github.com/fupete — github.com/dsii-2016-unirsm
// Made for educational purposes, MIT License, March 2016, San Marino

// 
// —
// salva immagine e salva PDF > processing

boolean vediOrbite = true, pause = false, info = false;

float rotationX, rotationY, zoomi, zoom;
ArrayList<Planet> p = new ArrayList();


//***************************************

String A_title, B_title, C_title, D_title; // < holders for column titles, first row, ex. title will be the content from A1, B1, ...

//*** VALORI COLONNE *** ///
StringList nomi = new StringList(); // < column A, strings, names 
IntList diametri = new IntList(); // < column B, integers, interactions
FloatList vel = new FloatList(); // < column C, floats, chat-time
IntList orbite = new IntList(); // < column D, int, valutazione

//***************************************

void setup() {


  String url = "https://spreadsheets.google.com/feeds/cells/15BEVns9VaB1pbMuelLiAM7L87BRKUUK_V2XgXDnBmro/od6/public/basic?alt=json"; // < the spreadsheet must be published and available to a public url.
  load_G_Spreadsheet(url);

  // are they loaded&parsed?
  println (A_title + "nomi");  
  println (nomi);  // < column A, integers, names
  println (B_title + "diametri");  
  println (diametri);  // < column B, strings, names
  println (C_title + "vel");  
  println (vel);  // < column C, strings, names
  println (D_title + "orbite");  
  println (orbite);  // < column C, strings, names

  /* nomi = new StringList();
   for (int i=0; i<A_values.size(); i++) {
   nomi.append(A_values.get(i));
   }
   
   
   diametri = new IntList();
   for (int i=0; i<B_values.size(); i++) {
   diametri.append(B_values.get(i));
   }
   
   orbiteX = new IntList();
   orbiteY = new IntList();
   for (int i=0; i<D_values.size(); i++) {
   orbiteX.append(D_values.get(i));
   orbiteY.append(D_values.get(i));
   }
   
   vel = new FloatList();
   for (int i=0; i<C_values.size(); i++) {
   vel.append(C_values.get(i));
   }*/



  fullScreen(P3D, 2);
  //size(800,600,P3D);

  creaPianeti();
} //setup


void creaPianeti() {
  for (int i=0; i<diametri.size(); i++) {

    // caratteristiche intrinsiche pianeta
    String nome = nomi.get(i);
    float rot = 0;//random(0, 360);
    int diametro = (int)map(diametri.get(i), 0, diametri.max(), 3, 7);
    colorMode(HSB);
    color col = color((int)map(vel.get(i), 0, vel.max(), 0, 255), 255, (int)map(diametri.get(i), (int)map(diametri.get(i), 0, diametri.max(), 0, 255), diametri.max(), 100, 255));//random(100, 255), random(100, 255));//color(random(0, 255), random(0, 255), random(0, 255)); // #123144; ...
    colorMode(RGB);

    // generi pianeta
    p.add(new Planet(nome, rot, diametro, col));
  }
}

void draw() {

  background(0);
  lights();
  translate(width/2, height/2);
  scale(width/600+zoomi);

  // girare col mouse
  rotateY(-rotationY); 
  rotateX(rotationX);

  // zoommare col mouse
  translate(0, 0, zoom);

  if (keyPressed && key==' ') {
    zoom = map(mouseY, 0, height, -400, 400);
  }

  // muovere e disegnare i pianeti
  for (int i=0; i<40; i++) {    //i<p.size()

    // parametri di movimento
    Float velocita = map(vel.get(i), 1, vel.max(), 1, 10);  //vel.max() è il valore massimo nella tabella
    int oX = (orbite.get(i)+3)*30;
    int oY = (orbite.get(i)+3)*20;


    // allora muovi il pianeta
    p.get(i).orbit(oX, oY, velocita, vediOrbite);
  }
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
  } else if ( key == 'i' || key == 'I') {
    info = !info;
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
    strokeWeight(1);
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
    if (index.equals("A1") == true) { 
      A_title = value;
    } else if (index.equals("B1") == true) { 
      B_title = value;
    } else if (index.equals("C1") == true) { 
      C_title = value;
    } else if (index.equals("D1") == true) { 
      D_title = value;
    } else // *** CONTENUTI COLONNE
    if (current_column == 'A') { 
      nomi.append(value);
    } else if (current_column == 'B') {  // < per gli interi
      diametri.append(int(value));
    } else if (current_column == 'C') { 
      vel.append(float(value.replaceAll(",", ".")));
    } else if (current_column == 'D') { 
      orbite.append(int(value));
    } // < per i float
  }
}

//***************************************
