
_main:

;WaterFlowControl.c,9 :: 		void main() {
;WaterFlowControl.c,10 :: 		trisd = 0b00000111;  //bits 0&1&2 in port D as I/P to LL&HL sensors, start button
	MOVLW      7
	MOVWF      TRISD+0
;WaterFlowControl.c,11 :: 		portd = 0;          //initializing O/P pins of ports D to GND
	CLRF       PORTD+0
;WaterFlowControl.c,13 :: 		trisb = 0; portb = 0;          //Port B as O/P and initializing it to GND
	CLRF       TRISB+0
	CLRF       PORTB+0
;WaterFlowControl.c,15 :: 		while (start_button == 0);     //Checkig start button
L_main0:
	BTFSC      PORTD+0, 2
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;WaterFlowControl.c,16 :: 		loop:
___main_loop:
;WaterFlowControl.c,17 :: 		if (LL ==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;WaterFlowControl.c,19 :: 		pump = turn_on; valve = turn_off;
	BSF        PORTB+0, 0
	BCF        PORTB+0, 1
;WaterFlowControl.c,20 :: 		}
L_main2:
;WaterFlowControl.c,21 :: 		if (HL ==1)
	BTFSS      PORTD+0, 1
	GOTO       L_main3
;WaterFlowControl.c,23 :: 		pump = turn_off; valve = turn_on;
	BCF        PORTB+0, 0
	BSF        PORTB+0, 1
;WaterFlowControl.c,24 :: 		}
L_main3:
;WaterFlowControl.c,25 :: 		goto loop;
	GOTO       ___main_loop
;WaterFlowControl.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
