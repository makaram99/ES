#include <Ultrasonic.h>
Ultrasonic ultrasonic(9,8);

byte const buzzer = 2;
int cmm;

void setup()
{
  pinMode (buzzer, OUTPUT);
  Serial.begin(9600);
}

void loop()
{
  cmm = ultrasonic.read(); 
  
  if (cmm < 50)
    {
      digitalWrite(buzzer, HIGH);
      delay(100);
      digitalWrite(buzzer, LOW);
      delay(100);
    }
  else
   digitalWrite(buzzer, LOW);
   
  Serial.print(cmm);
  Serial.print (" cm");
  Serial.println();
  delay(50);
}
