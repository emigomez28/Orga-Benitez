@ Codificar un programa en ARM-32 bits que recorra un vector de enteros y
@ genere un nuevo vector formado por los elementos que resultan de sumar
@ pares de elementos del vector original. EJ: {1, 2, 5, 6} -> {3, 11}

.equ SWI_Print_Int, 0x6B
.equ SWI_Exit, 0x11
.equ SWI_Print_String, 0x69
.equ Stdout, 1

.data

array_origen: .word 1, 2, 5, 6
array_destino: .word 0, 0
array_length: .word 4

eol:
    .ascii "\n"

.text
.global _start

_start:
    ldr r0, =array_origen
    ldr r1, =array_destino
    ldr r2, =array_length
    
    ldr r2, [r2]

loop_suma:
    ldr r4, [r0]
    add r0, r0, #4
    sub r2, r2, #1
    ldr r5, [r0]
    add r6, r4, r5
    str r6, [r1]

    add r0, r0, #4
    add r1, r1, #4
    sub r2, r2, #1
    cmp r2, #0
    bne loop_suma

    ldr r2, =array_destino
    ldr r3, =array_length
    ldr r3, [r3]

loop_mostrar:
    cmp r3, #0
    beq exit
    ldr r0, =Stdout
    ldr r1, [r2]
    swi SWI_Print_Int
    ldr r1, =eol
    swi SWI_Print_String
    add r2, r2, #4
    sub r3, r3, #1
    b loop_mostrar

exit:
    swi SWI_Exit
    .end

