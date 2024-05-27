// 6. Spaces

.include "conio.h"
.global _start

.section .bss
    buffer:         .space lenbuf
    new_buffer:     .space lenbuf

.section .text
_start:
    ldr r1, =buffer
    ldr r2, =lenbuf
    bl readBuf
    beq .exit

    // r4 is the {previous was \n}, 
    // r5 is the {inside space of spaces}
    // r6 is the pointer to new_buffer latest element
    // r8 is the length of new_buffer
    mov r4,#0
    mov r5,#0
    ldr r6,=new_buffer
    mov r8,#0

    .repeat:
        ldr r3,[r1]
        and r3,#0xff
        
        .cmp_w_nline: cmp r3,#'\n'
        bne .cmp_w_space
        tst r4,r4
        mov r4,#1
        mov r5,#0
        beq .print_to_buf
        b .end_repeat
        
        .cmp_w_space: cmp r3,#' '
        bne .nnl
        tst r5,r5
        mov r4,#0
        mov r5,#1
        beq .print_to_buf
        b .end_repeat
        
        .nnl:
        mov r4,#0
        mov r5,#0
        
        .print_to_buf: 
        strb r3,[r6]
        add r6,#1
        add r8,#1
        cmp r3,#0
        beq .exit
        
        .end_repeat: add r1,#1
    b .repeat

.exit:
    mov r0,#0

    mov r3,#0
    strb r3,[r6]

    ldr r1, =new_buffer
    mov r2,r8
    sub r2,#1
    bl writeBuf
    
    mov r2,#0
    bl writeBuf
    
    mov r7, #0x1
    swi 0