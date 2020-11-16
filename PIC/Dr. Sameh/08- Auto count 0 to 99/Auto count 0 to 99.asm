
_main:

;Auto count 0 to 99.c,11 :: 		void main()
;Auto count 0 to 99.c,12 :: 		{   char segment[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};      //for CC 7-SEG
	MOVLW      63
	MOVWF      main_segment_L0+0
	MOVLW      6
	MOVWF      main_segment_L0+1
	MOVLW      91
	MOVWF      main_segment_L0+2
	MOVLW      79
	MOVWF      main_segment_L0+3
	MOVLW      102
	MOVWF      main_segment_L0+4
	MOVLW      109
	MOVWF      main_segment_L0+5
	MOVLW      125
	MOVWF      main_segment_L0+6
	MOVLW      7
	MOVWF      main_segment_L0+7
	MOVLW      127
	MOVWF      main_segment_L0+8
	MOVLW      111
	MOVWF      main_segment_L0+9
;Auto count 0 to 99.c,14 :: 		trisb = 0;    seg2 = segment[0];
	CLRF       TRISB+0
	MOVF       main_segment_L0+0, 0
	MOVWF      PORTB+0
;Auto count 0 to 99.c,15 :: 		trisc = 0;    seg1 = segment[0];;
	CLRF       TRISC+0
	MOVF       main_segment_L0+0, 0
	MOVWF      PORTC+0
;Auto count 0 to 99.c,17 :: 		while (start == 1);  //check start butoon released
L_main0:
	BTFSS      PORTD+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;Auto count 0 to 99.c,19 :: 		for(;;)
L_main2:
;Auto count 0 to 99.c,21 :: 		char ones = 0, tens = 0;
	CLRF       main_ones_L1+0
	CLRF       main_tens_L1+0
;Auto count 0 to 99.c,22 :: 		for(tens=0; tens<=9; tens++)
	CLRF       main_tens_L1+0
L_main5:
	MOVF       main_tens_L1+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L_main6
;Auto count 0 to 99.c,23 :: 		for(ones=0; ones<=9; ones++)
	CLRF       main_ones_L1+0
L_main8:
	MOVF       main_ones_L1+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;Auto count 0 to 99.c,25 :: 		seg2 = segment[tens];
	MOVF       main_tens_L1+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Auto count 0 to 99.c,26 :: 		while(ones<=9)
L_main11:
	MOVF       main_ones_L1+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L_main12
;Auto count 0 to 99.c,28 :: 		seg1 = segment[ones++];
	MOVF       main_ones_L1+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
	INCF       main_ones_L1+0, 1
;Auto count 0 to 99.c,29 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;Auto count 0 to 99.c,30 :: 		}
	GOTO       L_main11
L_main12:
;Auto count 0 to 99.c,23 :: 		for(ones=0; ones<=9; ones++)
	INCF       main_ones_L1+0, 1
;Auto count 0 to 99.c,31 :: 		}
	GOTO       L_main8
L_main9:
;Auto count 0 to 99.c,22 :: 		for(tens=0; tens<=9; tens++)
	INCF       main_tens_L1+0, 1
;Auto count 0 to 99.c,31 :: 		}
	GOTO       L_main5
L_main6:
;Auto count 0 to 99.c,32 :: 		}
	GOTO       L_main2
;Auto count 0 to 99.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
