#line 1 "C:/Users/engma/Desktop/Traffic Light/Mikro C/Traffic Light.c"
#line 16 "C:/Users/engma/Desktop/Traffic Light/Mikro C/Traffic Light.c"
void main() {
 trisb = 1;
 trisc = 0;
 portc = 0;

 while ( portb.f0 ==1);
 for(;;)
 {
 portc = 0b00001100;
 delay_ms(3000);

 porta = 0b00011110;
 delay_ms(1000);

 portc = 0b00100001;
 delay_ms(3000);

 portc = 0b00110011;
 delay_ms(1000);
 }
}
