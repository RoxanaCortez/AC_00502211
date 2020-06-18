org 	100h

section .text

	mov 	dx, msg
	call 	w_strng

	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
	cmp 	al, "$"
	je	promedio
	sub     al,30h
	mov	[300h+si], al ; CS:0300h en adelante
	inc 	si
	jmp 	lupi

promedio:mov     bx, 0h
        mov     ax, 0h
suma:   add     al, [300h+bx]
        inc     bx
        cmp     bx, 05h
        jb      suma
        div     bl

	mov 	dx, nl
	call	w_strng
	cmp	al,1h
	je	frase1
	cmp	al,2h
	je	frase2
	cmp	al,3h
	je	frase3
	cmp	al,4h
	je	frase4
	cmp	al,5h
	je	frase5
	cmp	al,6h
	je	frase6
	cmp	al,7h
	je	frase7
	cmp	al,8h
	je	frase8
	cmp	al,9h
	je	frase9
	cmp	al,10d
	je	frase10

frase1:	mov 	dx, msg1
	jmp	fin

frase2:	mov 	dx, msg2
	jmp	fin

frase3:	mov 	dx, msg3
	jmp	fin

frase4:	mov 	dx, msg4
	jmp	fin

frase5:	mov 	dx, msg5
	jmp	fin

frase6:	mov 	dx, msg6
	jmp	fin

frase7:	mov 	dx, msg7
	jmp	fin

frase8:	mov 	dx, msg8
	jmp	fin

frase9:	mov 	dx, msg9
	jmp	fin

frase10:mov 	dx, msg10
	jmp	fin

fin:	call	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h	

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

section .data

msg 	db 	"Ingrese los 5 ultimos digitos de su carnet: $"
msg1	db 	"Solo necesito el cero $"
msg2	db 	"Aun se pasa $"
msg3	db 	"Hay salud $"
msg4	db 	"Me recupero $"
msg5	db 	"En el segundo $"
msg6	db 	"Peor es nada $"
msg7	db 	"Muy bien $"
msg8	db 	"Colocho $"
msg9	db 	"Siempre me esfuerzo $"
msg10	db 	"Perfecto solo Dios $"
nl	db 	0xA, 0xD, "$"