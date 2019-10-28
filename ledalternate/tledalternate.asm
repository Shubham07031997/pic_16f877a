
_delay:

;tledalternate.c,1 :: 		void delay(unsigned int d)
;tledalternate.c,4 :: 		for(x=0;x<d;x++)
	CLRF       R1+0
	CLRF       R1+1
L_delay0:
	MOVF       FARG_delay_d+1, 0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay9
	MOVF       FARG_delay_d+0, 0
	SUBWF      R1+0, 0
L__delay9:
	BTFSC      STATUS+0, 0
	GOTO       L_delay1
;tledalternate.c,6 :: 		for(y=0;y<1275;y++)
	CLRF       R3+0
	CLRF       R3+1
L_delay3:
	MOVLW      4
	SUBWF      R3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay10
	MOVLW      251
	SUBWF      R3+0, 0
L__delay10:
	BTFSC      STATUS+0, 0
	GOTO       L_delay4
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;tledalternate.c,8 :: 		}
	GOTO       L_delay3
L_delay4:
;tledalternate.c,4 :: 		for(x=0;x<d;x++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;tledalternate.c,9 :: 		}
	GOTO       L_delay0
L_delay1:
;tledalternate.c,10 :: 		}
L_end_delay:
	RETURN
; end of _delay

_main:

;tledalternate.c,11 :: 		void main(void) {
;tledalternate.c,14 :: 		TRISB=0;     //portb as output
	CLRF       TRISB+0
;tledalternate.c,16 :: 		while(1)
L_main6:
;tledalternate.c,18 :: 		PORTB=0x55;
	MOVLW      85
	MOVWF      PORTB+0
;tledalternate.c,19 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_d+0
	MOVLW      0
	MOVWF      FARG_delay_d+1
	CALL       _delay+0
;tledalternate.c,20 :: 		PORTB=0xAA;
	MOVLW      170
	MOVWF      PORTB+0
;tledalternate.c,21 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_d+0
	MOVLW      0
	MOVWF      FARG_delay_d+1
	CALL       _delay+0
;tledalternate.c,22 :: 		}
	GOTO       L_main6
;tledalternate.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
