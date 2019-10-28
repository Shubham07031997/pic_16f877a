
void main()
 {
   TRISB=0x02;  //assiging rb1 as input
   TRISA=0x00;   //ra0 as output
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