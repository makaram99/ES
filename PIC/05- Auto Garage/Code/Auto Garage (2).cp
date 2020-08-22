#line 1 "C:/Users/engma/Desktop/Code/Auto Garage (2).c"
#line 31 "C:/Users/engma/Desktop/Code/Auto Garage (2).c"
void main() {

 char segment[] = {  0X3F ,  0X06 ,  0X5B ,  0X4F ,  0X66 ,  0X6D ,  0X7D ,  0X07 ,  0X7F ,  0X6F };
 char count = 0;

 trisb = 0b00111111; portb = 0;
 trisd = 0; portd = 0;
 trisc = 0;
 portc = segment[count];

 start:
 if(  portb.f0  == 1)
 {
 if(count == 9)
 {
  portd.f4  = 1;
 delay_ms(2000);
  portd.f4  = 0;
 goto start;
 }

 enter:
 portc = segment[++count];
  portd.f0  = 1;
 while ( portb.f1  == 0);
  portd.f0  = 0;
 delay_ms(1000);
 while( portb.f0  == 1);
  portd.f1  = 1;
 check_LS2:
 if( portb.f2  == 1)
 {
  portd.f1  = 0;
 delay_ms(1000);
 goto start;
 }
 else if( portb.f0  == 1)
 {
 if(count == 9)
 {
  portd.f4  = 1;
 delay_ms(2000);
  portd.f4  = 0;
 goto check_LS2;;
 }

  portd.f1  = 0;
 delay_ms(1000);
 goto enter;
 }
 goto check_LS2;
 }

 else if ( portb.f3  == 1)
 {
 if (count == 0)
 goto start;

 leave:
 portc = segment[--count];
  portd.f2  = 1;
 while ( portb.f4  == 0);
  portd.f2  = 0;
 delay_ms(1000);
 while ( portb.f3  == 1);
  portd.f3  = 1;

 check_LS4:
 if( portb.f5  == 1)
 {
  portd.f3  = 0;
 delay_ms(1000);
 goto start;
 }
 else if ( portb.f3  == 1)
 if(count == 0)
 goto check_LS4;
 else
 {
  portd.f3  = 0;
 delay_ms(1000);
 goto leave;
 }
 else
 goto check_LS4;
 }

 else
 goto start;
}
