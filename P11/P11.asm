section .text
    global str_len
    global str_mid
    global clrBit

str_len:
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, [ebp + 8]
    mov esi, 0
    @@calcularLongitud:
        inc esi
        cmp byte [ebx+esi], 0
        jne @@calcularLongitud
    mov eax, esi
    pop ebx
    pop ebp
    ret

;str_mid:
;    push ebp
;    mov ebp, esp
;    push ebx
;    mov ebx, [ebp + 8] ; salida 
;    mov edx, [ebp + 12] ; entrada
;    mov cl, [ebp + 16] ; inicio 5
;    mov ch, [ebp + 20] ; fin 9
;    cmp ch, cl 
;    jb no_valido
;    mov 
;    sub ch, cl
;    mov cl, al
;    copiarCaracteres:
;        mov ah, [edx+esi]
;        mov [ebx+esi], ah
;        inc esi
;        loop copiarCaracteres
;    pop ebx
;    pop ebp
;    mov eax, edx
;    ret    
;no_valido:
;    pop ebx
;    pop ebp
;    ret




; sudo apt update

; sudo apt install gcc-multilib nasm -y
; cd P10
; nasm -f elf32 P11.asm -o P11.o
; gcc -m32 -c test_p11.c -o test_p11.o
; gcc -m32 test_p11.o P11.o -o test_p11
; ./test_p11
