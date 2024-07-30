global main
extern printf

%macro mPrintNum 2
    sub rsp,  8                  ; Espacio para alinear la pila y pasar argumentos
    mov rdi, %1                   ; Formato de cadena
    mov rsi, %2                   ; Valor a imprimir
    xor rax, rax                  ; printf usa rax para el conteo de argumentos flotantes
    call printf
    add rsp, 8
%endmacro

section .data
    vector db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 80, 12, 13, 14, 15, 16, 0, 18, 19, 20
    pos db 0

    msg_max db "Maximo: %d", 10, 0
    msg_min db "Minimo: %d", 10, 0
    msg_avg db "Promedio: %d", 10, 0

section .bss
    total resq 1
    cantidad resq 1
    promedio resq 1

    maximo resq 1
    minimo resq 1

section .text
main:
    mov rax, 0
    mov [total], rax
    mov [cantidad], rax

    ; Inicializa maximo y minimo con el primer elemento del vector
    movzx rbx, byte [vector]
    mov qword [maximo], rbx
    mov qword [minimo], rbx

    mov rcx, 0
    mov rdx, 20

loop_start:
    cmp rcx, rdx
    je fin

    ; Leer el valor del vector
    movzx rbx, byte [vector + rcx]

    ; Sumar al total y cantidad
    add qword [total], rbx
    inc qword [cantidad]

    ; Actualizar maximo
    cmp qword [maximo], rbx
    jl actualizar_max
    jmp verificar_min

actualizar_max:
    mov qword [maximo], rbx

verificar_min:
    cmp qword [minimo], rbx
    jg actualizar_min
    jmp siguiente

actualizar_min:
    mov qword [minimo], rbx

siguiente:
    inc rcx
    jmp loop_start

fin:
    ; Calcular promedio
    mov rax, [total]
    mov rcx, [cantidad]
    xor rdx, rdx
    div rcx
    mov [promedio], rax

    ; Imprimir resultados
    mPrintNum msg_max, qword [maximo]
    mPrintNum msg_min, qword [minimo]
    mPrintNum msg_avg, qword [promedio]

    ret
