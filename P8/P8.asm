%include "../LIB/pc_iox.inc"

section .text
    extern getche
    extern puts
    extern putchar
    global _start

section	.data
    N db 5
    vectorA db 0, 0, 0, 0, 0
    vectorB db 0, 0, 0, 0, 0

    

_start:

    ;call capturarVector
    
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    
capturarVector:
    push ebx 
    mov ebp, esp
    mov ecx, N
    mov esi, 0

    pedir_vector: 
        push ecx
        call getche              
        pop ecx
        mov [ebx+esi], al   
        inc esi                 
    loop pedir_vector
    ret
    
desplegarVector
    push ebx 
    mov ebp, esp
    mov ecx, N
    mov esi, 0

    imprimir_arreglo: 
        mov al, [ebx+esi] 
        push ecx
        call putchar            
        mov eax, 0x0A       
        call putchar            
        pop ecx
        inc esi                 
    loop imprimir_arreglo
ret


