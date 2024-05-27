// 1. Padovan problem

.include "conio.h"
.global _start


.section .text

_start:
    bl inputInt
    bne .not_empty
    
    mov r0,#-1
    b .exit
    
    .not_empty:
    mov r1,r0
    bl inputInt
    
    mov r2,r0
    bne .fst_not_empty
    
    mov r0,#1
    cmp r1,#1
    beq .exit0
    
    mov r0,#0
    b .exit0
    
    .fst_not_empty: bl inputInt

    mov r3,r0
    bne .sec_not_empty
    
    mov r0,#1
    cmp r2,#1
    beq .exit0
    
    mov r0,#0
    b .exit0
    
    .sec_not_empty:
    mov r0,#0
    cmp r3,#1
    bne .exit0
     
    .repeat:
        bl inputInt
        beq .end
        
        add r1,r2
        cmp r0,r1
        beq .end_repeat
        
        mov r0,#0
        b .exit0
        
        .end_repeat:
            mov r1,r2
            mov r2,r3
            mov r3,r0
    b .repeat
    
    .end: mov r0,#1
    
.exit0:
    bl printInt
    bl printEndl
    mov r0, #0
    
.exit:
    mov r7, #0x1
    swi 0