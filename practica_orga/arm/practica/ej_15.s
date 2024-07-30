.equ SWI_Exit, 0x11
.equ SWI_Print_Int, 0x6B
.equ Stdout, 1

    .data

entero_1:
    .word 28

    .text
    .global _start

_start:
    ldr r0, =entero_1
    ldr r1, =Stdout
    swi SWI_Print_Int

    mov r1, #5
    str r1, [r0]

    ldr r1, =Stdout
    swi SWI_Print_Int

exit:
    swi SWI_Exit
    .end


