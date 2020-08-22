
_display:

;Auto count 0 to 99 Func.c,11 :: 		void display()
;Auto count 0 to 99 Func.c,13 :: 		char ones = 0, tens = 0;
	CLRF       display_ones_L0+0
	CLRF       display_tens_L0+0
	MOVLW      63
	MOVWF      display_segment_L0+0
	MOVLW      6
	MOVWF      display_segment_L0+1
	MOVLW      91
	MOVWF      display_segment_L0+2
	MOVLW      79
	MOVWF      display_segment_L0+3
	MOVLW      102
	MOVWF      display_segment_L0+4
	MOVLW      109
	MOVWF      display_segment_L0+5
	MOVLW      125
	MOVWF      display_segment_L0+6
	MOVLW      7
	MOVWF      display_segment_L0+7
	MOVLW      127
	MOVWF      display_segment_L0+8
	MOVLW      111
	MOVWF      display_segment_L0+9
;Auto count 0 to 99 Func.c,16 :: 		seg2 = segment[0];      seg1 = segment[0];      //display zero
	MOVF       display_segment_L0+0, 0
	MOVWF      PORTB+0
	MOVF       display_segment_L0+0, 0
	MOVWF      PORTC+0
;Auto count 0 to 99 Func.c,18 :: 		for(tens=0; tens<=9; tens++)
	CLRF       display_tens_L0+0
L_display0:
	MOVF       display_tens_L0+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L_display1
;Auto count 0 to 99 Func.c,19 :: 		for(ones=0; ones<=9; ones++)
	CLRF       display_ones_L0+0
L_display3:
	MOVF       display_ones_L0+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L_display4
;Auto count 0 to 99 Func.c,21 :: 		seg2 = segment[tens];
	MOVF       display_tens_L0+0, 0
	ADDLW      display_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Auto count 0 to 99 Func.c,22 :: 		while(ones<=9)
L_display6:
	MOVF       display_ones_L0+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L_display7
;Auto count 0 to 99 Func.c,24 :: 		seg1 = segment[ones++];
	MOVF       display_ones_L0+0, 0
	ADDLW      display_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
	INCF       display_ones_L0+0, 1
;Auto count 0 to 99 Func.c,25 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_display8:
	DECFSZ     R13+0, 1
	GOTO       L_display8
	DECFSZ     R12+0, 1
	GOTO       L_display8
	DECFSZ     R11+0, 1
	GOTO       L_display8
	NOP
	NOP
;Auto count 0 to 99 Func.c,26 :: 		}
	GOTO       L_display6
L_display7:
;Auto count 0 to 99 Func.c,19 :: 		for(ones=0; ones<=9; ones++)
	INCF       display_ones_L0+0, 1
;Auto count 0 to 99 Func.c,27 :: 		}
	GOTO       L_display3
L_display4:
;Auto count 0 to 99 Func.c,18 :: 		for(tens=0; tens<=9; tens++)
	INCF       display_tens_L0+0, 1
;Auto count 0 to 99 Func.c,27 :: 		}
	GOTO       L_display0
L_display1:
;Auto count 0 to 99 Func.c,28 :: 		}
L_end_display:
	RETURN
; end of _display

_main:

;Auto count 0 to 99 Func.c,30 :: 		void main()
;Auto count 0 to 99 Func.c,32 :: 		trisb = 0;    seg2 = 0;
	CLRF       TRISB+0
	CLRF       PORTB+0
;Auto count 0 to 99 Func.c,33 :: 		trisc = 0;    seg1 = 0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;Auto count 0 to 99 Func.c,35 :: 		while (start == 1);  //check start butoon released
L_main9:
	BTFSS      PORTD+0, 0
	GOTO       L_main10
	GOTO       L_main9
L_main10:
;Auto count 0 to 99 Func.c,37 :: 		for(;;)
L_main11:
;Auto count 0 to 99 Func.c,38 :: 		display();
	CALL       _display+0
	GOTO       L_main11
;Auto count 0 to 99 Func.c,39 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
