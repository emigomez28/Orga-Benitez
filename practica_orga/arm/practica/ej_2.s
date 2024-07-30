.data

hola:
    .asciz "Hola\n"

chau:
    .asciz "Chau\n"

otroString:
    .asciz "Otro string\n"

.text
.global _start

print_otro_string:
    stmfd sp!, {r0, lr}

    mov r0, r3
    swi 0x02
    
    ldmfd sp!, {r0, pc}

_start:
    ldr r3, =hola
    bl print_otro_string

    ldr r3, =chau
    bl print_otro_string
    
    .end

    
