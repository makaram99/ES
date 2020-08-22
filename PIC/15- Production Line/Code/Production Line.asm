
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Production Line.c,10 :: 		void interrupt()
;Production Line.c,12 :: 		intcon.INTF = 0;
	BCF        INTCON+0, 1
;Production Line.c,13 :: 		motor = 0;   valve = 0;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 2
;Production Line.c,14 :: 		while(hl == 0)
L_interrupt0:
	BTFSC      PORTB+0, 1
	GOTO       L_interrupt1
;Production Line.c,15 :: 		pump = 1;
	BSF        PORTD+0, 1
	GOTO       L_interrupt0
L_interrupt1:
;Production Line.c,16 :: 		pump = 0;
	BCF        PORTD+0, 1
;Production Line.c,17 :: 		if(photocell == 1)
	BTFSS      PORTB+0, 2
	GOTO       L_interrupt2
;Production Line.c,19 :: 		valve = 1;  motor = 0;        return;
	BSF        PORTD+0, 2
	BCF        PORTD+0, 0
	GOTO       L__interrupt13
;Production Line.c,20 :: 		}
L_interrupt2:
;Production Line.c,23 :: 		valve = 0;  motor = 1;        return;
	BCF        PORTD+0, 2
	BSF        PORTD+0, 0
;Production Line.c,25 :: 		}
L_end_interrupt:
L__interrupt13:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Production Line.c,27 :: 		void main()
;Production Line.c,29 :: 		trisb = 0b00001111;  portd = 0;
	MOVLW      15
	MOVWF      TRISB+0
	CLRF       PORTD+0
;Production Line.c,30 :: 		trisd = 0;  portd = 0;
	CLRF       TRISD+0
	CLRF       PORTD+0
;Production Line.c,31 :: 		intcon.INTE = 1;  intcon.GIE = 1; option_reg.INTEDG = 1;   //Rising
	BSF        INTCON+0, 4
	BSF        INTCON+0, 7
	BSF        OPTION_REG+0, 6
;Production Line.c,33 :: 		while(start == 0);
L_main4:
	BTFSC      PORTB+0, 3
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;Production Line.c,35 :: 		motor = 1;
	BSF        PORTD+0, 0
;Production Line.c,36 :: 		for(;;)
L_main6:
;Production Line.c,38 :: 		while (photocell == 0);
L_main9:
	BTFSC      PORTB+0, 2
	GOTO       L_main10
	GOTO       L_main9
L_main10:
;Production Line.c,39 :: 		motor = 0;   valve = 1;
	BCF        PORTD+0, 0
	BSF        PORTD+0, 2
;Production Line.c,40 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;Production Line.c,41 :: 		motor = 1;   valve = 0;
	BSF        PORTD+0, 0
	BCF        PORTD+0, 2
;Production Line.c,42 :: 		}
	GOTO       L_main6
;Production Line.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
