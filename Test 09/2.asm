// 2. Count the characters

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
        ldr r3,[r1]
        cmp r3,#0
        beq .exit
        add r1,#1
        cmp r3,#'\n'
        addne r0,#1
    bne .repeat

.exit:
    bl printInt
    mov r0,#0
    mov r7, #0x1
    swi 0
