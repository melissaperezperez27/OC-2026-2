%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point


	mov ebx, 0x5C4B2A60     ; inciso a
    add ebx, 0x02228661
    mov eax, ebx
    call pHex_dw
    

    ; push bx                 ; inciso b
                            ; inciso c
    ; inc N
    ; call pHex_dw

    ; mov al, cl               ; inciso c
    ; mov cl, 8
    ; mult 



    ; mov edx, 0xFF
    ; div bx

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

section	.data
N db 0
