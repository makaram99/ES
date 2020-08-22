#line 1 "F:/Bussiness/FEE/Level 2/Term 2/MCU/Projects/17- Transporter with HC05/Transporter_With_HC05.c"
#line 34 "F:/Bussiness/FEE/Level 2/Term 2/MCU/Projects/17- Transporter with HC05/Transporter_With_HC05.c"
char Data ;






void move_F();







void move_R();







void move_L();







void move_B();






void move_S();






void move_AU();






void move_AD();






void move_AR();






void move_AL();






void move_GO();






void move_GC();







void pins_config();




void main()
{

 pins_config();

 while (1){
 if(UART1_Data_Ready())
 {
 Data =UART1_Read();
 if(Data=='F')
 move_F();
 else if(Data=='L')
 move_L();
 else if(Data=='R')
 move_R();
 else if(Data=='B')
 move_B();
 else if(Data=='S')
 move_S();
 else if(Data=='A')
 move_AU();
 else if(Data=='a')
 move_AD();
 else if(Data=='B')
 move_AR();
 else if(Data=='b')
 move_AL();
 else if(Data=='G')
 move_GO();
 else if(Data=='g')
 move_GC();
 else {};
 }

 }
}

void pins_config()
{
 UART1_Init(9600);
 Delay_ms(100);
 trisb = 0b00000000;
 portb = 0b00000000;
 trisd = 0b00000000;
 portd = 0b00000000;
}

void move_F()
{
  portb.b0 =1;
  portb.b1 =0;
  portb.b2 =1;
  portb.b3 =0;
}

void move_R()
{
  portb.b0 =0;
  portb.b1 =1;
  portb.b2 =1;
  portb.b3 =0;
}

void move_L()
{
  portb.b0 =1;
  portb.b1 =0;
  portb.b2 =0;
  portb.b3 =1;
}

void move_B()
{
  portb.b0 =0;
  portb.b1 =1;
  portb.b2 =0;
  portb.b3 =1;
}

void move_S()
{
  portb.b0 =0;
  portb.b1 =0;
  portb.b2 =0;
  portb.b3 =0;
}

void move_AU()
{
  portb.b4 =1;
  portb.b5 =0;
}

void move_AD()
{
  portb.b4 =0;
  portb.b5 =1;
}

void move_AR()
{
  portb.b6 =1;
  portb.b7 =0;
}

void move_AL()
{
  portb.b6 =0;
  portb.b7 =1;
}

void move_GO()
{
  portd.b0 =1;
  portd.b1 =0;
}

void move_GC()
{

  portd.b0 =0;
  portd.b1 =1;
}
