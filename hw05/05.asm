extern printEndl, printInt, inputInt, printHex
%include 'conio.h'

section .text
global _start

_start:
call inputInt
    mov rdi,-1  ; return error
    jz .exit
    
    mov ebx,0
    
    xor ebx,eax

    .repeat:
        call inputInt
        jz .exit0

        xor ebx,eax
    jmp .repeat
    
.exit0:
    mov eax,ebx
    call printInt
    xor rdi, rdi

.exit:
    mov rax, 60
    syscall


