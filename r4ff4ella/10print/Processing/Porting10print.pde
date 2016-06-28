/* Porting 10 print */

//definisco le variabili
int w = 16;//dimensione quadrato entro cui sono disegnate le linee
int h = 16;//dimensione quadrato entro cui sono disegnate le linee
int index = 0;//contatore

void setup() {
  size(640, 384);
  background(#0000ff);
  strokeWeight(3);
  stroke(224);
  smooth();
}

void draw() {
  int x1 = w*index;
  int x2 = x1 + w;
  int y1 = h*23;
  int y2 = h*24;
  // disegno una delle due linee "/" o "\"
  if (random(2) < 1) {
    line(x2, y1, x1, y2);
  } else {
    line(x1, y1, x2, y2);
  }
 
  index++;
  if (index == width/w) {
    PImage p = get(0, h, width, h*23); 
    background(#0000ff);
    set(0, 0, p);
    index = 0;
  }
}
