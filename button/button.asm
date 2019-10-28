
_main:

;button.c,3 :: 		void main() {
;button.c,5 :: 		ANSEL  = 0;                                    // Configure AN pins as digital I/O
	CLRF        ANSEL+0 
;button.c,6 :: 		ANSELH = 0;
	CLRF        ANSELH+0 
;button.c,7 :: 		C1ON_bit = 0;                                  // Disable comparators
	BCF         C1ON_bit+0, BitPos(C1ON_bit+0) 
;button.c,8 :: 		C2ON_bit = 0;
	BCF         C2ON_bit+0, BitPos(C2ON_bit+0) 
;button.c,10 :: 		TRISB0_bit = 1;                                // set RB0 pin as input
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;button.c,12 :: 		TRISC = 0x00;                                  // Configure PORTC as output
	CLRF        TRISC+0 
;button.c,13 :: 		PORTC = 0xAA;                                  // Initial PORTC value
	MOVLW       170
	MOVWF       PORTC+0 
;button.c,14 :: 		oldstate = 0;
	BCF         _oldstate+0, BitPos(_oldstate+0) 
;button.c,16 :: 		do {
L_main0:
;button.c,17 :: 		if (Button(&PORTB, 0, 1, 1)) {               // Detect logical one
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;button.c,18 :: 		oldstate = 1;                              // Update flag
	BSF         _oldstate+0, BitPos(_oldstate+0) 
;button.c,19 :: 		}
L_main3:
;button.c,20 :: 		if (oldstate && Button(&PORTB, 0, 1, 0)) {   // Detect one-to-zero transition
	BTFSS       _oldstate+0, BitPos(_oldstate+0) 
	GOTO        L_main6
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
L__main7:
;button.c,21 :: 		PORTC = ~PORTC;                            // Invert PORTC
	COMF        PORTC+0, 1 
;button.c,22 :: 		oldstate = 0;                              // Update flag
	BCF         _oldstate+0, BitPos(_oldstate+0) 
;button.c,23 :: 		}
L_main6:
;button.c,24 :: 		} while(1);                                    // Endless loop
	GOTO        L_main0
;button.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
