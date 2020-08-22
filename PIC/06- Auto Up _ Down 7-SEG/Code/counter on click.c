/*
Mahmoud Karam
Seven segment counter
click up-switch to increase counter and display
click down-switch to decrease counter and display
All switches are active low
*/

#define start portb.f0
#define up_switch portb.f1
#define down_switch portb.f2
#define high_led portb.f3
#define low_led portb.f4

//define numbers with hexadecimal system
#define start_switch portb.f0
#define zero 0X3F
#define one 0X06
#define two 0X5B
#define three 0X4F
#define four 0X66
#define five 0X6D
#define six 0X7D
#define seven 0X07
#define eight 0X7F
#define nine 0X6F

void main() {
  //array of numbers
  char segment[] = {zero, one, two, three, four, five, six, seven, eight, nine};
  char count = 0;

  trisb = 7; portb = 0;    //port of switches & set O/P pins to GND
  trisc = 0; portc = segment[count];    //display zero
  
  while (start == 1);   //check start switch active low
  
  check_up: 
  if(up_switch == 0)
  {
      if (count == 9)
      {
          high_led = 1;
          delay_ms(2000);
          high_led = 0;
          goto check_down;
      }
      portc = segment[++count];     //increase count and display
      while(up_switch == 0);
  }
  
  check_down:
  if(down_switch == 0)
  {
      if (count == 0)
      {
          low_led = 1;
          delay_ms(2000);
          low_led = 0;
          goto check_up;
      }
      portc = segment[--count];     //increase count and display
      while(down_switch == 0);
  }
  goto check_up;
}