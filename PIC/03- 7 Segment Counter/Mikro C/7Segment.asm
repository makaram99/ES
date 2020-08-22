
_main:

;7Segment.c,18 :: 		void main() {
;7Segment.c,20 :: 		char segment[] = {zero, one, two, three, four, five, six, seven, eight, nine};
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
;7Segment.c,22 :: 		trisd = 0;  // O/P port
	CLRF       TRISD+0
;7Segment.c,23 :: 		trisb = 1;  // bit '0' in port B as I/P
	MOVLW      1
	MOVWF      TRISB+0
;7Segment.c,25 :: 		portd = 0;    portb = 0;  // setting O/P pins in ports D & B to GND
	CLRF       PORTD+0
	CLRF       PORTB+0
;7Segment.c,27 :: 		portd = segment[0];   //setting 7-Seg. to display zero
	MOVF       main_segment_L0+0, 0
	MOVWF      PORTD+0
;7Segment.c,29 :: 		while (start_switch == 0);      // check start button
L_main0:
	BTFSC      PORTB+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;7Segment.c,30 :: 		for(;;)    // Endless loop
L_main2:
;7Segment.c,33 :: 		for(count=0; count<10; count++)
	CLRF       R1+0
	CLRF       R1+1
L_main5:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      10
	SUBWF      R1+0, 0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;7Segment.c,35 :: 		portd = segment[count];
	MOVF       R1+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;7Segment.c,36 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;7Segment.c,33 :: 		for(count=0; count<10; count++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;7Segment.c,37 :: 		}
	GOTO       L_main5
L_main6:
;7Segment.c,38 :: 		}
	GOTO       L_main2
;7Segment.c,39 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
