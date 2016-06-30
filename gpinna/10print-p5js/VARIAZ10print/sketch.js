
var w = 32;
var h = 32;
var index = 0;
var righe;


function setup() {
      createCanvas(windowWidth, windowHeight);
      background(200);
      stroke(224);
      strokeWeight(3);
      righe = (int(windowHeight/w));
}

function draw() {

     w= map (mouseX, 0, height, 32, 100);
     var x1 = w * index; 
     var y1 = w;


     noStroke ();
     fill (random (255), random (225), random (225)); // genera colori casuali
     rect (x1,y1,w, h); //quadrato


      index++;
      if (index >= windowWidth / w) {
        image = get(0, h, windowWidth, h * (righe+1));
        background(200);
        set(0, h+h, image);
        index = 0;


        } 
        
      }