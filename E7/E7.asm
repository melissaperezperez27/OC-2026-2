%include "../LIB/pc_iox.inc"

;section .bss
;    arreglo resw 10
section .text
    extern getche
	global _start

_start:
    ;mov cx, 4
    ;mov bx, 1
    ;renglones:
    ;    push cx
    ;    mov cx, bx
    ;    mov dx, 49
    ;    push dx
    ;    numeros:
    ;        push bx
    ;        mov ax, dx
    ;        call putchar
    ;        pop bx
    ;        inc dx
    ;        loop numeros
    ;    mov eax, 10
    ;    call putchar
    ;    pop dx
    ;    pop cx
    ;    inc bx
    ;    loop renglones

    mov cx, 5
    mov bx, 5
    renglon:
        push cx
        mov cx, bx
        mov dx, 'A'
        push dx
        letras:
            mov ax, dx
            call putchar
            inc ax
            loop letras
        mov eax, 10
        call putchar
        pop dx
        pop cx
        loop renglon


    mov ebx, 0
    mov eax, 1
    int 0x80


; sudo apt-get update
; sudo apt-get install nasm
; nasm -f elf PE.asm
; ld -m elf_i386 -o E7 E7.o ../LIB/libpc_iox.a
; ./PE
    