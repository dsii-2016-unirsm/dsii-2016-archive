void setup() {
    background(221,0,87);
    fullScreen();
    nQuadrati_x = width / DimQuadrato; // numero di quadrati sull'asse orizzontale
    nQuadrati_y = height / DimQuadrato;//numero di quadrati sull'asse verticale
    strokeCap(SQUARE);// estremità linee
   }
 
void draw() {
  disegnaQuadrato((int) random(nQuadrati_x) * DimQuadrato, (int) random(nQuadrati_y) * DimQuadrato);
}
 
 
void disegnaQuadrato(int x_, int y_) {
  
//quadrati  
  translate(x_, y_);
  noStroke();
  rect(0, 0, DimQuadrato, DimQuadrato);
  fill(221,0,87);

//linee 
  strokeWeight(2);
  stroke(0);
  if (random(2) < 1) {
  line(0, 0, DimQuadrato, DimQuadrato);
  } else {
  line(DimQuadrato, 0, 0, DimQuadrato);
}

}
    
