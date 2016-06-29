// Maria Chiara Sotgiu @MCSotgiu © 2016 MIT License
// 10 print porting to P5js
// Made for DSII2016 lab @UniRSM

var x = 0;
var y = 0;
var dimensioni = [ 20, 40, 80, 160 ];
var D;
var x1 = 0;
var y1 = 0;
var x3 = 0;
var y3 = 0;
var x4 = 0;
var y4 = 0;

function setup() {
  createCanvas(800, 640);
  background(0);
  frameRate(60);

  //pixelDensity(displayDensity());
  //createCanvas(windowWidth, windowHeight);

  var i = int(random(3));
  D = dimensioni[i];

  y1 = (height-D);
  x3 = (width-D);
  y3 = (height-D);
  x4 = (width-D);
}


function draw() {

  quadrato1();

  quadrato2();

  quadrato3();

  quadrato4();
}



function quadrato1() {
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

function quadrato2() {
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

function quadrato3() {  
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

function quadrato4() {
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

// se ridimensiona la finestra ricalcola width e height canvas
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

// se premi "s" salva come immagine
function keyTyped() {
  if (key === 's') {
    saveCanvas();
  }
  return false;
}
