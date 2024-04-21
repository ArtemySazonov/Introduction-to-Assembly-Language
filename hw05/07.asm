extern printEndl, printInt, inputInt, printHex
%include 'conio.h'

section .text
global _start

_start:
    call inputInt
    mov rdi,-1  ; return error
    jz .exit
    
    mov ebx,eax; ebx - global maxima. edx - second maxima
    mov ecx,1 ; 1 if only 1 element, else 0

    .repeat:
        call inputInt
        jz .exit0

        cmp ecx,0
        je .bodyloop
            cmp eax,ebx
            je .repeat

            mov edx,eax
            call .moreThanOne
            
            cmp eax,ebx
            jl .bodyloop
            
            mov edx,ebx
            mov ebx,eax
        
        .bodyloop:
            cmp eax,edx
            jng .repeat ; if eax<edx then jump to endloop 
            
            cmp eax,ebx
            jng .leqmax 
            
            mov edx,ebx
            mov ebx,eax
            
            .leqmax:
                cmp eax,ebx
                je .repeat
                
                mov edx,eax
        
    jmp .repeat
    
.exit0:
    cmp ecx,0
    jnz .exit1el
    mov eax,edx
    call printInt

.exit1el:
    xor rdi, rdi

.exit:
    mov rax, 60
    syscall
    
.moreThanOne:
    mov ecx,0
    ret
