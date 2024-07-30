global	main
extern	printf

section	.data
	msjSal		db	'Elemento guardado en fila %li columna %li: %hi',10,13,0

	;matriz		times 9 dw 2
	matriz		dw	11,12,13,14
				dw	21,22,23,24
				dw	31,32,33,34
                dw  41,42,43,44

	LONG_ELEM	equ	2
	CANT_FIL	equ	4
	CANT_COL	equ	4

	fil			dq  4	
	col			dq	4

section		.text

main:
	sub		rsp,8

	mov		rax,[fil]			;rax = fila
	dec		rax						;fila-1
	imul	rax,LONG_ELEM	;(fila-1) * longElem
	imul	rax,CANT_COL	;(fila-1) * longElem * cantCol = (fila-1) * longFila

	mov		rbx,rax				;rbx = desplazamiento en fila
	
	mov		rax,[col]			;rax = columna
	dec		rax						;columna-1
	imul	rax,LONG_ELEM	;(columna-1) * longElem

	add		rbx,rax				;rbx = desplazamiento total

	mov		rdi,msjSal
	mov		rsi,[fil]
	mov		rdx,[col]
	sub		rcx,rcx ;<instruccion> <de donde>,<a donde mando>
	mov		cx,word[matriz+rbx]
	call	printf

	add		rsp,8
	ret
