/***************************************************/
/* Author  : Mahmoud Karam                         */
/* Version : V01                                   */
/* Date    : 1 NOV 2020                            */
/***************************************************/

#ifndef LCD_CONNECTIONS_H
#define LCD_CONNECTIONS_H

/* Pinouts settings                                */
sbit LCD_RS    at RB4_bit;     //PORTB.B4 = PORTB.F4 = RB4_bit
sbit LCD_EN    at RB5_bit;
sbit LCD_D4    at RB0_bit;
sbit LCD_D5    at RB1_bit;
sbit LCD_D6    at RB2_bit;
sbit LCD_D7    at RB3_bit;

/* Pins Directions                                 */
sbit LCD_RS_Direction     at TRISB4_bit;     //TRISB.B4 = TRISB.F4 = TRISB4_bit
sbit LCD_EN_Direction     at TRISB5_bit;
sbit LCD_D4_Direction     at TRISB0_bit;
sbit LCD_D5_Direction     at TRISB1_bit;
sbit LCD_D6_Direction     at TRISB2_bit;
sbit LCD_D7_Direction     at TRISB3_bit;
/* End of LCD Connections */

#endif