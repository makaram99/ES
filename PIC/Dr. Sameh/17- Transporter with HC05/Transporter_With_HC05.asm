
_main:

;Transporter_With_HC05.c,127 :: 		void main()
;Transporter_With_HC05.c,130 :: 		pins_config();
	CALL       _pins_config+0
;Transporter_With_HC05.c,132 :: 		while (1){
L_main0:
;Transporter_With_HC05.c,133 :: 		if(UART1_Data_Ready())  // if bluetooth data recived
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Transporter_With_HC05.c,135 :: 		Data =UART1_Read();     // store the data recived to variable named Data
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _Data+0
;Transporter_With_HC05.c,136 :: 		if(Data=='F')              //forward
	MOVF       R0+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Transporter_With_HC05.c,137 :: 		move_F();
	CALL       _move_F+0
	GOTO       L_main4
L_main3:
;Transporter_With_HC05.c,138 :: 		else if(Data=='L')         //left
	MOVF       _Data+0, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;Transporter_With_HC05.c,139 :: 		move_L();
	CALL       _move_L+0
	GOTO       L_main6
L_main5:
;Transporter_With_HC05.c,140 :: 		else if(Data=='R')         //right
	MOVF       _Data+0, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;Transporter_With_HC05.c,141 :: 		move_R();
	CALL       _move_R+0
	GOTO       L_main8
L_main7:
;Transporter_With_HC05.c,142 :: 		else if(Data=='B')         //back
	MOVF       _Data+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;Transporter_With_HC05.c,143 :: 		move_B();
	CALL       _move_B+0
	GOTO       L_main10
L_main9:
;Transporter_With_HC05.c,144 :: 		else if(Data=='S')         //stop
	MOVF       _Data+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;Transporter_With_HC05.c,145 :: 		move_S();
	CALL       _move_S+0
	GOTO       L_main12
L_main11:
;Transporter_With_HC05.c,146 :: 		else if(Data=='A')         //Arm up
	MOVF       _Data+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;Transporter_With_HC05.c,147 :: 		move_AU();
	CALL       _move_AU+0
	GOTO       L_main14
L_main13:
;Transporter_With_HC05.c,148 :: 		else if(Data=='a')         //Arm down
	MOVF       _Data+0, 0
	XORLW      97
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;Transporter_With_HC05.c,149 :: 		move_AD();
	CALL       _move_AD+0
	GOTO       L_main16
L_main15:
;Transporter_With_HC05.c,150 :: 		else if(Data=='B')         //arm right
	MOVF       _Data+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Transporter_With_HC05.c,151 :: 		move_AR();
	CALL       _move_AR+0
	GOTO       L_main18
L_main17:
;Transporter_With_HC05.c,152 :: 		else if(Data=='b')         //arm left
	MOVF       _Data+0, 0
	XORLW      98
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;Transporter_With_HC05.c,153 :: 		move_AL();
	CALL       _move_AL+0
	GOTO       L_main20
L_main19:
;Transporter_With_HC05.c,154 :: 		else if(Data=='G')         //gripper open
	MOVF       _Data+0, 0
	XORLW      71
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;Transporter_With_HC05.c,155 :: 		move_GO();
	CALL       _move_GO+0
	GOTO       L_main22
L_main21:
;Transporter_With_HC05.c,156 :: 		else if(Data=='g')         //gripper close
	MOVF       _Data+0, 0
	XORLW      103
	BTFSS      STATUS+0, 2
	GOTO       L_main23
;Transporter_With_HC05.c,157 :: 		move_GC();
	CALL       _move_GC+0
	GOTO       L_main24
L_main23:
;Transporter_With_HC05.c,158 :: 		else {};                   //do nothing
L_main24:
L_main22:
L_main20:
L_main18:
L_main16:
L_main14:
L_main12:
L_main10:
L_main8:
L_main6:
L_main4:
;Transporter_With_HC05.c,159 :: 		}
L_main2:
;Transporter_With_HC05.c,161 :: 		}        //end of while loop
	GOTO       L_main0
;Transporter_With_HC05.c,162 :: 		}         //end of main function
L_end_main:
	GOTO       $+0
; end of _main

_pins_config:

;Transporter_With_HC05.c,164 :: 		void pins_config()
;Transporter_With_HC05.c,166 :: 		UART1_Init(9600);   // Universal Asynchronous Reciver Transmitter initialization for bluetooth module (BaudeRate--> speed of DAta transmition and reciver )
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Transporter_With_HC05.c,167 :: 		Delay_ms(100);      // Wait for UART module to stabilize
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_pins_config25:
	DECFSZ     R13+0, 1
	GOTO       L_pins_config25
	DECFSZ     R12+0, 1
	GOTO       L_pins_config25
	DECFSZ     R11+0, 1
	GOTO       L_pins_config25
	NOP
	NOP
;Transporter_With_HC05.c,168 :: 		trisb = 0b00000000; //make port b as output
	CLRF       TRISB+0
;Transporter_With_HC05.c,169 :: 		portb = 0b00000000; //initiating all pins by zero (logic low)
	CLRF       PORTB+0
;Transporter_With_HC05.c,170 :: 		trisd = 0b00000000; //make port d as output
	CLRF       TRISD+0
;Transporter_With_HC05.c,171 :: 		portd = 0b00000000; //initiating all pins by zero (logic low)
	CLRF       PORTD+0
;Transporter_With_HC05.c,172 :: 		}
L_end_pins_config:
	RETURN
; end of _pins_config

_move_F:

;Transporter_With_HC05.c,174 :: 		void move_F()       //move forward function
;Transporter_With_HC05.c,176 :: 		RM1=1;
	BSF        PORTB+0, 0
