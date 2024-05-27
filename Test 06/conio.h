%ifndef CONIO_H 
%define CONIO_H
; now define some macros 
%macro pushaq 0
;    push rax
    push rcx
    push rdx
    push rbx
    push rbp
    push rsi
    push rdi
%endm # pushaq

%macro popaq 0
    pop rdi
    pop rsi
    pop rbp
    pop rbx
    pop rdx
    pop rcx
;    pop rax
%endm # popaq

%macro pushq 0
    pushf
    push rax
    push rcx
    push rdx
    push rbx
    push rbp
    push rsi
    push rdi
%endm # pushq

%macro popq 0
    pop rdi
    pop rsi
    pop rbp
    pop rbx
    pop rdx
    pop rcx
    pop rax
    popf
%endm # popq

%define newline 10
%define space 32
%define minus 0x2D
%define lenbuf 4000
%define filein "./input.txt"
%define fileout "./output.txt"

len equ 1024



%endif ;CONIO_H
