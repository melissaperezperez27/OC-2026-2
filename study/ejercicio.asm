section .text
    global ClearBitRange

ClearBitRange:

    push ebp 
    mov ebp, esp 
    push ebx

    mov eax, [ebp+8] ; num 
    mov ecx, [ebp+12] ; inicio
    mov ebx, [ebp+16] ; fin

    ciclo:
    
    ror eax, ecx
    mov edx, 1
    not edx
    and eax, edx
    inc ecx 
    jmp ciclo

    salir:
    pop ebx
    pop ebp 
    ret

; sudo apt update
; sudo apt install gcc-multilib nasm -y
; cd study
; nasm -f elf32 ejercicio.asm -o ejercicio.o
; gcc -m32 -c ej.c -o ej.o
; gcc -m32 ej.o ejercicios.o -o ej
; ./ej