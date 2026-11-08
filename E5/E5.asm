%include "../LIB/pc_iox.inc"
section .bss
    M resw 1
section .text
    global _start

_start:
    mov ebx, 0x4A3B2C1D
    add ebx, 0x11111111
    mov eax, ebx
    call pHex_dw

    mov eax, 10
    call putchar

    push bx

    mov eax, 0
    mov al, bl
    mov cl, 4
    mul cl
    mov [M], ax
    call pHex_w

    mov eax, 10
    call putchar

    mov eax, 0
    mov ax, [M]
    dec ax
    mov [M], ax
    call pHex_w

    mov eax, 10
    call putchar

    mov eax, 0
    pop cx
    mov ax, cx
    call pHex_w

    mov eax, 10
    call putchar

    mov ebx, 0
    mov eax, 1
    int 0x80
