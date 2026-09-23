%include "../LIB/pc_iox.inc"    ; incluir declaraciones de procedimiento externos

section	.text

	global _start               ; referencia para inicio de programa

_start:                     
    ; Inciso a
	mov ebx, 0x5C4B2A60         ; ebx = 0x5C4B2A60                                                      
    add ebx, 0x02228661         ; ebx = ebx + 0x02228661
    mov eax, ebx                ; eax = ebx
    call pHex_dw                ; mostrar en pantalla
    mov eax, 0x0a               ; 
    call putchar

    mov ebx, 0
	mov eax, 1
	int 0x80       


