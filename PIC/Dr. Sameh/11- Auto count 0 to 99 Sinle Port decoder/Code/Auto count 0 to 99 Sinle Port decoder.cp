#line 1 "F:/Bussiness/FEE/Level 2/Term 2/MCU/Projects/2- 7_SEG/11- Auto count 0 to 99 Sinle Port decoder/Code/Auto count 0 to 99 Sinle Port decoder.c"
#line 13 "F:/Bussiness/FEE/Level 2/Term 2/MCU/Projects/2- 7_SEG/11- Auto count 0 to 99 Sinle Port decoder/Code/Auto count 0 to 99 Sinle Port decoder.c"
void main()
{
 char i, ones=0, tens=0, cnt1 = 0, cnt2 = 0;

 trisb = 0; trisd = 1;
 portb = 0; portd = 0;

 for(;;)
 {
 for(cnt2=0; cnt2<=9; cnt2++)
 for(cnt1=0; cnt1<=9; cnt1++)
 for(i=0; i<50; i++)
 {
 portb = cnt2;
  portd.f2  = 1; delay_ms(10);  portd.f2  = 0;

 portb = cnt1;
  portd.f1  = 1; delay_ms(10);  portd.f1  = 0;
 }
 while ( portd.f0  == 1);
 }
}
