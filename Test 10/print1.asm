.include "conio.h"
.global writeBuf // wite a char*lenbuf 
//  given:  r1 - buffer address
//          r2 - maximum read length
//  must:   none
//          

.section .data
fileName:  .asciz "./output.txt"
fileDescriptor: .space 4,0


.section .text

writeInt:
    push {lr}
    push {r0}

    tst r0, r0
    bpl .positive

    neg r0, r0
    push {r0}
    ldr r0, =minus
    bl .pb
    pop {r0}

.positive:
    cmp r0, #10
    bge .print

    add r0, r0, #0x30
    bl .pb
    b .ext

.print:
    mov r4, #0
    .loop:
        sub r0, r0, #10
        tst r0, r0
        bmi .loop
        
        add r4, r4, #1
    b .loop
    add r0, r0, #10

    push {r0}
    mov r0, r4
    bl writeInt
    
    pop {r0}
    add r0, r0, #0x30
    bl .pb

.ext:
    pop {r0}
    pop {pc}

writeBuf:
    push {lr}
    pushaq
    push {r1,r2}
    
    ldr r3,=fileDescriptor
    ldr r3,[r3]
    cmp r3,#0
    bne .file_opened
    
    mov r1,#00101
    ldr r0,=fileName
    mov r7,#5
    swi 0
    
    ldr r3,=fileDescriptor
    str r0,[r3]
    tst r0,r0              
    bgt .file_opened
    
    bl printHex
    
    mov r0, #-1
    mov r7, #0x1
    swi 0
    
.file_opened:
    ldr r0,=fileDescriptor
    ldr r0,[r0]
    
    pop {r1,r2}
    
    cmp r2,#0
    beq .close_file
    
    mov r7,#4
    swi 0   
    
    tst r0,r0
    bne .ret_flags
    
.close_file:    
    ldr r0,=fileDescriptor
    ldr r0,[r0]
    
    mov r7,#6
    swi 0
    
    ldr r3,=fileDescriptor
    str r0,[r3]

.ret_flags:
    popaq
    pop {pc}

printEndl: 
    push {lr}
    pushq
    
    ldr r0, =newline
    mov r7, #4
    
    push {r0}
    
    mov r1, sp
    mov r0, #1
    mov r2, #1
    swi 0
    
    add sp,sp,#4
    
    popq    
    pop {pc}
        
pb: 
    push {lr}
    pushq
    
    mov r7, #0x4
    ldr r1, =0xFF
    and r0,r0,r1
    
    push {r0}
    
    mov r1, sp
    mov r0, #1
    mov r2, #1
    swi 0
    
    add sp,sp,#4
    
    popq    
    pop {pc}

printHex:
    push {lr}
    pushq
    
    mov r1,#0xff
    and r0,r1
    
    push {r0}
    
    mov r1,#0xf0
    and r0,r1
    mov r0,r0,lsr #4
    mov r1,#0x0f
    
    and r0,r1
    bl print_hex_aux
    
    pop {r0}
    mov r1,#0x0f
    
    and r0,r1
    bl print_hex_aux
    
    popq
    pop {pc}

print_hex_aux:
    push {lr}
    
    ldr r1, =0x30
    add r0,r0,r1
    
    ldr r2, =0x39
    cmp r0,r2
    bcc .dgt
    
    ldr r1, ='A'-'9'-1
    add r0,r0,r1
    
    .dgt:
        bl pb
        pop {pc}