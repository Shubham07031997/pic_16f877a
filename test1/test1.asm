
_main:

;test1.c,2 :: 		void main() {
;test1.c,4 :: 		TRISB=0xff;//b axs input
	MOVLW      255
	MOVWF      TRISB+0
;test1.c,6 :: 		TRISC=0;  //output
	CLRF       TRISC+0
;test1.c,7 :: 		while(1)
L_main0:
;test1.c,8 :: 		{   mybyte++;
	INCF       main_mybyte_L0+0, 1
;test1.c,9 :: 		mybyte=PORTB;      //get a byte from b
	MOVF       PORTB+0, 0
	MOVWF      main_mybyte_L0+0
;test1.c,10 :: 		msdelay(200);
	MOVLW      200
	MOVWF      FARG_msdelay+0
	CLRF       FARG_msdelay+1
	CALL       _msdelay+0
;test1.c,11 :: 		PORTC=mybyte;  //send it to c
	MOVF       main_mybyte_L0+0, 0
	MOVWF      PORTC+0
;test1.c,12 :: 		}
	GOTO       L_main0
;test1.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_msdelay:

;test1.c,14 :: 		void msdelay(unsigned int)
;test1.c,18 :: 		for(i=0;i<250;i++) {
	CLRF       R1+0
	CLRF       R1+1
L_msdelay2:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__msdelay10
	MOVLW      250
	SUBWF      R1+0, 0
L__msdelay10:
	BTFSC      STATUS+0, 0
	GOTO       L_msdelay3
;test1.c,19 :: 		for(j=0;j<123;j++) {}}
	CLRF       R3+0
L_msdelay5:
	MOVLW      123
	SUBWF      R3+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_msdelay6
	INCF       R3+0, 1
	GOTO       L_msdelay5
L_msdelay6:
;test1.c,18 :: 		for(i=0;i<250;i++) {
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;test1.c,19 :: 		for(j=0;j<123;j++) {}}
	GOTO       L_msdelay2
L_msdelay3:
;test1.c,20 :: 		}
L_end_msdelay:
	RETURN
; end of _msdelay
