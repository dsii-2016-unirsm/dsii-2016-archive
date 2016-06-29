// Processing variation of 10Print by jamburraska : "Printed circuit board - with image"
// 2016 © jamburraska, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino

// Disegna un circuito elettronico stampato sul principio di casualità e ripetizione del 10 print
// La funzionalità dello sketch si basa sull'acquisizione delle immagini presenti nella cartella data lanciate in maniera casuale.


int x = 0; 
int y = 0;  
int g = 50; //gride size
int maxImages = 8; // Total # of images
int imageIndex; // Initial image to be displayed is the first
int index = 0;
// Declaring an array of images.
PImage[] images = new PImage[8]; 

void setup() {
  size(640, 384);
  background(0, 104, 65);
  smooth();
  noStroke();
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "t" + i + ".jpg" );
  }
}

void draw() {

  image(images[imageIndex], x, y);

  if (random(2) < 1) {
    ellipse(x, y, 10, 10); //draw ellipse
    stroke(122, 201, 67);
    //noFill();
    fill(0, 104, 65);
  } 

  imageIndex = int(random(images.length));
  x = x + g;
  if (x >= width) {
    x = 0; 
    y = y + g;
    PImage p = get(0, 1, width, height);
    set(0, 2, p);
  }

  if (y >= height) {
    fill(20, 100); // White rect with opacity
    rect(-10, -10, width+20, height+20); 

    y = 0;
  }
  
  
}

void keyPressed() { // stop and save frame 
  switch(key) {
  case 's':
    noLoop();
    saveFrame();
    break;

  case 'r': //restart frame from the last point
    loop();
    break;
  }
}
