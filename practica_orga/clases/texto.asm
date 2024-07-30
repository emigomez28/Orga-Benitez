global main
extern puts
extern gets
extern printf

%macro mPuts 0
    sub rsp, 8
    call puts
    add rsp, 8
%endmacro

%macro mGets 0
    sub rsp, 8
    call gets 
    add rsp, 8
%endmacro

%macro mPrintf 0
    sub rsp, 8
    call printf 
    add rsp, 8
%endmacro

section .data
    msgIngresarTexto db "Ingrese un texto por teclado(max 99 caracteres): ", 0
    msgIngresarChar db "Ingrese un caracter: ", 0
    longTexto dq 0 ;Con quad para poder hacer mov [longTexto], rsi y se copien los 8 bytes
    aparicionesChar dq 0
    msgTextoInvertido db "Texto invertido: %s", 10, 0
    porcenate dq 100

section .bss
    texto resb 100
    caracter resb 50
    textoInvertido resb 100

section .text
main:
    mov ebp, esp; for correct debugging
    ;Imprimo el mensaje para pedir texto
    mov     rdi, msgIngresarTexto
    mPuts
    ;Pido el texto
    mov     rdi, texto
    mGets
    ;Imprimo mensaje para pedir el caracter a buscar
    mov     rdi, msgIngresarChar
    mPuts
    ; Pido el caracter
    mov     rdi, caracter
    mGets

    sub     rsi, rsi ;Inicializo el rsi en 0
    ;Recorro el texto para invertirlo

loop:
    cmp     byte[texto + rsi], 0 ;Si encontre el 0 binario, tengo el fin de string
    je      finRecorrido
    inc     rsi
    jmp     loop 

finRecorrido:
    mov     rdi, 0
    mov     [longTexto], rsi ; Me guardo la longitud del texto
    
copiarChar:
    cmp     rsi,0
    je      finCopia
    mov     al, byte[texto + rsi - 1]
    mov     [textoInvertido + rdi], al
    cmp     al, [caracter]
    jne     moverPunteros
    add     qword[aparicionesChar], 1

moverPunteros:
    dec     rsi
    inc     rdi
    jmp     copiarChar


finCopia:
    mov     byte[textoInvertido + rdi], 0 ;Pongo el fin de string
    mov     rdi, msgTextoInvertido
    mov     rsi, textoInvertido 
    mPrintf

    sub     rax, rax
    mov     rax,[aparicionesChar]
    div     qword[longTexto]
    mul     qword[porcenate]
    mov     rdi, rax
    mPrintf

    ret
