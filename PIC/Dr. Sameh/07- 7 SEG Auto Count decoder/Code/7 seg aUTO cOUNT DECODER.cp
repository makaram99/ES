#line 1 "C:/Users/engma/Desktop/7 SEG Auto Count decoder/Code/7 seg aUTO cOUNT DECODER.c"
#line 10 "C:/Users/engma/Desktop/7 SEG Auto Count decoder/Code/7 seg aUTO cOUNT DECODER.c"
void main()
{
 trisb = 0; portb = 0;
 trisd = 1; portd = 0;
 char count = 0;
 while ( portd.f0  == 0);

 while(1)
 {
 for(count =0; count <=10; count++)
 {
  portb  = count;
 delay_ms(1000);
 }
 }
}
