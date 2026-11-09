%include "../LIB/pc_iox.inc"

section .bss
    ;arreglo resb 6
    vectorA resb 5
    vectorB resb 5

section .data
    msg_pedir db "Pedir vector: ", 10, 0
    msg_imprimir db "Vector: ", 10, 0
    msg_menor db "Es menor", 10, 0
    msg_mayor db "Es mayor", 10, 0
    msg_invalido db "Es invalido", 10, 0
    N equ 5

section .text
    extern getche
	global _start

_start:
    mov edx, msg_pedir
    call puts
    mov ebx, vectorA
    mov ecx, N
    call pedir_vector
    mov eax, 10
    call putchar
    mov edx, msg_imprimir
    call puts
    mov ebx, vectorA
    mov ecx, N
    call imprimir_vector

    ;mov cx, 4
    ;mov bx, 1
    ;renglones:
    ;    push cx
    ;    mov cx, bx
    ;    mov dx, 49
    ;    push dx
    ;    numeros:
    ;        push bx
    ;        mov ax, dx
    ;        call putchar
    ;        pop bx
    ;        inc dx
    ;        loop numeros
    ;    mov eax, 10
    ;    call putchar
    ;    pop dx
    ;    pop cx
    ;    inc bx
    ;    loop renglones

    ;mov cx, 5
    ;mov bx, 5
    ;renglon:
    ;    push cx
    ;    mov cx, bx
    ;    mov dx, 'A'
    ;    push dx
    ;    letras:
    ;        mov ax, dx
    ;        call putchar
    ;        inc dx
    ;        loop letras
    ;    mov eax, 10
    ;   
    ;    call putchar
    ;    dec bx
    ;    pop dx
    ;
    ;    pop cx
    ;    loop renglon

    ;mov ecx, 6
    ;mov esi, 0
    ;pedir_vector:
    ;    call getche
    ;    mov [arreglo+esi], eax
    ;    inc esi
    ;    mov eax, 10
    ;    call putchar
    ;    loop pedir_vector

    ;mov ecx, 6
    ;mov esi, 5
    ;imprimir_vector:
    ;    mov eax, [arreglo+esi]
    ;    call putchar
    ;    mov eax, 10
    ;    call putchar
    ;    dec esi
    ;    loop imprimir_vector


    mov ebx, 0
    mov eax, 1
    int 0x80


pedir_vector:
    push ebx
    push ecx
    mov esi, 0
    pedir:  
        call getche
        cmp al, '0' ;al-0
        jb invalido
        cmp al, '9'
        ja invalido
        mov [ebx+esi], eax
        inc esi


        loop pedir

    pop ecx
    pop ebx
    ret

    invalido:
        jmp pedir_vector
    
    imprimir_vector:
        push ebx
        push ecx
        mov esi, 0
        imprimir:
            mov eax, [ebx+esi]
            call putchar
            mov eax, 10
            call putchar
            inc esi
            loop imprimir

        pop ecx
        pop ebx

; sudo apt-get update
; sudo apt-get install nasm
; nasm -f elf PE.asm
; ld -m elf_i386 -o E7 E7.o ../LIB/libpc_iox.a
; ./PE
    
