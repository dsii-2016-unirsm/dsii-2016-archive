// -
// variazioe_10print 0.1 by Raffaella Barone [10Print, casualità]
// 2016 © Raffaella Barone, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino
// —
// La variazione proposta mantiene il tema della generazione del labirinto, costruzione apparentemente casuale e ne accentua 
//tale caratteristica introducendo l'elemento random nell'ordine in cui il labirinto si compone: non più ordinatamente 
//riga per riga, ma in modo assolutamente casuale.




var DimQuadrato = 80; //quadrati
var nQuadratix ;
var nQuadratiy ;

function setup() {
	
createCanvas(windowWidth, windowHeight);
background(221,0,87);
strokeCap(SQUARE);// estremità linee

nQuadratix = windowWidth / DimQuadrato; // numero di quadrati sull'asse orizzontale
nQuadratiy = windowHeight / DimQuadrato;//numero di quadrati sull'asse verticale
   
}

function draw() {
	
//decido random la x e la y del quadrato da disegnare 
 var a = int(random(nQuadratix));
  var b = int(random(nQuadratiy));

//disegno il quadrato
 fill(221,0,87);
  noStroke();
  rect(a*DimQuadrato, b*DimQuadrato, DimQuadrato, DimQuadrato);
 
//disegno le linee 
 strokeWeight(2);
  stroke(0);

if (int(random(2)) < 1) {
line(a*DimQuadrato, b*DimQuadrato, (a+1)*DimQuadrato, (b+1)*DimQuadrato);
}else{
line((a+1)*DimQuadrato, b*DimQuadrato, a*DimQuadrato, (b+1)*DimQuadrato);
}


}
    


	
