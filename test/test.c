
 #define LED PORTC
void main(void) {
TRISB=0;
TRISC=00;PORTB=00;
LED=0;
for(;;)
{
PORTB++;
LED++;}

}