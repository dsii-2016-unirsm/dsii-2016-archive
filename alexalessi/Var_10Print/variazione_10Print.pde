int w = 16;
int h = 16;
int index = 0;

void setup() {
  size(640, 384);
  background(255, 255, 255);
  strokeWeight(3);
  stroke(225);
  smooth();
}//setup


void draw() {
  fill(255, 255, 255, 5);
  rect(-2, -2, 650, 370); 


  int x1 = w*index;
  int x2 = x1 + w;
  int y1 = h*23;
  int y2 = h*24;

  if (random(2) <1) {
    line(x2, y1, x1, y2);
  } else {
    line (x1, y1, x2, y2);



    /*    if (random(2) <1) {
     line(x2, y1, x1, y2);
     }else {
     line (x1, y1, x2, y2);
     */
  }



  //  index++;
  if (index == width/w) {
    PImage p = get(0, h, width, h*23);
    background(255, 255, 255);
    set(0, 0, p);
    index = 0;
  }
  println(index);
}//draw




void mouseMoved() {
  index ++;
  if (index > 40) {
    index = 0;
  }
  println(index);
}

void keyPressed() {
  stroke(random(225), random(225), random(225));
}
