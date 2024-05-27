// 3. Second highest (silver)

.include "conio.h"
.global _start


.section .text

_start:
    bl inputInt
    beq .exitm1

    mov r1,r0
    mov r2,#1

    .repeat:
        bl inputInt
        beq .exit0

        cmp r2,#0
        beq .bodyloop
            cmp r0,r1
            beq .repeat

            mov r3,r0
            mov r2,#0
            
            cmp r0,r1
            blt .bodyloop
            
            mov r3,r1
            mov r1,r0
        
        .bodyloop:
            cmp r0,r3
            ble .repeat
            
            cmp r0,r1
            ble .leqmax 
            
            mov r3,r1
            mov r1,r0
            
            .leqmax:
                cmp r0,r1
                beq .repeat
                
                mov r3,r0
        
    b .repeat

    .exit0:
        cmp r2,#0
        bne .exit1el
        mov r0,r3
        bl printInt
        bl printEndl

    .exit1el:
        mov     r0, #0
        
    .exit:
        mov     r7, #0x1
        swi     0
        
    .exitm1:
        mov r0,#-1
        b .exit
