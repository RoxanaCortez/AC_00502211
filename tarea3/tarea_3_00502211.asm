org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	primera
	call 	segunda
	call	tercera
	call	cuarta
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, [202h] ; fila
	mov 	bh, 0h
	int 	10h
	ret

primera:mov 	di, 0d
conta1: mov 	cl, [msg1+di-0d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	conta1
	ret

segunda:mov 	di, 25d
conta2:	mov 	cl, [msg2+di-25d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	conta2
	ret

tercera:mov 	di, 50d
conta3:	mov 	cl, [msg3+di-50d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	conta3
	ret

cuarta:	mov 	di, 55d
conta4:	mov 	cl, [msg4+di-55d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len4
	jb	conta4
	ret

section .data
msg1	db 	"SI ERES HUMILDE NADA TE TOCARA"
len1 	equ	$-msg1+0d
msg2	db	"NI LA ALABANZA NI LA DESGRACIA"
len2	equ	$-msg2+25d
msg3 	db	"POR QUE SABES LO QUE ERES" 
len3	equ	$-msg3+50d
msg4 	db	"Madre Teresa de Calcuta" 
len4	equ	$-msg4+55d