
_display:

;Manual counter 0 to 99.c,12 :: 		char display(char num)
;Manual counter 0 to 99.c,15 :: 		char segment[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};      //for CC 7-SEG
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
;Manual counter 0 to 99.c,16 :: 		x = segment[num];
	MOVF       FARG_display_num+0, 0
	ADDLW      display_segment_L0+0
	MOVWF      FSR
;Manual counter 0 to 99.c,17 :: 		return (x);
	MOVF       INDF+0, 0
	MOVWF      R0+0
;Manual counter 0 to 99.c,18 :: 		}
L_end_display:
	RETURN
; end of _display

_main:

;Manual counter 0 to 99.c,20 :: 		void main()
;Manual counter 0 to 99.c,22 :: 		char i, ones, tens, count = 0;
	CLRF       main_count_L0+0
;Manual counter 0 to 99.c,23 :: 		trisb = 0;       trisd = 1;  //f1, f2 as I/P
	CLRF       TRISB+0
	MOVLW      1
	MOVWF      TRISD+0
;Manual counter 0 to 99.c,24 :: 		portb = 0;       portd = 0;
	CLRF       PORTB+0
	CLRF       PORTD+0
;Manual counter 0 to 99.c,26 :: 		for(;;)
L_main0:
;Manual counter 0 to 99.c,28 :: 		do
L_main3:
;Manual counter 0 to 99.c,30 :: 		tens = count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_count_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
;Manual counter 0 to 99.c,31 :: 		portb = display(tens);
	MOVF       R0+0, 0
	MOVWF      FARG_display_num+0
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Manual counter 0 to 99.c,32 :: 		tens_GND = 1;   delay_ms(10);    tens_GND = 0;
	BSF        PORTD+0, 2
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	BCF        PORTD+0, 2
;Manual counter 0 to 99.c,34 :: 		ones = count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_count_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;Manual counter 0 to 99.c,35 :: 		portb = display(ones);
	MOVF       R0+0, 0
	MOVWF      FARG_display_num+0
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Manual counter 0 to 99.c,36 :: 		ones_GND = 1;   delay_ms(10);    ones_GND = 0;
	BSF        PORTD+0, 1
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	BCF        PORTD+0, 1
;Manual counter 0 to 99.c,37 :: 		}while(start == 1);
	BTFSC      PORTD+0, 0
	GOTO       L_main3
;Manual counter 0 to 99.c,39 :: 		if(++count == 100)
	INCF       main_count_L0+0, 1
	MOVF       main_count_L0+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Manual counter 0 to 99.c,40 :: 		count = 0;
	CLRF       main_count_L0+0
L_main8:
;Manual counter 0 to 99.c,42 :: 		do
L_main9:
;Manual counter 0 to 99.c,44 :: 		tens = count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_count_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
;Manual counter 0 to 99.c,45 :: 		portb = display(tens);
	MOVF       R0+0, 0
	MOVWF      FARG_display_num+0
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Manual counter 0 to 99.c,46 :: 		tens_GND = 1;   delay_ms(10);    tens_GND = 0;
	BSF        PORTD+0, 2
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	BCF        PORTD+0, 2
;Manual counter 0 to 99.c,48 :: 		ones = count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_count_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;Manual counter 0 to 99.c,49 :: 		portb = display(ones);
	MOVF       R0+0, 0
	MOVWF      FARG_display_num+0
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Manual counter 0 to 99.c,50 :: 		ones_GND = 1;   delay_ms(10);    ones_GND = 0;
	BSF        PORTD+0, 1
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
	BCF        PORTD+0, 1
;Manual counter 0 to 99.c,51 :: 		}while(start == 0);
	BTFSS      PORTD+0, 0
	GOTO       L_main9
;Manual counter 0 to 99.c,52 :: 		}
	GOTO       L_main0
;Manual counter 0 to 99.c,53 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
