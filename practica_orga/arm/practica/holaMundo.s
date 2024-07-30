.data

cadena:
    .asciz "Hola Mundo\n"
    .text
    .global _start

_start:
    ldr r0, =cadena
    swi 0x02
    .end
