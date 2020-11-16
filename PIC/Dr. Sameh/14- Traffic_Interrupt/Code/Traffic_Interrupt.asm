
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Traffic_Interrupt.c,3 :: 		void interrupt()
;Traffic_Interrupt.c,5 :: 		intcon.intf = 0;
	BCF        INTCON+0, 1
;Traffic_Interrupt.c,6 :: 		while(1)
L_interrupt0:
;Traffic_Interrupt.c,8 :: 		portc = 0b00010010;        delay_ms(1000);
	MOVLW      18
	MOVWF      PORTC+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt2:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt2
	DECFSZ     R12+0, 1
	GOTO       L_interrupt2
	DECFSZ     R11+0, 1
	GOTO       L_interrupt2
	NOP
	NOP
;Traffic_Interrupt.c,9 :: 		portc = 0;        delay_ms(1000);
	CLRF       PORTC+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt3:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt3
	DECFSZ     R12+0, 1
	GOTO       L_interrupt3
	DECFSZ     R11+0, 1
	GOTO       L_interrupt3
	NOP
	NOP
;Traffic_Interrupt.c,10 :: 		}
	GOTO       L_interrupt0
;Traffic_Interrupt.c,11 :: 		}
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

_display:

;Traffic_Interrupt.c,13 :: 		void display()
;Traffic_Interrupt.c,15 :: 		portc = 0b00100001;        delay_ms(1000);
	MOVLW      33
	MOVWF      PORTC+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_display4:
	DECFSZ     R13+0, 1
	GOTO       L_display4
	DECFSZ     R12+0, 1
	GOTO       L_display4
	DECFSZ     R11+0, 1
	GOTO       L_display4
	NOP
	NOP
;Traffic_Interrupt.c,16 :: 		portc = 0b00110011;        delay_ms(1000);
	MOVLW      51
	MOVWF      PORTC+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_display5:
	DECFSZ     R13+0, 1
	GOTO       L_display5
	DECFSZ     R12+0, 1
	GOTO       L_display5
	DECFSZ     R11+0, 1
	GOTO       L_display5
	NOP
	NOP
;Traffic_Interrupt.c,17 :: 		portc = 0b00001100;        delay_ms(1000);
	MOVLW      12
	MOVWF      PORTC+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_display6:
	DECFSZ     R13+0, 1
	GOTO       L_display6
	DECFSZ     R12+0, 1
	GOTO       L_display6
	DECFSZ     R11+0, 1
	GOTO       L_display6
	NOP
	NOP
;Traffic_Interrupt.c,18 :: 		portc = 0b00011110;        delay_ms(1000);
	MOVLW      30
	MOVWF      PORTC+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_display7:
	DECFSZ     R13+0, 1
	GOTO       L_display7
	DECFSZ     R12+0, 1
	GOTO       L_display7
	DECFSZ     R11+0, 1
	GOTO       L_display7
	NOP
	NOP
;Traffic_Interrupt.c,19 :: 		}
L_end_display:
	RETURN
; end of _display

_main:

;Traffic_Interrupt.c,21 :: 		void main() {
;Traffic_Interrupt.c,22 :: 		trisc = 0;  portc = 0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;Traffic_Interrupt.c,23 :: 		trisd.f0 = 1;     portd = 0;
	BSF        TRISD+0, 0
	CLRF       PORTD+0
;Traffic_Interrupt.c,24 :: 		intcon.inte = 1;  intcon.gie = 1;       option_reg.intedg = 0;
	BSF        INTCON+0, 4
	BSF        INTCON+0, 7
	BCF        OPTION_REG+0, 6
;Traffic_Interrupt.c,26 :: 		while(start == 1);           //check for start releasing
L_main8:
	BTFSS      PORTD+0, 0
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;Traffic_Interrupt.c,27 :: 		while(1)
L_main10:
;Traffic_Interrupt.c,28 :: 		display();
	CALL       _display+0
	GOTO       L_main10
;Traffic_Interrupt.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
