
_main:

;Auto count 0 to 99 Sinle Port decoder.c,13 :: 		void main()
;Auto count 0 to 99 Sinle Port decoder.c,15 :: 		char i, ones=0, tens=0, cnt1 = 0, cnt2 = 0;
	CLRF       main_cnt1_L0+0
	CLRF       main_cnt2_L0+0
;Auto count 0 to 99 Sinle Port decoder.c,17 :: 		trisb = 0;       trisd = 1;  //f0 as I/P FOR START BUTTON
	CLRF       TRISB+0
	MOVLW      1
	MOVWF      TRISD+0
;Auto count 0 to 99 Sinle Port decoder.c,18 :: 		portb = 0;       portd = 0;  //display zero on 7-SEG
	CLRF       PORTB+0
	CLRF       PORTD+0
;Auto count 0 to 99 Sinle Port decoder.c,20 :: 		for(;;)
L_main0:
;Auto count 0 to 99 Sinle Port decoder.c,22 :: 		for(cnt2=0; cnt2<=9; cnt2++)
	CLRF       main_cnt2_L0+0
L_main3:
	MOVF       main_cnt2_L0+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;Auto count 0 to 99 Sinle Port decoder.c,23 :: 		for(cnt1=0; cnt1<=9; cnt1++)
	CLRF       main_cnt1_L0+0
L_main6:
	MOVF       main_cnt1_L0+0, 0
	SUBLW      9
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;Auto count 0 to 99 Sinle Port decoder.c,24 :: 		for(i=0; i<50; i++)
	CLRF       R1+0
L_main9:
	MOVLW      50
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;Auto count 0 to 99 Sinle Port decoder.c,26 :: 		portb = cnt2;
	MOVF       main_cnt2_L0+0, 0
	MOVWF      PORTB+0
;Auto count 0 to 99 Sinle Port decoder.c,27 :: 		tens_GND = 1;   delay_ms(10);    tens_GND = 0;
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
;Auto count 0 to 99 Sinle Port decoder.c,29 :: 		portb = cnt1;
	MOVF       main_cnt1_L0+0, 0
	MOVWF      PORTB+0
;Auto count 0 to 99 Sinle Port decoder.c,30 :: 		ones_GND = 1;   delay_ms(10);    ones_GND = 0;
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
;Auto count 0 to 99 Sinle Port decoder.c,24 :: 		for(i=0; i<50; i++)
	INCF       R1+0, 1
;Auto count 0 to 99 Sinle Port decoder.c,31 :: 		}
	GOTO       L_main9
L_main10:
;Auto count 0 to 99 Sinle Port decoder.c,23 :: 		for(cnt1=0; cnt1<=9; cnt1++)
	INCF       main_cnt1_L0+0, 1
;Auto count 0 to 99 Sinle Port decoder.c,31 :: 		}
	GOTO       L_main6
L_main7:
;Auto count 0 to 99 Sinle Port decoder.c,22 :: 		for(cnt2=0; cnt2<=9; cnt2++)
	INCF       main_cnt2_L0+0, 1
;Auto count 0 to 99 Sinle Port decoder.c,31 :: 		}
	GOTO       L_main3
L_main4:
;Auto count 0 to 99 Sinle Port decoder.c,32 :: 		while (start == 1);  //check start butoon released
L_main14:
	BTFSS      PORTD+0, 0
	GOTO       L_main15
	GOTO       L_main14
L_main15:
;Auto count 0 to 99 Sinle Port decoder.c,33 :: 		}
	GOTO       L_main0
;Auto count 0 to 99 Sinle Port decoder.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
