#define F_CPU 16000000UL
#include<avr/io.h>
#include<avr/interrupt.h>
#include<util/delay.h>

int c=0;

ISR(INT1_vect) // External INT1 ISR
{
    if(c>0){
        PORTB=0xFF;
        _delay_ms(1000);
        c=2000;
    }
    else
        c=3000;
 EIFR = (1 << INTF1); // Clear the flag of interrupt INTF1
}
int main(){
 // Interrupt on rising edge of INT1 pin
 EICRA=(1<<ISC11) | (1<<ISC10);
 
 // Enable the INT1 interrupt (PD3)
 EIMSK=(1<<INT1);
 
 sei(); // Enable global interrupts
 
 DDRB=0xFF; // Set PORTB as output
 
 while(1)
 {
     PORTB=0x00;
    while (c>0){
      
        PORTB=0x01;
       _delay_ms(1);
       c=c-1;
    }
 }
}