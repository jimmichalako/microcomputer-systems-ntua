.include "m328PBdef.inc"

.DEF A = r20
.DEF B = r21
.DEF C = r22
.DEF D = r23
.DEF F0 = r24
.DEF F1 = r25
.DEF INPUT = r26

reset:
    ldi r16 , low(RAMEND)
    out SPL , r16
    ldi r16 , high(RAMEND)
    out SPH , r16
ser r17
out DDRC, r17	;initialise C port output
clr r17
out DDRB, r17
    
    	

    
start:
    in INPUT, PINB
    
    BST INPUT,0
    BLD A,0	;A

    BST INPUT,1
    BLD B,0		;B

    BST INPUT,2
    BLD C,0		;C

    BST INPUT,3
    BLD D,0		;D

    AND D,B		;(B*D)
    COM B			;B'
    AND A,B		;(A * B')
    OR A,D		;F0
    MOV F0,A
    
    BST INPUT,0
    BLD A,0	;A

    BST INPUT,1
    BLD B,0		;B

    BST INPUT,2
    BLD C,0		;C

    BST INPUT,3
    BLD D,0		;D
    
    COM A
    COM C
    COM B
    OR A,C
    OR B,D
    AND A,B
    MOV F1,A
    LSL F1
    OR F1,F0
    OUT PORTC, F1

    JMP start