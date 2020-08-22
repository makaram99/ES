/* ******************************************************************** */
/* Author       : Mahmoud Karam                                         */
/* Date         : 09/08/2020                                            */
/* Version      : V1                                                    */
/* Description  : Control Transporter Robot with HC05 Module (3.3-6)V   */
/*                Implemented on PIC16F877A witt 20MHz Crystal.         */
/*                It has two Motors for motion, 2 Motors for Arm (one to*/
/*                go up&down and the other for left and right, and one  */
/*                motor for gripper                                     */
/* Actuators    : RM --> Right Motor                                    */
/*                LM --> Left Motor                                     */
/*                AMUD --> Arm Motor Up and Down                        */
/*                AMRL --> Arm Motor Left and Right                     */
/*                GMOC --> Gripper Motor Open and Close                 */
/* Pins of HC05 : 1 ---> state     not connected                        */
/*                2 ---> RXD       connected to TXD of pic              */
/*                3 ---> TXD       connected to RXD of pic              */
/*                4 ---> GND       connected to GND of pic              */
/*                5 ---> VCC       connected to +ve 5v of pic           */
/*                6 --->EN         not connected                        */
/* ******************************************************************** */

#define RM1 portb.b0                     //right motor pin1
#define RM2 portb.b1                     //right motor pin2
#define LM1 portb.b2                     //left motor pin1
#define LM2 portb.b3                     //left motor pin2
#define AMUD1 portb.b4                   //Arm motor up & down pin1
#define AMUD2 portb.b5                   //Arm motor up & down pin2
#define AMRL1 portb.b6                   //Arm motor Right & left pin1
#define AMRL2 portb.b7                   //Arm motor Right & left pin2
#define GMOC1 portd.b0                   //Gripper motor open & close pin1
#define GMOC2 portd.b1                   //Gripper motor open & close pin2

char Data ;
/* ********************************************************************** */
/* Function     : move_F   ==> Move Forward                               */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Defines the direction of each motor to go forward.      */
/*                Right and left motors are forward                       */
/* ********************************************************************** */
void move_F();

/* ********************************************************************** */
/* Function     : move_R   ==> Turn Right                                 */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Defines the direction of each motor to turn right.      */
/*                Right motor go backward and left motor go forward       */
/* ********************************************************************** */
void move_R();

/* ********************************************************************** */
/* Function     : move_L   ==> Turn Left                                  */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Defines the direction of each motor to turn left.       */
/*                Right motor go forward and left motor go backward       */
/* ********************************************************************** */
void move_L();

/* ********************************************************************** */
/* Function     : move_B   ==> Move Backward                              */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Defines the direction of each motor to go backward.     */
/*                Right and left motors are reversed                      */
/* ********************************************************************** */
void move_B();

/* ********************************************************************** */
/* Function     : move_S   ==> Stop Robot                                 */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Stop all motors by setting 0 at their pins              */
/* ********************************************************************** */
void move_S();

/* ********************************************************************** */
/* Function     : move_AU   ==> Move Arm Up                               */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Defines the direction of UP&Down Arm motor to go up.    */
/* ********************************************************************** */
void move_AU();

/* ********************************************************************** */
/* Function     : move_AD   ==> Move Arm Down                             */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Defines the direction of UP&Down Arm motor to go down.  */
/* ********************************************************************** */
void move_AD();

/* ********************************************************************** */
/* Function     : move_AR   ==> Move Arm Right                            */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Set the direction of Left&Right Arm motor to turn Right.*/
/* ********************************************************************** */
void move_AR();

/* ********************************************************************** */
/* Function     : move_AR   ==> Move Arm Left                             */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Set the direction of Left&Right Arm motor to turn Left. */
/* ********************************************************************** */
void move_AL();

/* ********************************************************************** */
/* Function     : move_GO   ==> Open Gripper                              */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Set the direction of gripper motor to open.             */
/* ********************************************************************** */
void move_GO();

/* ********************************************************************** */
/* Function     : move_GO   ==> Close Gripper                             */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Set the direction of gripper motor to close             */
/* ********************************************************************** */
void move_GC();

/* ********************************************************************** */
/* Function     : pins_config   ==> Configuration of pins                 */
/* Parameters   : No Input or returened parameters.                       */
/* Description  : Set ports B and D as O/P for motors and Initializing    */
/*                UART for bluetooth module with Baud rate 9600           */
/* ********************************************************************** */
void pins_config();

/* ********************************************************************** */
/*                          Main Program Driver                           */
/* ********************************************************************** */
void main()
{

  pins_config();

  while (1){
          if(UART1_Data_Ready())  // if bluetooth data recived
          {
          Data =UART1_Read();     // store the data recived to variable named Data
       if(Data=='F')              //forward
          move_F();
       else if(Data=='L')         //left
          move_L();
       else if(Data=='R')         //right
          move_R();
       else if(Data=='B')         //back
          move_B();
       else if(Data=='S')         //stop
          move_S();
       else if(Data=='A')         //Arm up
          move_AU();
       else if(Data=='a')         //Arm down
          move_AD();
       else if(Data=='B')         //arm right
          move_AR();
       else if(Data=='b')         //arm left
          move_AL();
       else if(Data=='G')         //gripper open
          move_GO();
       else if(Data=='g')         //gripper close
          move_GC();
       else {};                   //do nothing
          }

 }        //end of while loop
}         //end of main function

void pins_config()
{
 UART1_Init(9600);   // Universal Asynchronous Reciver Transmitter initialization for bluetooth module (BaudeRate--> speed of DAta transmition and reciver )
 Delay_ms(100);      // Wait for UART module to stabilize
 trisb = 0b00000000; //make port b as output
 portb = 0b00000000; //initiating all pins by zero (logic low)
 trisd = 0b00000000; //make port d as output
 portd = 0b00000000; //initiating all pins by zero (logic low)
}

void move_F()       //move forward function
{
        RM1=1;
        RM2=0;
        LM1=1;
        LM2=0;
}

void move_R()       //move right function
{
        RM1=0;
        RM2=1;
        LM1=1;
        LM2=0;
}

void move_L()       //move left function
{
        RM1=1;
        RM2=0;
        LM1=0;
        LM2=1;
}

void move_B()       //move back function
{
        RM1=0;
        RM2=1;
        LM1=0;
        LM2=1;
}

void move_S()       //stop the robot function
{
        RM1=0;
        RM2=0;
        LM1=0;
        LM2=0;
}

void move_AU()      //move Arm up function
{
        AMUD1=1;
        AMUD2=0;
}

void move_AD()      //move arm Down function
{
        AMUD1=0;
        AMUD2=1;
}

void move_AR()      //move Arm right function
{
        AMRL1=1;
        AMRL2=0;
}

void move_AL()      //move arm left function
{
        AMRL1=0;
        AMRL2=1;
}

void move_GO()      //open grapper function
{
        GMOC1=1;
        GMOC2=0;
}

void move_GC()      //close grapper function
{

        GMOC1=0;
        GMOC2=1;
}