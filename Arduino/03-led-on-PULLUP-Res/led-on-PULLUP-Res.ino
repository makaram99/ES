const byte led = 7;
const byte button = 3;

void setup() {
  // put your setup code here, to run once:
pinMode (led, OUTPUT);
pinMode (button, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  
byte test = 0;
test = digitalRead (button);

if (test==HIGH)
{
  delay (25);
  digitalWrite (led, HIGH);
}

else
{
  delay (25);
  digitalWrite (led, LOW);
}

}
