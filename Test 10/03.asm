.include "conio.h"
.global _start

.section .bss
    buffer:         .space lenbuf
    new_buffer:     .space lenbuf

.section .data
bracketL: .space 1,'['
bracketR: .space 1,']'

.section .text
_start:
ldr r1, =buffer
    ldr r2, =lenbuf
    bl readBuf
    beq .exit

    mov r4,#0 // I{we were inside the word}
    ldr r6,=new_buffer
    mov r8,#0 //length of new_buffer

    .repeat:
        ldr r3,[r1]
        and r3,#0xff
        cmp r3,#0
        beq .exit
        
        cmp r4,#0
        beq .outside_the_word
        
        .inside_the_word:
            cmp r3,#10
            beq .left
            cmp r3,#32
            beq .left
            b .print_to_buf
            .left: 
            mov r4,#0
            mov r5,#']'
            strb r5,[r6]
            add r6,#1
            add r8,#1
        b .print_to_buf
            
        .outside_the_word:
            cmp r3,#10
            beq .print_to_buf
            cmp r3,#32
            beq .print_to_buf
            mov r4,#1
            mov r5,#'['
            strb r5,[r6]
            add r6,#1
            add r8,#1
            
        .print_to_buf: 
        strb r3,[r6]
        add r6,#1
        add r8,#1
        add r1,#1
    b .repeat

.exit:
    mov r0,#0

    mov r3,#0
    strb r3,[r6]

    ldr r1, =new_buffer
    mov r2,r8
    bl writeBuf
    
    mov r2,#0
    bl writeBuf
    
    mov r7, #0x1
    swi 0

