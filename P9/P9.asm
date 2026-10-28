section	.text
    global suma             ; int suma(int num1, int num2)
    global mystrcmp         ; int mystrcmp(char *str1, char *str2)
    global mystrlen         ; int mystrlen(char *str);
    global getBit           ; int getBit(int value, int numbit);
    global setBit           ; int setBit(int value, int numbit);

suma:                       ; int suma(int num1, int num2)
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]      ; num1
    add eax, [ebp + 12]     ; eax = num1 + num2
    pop ebp
    ret

mystrcmp:                   ; int mystrcmp(char *str1, char *str2)
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx

    mov esi, [ebp + 8]      ; str1
    mov edi, [ebp + 12]     ; str2

    comprobar: 
        mov al, [esi]  
        mov bl, [edi]    
        cmp al, bl
        jne diferentes
        cmp al, 0
        je iguales
        inc esi
        inc edi
        jmp comprobar 

    diferentes:
        mov eax, 1
        jmp fin
        
    iguales:
        mov eax, 0
        jmp fin

    fin:
        pop ebx
        pop edi
        pop esi
        pop ebp
        ret
               
mystrlen:                   ; int mystrlen(char *str);
    push ebp
    mov ebp, esp
    push esi

    mov esi, [ebp + 8]      ; str1
    xor eax, eax

    contar: 
        mov cl, [esi]  
        cmp cl, 0
        je finc
        inc esi
        inc eax
        jmp contar 

    finc:
        pop esi
        pop ebp
        ret


getBit:                     ; int getBit(int value, int numbit);
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]      ; value
    mov ecx, [ebp + 12]     ; numbit
    shr eax, cl 
    and eax, 1
    pop ebp
    ret

setBit:                     ; int setBit(int value, int numbit);
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]      ; value
    mov ecx, [ebp + 12]     ; numbit
    mov edx, 1
    shl edx, cl
    or eax, edx
    pop ebp
    ret