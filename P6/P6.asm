%include "../LIB/pc_io.inc"

section .text

    global _start

_start:
    ; --- Inciso a ---
    mov eax, 0x22446688
    ROR eax, 2
    ;call pBin_dw 
    mov eax, 0x0A               
    call putchar  

    ; --- Inciso b ---
    ;mov cx, 0x3F48
    ;mov bl, 2
    ;shl cx, cl
    ;call pBin_w
    ;mov eax, 0x0A               
    ;call putchar 

    ; --- Inciso c ---
    ;mov esi, 0x20D685F3 ;0010 0000 1101 0110 1000 0101 1111
    ;xor esi, 0xFF  
    
    ; --- Inciso d ---
    ;push esi

    ; --- Inciso e --- 
    ;mov ch, 0xA7 
    ;mov al, 001001000b
    ;or ch, al
    ;mov al, 0
    ;mov al, ch
    ;call pBin_w
    ;mov eax, 0x0A               
    ;call putchar 

    ; --- Inciso f ---
    mov bp, 0x67DA
    


    ; ---
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    

