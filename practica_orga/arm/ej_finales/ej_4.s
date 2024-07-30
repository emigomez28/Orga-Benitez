@ Codificar un programa en ARM-32 bits que lea desde un archivo de numeros
@ enteros e imprima su sumatoria por salida estandar

.equ SWI_Exit, 0x11
.equ SWI_Print_Int, 0x6B
.equ SWI_Open, 0x66
.equ SWI_Read_Int, 0x6C
.equ SWI_Close, 0x68
.equ SWI_Print_Char, 0x00
.equ SWI_Print_Str, 0x69
.equ Stdout, 1

.data
file: 
   .asciz "numeros.txt"

eol:
   .asciz "\n"

inFileHandle:
    .word 0

sum:
    .word 0

.text
.global _start

_start:
    ldr r0, =file
    mov r1, #0
    swi SWI_Open
    bcs inFileError

    ldr r1, =inFileHandle 
    str r0, [r1]

read_loop:
    ldr r0, =inFileHandle
    ldr r0, [r0]
    swi SWI_Read_Int
    bcs EOF_Reached

    ldr r1, =sum
    ldr r2, [r1]
    add r2, r2, r0
    str r2, [r1]
    b read_loop

inFileError:
    ldr r0, =file
    swi SWI_Print_Str
    ldr r0, =eol
    swi SWI_Print_Str
    swi SWI_Exit

EOF_Reached:
    ldr r0, =Stdout
    ldr r1, =sum
    ldr r1, [r1]
    swi SWI_Print_Int

    ldr r0, =inFileHandle
    ldr r0, [r0]
    swi SWI_Close
    swi SWI_Exit

.end
