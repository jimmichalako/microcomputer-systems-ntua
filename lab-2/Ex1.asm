.include "m328PBdef.inc"
.def number=r16
 
.org 0x0
 rjmp reset 
 
.org 0x4
 rjmp isr0
reset:
 ldi r24, LOW(RAMEND)
 out SPL, r24
 ldi r24, HIGH(RAMEND)
 out SPH, r24
 ser r24
 out DDRC,r24 ; Init PORTB as output
 
 clr r24
 out DDRD,r24 ; Init PORTD as input
 ;Interrupt on rising edge of INT0 pin
 ldi r24, (1<<ISC11) | (1<<ISC10)
 sts EICRA, r24
 
 ;Enable the INT0 interrupt
 ldi r24, (1<<INT1)
 out EIMSK, r24
 
 sei ; Enable general flag of interrupts
 
 clr r24
 out PORTC, r24 ; Clear all pins of PORTB
 clr r22
 
main:
    out PORTC, r22
    rjmp main
;External interrupt 0 service routine
isr0:
loop:
 in r16,PIND
 sbrs r16,7
 rjmp end
 
inc r22
sbrc r22, 4
clr r22
;Delay 500 mS 
ldi r24, low(16*100) ; Init r25, r24 for delay 500 mS
ldi r25, high(16*100) ; CPU frequency = 16 MHz 
delay1:
 ldi r23, 249 ; (1 cycle)
delay2:
 dec r23 ; 1 cycle
 nop ; 1 cycle
 brne delay2 ; 1 or 2 cycles
 sbiw r24, 1 ; 2 cycles
 brne delay1 ; 1 or 2 cyclesa 
 

end:
 ldi r24, (1 << INTF1)
 out EIFR, r24 ; Clear external interrupt 0 flag
reti