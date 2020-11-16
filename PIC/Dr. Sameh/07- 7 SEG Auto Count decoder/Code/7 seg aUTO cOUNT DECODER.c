/*
Mahmoud Karam
7 Segment Auto counter from 0 to 9
with 74LS48 BCD decoder
*/

#define display portb
#define start portd.f0

void main() 
{
     trisb = 0;       portb = 0; //display zero
     trisd = 1;       portd = 0;
     
     char count = 0;
     while (start == 0);
     
     while(1)
     {
            for(count =0; count <=10; count++)
            {
                display = count;
                delay_ms(1000);
            }
     }
}