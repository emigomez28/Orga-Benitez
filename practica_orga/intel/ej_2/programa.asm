global main
extern printf
extern gets

section .data
    msgSalida        db `Ingrese * para salir \n`,0  
    msgPedirNombre   db 'Ingrese su Nombre: ',0
    msgPedirApellido db 'Ingrese su Apellido: ',0
    msgPedirPadron   db 'Ingrese su número de padrón: ',0  
    msgPedirEdad     db 'Ingrese su edad: ',0
    msgCompleto      db `El alumno %s %s de padron %s tiene %s años\n`,20,20,20,20,0   

section .bss
    Nombre     resb 20
    Apellido   resb 20  
    Padron     resb 20   
    Edad       resb 20   

section .text              
main:
    sub              rsp,8
    mov              rdi,msgSalida
    call             printf

ingreseNombre:
    mov         rdi,msgPedirNombre
    call        printf
    mov         rdi,Nombre
    call        gets

    cmp         byte[Nombre],'*'
    je          fin


ingreseApellido:
    mov         rdi,msgPedirApellido
    call        printf
    mov         rdi,Apellido
    call        gets

    cmp         byte[Apellido],'*'
    je          fin


ingresePadron:
    mov         rdi,msgPedirPadron
    call        printf
    mov         rdi,Padron
    call        gets

    cmp         byte[Padron],'*'
    je          fin


ingreseEdad:
    mov         rdi,msgPedirEdad
    call        printf
    mov         rdi,Edad
    call        gets

    cmp         byte[Edad],'*'
    je          fin

mensajeFinal:
    mov         rsi,Nombre
    mov         rdx,Apellido
    mov         rcx,Padron
    mov         r8,Edad
    mov         rdi,msgCompleto     
    
    call        printf

fin:
    add         rsp,8
    ret
