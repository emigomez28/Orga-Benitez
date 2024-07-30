global main
extern scanf
extern printf
extern gets
extern sscanf

%macro mPrintf 0
    sub rsp, 8
    call printf
    add rsp, 8
%endmacro

%macro mGets 0
    sub rsp, 8
    call gets
    add rsp, 8
%endmacro

%macro mSscanf 0
    sub rsp, 8
    call sscanf
    add rsp, 8
%endmacro


section .data
    numFormat db "%d",0 
    msgPedirNumero db "Ingrese un numero: ",0
    msgPedirPotencia db "Ingrese la potencia: ",0
    msgError db "Error, ingrese un numero y una potencia",0

section .bss
    numero resb 100 
    potencia resb 100
    contador resb 100
section .text
main:
    mov rdi,msgPedirNumero
    mPrintf
    sub rdi,rdi
    mGets
    mov rsi,numFormat
    mov rcx,numero
    mSscanf

    mov rdi,msgPedirPotencia
    mPrintf
    mov rdi,potencia
    mGets

    mov rdi,contador
    

    ret
