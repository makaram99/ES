#line 1 "C:/Users/engma/Desktop/7 Segment/Mikro C/7Segment.c"
#line 18 "C:/Users/engma/Desktop/7 Segment/Mikro C/7Segment.c"
void main() {

char segment[] = { 0X3F ,  0X06 ,  0X5B ,  0X4F ,  0X66 ,  0X6D ,  0X7D ,  0X07 ,  0X7F ,  0X6F };

trisd = 0;
trisb = 1;

 portd = 0; portb = 0;

 portd = segment[0];

 while ( portb.f0  == 0);
 for(;;)
 {
 int count;
 for(count=0; count<10; count++)
 {
 portd = segment[count];
 delay_ms(1000);
 }
 }
}
