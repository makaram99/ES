
#define start portd.f0         //setting start switch at Pin 0 at port D
#define yellow portc.f0
#define green portc.f1

void main() 
{
     trisc = 0;
     portc = 0;
     
     OPTION_REG.INTEDG = 1;       //Interrupt on rising edgein SFR OPTION_REG
     //INTEDG_bit = 1;
     INTCON.GIE = 1;              //Enabling global interrupt enable bit in SFR INTCON Register
     //GIE_bit = 1;
     inte_bit = 1;                //Enabling interrupt enable bit in SFR INTCON Register
     //INTCON.inte = 1;
     intcon.INTF = 0;             //Pressetting interrupt flag bit in SFR INTCON Register to low.
     //INTF_bit = 0;

     while (start == 0);
     
     while (1)
     {
         green = 1;
         yellow = 1;
     }
}

void interrupt()
{
     if (intf_bit)
     {
         int i;
         for(i =1; i<=2;i++)
         {
           green = yellow = ~yellow;
           delay_ms(1000);
           green = yellow = ~yellow;
           delay_ms(1000);
         }
        intf_bit = 0;
     }
}