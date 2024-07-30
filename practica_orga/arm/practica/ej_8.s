.equ SWI_Print_String, 0x02
.equ SWI_Open_File, 0x66
.equ SWI_Read_Int, 0x6C
.equ SWI_Print_Int, 0x6B
.equ SWI_Close_File, 0x68
.equ SWI_Exit, 0x11
.equ SWI_Print_Char, 0x00
.equ Stdout, 1

    .data
filename:
    .asciz "min_y_max.txt"

min_header:
    .asciz "Min: "

max_header:
    .asciz "Max: "

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
    mov r2, r0
    bl read_int
    mov r3, r0

    cmp r2, r3
    blt print_result

    mov r1, r2
    mov r2, r3
    mov r3, r1

print_result:
    ldr r0, =Stdout
    ldr r1, =min_header
    swi SWI_Print_String
    mov r1, r2
    bl print_r1_int


    ldr r0, =Stdout
    ldr r1, =max_header
    swi SWI_Print_String
    mov r1, r3
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
    ldmfd sp!, {pc}

inFileError:
EOFReached:
exit:
    swi SWI_Exit
    .end
