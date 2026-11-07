%include "../LIB/pc_iox.inc"
 
section .text
    global _start


_start:
    mov byte [cadena], '#'
    mov edx, cadena
	call puts
	
    mov eax, 1
    int 0x80

section .data 
    cadena db "0123456789abcdefghijklmnopqrstuvwxyz", 0xA, 0

 ; sudo apt-get update
 ; sudo apt-get install nasm
 ; cd E4
 ; nasm -f elf E4.asm
 ; ld -m elf_i386 -o E4 E4.o ../LIB/libpc_io.a
 ; ./E4