;Transporter_With_HC05.c,177 :: 		RM2=0;
	BCF        PORTB+0, 1
;Transporter_With_HC05.c,178 :: 		LM1=1;
	BSF        PORTB+0, 2
;Transporter_With_HC05.c,179 :: 		LM2=0;
	BCF        PORTB+0, 3
;Transporter_With_HC05.c,180 :: 		}
L_end_move_F:
	RETURN
; end of _move_F

_move_R:

;Transporter_With_HC05.c,182 :: 		void move_R()       //move right function
;Transporter_With_HC05.c,184 :: 		RM1=0;
	BCF        PORTB+0, 0
;Transporter_With_HC05.c,185 :: 		RM2=1;
	BSF        PORTB+0, 1
;Transporter_With_HC05.c,186 :: 		LM1=1;
	BSF        PORTB+0, 2
;Transporter_With_HC05.c,187 :: 		LM2=0;
	BCF        PORTB+0, 3
;Transporter_With_HC05.c,188 :: 		}
L_end_move_R:
	RETURN
; end of _move_R

_move_L:

;Transporter_With_HC05.c,190 :: 		void move_L()       //move left function
;Transporter_With_HC05.c,192 :: 		RM1=1;
	BSF        PORTB+0, 0
;Transporter_With_HC05.c,193 :: 		RM2=0;
	BCF        PORTB+0, 1
;Transporter_With_HC05.c,194 :: 		LM1=0;
	BCF        PORTB+0, 2
;Transporter_With_HC05.c,195 :: 		LM2=1;
	BSF        PORTB+0, 3
;Transporter_With_HC05.c,196 :: 		}
L_end_move_L:
	RETURN
; end of _move_L

_move_B:

;Transporter_With_HC05.c,198 :: 		void move_B()       //move back function
;Transporter_With_HC05.c,200 :: 		RM1=0;
	BCF        PORTB+0, 0
;Transporter_With_HC05.c,201 :: 		RM2=1;
	BSF        PORTB+0, 1
;Transporter_With_HC05.c,202 :: 		LM1=0;
	BCF        PORTB+0, 2
;Transporter_With_HC05.c,203 :: 		LM2=1;
	BSF        PORTB+0, 3
;Transporter_With_HC05.c,204 :: 		}
L_end_move_B:
	RETURN
; end of _move_B

_move_S:

;Transporter_With_HC05.c,206 :: 		void move_S()       //stop the robot function
;Transporter_With_HC05.c,208 :: 		RM1=0;
	BCF        PORTB+0, 0
;Transporter_With_HC05.c,209 :: 		RM2=0;
	BCF        PORTB+0, 1
;Transporter_With_HC05.c,210 :: 		LM1=0;
	BCF        PORTB+0, 2
;Transporter_With_HC05.c,211 :: 		LM2=0;
	BCF        PORTB+0, 3
;Transporter_With_HC05.c,212 :: 		}
L_end_move_S:
	RETURN
; end of _move_S

_move_AU:

;Transporter_With_HC05.c,214 :: 		void move_AU()      //move Arm up function
;Transporter_With_HC05.c,216 :: 		AMUD1=1;
	BSF        PORTB+0, 4
;Transporter_With_HC05.c,217 :: 		AMUD2=0;
	BCF        PORTB+0, 5
;Transporter_With_HC05.c,218 :: 		}
L_end_move_AU:
	RETURN
; end of _move_AU

_move_AD:

;Transporter_With_HC05.c,220 :: 		void move_AD()      //move arm Down function
;Transporter_With_HC05.c,222 :: 		AMUD1=0;
	BCF        PORTB+0, 4
;Transporter_With_HC05.c,223 :: 		AMUD2=1;
	BSF        PORTB+0, 5
;Transporter_With_HC05.c,224 :: 		}
L_end_move_AD:
	RETURN
; end of _move_AD

_move_AR:

;Transporter_With_HC05.c,226 :: 		void move_AR()      //move Arm right function
;Transporter_With_HC05.c,228 :: 		AMRL1=1;
	BSF        PORTB+0, 6
;Transporter_With_HC05.c,229 :: 		AMRL2=0;
	BCF        PORTB+0, 7
;Transporter_With_HC05.c,230 :: 		}
L_end_move_AR:
	RETURN
; end of _move_AR

_move_AL:

;Transporter_With_HC05.c,232 :: 		void move_AL()      //move arm left function
;Transporter_With_HC05.c,234 :: 		AMRL1=0;
	BCF        PORTB+0, 6
;Transporter_With_HC05.c,235 :: 		AMRL2=1;
	BSF        PORTB+0, 7
;Transporter_With_HC05.c,236 :: 		}
L_end_move_AL:
	RETURN
; end of _move_AL

_move_GO:

;Transporter_With_HC05.c,238 :: 		void move_GO()      //open grapper function
;Transporter_With_HC05.c,240 :: 		GMOC1=1;
	BSF        PORTD+0, 0
;Transporter_With_HC05.c,241 :: 		GMOC2=0;
	BCF        PORTD+0, 1
;Transporter_With_HC05.c,242 :: 		}
L_end_move_GO:
	RETURN
; end of _move_GO

_move_GC:

;Transporter_With_HC05.c,244 :: 		void move_GC()      //close grapper function
;Transporter_With_HC05.c,247 :: 		GMOC1=0;
	BCF        PORTD+0, 0
;Transporter_With_HC05.c,248 :: 		GMOC2=1;
	BSF        PORTD+0, 1
;Transporter_With_HC05.c,249 :: 		}
L_end_move_GC:
	RETURN
; end of _move_GC
