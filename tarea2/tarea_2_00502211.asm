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

frase1: 		;leyendo la frase dinamicamente
section	.text
	mov	cx,0d
	mov	di,0d
	mov	cx,len

contador: mov	bl,[comnt+di]
	mov	[di+200h],bl
	inc	di		
	cmp	di,cx
	jbe	contador
	
	jmp	ejercicio2	;llamamos directamente el ejercicio 2 asi que visualizaremos el resultado cuando se terminen de ejecutar los 3

section	.data
comnt	db	"Solo necesito el 0"
len	equ	$-comnt

ejercicio2:  		;inicialilzando las celdas
	
	mov	di,0d
	mov	ax,2d
	mov 	bx,2d
	mov 	di,0d
	mov	cx,0d

;a partir del numero 256 se ocuparan dos cedas por lo tanto tenememos dos casos
; el primero es para cuando todavia el ah este vacio y el otro para cuando ah ya tenga un elemento dentro
; esto ocurre tambien para el ejercicio 2 :)
;caso 1 numeros menores o igual a 255
simulacion: mul     bx	 
        mov     [210h+di],ax
        inc     cx
	inc 	di
	cmp     cx,11d
        jz      terminado
        cmp     ax,255d
	jbe	simulacion
	call 	simulacion2
;caso 2 numeros mayores a 255
simulacion2:                          
        mul     bx
        inc     di
        mov     [210h+di],ax
        inc     cx
	inc     di
        cmp     cx,11d
        jz      terminado
        call    simulacion2

terminado: jmp	ejercicio3

ejercicio3:
	mov	di,0h

	mov	ax,0d
	mov	[220h],ax
	mov	bx,1d
	mov	[221h],bx
;primer caso con numeros menores o igual a 255
serie:	add	ax,bx
	mov	[222h+di],ax
	mov 	cx,bx
	mov	bx,ax
	mov	ax,cx
	inc	di
	cmp	di,13d
	jz	salida
	cmp	ax,255d
	jbe	serie
	call 	serie2
;caso 2: dos celdas numeros mayores a 255
serie2: add	ax,bx
	inc	di
	mov	[222h+di],ax
	mov 	cx,bx
	mov	bx,ax
	mov	ax,cx
	inc	di
	cmp	di,13d
	jz	salida
	loop	serie2	

salida: int 	20h