%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:
    mov eax, 0x336699BB

    ; nasm -f elf prueba1.asm 
    ; ld -m elf_i386 -o Practicar prueba1.o ../LIB/pbin.o ../LIB/libpc_iox.a
    ;./Practicar
    mov ebx, 0                  
    mov eax, 1                  
    int 0x80                    
