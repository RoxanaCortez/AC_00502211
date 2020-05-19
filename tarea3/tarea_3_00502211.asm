org 	100h

section .text
	call	setear
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
	mov 	dx, di 		;columna
	mov 	dh, [202h] 	;fila ------ dh tendrá lo que hay en esa dirección
	mov 	bh, 0h		;por lo que ese será el número de la fila donde iniciará cada fila de la frase
	int 	10h
	ret

setear:	mov	al, 1d		; quiero que incicie en en la fila 1
	mov	[202h], al	; 1d es movido a dirección 202h
	mov	ax, 0d
	ret

salto:	mov	[200h], ax	; lo que esta en ax es movido a la dirección 200h
	mov	ax, 7d		; ax toma el valor de 7d
	add	[202h], ax	; a lo que viene en la direccón 202h le sumamos lo que trae ax
	mov	ax, [202h]	; y finalmente guardamos lo que hay en ax a la dirccioón 200h
	ret

primera:mov 	di, 10d
conta1: mov 	cl, [msg1+di-10d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	conta1		;Cuando termine de ejerutarse conta 1 (la primera frase), mandará a llamar
	call	salto		; a salto 
	ret

segunda:mov 	di, 35d
conta2:	mov 	cl, [msg2+di-35d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	conta2
	call	salto
	ret

tercera:mov 	di, 10d
conta3:	mov 	cl, [msg3+di-10d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	conta3
	call	salto
	ret

cuarta:	mov 	di, 55d
conta4:	mov 	cl, [msg4+di-55d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len4
	jb	conta4
	call	salto	
	ret

section .data
msg1	db 	"SI ERES HUMILDE NADA TE TOCARA"
len1 	equ	$-msg1+10d
msg2	db	"NI LA ALABANZA NI LA DESGRACIA"
len2	equ	$-msg2+35d
msg3 	db	"POR QUE SABES LO QUE ERES" 
len3	equ	$-msg3+10d
msg4 	db	"Madre Teresa de Calcuta" 
len4	equ	$-msg4+55d