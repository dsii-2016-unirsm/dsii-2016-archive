float w = 32;
int h = 32;
float index = 0;

void setup() {
  size(640, 384);
  background(200);
  strokeWeight(3);
  stroke(224);
  smooth();
}
void draw() {
  w= map (mouseX, 0, height, 32, 100);
  float x1 = w * index; 
  float y1 = w;

  noStroke ();
  fill (random (255), random (225), random (225)); // genera colori casuali
  rect (x1, y1, w, h); //quadrato

  index++;
  if (index >= width/w) {
    PImage p = get(0, h, width, height);
    background(200);
    set(0, h+h, p);
    index = 0;
  }
}