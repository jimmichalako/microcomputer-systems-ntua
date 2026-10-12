.include "m328PBdef.inc"

.DEF OUTPUT = r20
.DEF COUNT = r21

stack:	ldi r16, low(RAMEND)
		out SPL, r16
		ldi r16, high(RAMEND)
		out SPH, r16

IO_set:	
    ser OUTPUT		; initialize PORTD
    out DDRD, OUTPUT	; for output

main:	
    ldi OUTPUT, 01		; initialize output
    ldi COUNT, 07		; initialize counter
    out PORTD, OUTPUT

right:	
    ldi r24, low(4000)
    ldi r25, high(4000)
    rcall wait_msec
    lsl OUTPUT			; shift output 1 left
    out PORTD, OUTPUT	; send it to output
    dec COUNT			; decrease the counter
    cpi COUNT, 00		; check if it is 0
    brne right
    ldi r24, low(2000)
    ldi r25, high(2000); if it is then don't loop
    rcall wait_msec

left:
    ldi r24, low(4000)
    ldi r25, high(4000)
    rcall wait_msec
    lsr OUTPUT			; shift output 1 right
    out PORTD, OUTPUT	; send it to output
    inc COUNT			; increase the counter
    cpi COUNT, 07		; check if it is 7
    brne left		; if it is then don't loop
    ldi r24, low(2000)
    ldi r25, high(2000)
    rcall wait_msec
    rjmp right

    
wait_msec:
push r24 ; 2 ?????? (0.250 ?sec)
push r25 ; 2 ??????
ldi r24 , low(998) ; ??????? ??? ?????. r25:r24 ?? 998 (1 ?????? - 0.125?sec)
ldi r25 , high(998) ; 1 ?????? (0.125 ?sec)
rcall wait_usec ; 3 ?????? (0.375 ?sec), ???????? ???????? ???????????998.375 ?sec
pop r25 ; 2 ?????? (0.250 ?sec)
pop r24 ; 2 ??????
sbiw r24 , 1 ; 2 ??????
brne wait_msec ; 1 ? 2 ?????? (0.125 ? 0.250 ?sec)
ret ; 4 ?????? (0.500 ?sec)
wait_usec: 
sbiw r24 ,1 ; 2 ?????? (0.250 ?sec) 
nop ; 1 ?????? (0.125 ?sec)
nop ; 1 ?????? (0.125 ?sec)
nop ; 1 ?????? (0.125 ?sec)
nop ; 1 ?????? (0.125 ?sec)
brne wait_usec ; 1 ? 2 ?????? (0.125 ? 0.250 ?sec)
ret ; 4 ?????? (0.500 ?sec)
