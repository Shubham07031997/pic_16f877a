void msdelay(unsigned int);
void main() {
 unsigned char mybyte;
 TRISB=0xff;//b axs input

 TRISC=0;  //output
 while(1)
 {   mybyte++;
 mybyte=PORTB;      //get a byte from b
 msdelay(200);
 PORTC=mybyte;  //send it to c
 }
}
void msdelay(unsigned int)
{
 unsigned int i;
 unsigned char j;
 for(i=0;i<250;i++) {
 for(j=0;j<123;j++) {}}
 }