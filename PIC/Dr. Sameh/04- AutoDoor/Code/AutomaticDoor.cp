#line 1 "C:/Users/engma/Desktop/AutoDoor/Code/AutomaticDoor.c"
#line 14 "C:/Users/engma/Desktop/AutoDoor/Code/AutomaticDoor.c"
void main() {

trisb = 0b00001111; portb = 0;
trisd = 0; portd = 0;

start:
check_in_out:
if(( portb.f0  ==1 ) || ( portb.f1  == 1))
open:  portd.f0  = 1;
else
 goto check_in_out;

delay_ms(1000);

check_fully_opened:
if( portb.f2  == 1)
  portd.f0  = 0;
else
 goto check_fully_opened;
delay_ms(2000);

 portd.f1  = 1;
check_fully_closed:
if( portb.f3  == 1)
{
  portd.f1  = 0;
 delay_ms(1000);
 goto start;
}
else if(( portb.f0  ==1 ) || ( portb.f1  == 1))
{
  portd.f1  = 0;
 delay_ms(1000);
 goto open;
}
else
 goto check_fully_closed;
}
