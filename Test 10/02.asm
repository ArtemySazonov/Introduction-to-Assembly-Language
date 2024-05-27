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

    mov r4,#1 // I{newline}
    mov r5,#1 // line number
    ldr r6,=new_buffer
    mov r8,#0 //length of new_buffer

    .repeat:
        ldr r3,[r1]
        and r3,#0xff
        cmp r3,#0
        beq .exit
        
        cmp r4,#0
        beq .print_to_buf
        
        .new_line:
            mov r4,#0
            push {r5}
            
            cmp r5,#9
            ble .not_ten
            mov r9,#49
            str r9,[r6]
            add r6,#1
            add r8,#1
            sub r5,#10

            .not_ten:
            add r5,#48
            str r5,[r6]
            add r6,#1
            add r8,#1

            pop {r5}
            add r5,#1            

            mov r9,#' '
            str r9,[r6]

            add r6,#1
            add r8,#1
            
        .print_to_buf: 
            strb r3,[r6]
            add r6,#1
            add r8,#1
            add r1,#1
            
        cmp r3,#'\n'
        bne .repeat
        mov r4,#1
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