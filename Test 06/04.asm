extern printEndl, printInt, writeBuf, inputInt, printHex, readBuf, printChar, printBuf
%include 'conio.h'

section .bss
    buffer: resb lenbuf

section .text
global _start

_start:
    mov rcx,lenbuf
    mov rbx,buffer
    call readBuf
    mov rax,0
    mov rdx,0
    jz .exit
    
    .repeat:
        cmp byte [rbx+rdx],0
        jz .exit 
        
        cmp byte [rbx+rdx],65
        jb .endrepeat 
        
        cmp byte [rbx+rdx],122
        ja .endrepeat 
        
        cmp byte [rbx+rdx],91
        jb .incrax 
        
        cmp byte [rbx+rdx],96
        ja .incrax 
        
        jmp .endrepeat
        
        .incrax: inc rax
        
    .endrepeat: inc rdx
    loop .repeat
    
    .exit:
        call printInt
        mov rcx,0
        call readBuf
        xor rdi, rdi
        mov rax, 60
        syscall

