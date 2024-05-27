extern printEndl, printInt, writeBuf, writeEndl, inputInt, printHex, readBuf, printChar, printBuf
%include 'conio.h'
section .bss
    buffer: resb lenbuf

section .data
    in_word_bool db 0
    word_with_a  db 0
    ptr_to_start dq 0
    word_len     dq 0

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
        jnz .normal
        cmp byte[in_word_bool],0
        je .exit
        mov rcx,1
        jmp .outside_word
    .normal:
        cmp byte [rbx+rdx],10
        je .outside_word
        cmp byte [rbx+rdx],32
        je .outside_word
        
        .inside_word:
            cmp byte [in_word_bool],0
            jnz .were_inside
                mov byte [in_word_bool],1
                mov qword[ptr_to_start],rbx
                add qword[ptr_to_start],rdx
                mov qword[word_len],0
                cmp byte [rbx+rdx],65
                je .a_detected
                cmp byte [rbx+rdx],97
                je .a_detected
                jmp .were_inside
            .a_detected:
                mov byte[word_with_a],1
            .were_inside:
                inc qword[word_len]
        jmp .end_repeat
        .outside_word:
            cmp byte[in_word_bool],0
            jz .end_repeat
            mov byte[in_word_bool],0

            cmp byte[word_with_a],0
            jz .end_repeat
            mov byte[word_with_a],0

            push rbx
            push rcx
            mov rbx, qword[ptr_to_start]
            mov rcx, qword[word_len]
            call writeBuf
            call writeEndl
            pop rcx
            pop rbx

        .end_repeat: 
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