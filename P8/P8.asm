%include "../LIB/pc_iox.inc"

section .text
    extern getche
    extern puts
    extern putchar
    global _start

section .bss
    vectorA resb 5
    vectorB resb 5

section	.data
    N equ 5

_start:

    mov ebx, vectorA 
    mov ecx, N
    call capturarVector
    
    mov eax, 0x0A
    call putchar 

    mov ebx, vectorB 
    mov ecx, N
    call capturarVector

    mov eax, 0x0A
    call putchar 

    mov ebx, vectorA
    mov ecx, N
    call desplegarVector

    mov eax, 0x0A
    call putchar
    
    mov ebx, vectorB
    mov ecx, N
    call desplegarVector

    mov eax, 0x0A
    call putchar

    mov ebx, vectorA
    mov edx, vectorB
    mov ecx, N
    call sumaVectores

    mov eax, 0x0A
    call putchar

    mov ebx, vectorA
    mov ecx, N
    call desplegarVector


    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    
capturarVector:
    push eax
    push ebx
    push ecx
    mov esi, 0

    pedir_vector:
        push ecx
        push ebx
        call getche            
        pop ebx
        pop ecx

        sub al, 48
        jc invalido
        cmp al, 9
        ja invalido
        
        mov [ebx+esi], al 
        inc esi                 
    loop pedir_vector
    pop ecx            
    pop ebx
    pop eax
    ret

    invalido:
        jmp pedir_vector

    
desplegarVector:
    push ebx
    push ecx
    mov esi, 0

    imprimir_arreglo: 
        push ecx
        push ebx
        mov al, [ebx+esi] 
        add al, 48
        call putchar            
        pop ebx
        pop ecx
        inc esi                 
    loop imprimir_arreglo
    pop ecx
    pop ebx
    ret

sumaVectores:
    push eax
    push ebx 
    push edx
    push ecx
    mov esi, 0
    suma_vector: 
        mov al, [ebx+esi]
        add al, [edx+esi]
        mov [ebx+esi], al
        inc esi                 
    loop suma_vector
    pop ecx
    pop edx
    pop ebx
    pop eax
    ret 

