#define ll portb.f0     //Low Level Sensor
#define hl portb.f1     //High Level Sensor
#define photocell portb.f2     //Photo Cell Sensor
#define start portb.f3         //Start button     default low

#define motor portd.f0
#define pump portd.f1
#define valve portd.f2

void interrupt()
{
     intcon.INTF = 0;
     motor = 0;   valve = 0;
     while(hl == 0)
        pump = 1;
     pump = 0;
     if(photocell == 1)
     {
         valve = 1;  motor = 0;        return;
     }
     else
     {
         valve = 0;  motor = 1;        return;
     }
}

void main() 
{
     trisb = 0b00001111;  portd = 0;
     trisd = 0;  portd = 0;
     intcon.INTE = 1;  intcon.GIE = 1; option_reg.INTEDG = 1;   //Rising
     
     while(start == 0);
     
     motor = 1;
     for(;;)
     {
         while (photocell == 0);
         motor = 0;   valve = 1;
         delay_ms(1000);
         motor = 1;   valve = 0;
     }
}