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

void setup() {
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);

  Valori = new IntList(); //valori è un nuovo array
  ValoriTemp = new IntList(); //nuovo array



  size(640, 480);
  background(0);
  stroke(255);
  noFill();
  /* if ( myPort.available() > 0) 
   {  // If data is available,
   val = myPort.readStringUntil('\n');         // read it and store it in val
   } */
}

void draw() {
  background(0);
  //dammi un valore di media dei valori di ogni secondo
  secondi = millis()/1000;
  if (secondi-ora >= 1) {
    media();
  } 
  ora = secondi;

//mappa i valori di arduino con una dimensione
  for (int i=0; i<Valori.size(); i++) {
    int raggio = (int) map(Valori.get(i), 0, 2000, 0, height/2);
    ellipse(width/2, height/2, raggio*2, raggio*2);
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
    int radius = int(val);
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
