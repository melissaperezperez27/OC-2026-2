section	.text
    global suma
    global mystrcmp
    global mystrlen
    global getBit
    global setBit

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

        pop edi
        pop esi
        pop ebp
        ret
               
    


	     
	


