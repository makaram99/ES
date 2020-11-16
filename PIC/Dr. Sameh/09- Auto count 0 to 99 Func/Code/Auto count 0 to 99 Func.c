/*
Mahmoud Karam
Auto Count 0 to 99 seven segment with start button pull_up resistor
*/
//define 7 Segments ports
#define seg1 portc
#define seg2 portb

#define start portd.f0   //start switch

void display()
{
     char ones = 0, tens = 0;
     
     char segment[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};      //for CC 7-SEG
     seg2 = segment[0];      seg1 = segment[0];      //display zero
     
     for(tens=0; tens<=9; tens++)
        for(ones=0; ones<=9; ones++)
        {
          seg2 = segment[tens];
          while(ones<=9)
          {
              seg1 = segment[ones++];
              delay_ms(1000);
          }
        }
}

void main()
{
    trisb = 0;    seg2 = 0;
    trisc = 0;    seg1 = 0;

    while (start == 1);  //check start butoon released

    for(;;)
        display();
}