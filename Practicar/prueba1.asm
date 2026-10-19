%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:
    mov eax, 0x336699BB
    
 
   

    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
