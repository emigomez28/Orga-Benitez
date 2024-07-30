.data

numero_1:
    .word 0x00000001

numero_2:
    .word 0x00000002

.text
.global _start 

suma:
    stmfd sp!, {r0, lr}

    add r2, r0, r1

    ldmfd sp!, {r0, pc}

resta:
    stmfd sp!, {r0, lr}

    sub r3, r0, r1

    ldmfd sp!, {r0, pc}

multiplicar:

    stmfd sp!, {r0, lr}

    mul r4, r0, r1

    ldmfd sp!, {r0, pc}

and:
    
    stmfd sp!, {r0, lr}

    and r5, r0, r1

    ldmfd sp!, {r0, pc}

or:

    stmfd sp!, {r0, lr}

    orr r6, r0, r1

    ldmfd sp!, {r0, pc}
xor:

    stmfd sp!, {r0, lr}

    eor r7, r0, r1

    ldmfd sp!, {r0, pc}

shiftIzquierda:

    stmfd sp!, {r0, lr}
    mov r8, r0, lsl #1

    ldmfd sp!, {r0, pc}

shiftDerecha:

    stmfd sp!, {r0, lr}
    mov r9, r0, lsr #1

    ldmfd sp!, {r0, pc}
shiftDerechaAritmetica:

    stmfd sp!, {r0, lr}
    mov r10, r0, asr #1

    ldmfd sp!, {r0, pc}
_start:
    ldr r0, =numero_1
    ldr r1, =numero_2

    bl suma
    bl resta
    bl multiplicar
    bl and
    bl or
    bl xor
    bl shiftIzquierda
    bl shiftDerecha
    bl shiftDerechaAritmetica

    .end

