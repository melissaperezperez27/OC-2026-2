section .text
    global ClearBitRange

ClearBitRange:
    push ebp 
    mov ebp, esp 
    push ebx
    
    mov eax, [ebp+8] ; num 
    mov cl, [ebp+12] ; inicio 1
    mov bl, [ebp+16] ; fin 4

    mov edx, 1 ; 0001
    not edx     ; 1110

    ror eax, cl ; 11111111 11111111 11111111 11111111
   
    ciclo:
    cmp bl, cl ; 4 - 1
    je salir

    
    and eax, edx
    inc cl
    ror eax, 1
    jmp ciclo

    salir:
    mov cl, bl
    rol eax, cl

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