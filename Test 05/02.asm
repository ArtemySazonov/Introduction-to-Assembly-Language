extern printEndl, printInt, inputInt, printHex
%include 'conio.h'

section .text
global _start

_start:
    call inputInt
    mov rdi,-1
    jz .exit
    mov edx,eax

    .repeat:
        call inputInt
        jz .exit0
        cmp edx,eax
        jnl .repeat
        mov edx,eax
    jmp .repeat
    
.exit0:
    mov eax,edx
    call printInt
    xor rdi, rdi
.exit:
    mov rax, 60
    syscall