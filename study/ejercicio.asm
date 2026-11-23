section .text
    global ClearBitRange
    global CountSetBits

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
    and eax, edx
    ror eax, 1
    inc cl
    cmp bl, cl ; 4 - 1
    jae ciclo
    
    rol eax, cl

    pop ebx
    pop ebp 
    ret




CountSetBits:
    push ebp
    mov ebp, esp
    mov edx, [ebp+8] ; 11111111 11111111 11111111 11111111
    mov eax, 0
    mov ecx, 32
    finCadena:
        shr edx, 1
        jc uno
        jnc nouno
    uno:
        inc eax
    nouno:
        ;dec ecx
    loop finCadena
    pop ebp 
    ret 

; sudo apt update
; sudo apt install gcc-multilib nasm -y
; cd study
; nasm -f elf32 ejercicio.asm -o ejercicio.o
; gcc -m32 -c ej.c -o ej.o
; gcc -m32 ej.o ejercicio.o -o ej
; ./ej