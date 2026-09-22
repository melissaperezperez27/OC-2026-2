%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point


	mov ebx, 0x5C4B2A60     ; inciso a
    add ebx, 0x02228661
    mov eax, ebx
    call pHex_dw
    

    push bx                 ; inciso b
 
    call pHex_dw
                            
    inc word [N] 
    call pHex_dw
    mov eax, 1

    mov al, cl               ; inciso c
    mov cl, 8
    mul cl
    mov [N], cl 

    movzx eax, word [N]


    ; mov edx, 0xFF
    ; div bx

    ; pop bx 


	mov eax, 1
	int 0x80       

section	.data
N db 0
salto db 0
