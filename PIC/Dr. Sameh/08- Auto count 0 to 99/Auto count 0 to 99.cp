#line 1 "C:/Users/engma/Desktop/Auto count 0 to 99/Auto count 0 to 99.c"
#line 11 "C:/Users/engma/Desktop/Auto count 0 to 99/Auto count 0 to 99.c"
void main()
{ char segment[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};

 trisb = 0;  portb  = segment[0];
 trisc = 0;  portc  = segment[0];;

 while ( portd.f0  == 1);

 for(;;)
 {
 char ones = 0, tens = 0;
 for(tens=0; tens<=9; tens++)
 for(ones=0; ones<=9; ones++)
 {
  portb  = segment[tens];
 while(ones<=9)
 {
  portc  = segment[ones++];
 delay_ms(1000);
 }
 }
 }
}
