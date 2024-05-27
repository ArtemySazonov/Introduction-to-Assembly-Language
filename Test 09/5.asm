// 5. Digits

.include "conio.h"
.global _start

.section .bss
buffer:.space lenbuf


.section .text
_start:
    ldr r2, =lenbuf
    ldr r1, =buffer
    bl readBuf
    beq .exit
    mov r0, #0

    .repeat:
        ldr r3, [r1]
        and r3, #0xff
        tst r3,r3
        beq .exit
        
        cmp r3, #48
        bcc .end_repeat
        cmp r3, #58
        bcs .end_repeat
     
        add r0, #1
        
    .end_repeat: add r1,#1
    b .repeat

.exit:
    bl printInt
    mov r0,#0
    mov r7, #0x1
    swi 0