                                                                       /*
Mahmoud Karam
Auto Count 0 to 99 seven segment with start button pull_up resistor
*/
//define 7 Segments ports
#define seg portb
#define ones_GND portd.f1
#define tens_GND portd.f2

#define start portd.f0   //start switch

char display(char num)
{
     char x;
     char segment[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};      //for CC 7-SEG
     x = segment[num];
     return (x);
}

void main()
{
    char i, ones, tens, count = 0;
    trisb = 0;       trisd = 1;  //f1, f2 as I/P
    portb = 0;       portd = 0;

    while (start == 1);  //check start butoon released

    for(;;)
    {
        for(i=0; i<50; i++)
        {
            tens = count/10;
            portb = display(tens);
            tens_GND = 1;   delay_ms(10);    tens_GND = 0;
            
            ones = count%10;
            portb = display(ones);
            ones_GND = 1;   delay_ms(10);    ones_GND = 0;
        }
        if(++count == 100)
            count = 0;
    }
}