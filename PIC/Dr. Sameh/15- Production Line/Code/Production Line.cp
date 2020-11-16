#line 1 "C:/Users/engma/Desktop/2- Production Line/Code/Production Line.c"









void interrupt()
{
 intcon.INTF = 0;
  portd.f0  = 0;  portd.f2  = 0;
 while( portb.f1  == 0)
  portd.f1  = 1;
  portd.f1  = 0;
 if( portb.f2  == 1)
 {
  portd.f2  = 1;  portd.f0  = 0; return;
 }
 else
 {
  portd.f2  = 0;  portd.f0  = 1; return;
 }
}

void main()
{
 trisb = 0b00001111; portd = 0;
 trisd = 0; portd = 0;
 intcon.INTE = 1; intcon.GIE = 1; option_reg.INTEDG = 1;

 while( portb.f3  == 0);

  portd.f0  = 1;
 for(;;)
 {
 while ( portb.f2  == 0);
  portd.f0  = 0;  portd.f2  = 1;
 delay_ms(1000);
  portd.f0  = 1;  portd.f2  = 0;
 }
}
