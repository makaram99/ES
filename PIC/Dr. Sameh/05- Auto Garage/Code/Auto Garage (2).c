/*
Automatic Garage
Mahmoud Karam
*/

#define S1 portb.f0     //sensor 1 for entry gate
#define LS1 portb.f1    //entry limit switch 1  for fully opened
#define LS2 portb.f2    //entry limit switch 2  for fully closed
#define S2 portb.f3    //sensor 2  for leave gate
#define LS3 portb.f4    //leave limit switch 3  for fully opened
#define LS4 portb.f5    //leave limit switch 2  for fully closed

#define entry_motor_open portd.f0
#define entry_motor_close portd.f1
#define leave_motor_open portd.f2
#define leave_motor_close portd.f3

#define LED portd.f4

#define zero 0X3F
#define one 0X06
#define two 0X5B
#define three 0X4F
#define four 0X66
#define five 0X6D
#define six 0X7D
#define seven 0X07
#define eight 0X7F
#define nine 0X6F

void main() {
    //segment numbers array
    char segment[] = { zero, one, two, three, four, five, six, seven, eight, nine};
    char count = 0;
    //initialize ports
    trisb = 0b00111111; portb = 0;      //set pins 0,1,2,3,4,5 of port B as I/P & set O/P pins to GND
    trisd = 0; portd = 0;     //set port B as O/P & initialize it to GND
    trisc = 0;           //seven seg port C as O/P
    portc = segment[count];  //display zero

    start:
    if( S1 == 1)             //check entering cars
    {
        if(count == 9)
        {
            LED = 1;
            delay_ms(2000);
            LED = 0;
            goto start;
        }//end of if(count == 9)
        
        enter:
        portc = segment[++count];
        entry_motor_open = 1;
        while (LS1 == 0);  //gate still opening
        entry_motor_open = 0;
        delay_ms(1000);
        while(S1 == 1);  //car is still entering
        entry_motor_close = 1;
        check_LS2:
        if(LS2 == 1)      //fully closed
        {
               entry_motor_close = 0;
               delay_ms(1000);
               goto start;
        }
        else if(S1 == 1)
        {
              if(count == 9)
              {
                  LED = 1;
                  delay_ms(2000);
                  LED = 0;
                  goto check_LS2;;
              }//end of if(count == 9)
              
              entry_motor_close = 0;
              delay_ms(1000);
              goto enter;
        }
        goto check_LS2;
    }//end of detecting sensor 1
    
    else if (S2 == 1)   //check leaving cars
    {
         if (count == 0)        //check empty garage
            goto start;

         leave:
         portc = segment[--count];
         leave_motor_open = 1;
         while (LS3 == 0);  //check still opening
         leave_motor_open = 0;
         delay_ms(1000);
         while (S2 == 1);
         leave_motor_close = 1;
         
         check_LS4:
         if(LS4 == 1)
         {
             leave_motor_close = 0;
             delay_ms(1000);
             goto start;
         }
         else if (S2 == 1)
              if(count == 0)
                  goto check_LS4;
              else
              {
                   leave_motor_close = 0;
                   delay_ms(1000);
                   goto leave;
              }
         else
             goto check_LS4;
    }//end of detecting sensor 2
    
    else    //no entering or leaving cars
        goto start;
}