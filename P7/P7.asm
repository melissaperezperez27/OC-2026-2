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
    jmp fin                

es_mayor_o_igual: 
    mov eax, 0x0A               
    call putchar                ; imprime salto de linea
    mov edx, msg_A2		
	call puts                   ; imprime el mensaje msg_A2
    jmp fin


fin:
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
    
