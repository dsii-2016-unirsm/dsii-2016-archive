var w = 16;
var h = 16;
var index = 0;
var b = false;

function setup() {
  createCanvas(640, 384);
  strokeWeight(3);
  smooth();
  stroke(255, 255, 255);
  background(0);
}

function draw() {
  var x1 = w * index;
  var x2 = x1 + w;
  var y1 = h * 23;
  var y2 = h * 24;

  if (random(2) < 1) {
    line(x2, y1, x1, y2);
  } else {
    line(x1, y1, x2, y2);
  }


  index++;
  if (index == width / w) {
    image = get(0, h, width, h * 23);
    if (b) {
      stroke(255);
      background(0);
      b = false;
    } else {
      stroke(0);
      background(255);
      b = true;
    }

    set(0, 0, image);
    index = 0;
  }

}
