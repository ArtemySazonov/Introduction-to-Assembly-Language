// 3. Count the strings

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
    mov r0, #1
    ldr r4, =newline

    .repeat:
        ldr r3, [r1]
        and r3, #0xff
        cmp r3, r4
        bne .end_repeat
        ldr r3, [r1, #1]
        and r3, #0xff
        cmp r3, #0
        beq .end_repeat
        add r0, #1
        .end_repeat:
            add r1,#1
            subs r2, #1
    bne .repeat


.exit:
    bl printInt
    mov r0,#0
    mov r7, #0x1
    swi 0