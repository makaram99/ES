 #define LL portd.f0          //Low Level sensor
#define HL portd.f1          //High Level sensor
#define start_button portd.f2         //start button
#define pump portb.f0        //Pump motor
#define valve portb.f1       //Solenoid valve motor
#define turn_on 1
#define turn_off 0

void main() {
 trisd = 0b00000111;  //bits 0&1&2 in port D as I/P to LL&HL sensors, start button
 portd = 0;          //initializing O/P pins of ports D to GND

 trisb = 0; portb = 0;          //Port B as O/P and initializing it to GND

 while (start_button == 0);     //Checkig start button
 loop:
 if (LL ==1)
 {
    pump = turn_on; valve = turn_off;
 }
 if (HL ==1)
 {
    pump = turn_off; valve = turn_on;
 }
 goto loop;
}