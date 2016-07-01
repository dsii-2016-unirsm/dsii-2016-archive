import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
float valore;
float traY=0, rotX=0;

//array di valori
IntList Valori;
int totaleValori = 60;

IntList ValoriTemp;
int totaleValoriTemp=120;

float secondi;
float ora = 0;
int radius= 0;
int timer;
int giorni;
int base=+500;
int zoom=-600;
int add =4;

public float RX;
public float RY=timer;




void setup() {

  // Reed port value.
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  println(Serial.list());
 myPort = new Serial(this, portName, 9600);

  Valori = new IntList(); //valori è un nuovo array
  ValoriTemp = new IntList(); //nuovo array

  size(700,700,P3D);
  background(0);
  stroke(255);
  noFill();
}

void draw() {
  lights();
// posizione anelli
  translate(width/2, base+giorni, zoom);
  rotateZ(width-1000);

//rotazione cerchi su asse giornaliero
  rotateX(RX);  

  
  strokeWeight(1);
  stroke(255,255,255,10);
  
//dammi un valore di media dei valori di ogni secondo
  secondi = millis()/1000;
  if (secondi-ora >= 1) {
    media();
  } 
  ora = secondi;

    pushMatrix();
    
    for(int i=0; i<add; i++ ){
    translate(0, i+100, 0);
    }
    
    popMatrix();
    
//mappa i valori di arduino con una dimensione
  for (int h=0; h<Valori.size(); h++) {
    int radius = (int) map(Valori.get(h), 0, 2000, 0, height/2);
  ellipse(width/2, height/2, radius*10, radius*10);
  }

}

 
//fai la media
void media() {
  int somma = 0;
  for (int i=0; i<ValoriTemp.size(); i++) {
    somma+=ValoriTemp.get(i);
  }
  if (somma != 0 && ValoriTemp.size() >0) {
    int media = somma / ValoriTemp.size(); //media è la somma di tutti i ValoriTemp/ il numero di ValoriTemp
    Valori.append(media); 
    ValoriTemp.clear();
  }
}


void serialEvent (Serial myPort) {
  // get the ASCII string:
  String val = myPort.readStringUntil('\n');
  // trim off any whitespace:
  if (val != null) {
      val = trim(val);
    //else val ="0";
    
    // convert to an int
    radius = int(val);
    ValoriTemp.append(radius);
  if (ValoriTemp.size() >= totaleValoriTemp) {
      ValoriTemp.remove(0);
  }
    println(val);
  }
  // at the edge of the screen, go back to the beginning:
}

void mouseClicked() {
  background(0);
}

void keyPressed(){
  
  if(key == 's'){
   saveFrame("###.png");
   println("saved");
  }
  
   if(key == 'c'){
    background(0);
  }
  
   if(key=='g'){
   giorni= giorni-200;
  }
 
}


void mouseDragged() {

  if (mouseButton==LEFT)
  {
    // varia la rotazione dei cerchi lungo l'anello
    RX= (mouseX/360.0)*5*PI+PI;
  }
}  