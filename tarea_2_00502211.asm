	org	100h

	mov	cx,5d	; cx guardara el numero de digitos
	mov	ax,1d	; ax tiene el valor del primer numero
	mov	bx,1d	; bx tiene el valor del segundo numero
	add	ax,bx	; ax guardara la suma de los primeros dos numeros
	mov	bx,2d	; bx se setea con el valor del tercer numero
	add	ax,bx	; ax nuevamente guaradara la suma de los primeros 2 numeros mas el tercero
	mov	bx,2d	; bx se setea nuevamente con el valor del 4 numero
	add	ax,bx	; ax volvera a tener el resultado de los 4 primeros numeros
	mov	bx,0d	; bx se vuelve a setear con el valor del quinto numero
	add	ax,bx	; ax guardara la suma total de los 5 numeros
	div	cx	; dividere en valor de ax(suma de los 5 numeros)/cx(cantidad de numeros), el resultado se guardara en ax y su residuo en dx

	mov	bx,1d
	cmp	ax,bx
	jz 	frase1

frase1: 
section	.text
	mov	cx,0d
	mov	di,0d
	mov	cx,len

contador: mov	bl,[comnt+di]
	mov	[di+200h],bl
	inc	di		
	cmp	di,cx
	jbe	contador

		
	int 	20h

section	.data
comnt	db	"Solo necesito el 0"
len	equ	$-comnt