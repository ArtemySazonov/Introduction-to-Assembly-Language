// 2. Missing number

.include "conio.h"
.global _start


.section .text

_start:
    bl inputInt
    beq .exitm1
    
    mov r1,#1
    mov r2,#0
    mov r3,#0
    
    eor r2,r0
    eor r3,r1
    
    .repeat:
        bl inputInt
        beq .exit0
        
        add r1,#1
        
        eor r2,r0
        eor r3,r1
        
    b .repeat
    
    .exit0:
        add r1,#1
        eor r3,r1
        
        mov r0, r2
        eor r0, r3
        bl printInt
        bl printEndl
        mov     r0, #0
        
    .exit:
        mov     r7, #0x1
        swi     0
        
    .exitm1:
        mov r0,#-1
        b .exit