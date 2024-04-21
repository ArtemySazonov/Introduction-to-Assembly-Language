extern printEndl, printInt, inputInt, printHex
%include 'conio.h'

section .text
global _start

_start:
    call inputInt
    mov rdi,-1  ; return error
    jz .exit
    mov r13,rax
    cmp r13,1
    jnz .exit0
    
    call inputInt
    jz .exit1
    mov r12,rax
    cmp r12,1
    jnz .exit0
    
    call inputInt
    jz .exit1
    mov r11,rax
    cmp r11,1
    jnz .exit0
    
    mov r10,r13
    add r10,r12

    .repeat:
        ;read input
        call inputInt
        jz .exit1
        
        ; cmp input and supposed sequence value
        cmp rax,r10
        jne .exit0 
        
        call printInt
        call printEndl

        ;update the sequence
        mov r13,r12
        mov r12,r11
        mov r11,r10
        
        mov r10,r13
        add r10,r12
        
    jmp .repeat

.exit1:
    mov rax,1
    call printInt
    call printEndl
    xor rdi, rdi
jmp .exit

.exit0:
    mov rax,0
    call printInt
    call printEndl
    xor rdi, rdi
jmp .exit

.exitm1:
    mov rax,-1
    
.exit:

syscall

