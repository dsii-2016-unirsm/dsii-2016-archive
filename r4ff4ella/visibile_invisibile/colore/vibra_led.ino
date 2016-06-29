
void setup() {
    pinMode(9,OUTPUT);
    pinMode(10,OUTPUT);
    pinMode(11,OUTPUT);
    Serial.begin(9600);
}

 char val; 

void loop() {
  //LEGGE I DATI DA PROCESSING E ACCENDE IL LED CON UN DATO COLORE RGB
while (Serial.available()) { 
 val = Serial.read(); 
 }
 if (val == 'R') { // 
 digitalWrite(9, HIGH); 
  digitalWrite(10, LOW);
   digitalWrite(11, LOW);
 } 
if (val == 'G') { 
 digitalWrite(8, LOW); 
  digitalWrite(10, HIGH);
   digitalWrite(11, LOW);
 }
 if (val == 'B') { 
 digitalWrite(8, LOW); 
  digitalWrite(10, LOW);
   digitalWrite(11, HIGH);
 }

 
  // RACCOGLIE I DATI DAL SENSORE E LI SCRIVE
  int sensorValue = analogRead(A0);
  if(sensorValue>0)
  Serial.write(sensorValue);     
  delay(1);        // delay in between reads for stability
}
