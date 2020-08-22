/*Eng Mahmoud Karam
TRAFFIC LIGHT PROGRAM
*/

//start button
# define start portb.f0
//Street 1
# define red1 portc.f0
# define green1 portc.f1
# define blue1 portc.f2
//Streat 2
# define red2 portc.f3
# define green2 portc.f4
# define blue2 portc.f5

void main() {
  trisb = 1;  //set pin 0 @ port B as I/P for start switch
  trisc = 0;  //set port C as O/P for LEDs
  portc = 0;  //initialize port C to GND

  while (start==1);   //check start button
  for(;;)
  {
    portc = 0b00001100;
    delay_ms(3000);

    porta = 0b00011110;
    delay_ms(1000);

    portc = 0b00100001;
    delay_ms(3000);

    portc = 0b00110011;
    delay_ms(1000);
  }
}