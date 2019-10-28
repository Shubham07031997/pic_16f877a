
_main:

;test.c,3 :: 		void main(void) {
;test.c,4 :: 		TRISB=0;
	CLRF       TRISB+0
;test.c,5 :: 		TRISC=00;PORTB=00;
	CLRF       TRISC+0
	CLRF       PORTB+0
;test.c,6 :: 		LED=0;
	CLRF       PORTC+0
;test.c,7 :: 		for(;;)
L_main0:
;test.c,9 :: 		PORTB++;
	INCF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;test.c,10 :: 		LED++;}
	INCF       PORTC+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
	GOTO       L_main0
;test.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
