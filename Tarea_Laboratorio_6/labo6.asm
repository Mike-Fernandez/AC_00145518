org 100h

section .text

    call modoTexto

    MOV DX, msg1
    call writeWord

    MOV BP, input
    call readWord

;    call validate

    

success:
    MOV DX, welcome
    call writeWord
    call waitInput
    int 20h

end:
    MOV DX, failed
    call writeWord
    int 20h

modoTexto:
    mov     AH, 00h
    mov     AL, 03h
    int     10h
    ret

waitInput:
    mov     AH, 01h         
    int     21h
    ret

;validate:
;    XOR SI, SI
;check:
;    cmp [BP+SI], [clave + SI]
;    jne end
;    ret

countClave:
    XOR DI, DI
check:
    cmp byte [clave+DI], "$"
    je validate
    INC DI
    call check

;countInput:
;    XOR DI, DI
;    cmp byte [input+DI], "$"
;    je validate
;    INC DI

validate:
    cmp DI, SI
    jne end
    je success

writeWord:
	mov 	AH, 09h
	int 	21h
	ret

readWord:
    xor     SI, SI
while:  
    call    waitInput
    cmp     AL, 0x0D
    je      exit
    cmp     AL, [clave + SI]
    jne     end
    mov     [BP+SI], AL
    inc     SI
    jmp while
exit:
	mov 	byte [BP+SI], "$"
    call    countClave

section .data
    msg1 db "Ingrese la clave ", "$"
    welcome db "Clave correcta, bienvenido usuario", "$"
    failed db "Clave incorrecta, intente de nuevo", "$"
    clave db "root", "$"
    input times 20 db " "
