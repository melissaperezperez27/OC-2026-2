%include "../LIB/pc_iox.inc"

section .text
    extern pBin_dw
    extern pBin_b
    extern pBin_w

    global _start

_start:
    mov eax, 0x22446688
    call pBin_dw
    mov ebx, eax

    mov eax, 10
    call putchar

    mov eax, ebx
    ror eax, 4
    call pBin_dw

    mov eax, 10
    call putchar

    mov cx, 0x3F48 ; 0011 1111 0100 1000
    mov ax, cx
    call pBin_w

    mov eax, 10
    call putchar
    ;                 1111 1010 0100 0000
    ;  0xFA40         1111 1010 0100 0000
    shl cx, 3
    mov ax, cx
    call pBin_w

    mov eax, 10
    call putchar

    mov esi, 0x20D685F3 ; 0010-0000-1101-0110-1000-0101-1111-0011
    xor esi, 0x40042021 ; 0100-0000-0000-0100-0010-0000-0010-0001 
                        ; 
    mov eax, esi
    call pBin_dw

    mov eax, 10
    call putchar

    push esi

    mov ch, 0xA7 ; 1010-0111
    or ch, 0x48  ; 0100-1000
    mov al, ch
    call pBin_b
    mov eax, 10
    call putchar


    mov bp, 0x67DA ; 0110-0111-1101-1010
                   ; 0100-0100-0101-0010
                   ; 1011-1011-1010-1101
    ;and bp, 0x4452
    and bp, 0xBBAD
    mov ax, bp
    call pBin_w
    mov eax, 10
    call putchar

    shr bp, 3
    mov ax, bp
    call pBin_w
    mov eax, 10
    call putchar

    shr ebx, 5
    mov eax, ebx
    call pBin_dw
    mov eax, 10
    call putchar

    shl cx, 3
    mov ax, cx
    call pBin_w
    mov eax, 10
    call putchar

    pop esi
    mov eax, esi
    call pBin_dw
    mov eax, 10
    call putchar

    mov eax, esi
    mov ebx, esi
    shl eax, 3
    shl ebx, 1
    add eax, ebx
    call pBin_dw
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