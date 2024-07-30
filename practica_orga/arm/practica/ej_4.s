.data

filename:
    .asciz "mi_archivo.txt"
    .align

inFileHandle:
    .word 0


.text
.global _start

inFileError:
    .end

_start:

    ldr r0, =filename
    mov r1, #0
    swi 0x66
    bcs inFileError
    ldr r1, =inFileHandle
    str r0, [r1]

    ldr r0, =inFileHandle
    ldr r0, [r0]
    swi 0x6c

    ldr r0, =inFileHandle
    ldr r0, [r0]
    swi 0x68

    mov r0, #1
    mov r1, r2
    swi 0x6b
    .end



