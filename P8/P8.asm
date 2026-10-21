%include "../LIB/pc_iox.inc"

section .text
    extern getche
    extern puts
    extern putchar
    extern pHex_dw
    global _start

section .bss
    vectorA resb 5
    vectorB resb 5

section	.data
    N equ 5
    msjSuma db "Suma de vectores: ", 0
    msjProd db "Producto escalar: ", 0

_start:

    mov ebx, vectorA 
    mov ecx, N
    call capturarVector             ;  llamada a la función capturarVector para el vector A
    
    mov eax, 0x0A
    call putchar                    ; Salto de línea

    mov ebx, vectorB 
    mov ecx, N
    call capturarVector             ;  llamada a la función capturarVector para el vector B

    mov eax, 0x0A
    call putchar                    ; Salto de línea

    mov ebx, vectorA
    mov ecx, N
    call desplegarVector            ; imprime vector A

    mov eax, 0x0A
    call putchar                    ; imprime salto de línea
    
    mov ebx, vectorB
    mov ecx, N
    call desplegarVector            ; imprime vector B

    mov eax, 0x0A                   
    call putchar                    ; imprime salto de línea

    mov edx, msjProd                ; mensaje producto escalar de vectores    
    call puts
    mov eax, 0x0A
    call putchar                    ; Salto de línea
    mov ebx, vectorA
    mov edx, vectorB
    mov ecx, N
    call productoEscalarVectores    ; llamada a la función productoEscalarVectores
    call pHex_dw

    mov eax, 0x0A                   
    call putchar                    ; Salto de línea

    mov edx, msjSuma                ; mensaje suma de vectores    
    call puts   
    mov eax, 0x0A
    call putchar                    ; imprime salto de línea
    mov ebx, vectorA
    mov edx, vectorB
    mov ecx, N
    call sumaVectores               ; llamada a la función sumaVectores



    mov ebx, vectorA
    mov ecx, N
    call desplegarVector            ; llamada a la función desplegarVector 

    mov eax, 0x0A
    call putchar                    ; imprime salto de línea


    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    
capturarVector:                     ; función capturarVector
    push eax
    push ebx
    push ecx
    mov esi, 0

    pedir_vector:                   ; ciclo para pedir el vector
        push ecx
        push ebx
        call getche            
        pop ebx
        pop ecx

        sub al, 48                  ; validación
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
    
desplegarVector:                    ; función desplegarVector
    push ebx
    push ecx
    mov esi, 0

    imprimir_arreglo:               ; ciclo para imprimir el arreglo
        push ecx
        push ebx
        xor eax, eax          
        mov al, [ebx+esi]
        call pHex_dw          
        mov eax, ' '
        call putchar
        pop ebx
        pop ecx
        inc esi                 
    loop imprimir_arreglo
    pop ecx
    pop ebx
    ret

sumaVectores:                       ; función sumaVectores
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

productoEscalarVectores:            ; función productoEscalarVectores              
    push ebx 
    push edx
    push ecx
    push esi
    push edi
    
    xor edi, edi
    mov esi, 0
    producto: 
        xor eax, eax
        mov al, [ebx+esi]      
        mul byte [edx+esi]      
        add edi, eax            
        inc esi                 
    loop producto         
    mov eax, edi
    pop edi
    pop esi
    pop ecx
    pop edx
    pop ebx
    ret 
