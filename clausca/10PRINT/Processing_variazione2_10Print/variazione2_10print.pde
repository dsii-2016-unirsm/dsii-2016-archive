// Processing variation 2 of 10Print by clausca 
// 2016 © clausca, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino
// Help:
// Load font Commodore-64-Rounded-48.vlw
// Mouse Pressed
// Key Pressed 'n' noLoop, saveFrame
// Key Pressed 'l' Loop

int x = 0; 
int y = 0;  
int g = 20; //dimensioni griglia
PFont font;

void setup() {
  frameRate(200);
  size(640, 384);
  background(255);
  smooth();
  strokeWeight(1);
}

void draw() {
  fill(0);
  noStroke();
  rect(0, 0, width, 40);

  font = loadFont("Commodore-64-Rounded-48.vlw");
  textFont(font, g/2);
  fill (random(255), random(255, 0), random(250, 255));//(#00FFFF)//
  text("10 PRINT CHR$(205.5+RND(1)); : GOTO 10", 20, 20);


  RigheNere();
  if (random(2) < 1) {
    line(x, y, x + g, y + g);  //disegno linea (\)
  } else {
    line(x + g, y, x, y + g); //disegno linea (/)
  }
  x = x + g;


  if (x >= width) {   //se supera la larghezza della pagina, va a capo e ricomincia da zero_va alla riga seguente
    x =0; 
    y = y + g;
  }

  if (y >= height) {  //se supera l'altezza della pagina, va a capo e ricomincia da zero con griglia e background differente

    g=30;
    y =0; 
    Cambio();
  }
}
void Cambio() {

  fill(255, 100);
  //fill(random(0, 255), random(0, 255), random(0, 255)); //riempimento rettangolo colori casuali r g b 
  noStroke(); //rettangolo senza contorni//
  rect(x, y, width, height);  //rettangolo grande tutta l'altezza e larghezza della pagina
  /*stroke(random(0, 255)); //colore della linea random*/
  strokeWeight(random(1, 4));  //spessore della linea random tra 1 e 4
}


void mousePressed() { 
  //se premo il mouse, ricomincio da x=0 e a metà dell'altezza della finestra, con griglia e background differente
  g=40;
  x=0;
  y=0;

  strokeWeight(1);
  /*stroke(random(0, 255), random(0, 255), random(0, 255));*/
  background(random(0, 255), random(0, 255), random(0, 255)); //colori casuali r g b per background
}

void RigheNere () {
  fill(0);
  noStroke();
  rect(x, y, width, g);
  stroke(random(255), random(255, 0), random(250, 255));
}

void keyPressed() { // se premo 'n' fermo il loop e salvo l'immagine, se premo 'l' riprendo il loop 
  switch(key) {
  case 'n':
    noLoop();
    saveFrame();
    break;

  case 'l':
    loop();
    break;
  }
}
