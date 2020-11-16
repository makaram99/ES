
_main:

;Auto Garage (2).c,31 :: 		void main() {
;Auto Garage (2).c,33 :: 		char segment[] = { zero, one, two, three, four, five, six, seven, eight, nine};
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
;Auto Garage (2).c,36 :: 		trisb = 0b00111111; portb = 0;      //set pins 0,1,2,3,4,5 of port B as I/P & set O/P pins to GND
	MOVLW      63
	MOVWF      TRISB+0
	CLRF       PORTB+0
;Auto Garage (2).c,37 :: 		trisd = 0; portd = 0;     //set port B as O/P & initialize it to GND
	CLRF       TRISD+0
	CLRF       PORTD+0
;Auto Garage (2).c,38 :: 		trisc = 0;           //seven seg port C as O/P
	CLRF       TRISC+0
;Auto Garage (2).c,39 :: 		portc = segment[count];  //display zero
	MOVF       main_count_L0+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Auto Garage (2).c,41 :: 		start:
___main_start:
;Auto Garage (2).c,42 :: 		if( S1 == 1)             //check entering cars
	BTFSS      PORTB+0, 0
	GOTO       L_main0
;Auto Garage (2).c,44 :: 		if(count == 9)
	MOVF       main_count_L0+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main1
;Auto Garage (2).c,46 :: 		LED = 1;
	BSF        PORTD+0, 4
;Auto Garage (2).c,47 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;Auto Garage (2).c,48 :: 		LED = 0;
	BCF        PORTD+0, 4
;Auto Garage (2).c,49 :: 		goto start;
	GOTO       ___main_start
;Auto Garage (2).c,50 :: 		}//end of if(count == 9)
L_main1:
;Auto Garage (2).c,52 :: 		enter:
___main_enter:
;Auto Garage (2).c,53 :: 		portc = segment[++count];
	INCF       main_count_L0+0, 1
	MOVF       main_count_L0+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Auto Garage (2).c,54 :: 		entry_motor_open = 1;
	BSF        PORTD+0, 0
;Auto Garage (2).c,55 :: 		while (LS1 == 0);  //gate still opening
L_main3:
	BTFSC      PORTB+0, 1
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;Auto Garage (2).c,56 :: 		entry_motor_open = 0;
	BCF        PORTD+0, 0
;Auto Garage (2).c,57 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Auto Garage (2).c,58 :: 		while(S1 == 1);  //car is still entering
L_main6:
	BTFSS      PORTB+0, 0
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;Auto Garage (2).c,59 :: 		entry_motor_close = 1;
	BSF        PORTD+0, 1
;Auto Garage (2).c,60 :: 		check_LS2:
___main_check_LS2:
;Auto Garage (2).c,61 :: 		if(LS2 == 1)      //fully closed
	BTFSS      PORTB+0, 2
	GOTO       L_main8
;Auto Garage (2).c,63 :: 		entry_motor_close = 0;
	BCF        PORTD+0, 1
;Auto Garage (2).c,64 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;Auto Garage (2).c,65 :: 		goto start;
	GOTO       ___main_start
;Auto Garage (2).c,66 :: 		}
L_main8:
;Auto Garage (2).c,67 :: 		else if(S1 == 1)
	BTFSS      PORTB+0, 0
	GOTO       L_main11
;Auto Garage (2).c,69 :: 		if(count == 9)
	MOVF       main_count_L0+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;Auto Garage (2).c,71 :: 		LED = 1;
	BSF        PORTD+0, 4
;Auto Garage (2).c,72 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
;Auto Garage (2).c,73 :: 		LED = 0;
	BCF        PORTD+0, 4
;Auto Garage (2).c,74 :: 		goto check_LS2;;
	GOTO       ___main_check_LS2
;Auto Garage (2).c,75 :: 		}//end of if(count == 9)
L_main12:
;Auto Garage (2).c,77 :: 		entry_motor_close = 0;
	BCF        PORTD+0, 1
;Auto Garage (2).c,78 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;Auto Garage (2).c,79 :: 		goto enter;
	GOTO       ___main_enter
;Auto Garage (2).c,80 :: 		}
L_main11:
;Auto Garage (2).c,81 :: 		goto check_LS2;
	GOTO       ___main_check_LS2
;Auto Garage (2).c,82 :: 		}//end of detecting sensor 1
L_main0:
;Auto Garage (2).c,84 :: 		else if (S2 == 1)   //check leaving cars
	BTFSS      PORTB+0, 3
	GOTO       L_main16
;Auto Garage (2).c,86 :: 		if (count == 0)        //check empty garage
	MOVF       main_count_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Auto Garage (2).c,87 :: 		goto start;
	GOTO       ___main_start
L_main17:
;Auto Garage (2).c,89 :: 		leave:
___main_leave:
;Auto Garage (2).c,90 :: 		portc = segment[--count];
	DECF       main_count_L0+0, 1
	MOVF       main_count_L0+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Auto Garage (2).c,91 :: 		leave_motor_open = 1;
	BSF        PORTD+0, 2
;Auto Garage (2).c,92 :: 		while (LS3 == 0);  //check still opening
L_main18:
	BTFSC      PORTB+0, 4
	GOTO       L_main19
	GOTO       L_main18
L_main19:
;Auto Garage (2).c,93 :: 		leave_motor_open = 0;
	BCF        PORTD+0, 2
;Auto Garage (2).c,94 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;Auto Garage (2).c,95 :: 		while (S2 == 1);
L_main21:
	BTFSS      PORTB+0, 3
	GOTO       L_main22
	GOTO       L_main21
L_main22:
;Auto Garage (2).c,96 :: 		leave_motor_close = 1;
	BSF        PORTD+0, 3
;Auto Garage (2).c,98 :: 		check_LS4:
___main_check_LS4:
;Auto Garage (2).c,99 :: 		if(LS4 == 1)
	BTFSS      PORTB+0, 5
	GOTO       L_main23
;Auto Garage (2).c,101 :: 		leave_motor_close = 0;
	BCF        PORTD+0, 3
;Auto Garage (2).c,102 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
;Auto Garage (2).c,103 :: 		goto start;
	GOTO       ___main_start
;Auto Garage (2).c,104 :: 		}
L_main23:
;Auto Garage (2).c,105 :: 		else if (S2 == 1)
	BTFSS      PORTB+0, 3
	GOTO       L_main26
;Auto Garage (2).c,106 :: 		if(count == 0)
	MOVF       main_count_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main27
;Auto Garage (2).c,107 :: 		goto check_LS4;
	GOTO       ___main_check_LS4
L_main27:
;Auto Garage (2).c,110 :: 		leave_motor_close = 0;
	BCF        PORTD+0, 3
;Auto Garage (2).c,111 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
	NOP
;Auto Garage (2).c,112 :: 		goto leave;
	GOTO       ___main_leave
;Auto Garage (2).c,113 :: 		}
L_main26:
;Auto Garage (2).c,115 :: 		goto check_LS4;
	GOTO       ___main_check_LS4
;Auto Garage (2).c,116 :: 		}//end of detecting sensor 2
L_main16:
;Auto Garage (2).c,119 :: 		goto start;
	GOTO       ___main_start
;Auto Garage (2).c,120 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
