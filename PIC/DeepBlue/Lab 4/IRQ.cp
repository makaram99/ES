#line 1 "C:/Users/makar/Desktop/MCU/Lab 4/IRQ.c"





void main()
{
 trisc = 0;
 portc = 0;

 OPTION_REG.INTEDG = 1;

 INTCON.GIE = 1;

 inte_bit = 1;

 intcon.INTF = 0;


 while ( portd.f0  == 0);

 while (1)
 {
  portc.f1  = 1;
  portc.f0  = 1;
 }
}

void interrupt()
{
 if (intf_bit)
 {
 int i;
 for(i =1; i<=2;i++)
 {
  portc.f1  =  portc.f0  = ~ portc.f0 ;
 delay_ms(1000);
  portc.f1  =  portc.f0  = ~ portc.f0 ;
 delay_ms(1000);
 }
 intf_bit = 0;
 }
}
