
_main:

;counter on click.c,28 :: 		void main() {
;counter on click.c,30 :: 		char segment[] = {zero, one, two, three, four, five, six, seven, eight, nine};
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
	CLRF       main_count_L0+0
;counter on click.c,33 :: 		trisb = 7; portb = 0;    //port of switches & set O/P pins to GND
	MOVLW      7
	MOVWF      TRISB+0
	CLRF       PORTB+0
;counter on click.c,34 :: 		trisc = 0; portc = segment[count];    //display zero
	CLRF       TRISC+0
	MOVF       main_count_L0+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;counter on click.c,36 :: 		while (start == 1);   //check start switch active low
L_main0:
	BTFSS      PORTB+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;counter on click.c,38 :: 		check_up:
___main_check_up:
;counter on click.c,39 :: 		if(up_switch == 0)
	BTFSC      PORTB+0, 1
	GOTO       L_main2
;counter on click.c,41 :: 		if (count == 9)
	MOVF       main_count_L0+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;counter on click.c,43 :: 		high_led = 1;
	BSF        PORTB+0, 3
;counter on click.c,44 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;counter on click.c,45 :: 		high_led = 0;
	BCF        PORTB+0, 3
;counter on click.c,46 :: 		goto check_down;
	GOTO       ___main_check_down
;counter on click.c,47 :: 		}
L_main3:
;counter on click.c,48 :: 		portc = segment[++count];     //increase count and display
	INCF       main_count_L0+0, 1
	MOVF       main_count_L0+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;counter on click.c,49 :: 		while(up_switch == 0);
L_main5:
	BTFSC      PORTB+0, 1
	GOTO       L_main6
	GOTO       L_main5
L_main6:
;counter on click.c,50 :: 		}
L_main2:
;counter on click.c,52 :: 		check_down:
___main_check_down:
;counter on click.c,53 :: 		if(down_switch == 0)
	BTFSC      PORTB+0, 2
	GOTO       L_main7
;counter on click.c,55 :: 		if (count == 0)
	MOVF       main_count_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;counter on click.c,57 :: 		low_led = 1;
	BSF        PORTB+0, 4
;counter on click.c,58 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;counter on click.c,59 :: 		low_led = 0;
	BCF        PORTB+0, 4
;counter on click.c,60 :: 		goto check_up;
	GOTO       ___main_check_up
;counter on click.c,61 :: 		}
L_main8:
;counter on click.c,62 :: 		portc = segment[--count];     //increase count and display
	DECF       main_count_L0+0, 1
	MOVF       main_count_L0+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;counter on click.c,63 :: 		while(down_switch == 0);
L_main10:
	BTFSC      PORTB+0, 2
	GOTO       L_main11
	GOTO       L_main10
L_main11:
;counter on click.c,64 :: 		}
L_main7:
;counter on click.c,65 :: 		goto check_up;
	GOTO       ___main_check_up
;counter on click.c,66 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
