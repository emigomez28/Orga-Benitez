.equ SWI_Open_File, 0x66
.equ SWI_Read_Int, 0x6C
.equ Stdout, 1
.equ SWI_Print_Int, 0x6B
.equ SWI_Exit, 0x11
.equ SWI_Close_File, 0x68

    .data
filename:
    .asciz "valor_abs.txt"

    .text
    .global _start

_start:
    @ Cargo el handler en el r5

    ldr r0, =filename 
    mov r1, #0
    swi SWI_Open_File
    mov r5, r0

    @ Cargo el valor en el r2
    swi SWI_Read_Int
    mov r2, r0

    @ Cierro el archivo
    mov r0, r5
    swi SWI_Close_File

    cmp r2, #0


    mov r3, #0
    submi r2, r3, r2
    

    @ Mostrar el entero

    mov r0, =Stdout
    mov r1, r2
    swi SWI_Print_Int

    swi SWI_Exit
    .end
