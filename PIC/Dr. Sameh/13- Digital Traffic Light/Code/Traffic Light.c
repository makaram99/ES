                                                                       /*
Mahmoud Karam
Auto Count 0 to 99 seven segment with start button pull_up resistor
*/

//define 7 Segments ports
#define street1 portb
#define street2 portc

#define led portd.f3     //with NOT Gate

#define ones_GND portd.f1  //activate ones 7 Segment
#define tens_GND portd.f2  //activate tens 7 Segment

#define start portd.f0   //start switch

void main()
{
    char j, i, ones=0, tens=0, cnt1 = 0, cnt2 = 0, temp1=0, temp2=1;
    trisb = 0;       trisd = 1;  //f0 as I/P FOR START BUTTON
    portb = 0;       portd = 0;  //display zero on 7-SEG

    while (start == 1);  //check start butoon released
    
    led = 1;
    for(;;)
    {
          cnt2=1;
          for(j=6; j>0; j--)
          {  
            cnt1 = j-1;
            for(i=0; i<50; i++)
            {
                portb = cnt2;
                tens_GND = 1;   delay_ms(10);    tens_GND = 0;

                portb = cnt1;
                ones_GND = 1;   delay_ms(10);    ones_GND = 0;
            }
          }

          ones_GND = 1;
          for(j=10; j>0; j--)
          {
                cnt1 = j-1;
                portb = cnt1;
                delay_ms(1000);
          }
        
        //converting LEDs
        temp2 = led;
        led = temp1;
        temp1 = temp2;

    }
}