.ifndef CONIO_H 
.set CONIO_H,1
# now define some macros 
.macro pushaq
push {r1-r11}
.endm // pushaq

.macro popaq
pop {r1-r11}
.endm @ popaq

.macro pushq
push {r0-r11}
mrs r12,cpsr
push {r12}
.endm // pushq

.macro popq
pop {r12}
msr cpsr,r12
pop {r0-r11}
.endm // popq

.set newline,10
.set space,32
.set minus,0x2D
.set lenbuf,4000

.equ len,1024

.endif //CONIO_H
