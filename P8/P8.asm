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

   
    
    ;mov ebx, vectorA
    call capturarVector
    
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    
capturarVector:
    mov ecx, [N]
    mov esi, 0

    pedir_vector:

        ;mov eax, ecx    
        ;call pHex_dw
        push ecx
        call getche              
        pop ecx
        mov [vectorA+esi], al   
        inc esi                 
    loop pedir_vector

    mov esp, ebp       
    pop ebp
    ret
    
;desplegarVector
    push ebx 
    mov ebp, esp
    ;mov ecx, N
    ;mov esi, 0

    ;imprimir_arreglo: 
    ;    mov al, [arreglo_D+esi] 
    ;    push ecx
    ;    call putchar            
    ;    mov eax, 0x0A       
    ;    call putchar            
    ;    pop ecx
    ;    inc esi                 
    ;loop imprimir_arreglo
;ret

;sumaVectores:
;    push ebx 
;    mov ebp, esp
;    mov ecx, N
;    mov esi, 0
;
;    suma_vector: 
;        mov al, [vectorA+esi] 
;        mov bl, [vectorB+esi] 
;        add al, bl
;        mov [vectorA+esi], al
;        push ecx
;        call putchar            
;        mov eax, 0x0A       
;        call putchar            
;        pop ecx
;        inc esi                 
;    loop suma_vector
;    ret 

