%include "../LIB/pc_iox.inc"

section .bss
    n resw 1

section .text
    global _start


_start:
    mov ebx, 0x5C4B2A6
    add ebx, 0x02228661
    mov eax, ebx
    call pHex_dw
    mov eax, 0
    mov eax, 10
    call putchar

    push bx

    
    mov al, bl
    mov cl, 8
    mul cl
    mov [n], ax
    mov eax, 0
    mov ax, [n]
    call pHex_dw
    mov eax, 10
    call putchar

    mov ax, [n]
    inc ax
    mov [n], ax
    mov eax, 0
    mov ax, [n]
    call pHex_dw
    mov eax, 10
    call putchar

    mov cl, 0xFF
    mov ax, bx
    div cl
    mov ebx, 0
    mov bl, al
    mov bh, ah
    mov al, bl
    call pHex_dw
    mov ebx, eax
    mov eax, 10
    call putchar
    mov al, bh
    call pHex_dw





    mov ebx, 0
    mov eax, 1
    int 0x80