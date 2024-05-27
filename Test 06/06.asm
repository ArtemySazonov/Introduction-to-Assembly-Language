extern printEndl, printInt, writeBuf, inputInt, printHex, readBuf, printChar, printBuf
%include 'conio.h'
section .bss
    buffer: resb lenbuf

section .data
    inside_word db 0

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
        cmp byte [inside_word],0
        jz .outside
            cmp byte [rbx+rdx],10
            je .left
            cmp byte [rbx+rdx],32
            je .left
            jmp .endrepeat
            .left: mov byte [inside_word],0
        .outside:
            cmp byte [rbx+rdx],10
            je .endrepeat
            cmp byte [rbx+rdx],32
            je .endrepeat
            inc rax
            mov byte [inside_word],1
        
    .endrepeat: inc rdx
    loop .repeat
    
    .exit:
        call printInt
        mov rcx,0
        call readBuf
        xor rdi, rdi
        mov rax, 60
        syscall
