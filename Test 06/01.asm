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
    mov rdi,-1  ; return error (Never!)
    jz .exit

    mov rcx,rax
    mov rbx,buffer
    call writeBuf

    mov rcx,0
    call writeBuf
    
.exit0:
    xor rdi, rdi ; That's All Right, Mama!
.exit:
    mov rax, 60
    syscall
