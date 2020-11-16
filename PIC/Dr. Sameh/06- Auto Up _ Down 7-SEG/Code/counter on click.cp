#line 1 "C:/Users/engma/Desktop/7-SEG counter ++ & --/counter on click.c"
#line 28 "C:/Users/engma/Desktop/7-SEG counter ++ & --/counter on click.c"
void main() {

 char segment[] = { 0X3F ,  0X06 ,  0X5B ,  0X4F ,  0X66 ,  0X6D ,  0X7D ,  0X07 ,  0X7F ,  0X6F };
 char count = 0;

 trisb = 7; portb = 0;
 trisc = 0; portc = segment[count];

 while ( portb.f0  == 1);

 check_up:
 if( portb.f1  == 0)
 {
 if (count == 9)
 {
  portb.f3  = 1;
 delay_ms(2000);
  portb.f3  = 0;
 goto check_down;
 }
 portc = segment[++count];
 while( portb.f1  == 0);
 }

 check_down:
 if( portb.f2  == 0)
 {
 if (count == 0)
 {
  portb.f4  = 1;
 delay_ms(2000);
  portb.f4  = 0;
 goto check_up;
 }
 portc = segment[--count];
 while( portb.f2  == 0);
 }
 goto check_up;
}
