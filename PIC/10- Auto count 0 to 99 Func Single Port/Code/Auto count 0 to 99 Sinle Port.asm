
_display:

;Auto count 0 to 99 Sinle Port.c,12 :: 		char display(char num)
;Auto count 0 to 99 Sinle Port.c,15 :: 		char segment[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};      //for CC 7-SEG
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
;Auto count 0 to 99 Sinle Port.c,16 :: 		x = segment[num];
	MOVF       FARG_display_num+0, 0
	ADDLW      display_segment_L0+0
	MOVWF      FSR
;Auto count 0 to 99 Sinle Port.c,17 :: 		return (x);
	MOVF       INDF+0, 0
	MOVWF      R0+0
;Auto count 0 to 99 Sinle Port.c,18 :: 		}
L_end_display:
	RETURN
; end of _display

_main:

;Auto count 0 to 99 Sinle Port.c,20 :: 		void main()
;Auto count 0 to 99 Sinle Port.c,22 :: 		char i, ones, tens, count = 0;
	CLRF       main_count_L0+0
;Auto count 0 to 99 Sinle Port.c,23 :: 		trisb = 0;       trisd = 1;  //f1, f2 as I/P
	CLRF       TRISB+0
	MOVLW      1
	MOVWF      TRISD+0
;Auto count 0 to 99 Sinle Port.c,24 :: 		portb = 0;       portd = 0;
	CLRF       PORTB+0
	CLRF       PORTD+0
;Auto count 0 to 99 Sinle Port.c,26 :: 		while (start == 1);  //check start butoon released
L_main0:
	BTFSS      PORTD+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;Auto count 0 to 99 Sinle Port.c,28 :: 		for(;;)
L_main2:
;Auto count 0 to 99 Sinle Port.c,30 :: 		for(i=0; i<50; i++)
	CLRF       main_i_L0+0
L_main5:
	MOVLW      50
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Auto count 0 to 99 Sinle Port.c,32 :: 		tens = count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_count_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
;Auto count 0 to 99 Sinle Port.c,33 :: 		portb = display(tens);
	MOVF       R0+0, 0
	MOVWF      FARG_display_num+0
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Auto count 0 to 99 Sinle Port.c,34 :: 		tens_GND = 1;   delay_ms(10);    tens_GND = 0;
	BSF        PORTD+0, 2
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	BCF        PORTD+0, 2
;Auto count 0 to 99 Sinle Port.c,36 :: 		ones = count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_count_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;Auto count 0 to 99 Sinle Port.c,37 :: 		portb = display(ones);
	MOVF       R0+0, 0
	MOVWF      FARG_display_num+0
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Auto count 0 to 99 Sinle Port.c,38 :: 		ones_GND = 1;   delay_ms(10);    ones_GND = 0;
	BSF        PORTD+0, 1
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	BCF        PORTD+0, 1
;Auto count 0 to 99 Sinle Port.c,30 :: 		for(i=0; i<50; i++)
	INCF       main_i_L0+0, 1
;Auto count 0 to 99 Sinle Port.c,39 :: 		}
	GOTO       L_main5
L_main6:
;Auto count 0 to 99 Sinle Port.c,40 :: 		if(++count == 100)
	INCF       main_count_L0+0, 1
	MOVF       main_count_L0+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;Auto count 0 to 99 Sinle Port.c,41 :: 		count = 0;
	CLRF       main_count_L0+0
L_main10:
;Auto count 0 to 99 Sinle Port.c,42 :: 		}
	GOTO       L_main2
;Auto count 0 to 99 Sinle Port.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
