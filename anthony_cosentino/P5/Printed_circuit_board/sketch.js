var x = 0; 
var y = 0;
var g = 50; //dimensioni griglia


function setup() {
  frameRate(50);
  pixelDensity(displayDensity());
  createCanvas(windowWidth, windowHeight);
  background(0, 104, 65);
  smooth();
  strokeWeight(2);
}

function draw() {

 

  if (int (random(4)) == 0) {
    Circuito();
    line(x + g/2, y, x + g/2, y+g);  //disegno linea (|)
  } 
  if (int (random(4)) == 1) {
    Circuito();
    line(x, y+g/2, x + g, y + g/2); //disegno linea (-)
  } 
  if (int (random(4)) == 2) {
    Circuito();
    line(x+g, y, x, y+g); //disegno linea (/)
  } 
  if (int (random(4)) == 3) {
    Circuito();
    line(x, y, x + g, y + g); //disegno linea (\)
  }
  x = x + g;

 if (x >= width) {   
    x = 0; 
    y = y + g;
  }

  if (y >= height) {  
    g=50;
    y = 0; 
    
  }
}




function Circuito () {
  fill(0, 104, 65);
  noStroke();
  rect(x, y, width, g);
  stroke(122, 201, 67);
  fill(122, 201, 67);
  ellipse(x, y, 8, 8);
  
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function keyPressed() { // se premo 'n' fermo il loop e salvo l'immagine, se premo 'l' riprendo il loop 
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
