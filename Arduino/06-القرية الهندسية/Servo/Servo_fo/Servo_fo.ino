#include <Servo.h>
Servo myservo;
byte pos = 0;

void setup()
{
  myservo.attach(3);
  Serial.begin(9600);
}

void loop()
{
  for(pos = 0; pos<180; pos++)
  {
    myservo.write(pos);
    Serial.print("Position: ");
    Serial.print(pos);
    Serial.print(" degree");
    Serial.println();
    delay(15);
  }

  for(pos = 179; pos>=0; pos--)
  {
    myservo.write(pos);
    Serial.print("Powition: ");
    Serial.print(pos);
    Serial.print(" degree");
    Serial.println();
    delay(15);
  }
}
