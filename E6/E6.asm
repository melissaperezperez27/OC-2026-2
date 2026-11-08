%include "../LIB/pc_iox.inc"

section .text
    extern pBin_dw

    global _start

_start:
    mov eax, 0x22446688
    call pHex_dw
    mov ebx, eax

    mov eax, 10
    call putchar

    mov eax, ebx
    ror eax, 4
    call pHex_dw

    mov eax, 10
    call putchar

    mov cx, 0x3F48 ; 0011 1111 0100 1000
    mov ax, cx
    call pHex_w

    mov eax, 10
    call putchar
    ;                 1111 1010 0100 0000
    ;  0xFA40         1111 1010 0100 0000
    shl cx, 3
    mov ax, cx
    call pHex_w

    mov eax, 10
    call putchar

    ;0001
    ;0010
    ;0011
    ;0100
    ;0101
    ;0110
    ;0111
    ;1000
    ;1001  
    ;1010   A
    ;1011   B
    ;1100   C
    ;1101   D
    ;1110   E
    ;1111   F





    mov ebx, 0
    mov eax, 1
    int 0x80