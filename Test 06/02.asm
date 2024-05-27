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
    mov rdi,-1 
    jz .exit
    
    .repeat:
        cmp byte [rbx+rax],0
        jz .exit        
        inc rax
    loop .repeat
    
    .exit:
        call printInt
        mov rcx,0
        call readBuf
        xor rdi, rdi
        mov rax, 60
        syscall