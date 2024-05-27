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
        jz .exitloop 
        
        cmp byte [rbx+rdx],10
        jne .endrepeat
        
        inc rax
        
    .endrepeat: inc rdx
    loop .repeat
    jmp .exit
    
    .exitloop:
        dec rdx
        cmp byte [rbx+rdx],10
        je .exit
        inc rax
    .exit:
        call printInt
        mov rcx,0
        call readBuf
        xor rdi, rdi
        mov rax, 60
        syscall

