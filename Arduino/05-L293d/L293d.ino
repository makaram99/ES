const byte leftforward = 2;
const byte leftbackward = 3;
const byte rightforward =4;
const byte rightbackward = 5;

byte i = LOW, j = HIGH, swap;

void setup() {
  // put your setup code here, to run once:
  pinMode (leftforward, OUTPUT);
  pinMode (leftbackward, OUTPUT);
  pinMode (rightforward, OUTPUT);
  pinMode (rightbackward, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

//byte i = LOW, j = HIGH, swap; //make it on one direction (won't reverse)
{
  digitalWrite (leftforward, LOW);
  digitalWrite (leftbackward, LOW);
  digitalWrite (rightforward, LOW);
  digitalWrite (rightbackward, LOW);
  delay (1000);
  
  swap = i;
  i = j; 
  j = swap;
  
  digitalWrite (leftforward, i);
  digitalWrite (leftbackward, j);
  digitalWrite (rightforward, i);
  digitalWrite (rightbackward, j);
  delay (1000);
}
}
