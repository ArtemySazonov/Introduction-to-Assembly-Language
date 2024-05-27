.include "conio.h"
.global inputInt    // read a num 
//  given:  none
//  must:   R0 - posivive number less then 2**31
//          Z == 1 if EOF

.global readBuf   // read a char*lenbuf 
//  given:  R1 - buffer address
//          R2 - maximum read length
//  must:   R0 - number of reading chars
//          Z == 1 if EOF


.section .data
  fileName:  .asciz "./input.txt"
  fileDescriptor: .space 4,0

.section .text
readBuf:
    push {lr}
    pushaq
    push {r1,r2}
    ldr r3,=fileDescriptor
    ldr r3,[r3]
    cmp r3,#0
    bne 0f
    mov r1,#0               //  00000  O_RDONLY open for reading only
    ldr r0,=fileName        //  const char *filename
    mov r7,#5               //  sys_open
    swi 0                 
    ldr r3,=fileDescriptor
    str r0,[r3]
    tst r0,r0              
    bgt 0f      // jumps if EAX was greater-than 0.  
    bl printHex
    mov     r0, #-1
    mov     r7, #0x1            // set sys call to 1 aka exit
    swi     0
0:
    ldr r3,=fileDescriptor
    ldr r0,[r3] // sys_read
    pop {r1,r2}
    mov r7,#3               //  sys_read
    swi 0                   
    tst r0,r0 // close file Descriptor
    bgt 1f
    ldr r3,=fileDescriptor
    ldr r0,[r3] // sys_close
    mov r7,#6               //  sys_close
    swi 0                   
    movs r0,#0
    ldr r3,=fileDescriptor
    str r0,[r3]
1:
    popaq
    pop {pc}

inputInt:   
        push     {lr}
        pushaq
        mov r0,#0
        mov r4,#0
.readB:
        push {r0,r4}

        mov     r7, #3              // set sys call to 3 aka read
        mov r0,#0
        push    {r0}
        mov     r1, sp              // get address of message to get printed
        mov     r0, #0              // write to stdin 0
        mov     r2, #1              // set 1 the lenght of the message
        swi     0
        tst  r0,r0
        pop     {r3}
        pop {r0,r4}
        bne .noend 
        tst r4,#2
        beq .endRead0  

tst r4,#1
beq .positive
neg r0,r0
.positive:
b .endRead0
.noend:

ldr r2,=minus
cmp r3,r2
bne .digit
orr r4,#1   // Negative

b .readB
.digit:
ldr r2,=newline
cmp r3,r2
beq .endRead
ldr r2,=space
cmp r3,r2
beq .endRead

sub r3,r3,#48   // 0 code in ASCII
tst r3,r3              
bmi .endRead
cmp r3,#10   // error occur if code=58!
bge .endRead 
orr r4,#2

mov r1,#10
mov r2,r0
mul r0,r2,r1
add r0,r0,r3

b .readB
.endRead:  
tst r4,#1
bne .negative
tst r4,#2
beq .readB
b .endRead0
.negative:
neg r0,r0

.endRead0:
tst r4,r4    // EOF Z Flag
        popaq    
        pop     {pc}
