%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

	mov ebx, 0x5C4B2A60 
    add ebx, 0x2228661

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

