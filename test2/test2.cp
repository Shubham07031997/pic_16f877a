#line 1 "C:/Users/aman/Desktop/picprogrammes/test2/test2.c"

void main()
 {
 TRISB=0x02;
 TRISA=0x00;
 PORTB=0x02;
 PORTA=0x00;
 do
 {
 if(PORTB.F1==0)
 {
 PORTA.F0=1;
 }
 else
 {
 PORTA.F0=0;
 }
 }
 while(1);
 {
 }

}
