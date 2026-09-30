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
    mov eax, 0x0A               ; salto de linea  
    call putchar                ; imprime salto de linea
   
    ; --- Inciso c ---
    mov esi, 0x20D685F3         ; esi = 0x20D685F3 = 0010-0000-1101-0110-1000-0101-1111-0011
    xor esi, 0x40042021         ;       0x40042021 = 0100-0000-0000-0100-0010-0000-0010-0001
    mov eax, esi                ; eax = esi
    call pBin_dw                ; imprime eax 
    mov eax, 0x0A               ; salto de linea  
    call putchar                ; imprime salto de linea

    ; --- Inciso d ---
    push esi                    ; guarda en valor de esi en la pila

    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    