extern printEndl, printInt, writeBuf, writeInt, writeEndl, inputInt, printHex, readBuf, printChar, printBuf
%include 'conio.h'

section .data
bracketL:db '['
bracketR:db ']'
inside_word db 0

section .bss
    buffer: resb lenbuf

section .text
global _start

_start:
mov rcx,lenbuf
    mov rbx,buffer
    call readBuf
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
            call .printBracketR
        jmp .endrepeat
        .outside:
            cmp byte [rbx+rdx],10
            je .endrepeat
            cmp byte [rbx+rdx],32
            je .endrepeat
            mov byte [inside_word],1
            call .printBracketL
        .endrepeat: call .printCurrentSymbol
        inc rdx
    loop .repeat
    
    .exit:
        call printInt
        mov rcx,0
        call readBuf
        xor rdi, rdi
        mov rax, 60
        syscall
        
.printCurrentSymbol:
    push rcx
    push rbx
    mov rcx,1
    add rbx,rdx
    call writeBuf
    pop rbx
    pop rcx
    ret
    
.printBracketL:
    push rcx
    push rbx
    mov rcx,1
    mov rbx,bracketL
    call writeBuf
    pop rbx
    pop rcx
    ret

.printBracketR:
    push rcx
    push rbx
    mov rcx,1
    mov rbx,bracketR
    call writeBuf
    pop rbx
    pop rcx
    ret