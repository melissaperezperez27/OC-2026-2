%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point


	mov ebx, 0x5C4B2A60     ; inciso a
    add ebx, 0x02228661
    mov eax, ebx
    call pHex_dw
    mov eax, 1

    push bx                 ; inciso b
    mov eax, 1
                            
    inc N
    call pHex_dw
    mov eax, 1

    mov al, cl               ; inciso c
    mov cl, 8
    mul cl
    mov [N], cl 
    call pHex_dw
    mov eax, 1



    ; mov edx, 0xFF
    ; div bx

    ; pop bx 

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

section	.data
N db 0
