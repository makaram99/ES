#line 1 "C:/Users/engma/Desktop/Manual counter 0 to 99/Code/Manual counter 0 to 99.c"
#line 12 "C:/Users/engma/Desktop/Manual counter 0 to 99/Code/Manual counter 0 to 99.c"
char display(char num)
{
 char x;
 char segment[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};
 x = segment[num];
 return (x);
}

void main()
{
 char i, ones, tens, count = 0;
 trisb = 0; trisd = 1;
 portb = 0; portd = 0;

 for(;;)
 {
 do
 {
 tens = count/10;
 portb = display(tens);
  portd.f2  = 1; delay_ms(10);  portd.f2  = 0;

 ones = count%10;
 portb = display(ones);
  portd.f1  = 1; delay_ms(10);  portd.f1  = 0;
 }while( portd.f0  == 1);

 if(++count == 100)
 count = 0;

 do
 {
 tens = count/10;
 portb = display(tens);
  portd.f2  = 1; delay_ms(10);  portd.f2  = 0;

 ones = count%10;
 portb = display(ones);
  portd.f1  = 1; delay_ms(10);  portd.f1  = 0;
 }while( portd.f0  == 0);
 }
}
