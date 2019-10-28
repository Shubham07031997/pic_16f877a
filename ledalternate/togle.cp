#line 1 "C:/Users/aman/Desktop/picprogrammes/togle.c"
void delay(unsigned int d)
{
 unsigned int x,y;
 for(x=0;x<d;x++)
 {
 for(y=0;y<1275;y++)
 {
 }
 }
 }
void main(void) {


TRISB=0;

 while(1)
 {
 PORTB=0x55;
 delay(10);
 PORTB=0xff;
 delay(10);
 }


}
