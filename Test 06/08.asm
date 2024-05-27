extern printEndl, printInt, writeBuf, writeInt, writeEndl, inputInt, printHex, readBuf, printChar, printBuf
%include 'conio.h'
section .bss
    buffer: resb lenbuf

section .data
    start   dq 0
    lenword dq 0

section .text
global _start

_start:
    mov rcx,lenbuf
    mov rbx,buffer
    call readBuf
    mov r10,0
    mov rdx,0
    jz .exit
    mov qword [start],rbx
    
    .repeat:
        cmp byte [rbx+rdx],0
        jz .exit
        
        inc qword [lenword]
        
        cmp byte [rbx+rdx],10
        je .printstring
        
        jmp .endrepeat
        .printstring:
            inc r10
            mov rax,r10
            call writeInt
            
            push rbx
            push rcx
            
            mov rbx, qword [start]
            mov rcx, qword [lenword]
            call writeBuf
            
            pop rcx
            pop rbx
            
            mov qword [start],rbx
            add qword [start],rdx
            inc qword [start]
            mov qword [lenword],0
        
        .endrepeat: 
            inc rdx
            dec rcx
            cmp rcx,0
    jnz .repeat
    
    .exit:
        mov rcx,0
        call readBuf
        call writeBuf

        xor rdi, rdi
        mov rax, 60
        syscall

