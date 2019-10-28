#line 1 "C:/Users/aman/Desktop/picprogrammes/test1/test1.c"
void msdelay(unsigned int);
void main() {
 unsigned char mybyte;
 TRISB=0xff;

 TRISC=0;
 while(1)
 { mybyte++;
 mybyte=PORTB;
 msdelay(200);
 PORTC=mybyte;
 }
}
void msdelay(unsigned int)
{
 unsigned int i;
 unsigned char j;
 for(i=0;i<250;i++) {
 for(j=0;j<123;j++) {}}
 }
