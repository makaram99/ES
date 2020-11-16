/*
Automatic Door
Mahmoud Karam
*/
#define S1 portb.f0     //sensor 1
#define S2 portb.f1     //sensor 2
#define LS1 portb.f2    //limit switch 1
#define LS2 portb.f3    //limit switch 2
#define DIR1 portd.f0   //Direction 1
#define DIR2 portd.f1   //Direction 2
#define turn_on 1
#define turn_off 0

void main() {
//initialize ports
trisb = 0b00001111; portb = 0;      //set pins 0,1,2,3 of port B as I/P & initialize O/P pins to GND
trisd = 0; portd = 0;     ////set port B as O/P & initialize it to GND

start:
check_in_out:
if((S1 ==1 ) || (S2 == 1))
open: DIR1 = 1;     //open door
else
    goto check_in_out;

delay_ms(1000);

check_fully_opened:
if(LS1 == 1)
    DIR1 = 0;     //stop opening
else
    goto check_fully_opened;
delay_ms(2000);

DIR2 = 1;      //close door
check_fully_closed:
if(LS2 == 1)   //fully closed
{
    DIR2 = 0;  //stop closing
    delay_ms(1000);  
    goto start; 
}
else if((S1 ==1 ) || (S2 == 1)) //Check enter or leave
{    
     DIR2 = 0;
     delay_ms(1000); 
     goto open; 
}
else
    goto check_fully_closed;
}