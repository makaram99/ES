
_main:

;AutomaticDoor.c,14 :: 		void main() {
;AutomaticDoor.c,16 :: 		trisb = 0b00001111; portb = 0;      //set pins 0,1,2,3 of port B as I/P & initialize O/P pins to GND
	MOVLW      15
	MOVWF      TRISB+0
	CLRF       PORTB+0
;AutomaticDoor.c,17 :: 		trisd = 0; portd = 0;     ////set port B as O/P & initialize it to GND
	CLRF       TRISD+0
	CLRF       PORTD+0
;AutomaticDoor.c,19 :: 		start:
___main_start:
;AutomaticDoor.c,20 :: 		check_in_out:
___main_check_in_out:
;AutomaticDoor.c,21 :: 		if((S1 ==1 ) || (S2 == 1))
	BTFSC      PORTB+0, 0
	GOTO       L__main17
	BTFSC      PORTB+0, 1
	GOTO       L__main17
	GOTO       L_main2
L__main17:
;AutomaticDoor.c,22 :: 		open: DIR1 = 1;     //open door
___main_open:
	BSF        PORTD+0, 0
	GOTO       L_main3
L_main2:
;AutomaticDoor.c,24 :: 		goto check_in_out;
	GOTO       ___main_check_in_out
L_main3:
;AutomaticDoor.c,26 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;AutomaticDoor.c,28 :: 		check_fully_opened:
___main_check_fully_opened:
;AutomaticDoor.c,29 :: 		if(LS1 == 1)
	BTFSS      PORTB+0, 2
	GOTO       L_main5
;AutomaticDoor.c,30 :: 		DIR1 = 0;     //stop opening
	BCF        PORTD+0, 0
	GOTO       L_main6
L_main5:
;AutomaticDoor.c,32 :: 		goto check_fully_opened;
	GOTO       ___main_check_fully_opened
L_main6:
;AutomaticDoor.c,33 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;AutomaticDoor.c,35 :: 		DIR2 = 1;      //close door
	BSF        PORTD+0, 1
;AutomaticDoor.c,36 :: 		check_fully_closed:
___main_check_fully_closed:
;AutomaticDoor.c,37 :: 		if(LS2 == 1)   //fully closed
	BTFSS      PORTB+0, 3
	GOTO       L_main8
;AutomaticDoor.c,39 :: 		DIR2 = 0;  //stop closing
	BCF        PORTD+0, 1
;AutomaticDoor.c,40 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;AutomaticDoor.c,41 :: 		goto start;
	GOTO       ___main_start
;AutomaticDoor.c,42 :: 		}
L_main8:
;AutomaticDoor.c,43 :: 		else if((S1 ==1 ) || (S2 == 1)) //Check enter or leave
	BTFSC      PORTB+0, 0
	GOTO       L__main16
	BTFSC      PORTB+0, 1
	GOTO       L__main16
	GOTO       L_main13
L__main16:
;AutomaticDoor.c,45 :: 		DIR2 = 0;
	BCF        PORTD+0, 1
;AutomaticDoor.c,46 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;AutomaticDoor.c,47 :: 		goto open;
	GOTO       ___main_open
;AutomaticDoor.c,48 :: 		}
L_main13:
;AutomaticDoor.c,50 :: 		goto check_fully_closed;
	GOTO       ___main_check_fully_closed
;AutomaticDoor.c,51 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
