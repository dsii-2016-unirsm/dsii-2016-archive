

/*

 Table table = loadTable("borsa_petrolio.csv","header");
 
 int val1 = table.getInt(2, 1);     
 float val2 = table.getFloat(3, 2);  
 String s = table.getString(0, 3);   
 */
PImage p;
void setup () {
  size(600, 600);
  background(255);
  String[] lines = loadStrings("provaDati.txt");  //legge stringhe  direttamente dal file


  stroke(0);  //linee nere
  for (int i =0; i<lines.length; i++) {  //incrementa lunghezza linea

    println(float(lines[i]));  //stampa linea
    // line(10+i*(height/lines.length),height/2,10+i*(height/lines.length),height/2+(float(lines[i])*1000));
  }
}

int cont=0;

void draw() {

  cont++;
  fill(0);
  ellipse(width/2+cont, height/2+cont, 5, 5); //sfere che compongono la linea
  p = get(0, 0, width, height); 

  translate(-cont, -cont); //trasla e sovrascrive(?) sfere
  set(0, 0, p);
}



