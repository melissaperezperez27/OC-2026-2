%include "../LIB/pc_iox.inc"

section .text
    extern getche
    extern puts
    extern putchar
    global _start

section	.data
    N db 5
    vectorA db 0, 0, 0


_start:

    mov ecx, N
    mov esi, 0

    pedir_arreglo: 
        push ecx
        call getche             ; pide un valor
        pop ecx
        mov [vectorA+esi], al   ; cambia de posición y guarda en el arreglo
        inc esi                 ; incrementa 1
    loop pedir_arreglo

    mov eax, 0x0A
    call 
    
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    
