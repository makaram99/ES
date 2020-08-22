#line 1 "C:/Users/engma/Desktop/1- Traffic_Interrupt/Code/Traffic_Interrupt.c"


void interrupt()
{
 intcon.intf = 0;
 while(1)
 {
 portc = 0b00010010; delay_ms(1000);
 portc = 0; delay_ms(1000);
 }
}

void display()
{
 portc = 0b00100001; delay_ms(1000);
 portc = 0b00110011; delay_ms(1000);
 portc = 0b00001100; delay_ms(1000);
 portc = 0b00011110; delay_ms(1000);
}

void main() {
trisc = 0; portc = 0;
trisd.f0 = 1; portd = 0;
intcon.inte = 1; intcon.gie = 1; option_reg.intedg = 0;

while( portd.f0  == 1);
while(1)
 display();
}
