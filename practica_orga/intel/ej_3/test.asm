global main
extern sscanf
extern printf

%macro mSscanf 0
    sub rsp, 8
    call sscanf
    add rsp, 8
%endmacro

%macro mPrintf 0
    sub rsp, 8
    call printf
    add rsp, 8
%endmacro

section .data
    msgError db "Error",0
    format db "%d", 0
    num db 0

section .text
main:
    mov rdi, format
    mov rsi, num
    mSscanf
    cmp rax,1
    je  error
    ret

error:
    mov rdi,msgError
    mPrintf
