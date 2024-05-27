// 1. Copy files

.include "conio.h"
.global _start

.section .bss
    buffer: .space lenbuf

.section .text
_start:
    ldr r2, =lenbuf
    ldr r1, =buffer
    bl readBuf
    beq .exitm1
    
    mov r2,r0
    ldr r1,=buffer
    bl writeBuf
    
    mov r2, #0
    bl writeBuf
    b .exit0
    
.exitm1:
    mov r0,#-1  // return error
    b .exit
.exit0:
    mov r0, #0              // set exit code, That's All Right, Mama!
.exit:
    mov r7, #0x1            // set sys call to 1 aka exit
    swi 0