%include "../LIB/pc_iox.inc"

section .text

    global _start
    extern pBin_dw    
    extern pBin_w      
    extern pBin_b

_start:
    ; --- Inciso a ---
    mov eax, 0x22446688         ; eax = 0x22446688
    ror eax, 4                  ; mueve 4 bits = 1 hex a la derecha
    call pBin_dw                ; imprime en binario
    mov eax, 0x0A               ; salto de linea  
    call putchar                ; imprime salto de linea

   
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    