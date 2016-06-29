/* Waves 01 by jamburraska_anthony cosentino
   2016 © Anthony @jamburraska, Daniele @Fupete and the course DSII2016 @UniRSM
   github.com/fupete — github.com/dsii-2016-unirsm - github.com/Jamburraska
   Educational purposes, MIT License, 2016, San Marino
   —
   Credits to Aaron Alai / Original code inspired on www.aaronalai.com/emf-detector
*/

int inPin = 2;                                // analog 2
int val = 0;                                  // where to store info from analog 5
int pin11 = 11;                               // output of red led

void setup() {

  Serial.begin(9600);

}

void loop() {



  val = analogRead(inPin);                     // reads in the values from analog 2 and
  //assigns them to val
  if (val >= 0) {

    val = constrain(val, 0, 100);              // mess with these values
    val = map(val, 0, 100, 0, 1000);           // to change the response distance of the device
    analogWrite(pin11, val);                   // note also messing with the resistor should change
                                               // the sensitivity
  } else {                                     // analogWrite(pin11, val); just tuns on the led with
                                               // the intensity of the variable val
    analogWrite(pin11, 1);                     // the else statement is just telling the microcontroller
                                               // to turn off the light if there is no EMF detected
  }
  if (val > 0)
    Serial.println(val);                       // use output to aid in calibrating

}
