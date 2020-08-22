const byte trigger = 7;
const byte echo = 8;

float distance;
unsigned long period;

void setup() {
  // put your setup code here, to run once:
pinMode (trigger, OUTPUT);
pinMode (echo, INPUT);
Serial.begin (9600);
}

void loop() {
  // put your main code here, to run repeatedly:
digitalWrite (trigger, LOW);
delayMicroseconds (3);

digitalWrite (trigger, HIGH);
delayMicroseconds (10);

digitalWrite (trigger, LOW);

period = pulseIn (echo, HIGH);

distance = float (period) / 58.8;
Serial.println (distance);

delay (60);
}
