/*
 * LED Blink.c
 *
 * Created: 1/10/2021 6:20:22 PM
 * Author : Mahmoud Karam
 */ 

#define F_CPU	1000000UL
#include <avr/io.h>
#include <util/delay.h>


int main(void)
{
	DDRA = 0x01;
	
    while (1) 
    {
		PORTA = 0x01;
		_delay_ms(1000);
		PORTA = 0x00;
		_delay_ms(1000);
    }
	
	return 0;
}

