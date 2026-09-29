%include "../LIB/pc_iox.inc"

section .text

    global _start

_start:
    ; --- Inciso a ---
    mov ebx, 0x5C4B2A60         ; Carga valor 0x5C4B2A60 en EBX
    add ebx, 0x02228661         ; Suma el valor de la matrícula a EBX
    mov eax, ebx                ; Copia el resultado a EAX para imprimir
    call pHex_dw                ; Imprime EAX
    mov eax, 0x0A               ; Salto de linea
    call putchar                ; Imprime el salto de línea

    ; --- Inciso b ---
    push bx                     ; Parte baja de 16 bits (BX) a la pila
    
    ; --- Inciso c ---
    mov al, bl                  ; Carga BL en AL
    mov cl, 8                   ; Carga el multiplicador (8)
    mul cl                      ; AX = AL * CL
    mov [N], ax                 ; Guarda el resultado en la variable N
    call pHex_dw                ; Imprime AX
    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso D ---
    mov ax, [N]                 ; Carga N en AX
    inc ax                      ; Incrementa en 1 el valor de AX
    mov [N], ax                 ; Carga AX en N
    call pHex_dw                ; Imprime AX
    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso E ---
    mov ax, bx                  ; Carga BX en AX
    mov cl, 0xFF                ; Carga 0xFF en CL
    div cl                      ; AX = AX / CL
    call pHex_b                 ; Imprime AL (Cociente)
    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea
    mov al, ah                  ; Carga AH en AL
    call pHex_b                 ; Imprime AL (Residuo)
    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso F ---
    mov ah, 0                   ; Limpia AH
    add ax, [N]                 ; AX = AX + N
    call pHex_w                 ; Imprime AX (suma)
    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea


    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    

section .data
    N dw 0                      ; Variable N (16 bits)