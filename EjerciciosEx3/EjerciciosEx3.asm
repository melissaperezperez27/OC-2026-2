section .text
    global NotBit32b
    global XchgBits

NotBit32b:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov cl, [ebp+12]
    ror eax, cl
    xor eax, 1
    rol eax, cl 
    pop ebp
    ret



; sudo apt update

; sudo apt install gcc-multilib nasm -y
; cd P10
; nasm -f elf32 EjerciciosEx3.asm -o EjerciciosEx3.o
; gcc -m32 -c EEx3.c -o EEx3.o
; gcc -m32 EEx3.o EjerciciosEx3.o -o EEx3
; ./EEx3

