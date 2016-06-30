
#include <Servo.h>


Servo myservo;  // create servo object to control a servo
Servo servo_test; // Set the pin to digital I/O 13


int pos = 0;    // variable to store the servo position
int angle = 0;

void setup() {
  myservo.attach(10); // attaches the servo on pin 9 to the servo object
  servo_test.attach(9);


  pinMode (11, OUTPUT);
  pinMode (2, INPUT);
  pinMode (8, OUTPUT);
  pinMode (13, OUTPUT);

}

void loop()

//motore dc

{

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


  //servo motore

  {
    for (angle = 0; angle < 30; angle += 1)  // command to move from 0 degrees to 180 degrees
    {
      servo_test.write(angle);                 //command to rotate the servo to the specified angle
      delay(15);
    }

    delay(1000);

    for (angle = 10; angle >= 1; angle -= 5) // command to move from 180 degrees to 0 degrees
    {
      servo_test.write(angle);              //command to rotate the servo to the specified angle
      delay(5);
    }

    delay(1000);

    for (angle = 15; angle >= 1; angle -= 5) // command to move from 180 degrees to 0 degrees
    {
      servo_test.write(angle);              //command to rotate the servo to the specified angle
      delay(5);
    }

    delay(1000);

    for (angle = 20; angle >= 1; angle -= 5) // command to move from 180 degrees to 0 degrees
    {
      servo_test.write(angle);              //command to rotate the servo to the specified angle
      delay(5);
    }

    delay(1000);

    
    for (angle = 30; angle >= 1; angle -= 5) // command to move from 180 degrees to 0 degrees
    {
      servo_test.write(angle);              //command to rotate the servo to the specified angle
      delay(5);
    }

    delay(1000);


  }

}
