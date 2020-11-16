                                                                       /*
Mahmoud Karam
Auto Count 0 to 99 seven segment with start button pull_up resistor
*/
//define 7 Segments ports
#define seg portb

#define ones_GND portd.f1
#define tens_GND portd.f2

#define start portd.f0   //start switch

void main()
{
    char i, ones=0, tens=0, cnt1 = 0, cnt2 = 0;
    
    trisb = 0;       trisd = 1;  //f0 as I/P FOR START BUTTON
    portb = 0;       portd = 0;  //display zero on 7-SEG

    for(;;)
    {
        for(cnt2=0; cnt2<=9; cnt2++)
          for(cnt1=0; cnt1<=9; cnt1++)
          for(i=0; i<50; i++)
          {
              portb = cnt2;
              tens_GND = 1;   delay_ms(10);    tens_GND = 0;

              portb = cnt1;
              ones_GND = 1;   delay_ms(10);    ones_GND = 0;
          }
          while (start == 1);  //check start butoon released
    }
}