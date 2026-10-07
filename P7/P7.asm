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
  

_start:
    ; --- Inciso a ---
    call getche
    cmp al, 'm'
    jb es_menor
    jae es_mayor_o_igual

    es_menor:
        mov edx, msg_A1		; edx = dirección de la cadena msg
	    call puts
        mov eax, 0x0A               ; salto de linea  
        call putchar                ; imprime salto de linea
        jmp fin

    es_mayor_o_igual: 
        mov edx, msg_A2		; edx = dirección de la cadena msg
	    call puts
        mov eax, 0x0A               ; salto de linea  
        call putchar                ; imprime salto de linea
        jmp fin

    ; --- inciso b --- 


    fin:

        mov ebx, 0                  
        mov eax, 1                  
        int 0x80                    
    
