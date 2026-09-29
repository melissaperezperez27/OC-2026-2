%include "../LIB/pc_io.inc"

section .text

    global _start

_start:
    ; --- Inciso a ---
    
    mov eax, 0x0A               ; Salto de linea
    call putchar                ; Imprime el salto de línea

    ; --- Inciso b ---
    push bx                     ; Parte baja de 16 bits (BX) a la pila
    
    ; --- Inciso c ---
  
    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso D ---

    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso E ---
 
    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso F ---

    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso G ---
  
    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso H ---
   
    mov eax, 0x0A               ; Salto de línea
    call putchar                ; Imprime salto de línea

    
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
