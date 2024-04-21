extern printEndl, printInt, inputInt, printHex
%include 'conio.h'

section .text
global _start

_start:
    call inputInt
    mov rdi,-1  ; return error
    jz .exit
    
    mov ebx,0
    mov ecx,1
    mov edx,0
    
    xor ebx,ecx
    xor edx,eax

    .repeat:
        call inputInt
        jz .exit0
        
        inc ecx
        xor ebx,ecx
        xor edx,eax
        
    jmp .repeat
    
.exit0:
    inc cx
    xor ebx,ecx
    mov eax,edx
    xor eax,ebx
    call printInt
    xor rdi, rdi

.exit:
    mov rax, 60
    syscall

