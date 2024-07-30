.equ SWI_Print_Int, 0x6B
.equ SWI_Exit, 0x11
.equ SWI_Print_String, 0x69
.equ Stdout, 1

    .data

array_origen:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

array_destino:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

eol:
    .asciz "\n"
    .align 

constante:
    .word 10

array_length:
    .word 10

    .text
    .global _start

_start:
    ldr r0, =array_origen
    ldr r1, =array_destino
    ldr r2, =array_length
    ldr r2, [r2]
    ldr r3, =constante
    ldr r3, [r3]

loop_suma:
    ldr r4, [r0]
    add r4, r4, r3
    str r4, [r1]
    bl mostrar_suma
    add r0, r0, #4
    add r1, r1, #4
    subs r2, r2, #1
    cmp r2, #0
    bne loop_suma
    b exit

mostar_suma:
    stmfd sp!, {r0-r4, lr}
    ldr r0, =Stdout
    swi SWI_Print_Int
    ldr r0, =eol
    swi SWI_Print_String
    ldmfd sp!, {r0-r4, pc}

exit:
    swi SWI_Exit
    .end

