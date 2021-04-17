	org	100h

	section .text

	mov	byte [200h], "M"
	mov	byte [201h], "E"
	mov	byte [202h], "F"
	mov	byte [203h], "A"

	; Direccionamiento directo 
	mov	AL, [200h]
	; Direccionamiento indirecto por registro
	mov	BX, 201h
	mov	CL, [BX]
	; Direccionamiento indirecto base mas indice
	mov	SI, 1h
	mov	DL, [BX+SI]
	;Direccionamiento relativo por registro
	mov	DI, [BX+2h]

	int 20h