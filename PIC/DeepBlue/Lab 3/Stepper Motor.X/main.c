/*
 * File:   main.c
 * Author: makar
 *
 * Created on June 11, 2020, 1:31 AM
 */


#include <xc.h>
#include "config.h"
#define _XTAL_FREQ 8000000
#define START RC0 

void main(void) {

    unsigned char i=0;
    
    TRISB = 0x00;           //Port B as O/P
    PORTB = 0x00;           //Set Port B to Low
    while (START == 0);     //Check Releasing Start button
    while(1)                //Endless Loop
    {
        for (int j = 0; j<=45; j++)
        {
            PORTB = (1<<i);
            i++;
            __delay_ms(100);
            if (i == 4)
                i=0;
        }
        __delay_ms(1000);
        for (int j = 0, i = 0; j<=45; j++)
        {
            PORTB = (8>>i++);
            __delay_ms(100);
            if (i == 4)
                i=0;
        }
        __delay_ms(1000);
    }
    return;
}
