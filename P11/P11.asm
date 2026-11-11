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

str_mid:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov edi, [ebp + 8]   ; str_out (destino)
    mov esi, [ebp + 12]  ; str1_in (origen)
    mov ecx, [ebp + 16]  ; start (inicio)
    mov edx, [ebp + 20]  ; end (fin)
    
    cmp edx, ecx
    jb no_valido
    sub edx, ecx
    inc edx   

    add esi, ecx
    
    copiarCaracteres:
        mov al, [esi]       
        test al, al          
        jz terminar_cadena   
        mov [edi], al
        inc esi
        inc edi
        dec edx 
        jnz copiarCaracteres

    terminar_cadena:
        mov byte [edi], 0

    no_valido:
        pop edi
        pop esi
        pop ebx
    
        mov esp, ebp
        pop ebp
        ret

clrBit:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8] ; value
    mov ecx, [ebp + 12] ; nbit
    mov edx, 1
    shl edx, cl
    xor edx, 0xffffffff
    and eax, edx
    pop ebp
    ret

; sudo apt update

; sudo apt install gcc-multilib nasm -y
; cd P10
; nasm -f elf32 P11.asm -o P11.o
; gcc -m32 -c test_p11.c -o test_p11.o
; gcc -m32 test_p11.o P11.o -o test_p11
; ./test_p11
