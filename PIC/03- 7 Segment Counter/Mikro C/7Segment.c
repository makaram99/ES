/* 7-seg. counter with start button
St. Mahmoud Karam
Level 2
*/
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

trisd = 0;  // O/P port
trisb = 1;  // bit '0' in port B as I/P

 portd = 0;    portb = 0;  // setting O/P pins in ports D & B to GND
 
 portd = segment[0];   //setting 7-Seg. to display zero
 
 while (start_switch == 0);      // check start button
 for(;;)    // Endless loop
 {
  int count;
  for(count=0; count<10; count++)
  {
   portd = segment[count];
   delay_ms(1000);
  }
 }
}