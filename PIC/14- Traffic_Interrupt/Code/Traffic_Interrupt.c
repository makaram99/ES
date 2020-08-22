#define start portd.f0

void interrupt()
{
     intcon.intf = 0;
     while(1)
     {
       portc = 0b00010010;        delay_ms(1000);
       portc = 0;        delay_ms(1000);
     }
}

void display()
{
     portc = 0b00100001;        delay_ms(1000);
     portc = 0b00110011;        delay_ms(1000);
     portc = 0b00001100;        delay_ms(1000);
     portc = 0b00011110;        delay_ms(1000);
}

void main() {
trisc = 0;  portc = 0;
trisd.f0 = 1;     portd = 0;
intcon.inte = 1;  intcon.gie = 1;       option_reg.intedg = 0;

while(start == 1);           //check for start releasing
while(1)
   display();
}