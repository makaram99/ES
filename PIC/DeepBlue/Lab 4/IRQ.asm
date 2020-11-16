
_main:

;IRQ.c,6 :: 		void main()
;IRQ.c,8 :: 		trisc = 0;
	CLRF       TRISC+0
;IRQ.c,9 :: 		portc = 0;
	CLRF       PORTC+0
;IRQ.c,11 :: 		OPTION_REG.INTEDG = 1;       //Interrupt on rising edgein SFR OPTION_REG
	BSF        OPTION_REG+0, 6
;IRQ.c,13 :: 		INTCON.GIE = 1;              //Enabling global interrupt enable bit in SFR INTCON Register
	BSF        INTCON+0, 7
;IRQ.c,15 :: 		inte_bit = 1;                //Enabling interrupt enable bit in SFR INTCON Register
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;IRQ.c,17 :: 		intcon.INTF = 0;             //Pressetting interrupt flag bit in SFR INTCON Register to low.
	BCF        INTCON+0, 1
;IRQ.c,20 :: 		while (start == 0);
L_main0:
	BTFSC      PORTD+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;IRQ.c,22 :: 		while (1)
L_main2:
;IRQ.c,24 :: 		green = 1;
	BSF        PORTC+0, 1
;IRQ.c,25 :: 		yellow = 1;
	BSF        PORTC+0, 0
;IRQ.c,26 :: 		}
	GOTO       L_main2
;IRQ.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;IRQ.c,29 :: 		void interrupt()
;IRQ.c,31 :: 		if (intf_bit)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt4
;IRQ.c,34 :: 		for(i =1; i<=2;i++)
	MOVLW      1
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_interrupt5:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt13
	MOVF       R1+0, 0
	SUBLW      2
L__interrupt13:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt6
;IRQ.c,36 :: 		green = yellow = ~yellow;
	MOVLW      1
	XORWF      PORTC+0, 1
	BTFSC      PORTC+0, 0
	GOTO       L__interrupt14
	BCF        PORTC+0, 1
	GOTO       L__interrupt15
L__interrupt14:
	BSF        PORTC+0, 1
L__interrupt15:
;IRQ.c,37 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt8:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt8
	DECFSZ     R12+0, 1
	GOTO       L_interrupt8
	DECFSZ     R11+0, 1
	GOTO       L_interrupt8
	NOP
	NOP
;IRQ.c,38 :: 		green = yellow = ~yellow;
	MOVLW      1
	XORWF      PORTC+0, 1
	BTFSC      PORTC+0, 0
	GOTO       L__interrupt16
	BCF        PORTC+0, 1
	GOTO       L__interrupt17
L__interrupt16:
	BSF        PORTC+0, 1
L__interrupt17:
;IRQ.c,39 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt9:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt9
	DECFSZ     R12+0, 1
	GOTO       L_interrupt9
	DECFSZ     R11+0, 1
	GOTO       L_interrupt9
	NOP
	NOP
;IRQ.c,34 :: 		for(i =1; i<=2;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;IRQ.c,40 :: 		}
	GOTO       L_interrupt5
L_interrupt6:
;IRQ.c,41 :: 		intf_bit = 0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;IRQ.c,42 :: 		}
L_interrupt4:
;IRQ.c,43 :: 		}
L_end_interrupt:
L__interrupt12:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
