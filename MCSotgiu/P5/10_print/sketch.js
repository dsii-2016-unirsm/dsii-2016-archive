var w = 16; // int diventa var
var h = 16;
var index = 0;
var righe;

function setup() { // void diventa function
  createCanvas(windowWidth, windowHeight); // in modo che si adatti allo schermo
  background(0,0, 255);
  strokeWeight(3);
  stroke(224);
  righe = int(windowHeight/h); // è il numero intero per l'altezza della finestra diviso h
  //smooth(); togliere per p5js
}

function draw() {
  var x1 = w*index;
  var x2 = x1 + w;
  var y1 = h*(righe-1); //indice della riga
  var y2 = h*righe; // qui come sopra è necessario dare righe e non numeri fissi se no non si riadatta
  if (random(2) < 1) {
    line(x2, y1, x1, y2);
  } else {
    line(x1, y1, x2, y2);
  }
 
  index++;
  if (index >= windowWidth/w) {  //cambiato da == a >=, ma perchè?
    image = get(0, h, windowWidth, h*(righe-1)); // perchè? da rivedere
    background(0,0, 255);
    set(0, 0, image);
    index = 0;
  }

  // se ridimensiona la finestra ricalcola width e height canvas
// da inserire sempre se si utlizzano windowWidth e windowHeight
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
}
