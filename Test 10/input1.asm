.include "conio.h"
.global inputInt    // read a num 
//  given:  none
//  must:   R0 - posivive number less then 2**31
//          Z == 1 if EOF


.section .text
readBuf:

inputInt:
    push {lr}
    pushaq
    
    mov r0,#0
    mov r4,#0
    
    .rb:
        push {r0,r4}
    
        mov r7, #3 
        mov r0,#0
        
        push {r0}
        
        mov r1, sp 
        mov r0, #0
        mov r2, #1
        swi 0
        
        tst r0,r0
        
        pop {r3}
        pop {r0,r4}
        
        bne .resume 
        tst r4,#2
        beq .end_of_read0  
    
        tst r4,#1
        beq .positive
        neg r0,r0
        
        .positive: b .end_of_read0
        
        .resume:
            ldr r2,=minus
            cmp r3,r2
            bne .dgt
            orr r4,#1
    b .rb

.dgt:
    ldr r2,=newline
    cmp r3,r2
    beq .end_of_read
    
    ldr r2,=space
    cmp r3,r2
    beq .end_of_read
    
    sub r3,r3,#48
    tst r3,r3              
    bmi .end_of_read
    
    cmp r3,#10
    bge .end_of_read 
    
    orr r4,#2
    
    mov r1,#10
    mov r2,r0
    
    mul r0,r2,r1
    add r0,r0,r3
    
    b .rb
    
.end_of_read:  
    tst r4,#1
    bne .negate
    tst r4,#2
    beq .rb
    b .end_of_read0
    .negate: neg r0,r0

.end_of_read0:
    tst r4,r4
    popaq    
    pop     {pc}
