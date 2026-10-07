%include "../LIB/pc_iox.inc"

section .text

    global _start
    extern getche
    extern puts
    extern putchar
    
section	.data
    msg_A1	db  'El carácter es menor', 0xa, 0 
    msg_A2	db  'El carácter es mayor o igual', 0xa, 0 

    msg_B1	db  'El carácter es un número', 0xa, 0 
    msg_B2	db  'El carácter es una letra', 0xa, 0 
    msg_B3	db  'El carácter no es ninguno', 0xa, 
    
    msg_C1	db  '*', 0xa, 0

    arreglo_D db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  

_start:
    ; *** Inciso a ***
    call getche
    cmp al, 'm'
    jb es_menor
    jae es_mayor_o_igual

es_menor:
    mov eax, 0x0A               ; salto de linea  
    call putchar                ; imprime salto de linea
    mov edx, msg_A1		; edx = dirección de la cadena msg
    call puts
    jmp inciso_b

es_mayor_o_igual: 
    mov eax, 0x0A               ; salto de linea  
    call putchar                ; imprime salto de linea
    mov edx, msg_A2		; edx = dirección de la cadena msg
	call puts
    jmp inciso_b

    ; *** inciso b *** 

inciso_b: 
    call getche
    jmp evaluar_numero

evaluar_numero: 
    cmp al, '0'     ; al - 48  48-48 49-48 
    jb evaluar_letra   ; Saltar si es menor
    cmp al, '9'     ; al - 57 
    ja evaluar_letra    ; saltar si es mayor
    mov eax, 0x0A               ; salto de linea  
    call putchar                ; imprime salto de linea
    mov edx, msg_B1
    call puts
    jmp inciso_c

evaluar_letra: 
    cmp al, 'A'     ; al - 65 
    jb no_es_ninguno   ; Saltar si es menor
    cmp al, 'Z'     ; al - 90 
    ja no_es_ninguno    ; saltar si es mayor
    mov eax, 0x0A               ; salto de linea  
    call putchar                ; imprime salto de linea
    mov edx, msg_B2
    call puts
    jmp inciso_c

no_es_ninguno:
    mov eax, 0x0A               ; salto de linea  
    call putchar                ; imprime salto de linea
    mov edx, msg_B3
    call puts
    jmp inciso_c 

    ; *** Inciso C *** 

inciso_c:
    mov ecx, 5          ; Tamaño N del triángulo
    mov ebx, 1          ; Cantidad inicial de asteriscos

    ; parte superior
parte_superior:
    push ecx            
    mov ecx, ebx        

imprimir_asterisco_sup:
    push ebx
    mov eax, '*'
    call putchar 
    pop ebx
    loop imprimir_asterisco_sup

    mov eax, 0x0A       ; Salto de línea al terminar el renglón
    call putchar

    pop ecx             
    inc ebx             ; Aumenta asteriscos para la siguiente línea
    loop parte_superior

    ; parte inferior
    pop ecx             
    mov ecx, 4          
    sub ebx, 2          

parte_inferior:
    push ecx            
    mov ecx, ebx        

imprimir_asterisco_inf:
    push ebx
    mov eax, '*'
    call putchar
    pop ebx
    loop imprimir_asterisco_inf

    mov eax, 0x0A       ; Salto de línea
    call putchar

    pop ecx             
    dec ebx             ; Resta asteriscos para la siguiente línea
    loop parte_inferior

; *** Inciso D *** 
    
    mov ecx, 10
    mov esi, 0

    pedir_arreglo: 
        push ecx
        call getche
        pop ecx
        mov [arreglo_D+esi], al
        inc esi
    loop pedir_arreglo
    
    mov ecx, 10
    mov esi, 0

    imprimir_arreglo: 
        mov al, [arreglo_D+esi]
        push ecx
        call putchar
        mov eax, 0x0A       ; Salto de línea
        call putchar
        pop ecx
        inc esi
    loop imprimir_arreglo

fin:
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    
