.include "conio.h"
.global printEndl, printInt, printHex, printB
.global writeBuf // wite a char*lenbuf 
//  given:  r1 - buffer address
//          r2 - maximum read length
//  must:   none
//          

.section .data
fileName:  .asciz "./output.txt"
fileDescriptor: .space 4,0

.section .text

writeBuf:
    push {lr}
    pushaq
    push {r1,r2}
    ldr r3,=fileDescriptor
    ldr r3,[r3]
    cmp r3,#0
    bne 0f
    
    mov r1,#00101           // 00001  O_WRONLY |00100  O_CREAT  
    ldr r0,=fileName        // const char *filename
    mov r7,#5               // sys_open
    swi 0                   
    ldr r3,=fileDescriptor
    str r0,[r3]
    tst r0,r0              
    bgt 0f      // jumps if R0 was greater-than 0.  
bl printHex
    mov     r0, #-1
    mov     r7, #0x1            // set sys call to 1 aka exit
    swi     0
0:
    ldr r0,=fileDescriptor
    ldr r0,[r0] // sys_write
    pop {r1,r2}
    cmp r2,#0
    beq 1f
    mov r7,#4               //  sys_write
    swi 0                   
    tst r0,r0   //    close file Descriptor
    bne 2f
1:    
    ldr r0,=fileDescriptor
    ldr r0,[r0] // ; sys_close
    mov r7,#6               //  sys_close
    swi 0                   
    ldr r3,=fileDescriptor
    str r0,[r3]
2:
    popaq
    pop {pc}

printEndl: 
        push     {lr}
        pushq
        ldr     r0, =newline
        mov     r7, #4              // set sys call to 4 aka write
        push    {r0}
        mov     r1, sp              // get address of message to get printed
        mov     r0, #1              // write to stdout
        mov     r2, #1              // set 1 the lenght of the message
        swi     0
        add     sp,sp,#4
        popq    
        pop     {pc}
        
printB: 
        push     {lr}
        pushq
        mov     r7, #0x4            // set sys call to 4 aka write
        ldr     r1, =0xFF
        and     r0,r0,r1
        push    {r0}
        mov     r1, sp              // get address of message to get printed
        mov     r0, #1              // write to stdout
        mov     r2, #1              // set 1 the lenght of the message
        swi     0
        add     sp,sp,#4
        popq    
        pop     {pc}

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
bl printHex1
pop {r0}
mov r1,#0x0f
and r0,r1
bl printHex1
popq
pop {pc}

printHex1:
push {lr}
ldr     r1, =0x30
add r0,r0,r1
ldr     r2, =0x39
cmp r0,r2
bcc 1f
ldr     r1, ='A'-'9'-1
add r0,r0,r1
1:
bl printB
pop {pc}

printInt:
push {lr}
pushq
tst r0,r0              
bpl .0    // .positive  ; jumps if EAX was *not* less-than 0.  
neg r0,r0
push {r0}
ldr r0,=minus
bl printB
pop {r0}
.0:
cmp r0, #10 // > 10
bge .print
add r0,r0,#0x30
bl printB
b .printExit

.print:
mov r4, #0
1: // fucking cluge
sub r0,r0,#10
tst r0,r0              
bmi 1f
add r4,r4,#1
b 1b
1:
add r0,r0,#10

push {r0}
mov r0,r4
bl printInt
pop {r0}
add r0,r0,#0x30
bl printB

.printExit:
popq
pop {pc}

