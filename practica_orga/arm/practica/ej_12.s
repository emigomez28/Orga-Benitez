.equ SWI_Open_File, 0x66
.equ SWI_Read_Int, 0x6C
.equ SWI_Print_Int, 0x6B
.equ SWI_Close_File, 0x68
.equ SWI_Exit, 0x11
.equ SWI_Print_Char, 0x00
.equ SWI_Print_String, 0x69
.equ Stdout, 1

    .data
filename:
    .asciz "factorial.txt"

eol:
    .asciz "\n"
    .align

inFileHandle:
    .word 0

    .text
    .global _start

_start:
    ldr r0, =filename
    mov r1, #0
    swi SWI_Open_File
    bcs inFileError
    ldr r1, =inFileHandle
    str r0, [r1]

    bl read_int

    mov r1, #1

factorial:
    cmp r0, #0
    beq factorialEnd

    mul r1, r0, r1

    bl print_r1_int

    sub r0, r0, #1

    b factorial

factorialEnd:
    bl print_r1_int
    b exit

read_int:
    stmfd sp!, {lr}
    ldr r0, =inFileHandle
    ldr r0, [r0]
    swi SWI_Read_Int
    ldmfd sp!, {pc}

print_r1_int:
    stmfd sp!, {r0, r1, lr}
    ldr r0, =Stdout
    swi SWI_Print_Int
    ldr r1, =eol
    swi SWI_Print_String
    ldmfd sp!, {r0, r1, pc}

inFileError:
exit:
    swi SWI_Exit
    .end
    

