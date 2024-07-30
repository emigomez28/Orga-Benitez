@ Escribir un programa que imprima 4 mensajes en pantalla utilizando una
@ rutina interna

.equ SWI_Exit, 0x11

.equ SWI_Print_Str, 0x02

.data

mensaje1: 
    
    .asciz "Hola Mundo!\n"

mensaje2:

    .asciz "Hola Mundo 2!\n"

mensaje3:
    
    .asciz "Hola Mundo 3!\n"

mensaje4:
    
    .asciz "Hola Mundo 4!\n"


.text

.global _start

_start:

    ldr r0, =mensaje1

    bl  imprimir_cadena 

    ldr r0, =mensaje2

    bl  imprimir_cadena 
    
    ldr r0, =mensaje3

    bl  imprimir_cadena 

    ldr r0, =mensaje4

    bl  imprimir_cadena 

    swi SWI_Exit

imprimir_cadena:
    swi SWI_Print_Str
    mov pc, lr 
