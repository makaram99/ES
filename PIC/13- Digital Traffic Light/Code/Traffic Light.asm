
_main:

;Traffic Light.c,16 :: 		void main()
;Traffic Light.c,18 :: 		char j, i, ones=0, tens=0, cnt1 = 0, cnt2 = 0, temp1=0, temp2=1;
	CLRF       main_cnt1_L0+0
	CLRF       main_cnt2_L0+0
	CLRF       main_temp1_L0+0
	MOVLW      1
	MOVWF      main_temp2_L0+0
;Traffic Light.c,19 :: 		trisb = 0;       trisd = 1;  //f0 as I/P FOR START BUTTON
	CLRF       TRISB+0
	MOVLW      1
	MOVWF      TRISD+0
;Traffic Light.c,20 :: 		portb = 0;       portd = 0;  //display zero on 7-SEG
	CLRF       PORTB+0
	CLRF       PORTD+0
;Traffic Light.c,22 :: 		while (start == 1);  //check start butoon released
L_main0:
	BTFSS      PORTD+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;Traffic Light.c,24 :: 		led = 1;
	BSF        PORTD+0, 3
;Traffic Light.c,25 :: 		for(;;)
L_main2:
;Traffic Light.c,27 :: 		cnt2=1;
	MOVLW      1
	MOVWF      main_cnt2_L0+0
;Traffic Light.c,28 :: 		for(j=6; j>0; j--)
	MOVLW      6
	MOVWF      R1+0
L_main5:
	MOVF       R1+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Traffic Light.c,30 :: 		cnt1 = j-1;
	DECF       R1+0, 0
	MOVWF      main_cnt1_L0+0
;Traffic Light.c,31 :: 		for(i=0; i<50; i++)
	CLRF       R2+0
L_main8:
	MOVLW      50
	SUBWF      R2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Traffic Light.c,33 :: 		portb = cnt2;
	MOVF       main_cnt2_L0+0, 0
	MOVWF      PORTB+0
;Traffic Light.c,34 :: 		tens_GND = 1;   delay_ms(10);    tens_GND = 0;
	BSF        PORTD+0, 2
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
	BCF        PORTD+0, 2
;Traffic Light.c,36 :: 		portb = cnt1;
	MOVF       main_cnt1_L0+0, 0
	MOVWF      PORTB+0
;Traffic Light.c,37 :: 		ones_GND = 1;   delay_ms(10);    ones_GND = 0;
	BSF        PORTD+0, 1
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
	BCF        PORTD+0, 1
;Traffic Light.c,31 :: 		for(i=0; i<50; i++)
	INCF       R2+0, 1
;Traffic Light.c,38 :: 		}
	GOTO       L_main8
L_main9:
;Traffic Light.c,28 :: 		for(j=6; j>0; j--)
	DECF       R1+0, 1
;Traffic Light.c,39 :: 		}
	GOTO       L_main5
L_main6:
;Traffic Light.c,41 :: 		ones_GND = 1;
	BSF        PORTD+0, 1
;Traffic Light.c,42 :: 		for(j=10; j>0; j--)
	MOVLW      10
	MOVWF      R1+0
L_main13:
	MOVF       R1+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;Traffic Light.c,44 :: 		cnt1 = j-1;
	DECF       R1+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_cnt1_L0+0
;Traffic Light.c,45 :: 		portb = cnt1;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Traffic Light.c,46 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;Traffic Light.c,42 :: 		for(j=10; j>0; j--)
	DECF       R1+0, 1
;Traffic Light.c,47 :: 		}
	GOTO       L_main13
L_main14:
;Traffic Light.c,50 :: 		temp2 = led;
	MOVLW      0
	BTFSC      PORTD+0, 3
	MOVLW      1
	MOVWF      main_temp2_L0+0
;Traffic Light.c,51 :: 		led = temp1;
	BTFSC      main_temp1_L0+0, 0
	GOTO       L__main18
	BCF        PORTD+0, 3
	GOTO       L__main19
L__main18:
	BSF        PORTD+0, 3
L__main19:
;Traffic Light.c,52 :: 		temp1 = temp2;
	MOVF       main_temp2_L0+0, 0
	MOVWF      main_temp1_L0+0
;Traffic Light.c,54 :: 		}
	GOTO       L_main2
;Traffic Light.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
