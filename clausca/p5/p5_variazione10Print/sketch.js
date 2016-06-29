//Clausca variazione 10 print in p5.js// 21.04.2016

var x = 0;  
var y = 40;  
var g = 30; 



function setup() {
   smooth(); 
   createCanvas(800, 600); 
 }

function draw() {
    fill(0);
    noStroke();
    rect(0, 0, width, 40);
	
	var font;
	textSize(g/2);
	noStroke();
	fill('#FF00FF'); 
	textSize(g/2);
	//font = loadFont('Commodore Rounded v1.2.ttf');
	textFont("Courier");
    text('10 PRINT CHR$(205.5+RND(1)); : GOTO 10',10, g-10);
	

    var strokeW = g/4;
    strokeWeight(strokeW);
    strokeCap(SQUARE);
    strokeJoin(BEVEL);
	
    RigheNere(); //fa una riga nera orizzontale che segue il disegno

 
  if (random(2) < 1) {
    line(x, y, x + g, y + g);  //disegno linea (\)
  } else {
    line(x + g, y, x, y + g); //disegno linea (/)
  }
  x = x + g;

 
  if (x >= width) {   
  //se supera la larghezza della pagina, va a capo e ricomincia da zero_va alla riga seguente
    x = 0; 
    y = y + g;
	
  }
  
  if (y >= height) {  
  //se supera l'altezza della pagina, va a capo e ricomincia da zero con griglia random e background con opacità(funzione 'Cambio')
    y = 40; 
    Cambio();		
  }
}

function Cambio() {
  g=30+random(width);
  //rettangolo senza contorni//
  noStroke();
  //opacità
  fill(255,100); 
  //rettangolo grande tutta l'altezza e larghezza della pagina
  rect(x, y, width, height); 
}


function RigheNere () {
  fill(0);
  noStroke();
  rect(x, y, width, g); //riga nera orizzontale 
  stroke(random(0, 255), (0, 255), (0, 255));
}


function mousePressed() {
  //se premo il mouse, ricomincio da x=0 con griglia e background differente
  g=30;
  x=0;
  y=40;
   //colori background random 
  fill(random(0, 255), random(0, 255), random(0, 255));
  noStroke();
  rect(x, y, width, height);

}


function keyTyped() { 
// se premo 'n' salvo l'immagine

 if (key === 'n') {
    saveCanvas();
  }
}
