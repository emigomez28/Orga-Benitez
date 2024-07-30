global main
extern puts

section .data
    fff db "("
    des db 14
    val2 db "Z9"
    val3 db 0

section .bss
    mat resb 500

section .text
main:
    lea rbx, [mat]
    mov cl, [fff]
;ssi:
;    add ax, [rbx + rdi]
;    add dil, [des]
;    loop ssi

otra_rutina: 
    
    
    mov ah, al
    add ah, 1
    mov [des], ax
    mov rdi, des
    sub rsp, 8
    call puts
    add rsp, 8
