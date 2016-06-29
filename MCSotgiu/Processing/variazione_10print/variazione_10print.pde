float x = 0;
float y = 0;
int[] dimensioni = { 20, 40, 80, 160, 320 };
int D;
float x1 = 0;
float y1 = 0;
float x3 = 0;
float y3 = 0;
float x4 = 0;
float y4 = 0;

void setup() {
  size(1080, 720);
  background(0);
  frameRate(60);
  //fullScreen();
  //pixelDensity(displayDensity());

  float i= random(4);
  D = dimensioni[int(i)];

  y1 = (height-D);
  x3 = (width-D);
  y3 = (height-D);
  x4 = (width-D);
}


void draw() {

  quadrato1();

  quadrato2();

  quadrato3();

  quadrato4();
}



void quadrato1() {
  fill(100, 40);
  noStroke();
  rect(x, y, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
  if (random(2) <= 1) {
    line(x, y, x+D, y+D);
  } else {
    line(x+D, y, x, y+D);
  }

  x = x + D;
  if (x >= width) {
    x=0;
    y = y+D;
  }
  if (y >= height) {
    background(random(255));
    x=0;
    y=0;
  }
}

void quadrato2() {
  fill(100, 40);
  noStroke();
  rect(x1, y1, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
  if (random(2) <= 1) {
    line(x1, y1, x1+D, y1+D);
  } else {
    line(x1+D, y1, x1, y1+D);
  }

  if (y1 <= 0) {
    y1 = (height);
    x1 = x1+D;
  }
  y1 = y1 - D;

  if (x1 >= width ) {
    background(random(255));
    x1 = 0;
    y1 = (height-D);
  }
}

void quadrato3() {  
  fill(100, 40);

  noStroke();
  rect(x3, y3, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
  if (random(2) <= 1) {
    line(x3, y3, x3+D, y3+D);
  } else {
    line(x3, y3+D, x3+D, y3);
  }

  x3 = x3 - D;
  if (x3 < 0) {
    x3 = width-D;
    y3 = y3-D;
  }

  if (y3 <= 0-D) {
    background(random(255));
    x3 = (width-D);
    y3 = (height-D);
  }
}

void quadrato4() {
  fill(100, 40);
  noStroke();
  rect(x4, y4, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
  ;
  if (random(2) <= 1) {
    line(x4, y4, x4+D, y4+D);
  } else {
    line(x4+D, y4, x4, y4+D);
  }

  y4 = y4 + D;

  if (y4 >= height) {
    y4 = 0;
    x4 = x4 -D;
  }


  if (x4 <= 0-D) {
    setup();    
    background(random(255));
    x4 = (width-D);
    y4 = 0;
  }
}


 void keyPressed() {
    if (key == 'S' || key == 's') {
      saveFrame();
    }
}
