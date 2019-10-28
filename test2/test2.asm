
_main:

;test2.c,2 :: 		void main()
;test2.c,4 :: 		TRISB=0x02;  //assiging rb1 as input
	MOVLW      2
	MOVWF      TRISB+0
;test2.c,5 :: 		TRISA=0x00;   //ra0 as output
	CLRF       TRISA+0
;test2.c,6 :: 		PORTB=0x02;
	MOVLW      2
	MOVWF      PORTB+0
;test2.c,7 :: 		PORTA=0x00;
	CLRF       PORTA+0
;test2.c,8 :: 		do
L_main0:
;test2.c,10 :: 		if(PORTB.F1==0)
	BTFSC      PORTB+0, 1
	GOTO       L_main3
;test2.c,12 :: 		PORTA.F0=1;
	BSF        PORTA+0, 0
;test2.c,13 :: 		}
	GOTO       L_main4
L_main3:
;test2.c,16 :: 		PORTA.F0=0;
	BCF        PORTA+0, 0
;test2.c,17 :: 		}
L_main4:
;test2.c,19 :: 		while(1);
	GOTO       L_main0
;test2.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
