
_main:

;Traffic Light.c,16 :: 		void main() {
;Traffic Light.c,17 :: 		trisb = 1;  //set pin 0 @ port B as I/P for start switch
	MOVLW      1
	MOVWF      TRISB+0
;Traffic Light.c,18 :: 		trisc = 0;  //set port C as O/P for LEDs
	CLRF       TRISC+0
;Traffic Light.c,19 :: 		portc = 0;  //initialize port C to GND
	CLRF       PORTC+0
;Traffic Light.c,21 :: 		while (start==1);   //check start button
L_main0:
	BTFSS      PORTB+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;Traffic Light.c,22 :: 		for(;;)
L_main2:
;Traffic Light.c,24 :: 		portc = 0b00001100;
	MOVLW      12
	MOVWF      PORTC+0
;Traffic Light.c,25 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;Traffic Light.c,27 :: 		porta = 0b00011110;
	MOVLW      30
	MOVWF      PORTA+0
;Traffic Light.c,28 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;Traffic Light.c,30 :: 		portc = 0b00100001;
	MOVLW      33
	MOVWF      PORTC+0
;Traffic Light.c,31 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;Traffic Light.c,33 :: 		portc = 0b00110011;
	MOVLW      51
	MOVWF      PORTC+0
;Traffic Light.c,34 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;Traffic Light.c,35 :: 		}
	GOTO       L_main2
;Traffic Light.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
