#include <Servo.h>

Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards

int pos = 0;    // variable to store the servo position

void setup() {
  myservo.attach(10);  // attaches the servo on pin 9 to the servo object

  pinMode (11, OUTPUT);
  pinMode (2, INPUT);
  pinMode (8, OUTPUT);
    pinMode (13, OUTPUT);
  }

void loop() {


int bottone = digitalRead (2);
if (bottone == LOW)
{
  

digitalWrite(8, LOW); //stop

  analogWrite (11, 255);  //velocità
  delay(100);

  digitalWrite(8, HIGH); //stop

  analogWrite (11, 255);  //velocità
  delay(1);
  }
 
  /*
  
  for (pos = 0; pos <= 45; pos += 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
  for (pos = 45; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
*/
  
}
