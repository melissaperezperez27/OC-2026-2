%include "../LIB/pc_iox.inc"

section .text

    global _start
    extern getche
    extern puts
    extern putchar
    
section	.data
    msg_A	db  'Inciso A', 0xa, 0 
    msg_A1	db  'El carácter es menor', 0xa, 0 
    msg_A2	db  'El carácter es mayor o igual', 0xa, 0 

    msg_B	db  'Inciso B', 0xa, 0 
    msg_B1	db  'El carácter es un número', 0xa, 0 
    msg_B2	db  'El carácter es una letra', 0xa, 0 
    msg_B3	db  'El carácter no es ninguno', 0xa, 0
    
    msg_C	db  'Inciso C', 0xa, 0 
    msg_C1	db  '*', 0xa, 0

    msg_D	db  'Inciso D', 0xa, 0 
    arreglo_D db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    msg_D1 db 'Datos capturados:', 0xa, 0
  
_start:
    ; *** Inciso a ***
    mov edx, msg_A		
	call puts                   ; imprime el mensaje msg_A

    call getche                 ; lee un carácter
    cmp al, 'm'                 ; al - 'm'
    jb es_menor                 ; salta si es menor 
    jae es_mayor_o_igual        ; salta si es mayor o igual

es_menor:
    mov eax, 0x0A                 
    call putchar                ; imprime salto de linea
    mov edx, msg_A1		        
    call puts                   ; imprime el mensaje msg_A1
    jmp inciso_b                

es_mayor_o_igual: 
    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov edx, msg_A2		
	call puts                   ; imprime el mensaje msg_A2
    jmp inciso_b


    ; *** inciso b *** 
inciso_b: 
    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov edx, msg_B		
	call puts                   ; imprime el mensaje msg_B
    call getche                 ; lee un carácter
    jmp evaluar_numero          ; salta a la etiqueta evaluar_numero

evaluar_numero: 
    cmp al, '0'                 ; al - 48
    jb evaluar_letra            ; salta si es menor
    cmp al, '9'                 ; al - 57 
    ja evaluar_letra            ; saltar si es mayor
    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov edx, msg_B1
    call puts                   ; imprime el mensaje msg_B1
    jmp inciso_c

evaluar_letra: 
    cmp al, 'A'                 ; al - 65 
    jb no_es_ninguno            ; salta si es menor
    cmp al, 'Z'                 ; al - 90 
    ja no_es_ninguno            ; salta si es mayor
    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov edx, msg_B2             
    call puts                   ; imprime el mensaje msg_B2
    jmp inciso_c

no_es_ninguno:
    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov edx, msg_B3
    call puts                   ; imprime el mensaje msg_B3
    jmp inciso_c 


    ; *** Inciso C *** 
inciso_c:
    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov edx, msg_C		
	call puts                   ; imprime el mensaje msg_C
    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov ecx, 5                  ; tamaño del triángulo
    mov ebx, 1                  ; cantidad inicial de asteriscos

parte_superior:                 ; inicio de la parte superior
    push ecx            
    mov ecx, ebx        

imprimir_asterisco_sup:
    push ebx
    mov eax, '*'                ; eax = '*'
    call putchar                ; imprime asterisco
    pop ebx
    loop imprimir_asterisco_sup

    mov eax, 0x0A               ; salto de línea al terminar el renglón
    call putchar

    pop ecx             
    inc ebx                     ; aumenta asteriscos para la siguiente línea
    loop parte_superior
 
    mov ecx, 4                  ; inicio de la parte inferior
    sub ebx, 2                  ; ebx = ebx -2

parte_inferior:
    push ecx            
    mov ecx, ebx        

imprimir_asterisco_inf:
    push ebx
    mov eax, '*'                ; eax = '*'
    call putchar                ; imprime asterisco
    pop ebx
    loop imprimir_asterisco_inf

    mov eax, 0x0A       
    call putchar                ; imprime salto de línea

    pop ecx             
    dec ebx                     ; resta asteriscos para la siguiente línea
    loop parte_inferior

    ; *** Inciso D *** 
    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov edx, msg_D		
	call puts                   ; imprime el mensaje msg_D
    
    mov ecx, 10
    mov esi, 0

    pedir_arreglo: 
        push ecx
        call getche             ; pide un valor
        pop ecx
        mov [arreglo_D+esi], al ; cambia de posición y guarda en el arreglo
        inc esi                 ; incrementa 1
    loop pedir_arreglo

    mov ecx, 10
    mov esi, 0

    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov edx, msg_D1	        
    call puts                   ; imprime mensaje

    imprimir_arreglo: 
        mov al, [arreglo_D+esi] ; al = un valor del arreglo
        push ecx
        call putchar            ; imprime un valor del arreglo
        mov eax, 0x0A       
        call putchar            ; imprime salto de linea
        pop ecx
        inc esi                 ; incrementa 1
    loop imprimir_arreglo

    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    
