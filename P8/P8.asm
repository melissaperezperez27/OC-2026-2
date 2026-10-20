%include "../LIB/pc_iox.inc"

section .text
    extern getche
    extern puts
    extern putchar
    global _start

section	.data
    N db 5

section .bss
    vectorA: resb N
    vectorB: resb N
_start:

    ;call capturarVector
    

    ;imprimir_arreglo: 
    ;    mov al, [arreglo_D+esi] ; al = un valor del arreglo
    ;    push ecx
    ;    call putchar            ; imprime un valor del arreglo
    ;    mov eax, 0x0A       
    ;    call putchar            ; imprime salto de linea
    ;    pop ecx
    ;    inc esi                 ; incrementa 1
    ;loop imprimir_arreglo
    
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    
;capturarVector:
    ;mov ecx, N
    ;mov esi, 0

    ;pedir_vector: 
        ;push ecx
        ;call getche             ; pide un valor
        ;pop ecx
        ;mov [vectorA+esi], al   ; cambia de posición y guarda en el arreglo
        ;inc esi                 ; incrementa 1
    ;loop pedir_vector