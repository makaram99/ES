/*
 * File:   main.c
 * Author: makar
 *
 * Created on June 10, 2020, 3:41 PM
 */


#include <xc.h>
#include "config.h"
#define _XTAL_FREQ 8000000
void main(void) {
        
    TRISC=0b00000001;;
    PORTC=0;

    while (RC0 == 0);
    
    while(1)
    {
        for(int i=2; i<=16; i*=2)
        {
            PORTC = i;
            __delay_ms(250);
        }  
    }
    return;
}
