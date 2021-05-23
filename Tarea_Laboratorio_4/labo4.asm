org 100h

section .text

	XOR DI, DI
	XOR CX, CX
    XOR BX, BX
	MOV BL, 2d
    CALL check
    CALL exit

check:
    XOR AX, AX
    MOV AL, [nums + DI]
    DIV BL
    CMP AH, 0d
    JE par
    JNE impar

exit:
    int 20h

par:
    XOR SI, SI
    MOV SI, [pares]
    MOV CH, [nums+DI]
    MOV [300h+SI], CH
    INC SI
    MOV [pares] , SI
    JMP afterlogic

impar:
    XOR SI, SI
    MOV SI, [impares]
    MOV CH, [nums+DI]
    MOV [320h+SI], CH
    INC SI
    MOV [impares], SI
    JMP afterlogic

afterlogic:
    INC DI
    CMP DI, 10d
    JNE check
    RET


section .data
	nums DB 6,5,1,4,5,5,1,8,7,2
    pares dw 0h
    impares dw 0h