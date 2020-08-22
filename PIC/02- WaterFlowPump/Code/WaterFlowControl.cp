#line 1 "C:/Users/engma/Desktop/Pro/Code/WaterFlowControl.c"








void main() {
 trisd = 0b00000111;
 portd = 0;

 trisb = 0; portb = 0;

 while ( portd.f2  == 0);
 loop:
 if ( portd.f0  ==1)
 {
  portb.f0  =  1 ;  portb.f1  =  0 ;
 }
 if ( portd.f1  ==1)
 {
  portb.f0  =  0 ;  portb.f1  =  1 ;
 }
 goto loop;
}
