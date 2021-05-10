org 100h

section .text

	XOR DI, DI
	XOR CX, CX
	XOR AX, AX
	MOV word CX, 8d
	CALL sumar
	CALL avg
	CALL exit

sumar:
	ADD AL, [carnet+DI]
	INC DI
	LOOP sumar

avg:
	MOV BX, 8d
	DIV BX
	MOV [20Ah], AL

exit:
	int 20h

section .data
	carnet DB 0,0,1,4,5,5,1,8
