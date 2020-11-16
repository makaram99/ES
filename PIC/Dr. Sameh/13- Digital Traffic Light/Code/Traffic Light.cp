#line 1 "C:/Users/engma/OneDrive/FEE/Level 2/MCU/Tasks/13- Digital Traffic Light/Code/Traffic Light.c"
#line 16 "C:/Users/engma/OneDrive/FEE/Level 2/MCU/Tasks/13- Digital Traffic Light/Code/Traffic Light.c"
void main()
{
 char j, i, ones=0, tens=0, cnt1 = 0, cnt2 = 0, temp1=0, temp2=1;
 trisb = 0; trisd = 1;
 portb = 0; portd = 0;

 while ( portd.f0  == 1);

  portd.f3  = 1;
 for(;;)
 {
 cnt2=1;
 for(j=6; j>0; j--)
 {
 cnt1 = j-1;
 for(i=0; i<50; i++)
 {
 portb = cnt2;
  portd.f2  = 1; delay_ms(10);  portd.f2  = 0;

 portb = cnt1;
  portd.f1  = 1; delay_ms(10);  portd.f1  = 0;
 }
 }

  portd.f1  = 1;
 for(j=10; j>0; j--)
 {
 cnt1 = j-1;
 portb = cnt1;
 delay_ms(1000);
 }


 temp2 =  portd.f3 ;
  portd.f3  = temp1;
 temp1 = temp2;

 }
}
