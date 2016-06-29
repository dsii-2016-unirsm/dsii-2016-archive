int w = 16; // int = variabili per valori interi
int h = 16;
int index = 0; // posizione rispetto al lato sx del display
    void setup() {
      size(640, 384);
      //background(#0000ff); //colore di sfondo
      strokeWeight(3);
      stroke(224);
      smooth();
} // la parte sopra definisce le caratteristiche di un display

    void draw() {
      int x1 = w*index; // origine del labirinto rispetto al lato sx del display
      int x2 = x1 + w;
      int y1 = h*23;
      int y2 = h*24;
      //int x3 = (x2-x1)/2;
      //int y3 = (y2-y1)/2;
      if (random(2) < 1) {
        triangle(x2, y1, x1, y2, mouseX, mouseY); //non è più elemento linea ma un triangolo
        stroke(#00FF00);
        strokeWeight(0.5); 
        fill(#00BFFF);
      } else {
        triangle(x1, y1, x2, y2, mouseX, mouseY); 
        stroke(#FFFFFF);
        strokeWeight(0.5);
        fill(#FF00FF);
        background(#000000);
} 

      index++;
      if (index == width/w) {
        PImage p = get(0, h, width, h*23);
        
        stroke(#FFB6C1);
        set(0, 0, p);
        index = 0;
}
}
