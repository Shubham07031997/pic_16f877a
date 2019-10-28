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
 //char mynum[]={+1.-1.+2.-2.+3.-3.+4.-4};
  //nsigned char z;
TRISB=0;     //portb as output

    while(1)
    {
    PORTB=0x55;
    delay(10);
    PORTB=0xAA;
    delay(10);
    }


}