extern printEndl, printInt, inputInt, printHex
%include 'conio.h'

section .text
global _start

_start:
    call inputInt
    mov rdi,-1
    jz .exit
    
    mov ebx,eax
    mov edi,eax
    mul edi
    mov ecx,eax
    
    call inputInt
    mov rdi,-1
    jz .exit
    
    add ebx,eax
    mov edi,eax
    mul edi
    add ecx,eax

    .repeat:
        call inputInt
        jz .exit0
        add ebx,eax
        mov edi,eax
        mul edi
        add ecx,eax
    jmp .repeat
    
.exit0:
    mov eax,ebx
    mul ebx
    sub eax,ecx
    mov edi,2
    div edi
    call printInt
    xor rdi, rdi

.exit:
    mov rax, 60
    syscall