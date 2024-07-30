@ Codificar un programa en ARM-32 bits que imprima por salida estandar los
@ elementos de un array pares junto con el mensaje "PAR".


.equ SWI_Print_Int, 0x6B
.equ SWI_Exit, 0x11
.equ SWI_Print_Str, 0x69
.equ Stdout, 1

.data
array: 

    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

array_size: 

    .word 10

eol:

    .asciz "\n"

par:
    .asciz "PAR"

.text
.global _start

_start:
    ldr r0, =array
    ldr r2, =array_size
    ldr r2, [r2]

loop:
    ldr r4, [r0] 
    bl imprimir
    add r0, r0, #4
    subs r2, r2, #1
    cmp r2, #0
    bne loop
    b exit

imprimir:
    stmfd sp!, {r0, r1, lr}
    ldr r0, =Stdout
    mov r1, r4
    swi SWI_Print_Int
    and r5, r4, #1 
    cmp r5, #0
    bne impSig
    ldr r1, =par
    swi SWI_Print_Str
impSig:
    ldr r1, =eol
    swi SWI_Print_Str
    ldmfd sp!, {r0, r1, pc}

exit:
    swi SWI_Exit
    .end
