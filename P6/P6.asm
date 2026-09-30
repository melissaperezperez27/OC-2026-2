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

    ; --- Inciso b ---
    mov cx, 0x3F48              ; cx = 0x3F48 = 0011-1111-0100-1000
    shl cx, 3                   ; se recorren 3 bits a la izquierda
    mov ax, cx                  ; ax = cx
    call pBin_w                 ; imprime ax = 0xFA40 = 1111-1010-0100-0000
    mov eax, 0x0A               
    call putchar 
   
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    