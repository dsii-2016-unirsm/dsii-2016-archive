   // Processing variation of 10Print by jamburraska : "EYE"
// 2016 © jamburraska, Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2016-unirsm
// Educational purposes, MIT License, 2016, San Marino
// Istruzioni:
// Premere "s" per stoppare l'interazione e salvare il frame.
// Premere "r" per riprendere.
   
   
   
    int w = 16;
    int h = 16;
    int index = 0;
    int colore = 20;
    void setup() {
      size(800, 600);
      background(0);
      strokeWeight(3);
      stroke(224);
      smooth();
      print(colore);
} 
    void draw() {
      
      int x1 = w*index;
      int x2 = x1 + w;
      int y1 = h*23;
      int y2 = h*24;
      
      //quando viene premuto il mouse il contorno del cerchio assume colori random
      if (mousePressed)  {
        ellipseMode(CENTER);
        ellipse(width/2, height/2, mouseX, mouseY);
        stroke (random(0, 255), random(0, 255), random(0, 255));
        
        
      
      
      } else {
        ellipse(width/2, height/2, mouseX, mouseY); 
        stroke(150);
        strokeWeight(0.5);
        fill(0);
} 
  

} 


//quando premo il tasto "s" blocco la schermata e salvo la composizione
void keyPressed() { 
  switch(key) {
  case 's':
    noLoop();
    saveFrame();
    break;
    
    //quando premo "r" riprendo il loop da dove l'avevo lasciato
    case 'r':
    loop();
    break;
  }
}
