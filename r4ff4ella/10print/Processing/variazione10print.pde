//variazione 10print 
//si genera il labirinto, modificandosi in modo random
/*
10 PRINT ABSTRACT
Inspired by: 10 PRINT CHR$(205.5+RND(1)); : GOTO 10
Jacob Joaquin
jacobjoaquin@gmail.com
twitter @jacobjoaquin
http://www.openprocessing.org/sketch/84209
*/


int DimQuadrato = 75; //quadrati
int nQuadrati_x; // numero di quadrati possibili sull'asse x
int nQuadrati_y; // numero di quadrati possibili sull'asse y


void setup() {
   background(221,0,87);
   fullScreen();
   
    nQuadrati_x = width / DimQuadrato; // numero di quadrati sull'asse x
    nQuadrati_y = height / DimQuadrato; //numero di quadrati sull'asse y
    strokeCap(SQUARE);// estremità linee
    
   }
   
 
 void draw() {

    //identificazione di uno dei possibili quadrati da disegnare
 disegnaQuadrato((int) random(nQuadrati_x), (int) random(nQuadrati_y));
 
  }
  
  
  void disegnaQuadrato(int x_, int y_){
 
//QUADRATI
  noStroke();
  //x_*DimQuadrato = coordinata x reale del quadrato identificato
  //y_*DimQuadrato = coordinata y reale del quadrato identificato
  rect(x_*DimQuadrato, y_*DimQuadrato, DimQuadrato, DimQuadrato);
  fill(221,0,87);
  
 
//LINEE

  strokeWeight(2);
  stroke(0);
  if (random(2) < 1) {
  line(x_*DimQuadrato, y_*DimQuadrato, (x_+1)*DimQuadrato, (y_+1)*DimQuadrato);
  } else {
  line((x_+1)*DimQuadrato, y_*DimQuadrato, x_*DimQuadrato, (y_+1)*DimQuadrato);
}
 
  
}
