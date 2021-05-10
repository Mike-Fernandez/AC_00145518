org 100h

section .text

    XOR AX, AX
    XOR DI, DI
    XOR CX, CX
    MOV AX, 1d
    MOV BL, 5d
    JMP factorial

factorial:
    MUL BL
    DEC BL
    CMP BL, 0d
    JZ exit
    JNZ factorial

exit: 
    MOV [20Bh], AX
    int 20h