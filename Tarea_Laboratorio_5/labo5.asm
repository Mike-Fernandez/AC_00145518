org 100h

    section .text
    XOR AX, AX
    XOR DI, DI
    XOR DX, DX

    MOV DI, 0d
    MOV DH, 10
    MOV word [200h], nombre1

    CALL modotexto
    
    CALL placeCursor
    CALL writeWord
    INC DI
    MOV word [200h], nombre2   

    CALL placeCursor
    CALL writeWord
    INC DI
    MOV word [200h], apellido1 

    CALL placeCursor
    CALL writeWord
    INC DI
    MOV word [200h], apellido2

    CALL placeCursor
    CALL writeWord

    CALL waitInput
    CALL exit

    modotexto: 
        MOV AH, 0h 
        MOV AL, 03h 
        INT 10h
        RET

    placeCursor:
        MOV AH, 02h 
        MOV DH, [posiciones+DI]
        MOV DL, 20 
        MOV BH, 0h 
        INT 10h
        RET

    writeWord: 
        MOV AH, 09h 
        MOV DX, [200h]
        INT 21h
        RET

    waitInput:
        MOV AH, 00h 
        INT 16h
        RET

    exit:
        int 20h

section .data
    nombre1 DB "Miguel $"
    nombre2 DB "Enrique $"
    apellido1 DB "Fernandez $"
    apellido2 DB "Azucena $"
    posiciones DB 10,12,14,16
