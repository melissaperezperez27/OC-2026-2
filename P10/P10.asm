section	.text
    global pBin8b       
    global pBin16b   
    global pBin32b
    global pBin64b
    global my_putchar

my_putchar:
    pushad                  ; salvar todos los registros
    push eax                ; salvar EAX -- meter el caracter a la pila
    mov eax,4               ; seleccionar el tipo llamada al sistema
    mov ebx,1               ;  seleccionar la salida a pantalla 
    mov ecx,esp             ; ECX debe apuntar a la cadena
    mov edx,1               ; EDX debe tener la longitud de la cadena
    int 80h                 ; llamar al sistema 
    pop eax                 ; recuperar EXA 
    popad                   ; recuperar todos los registros
    ret

pBin8b: 
    push ebp
    mov ebp, esp
    push ebx
    mov bl, [ebp + 8]
    
    mov ecx, 8
    verificarBit8:
        shl bl, 1
        jc imprimirUno
        jnc imprimirCero
            imprimirUno:
                mov al, '1'
                call my_putchar
                jmp fin

            imprimirCero: 
                mov al, '0'
                call my_putchar
                jmp fin
        fin:
        loop verificarBit8
    pop ebx
    pop ebp
    ret


pBin16b: 
    push ebp
    mov ebp, esp
    push ebx
    mov bx, [ebp + 8]   
    mov ecx, 16
    verificarBit16:
        shl bx, 1
        jc imprimirUno16
        jnc imprimirCero16
            imprimirUno16:
                mov al, '1'
                call my_putchar
                jmp fin16
            imprimirCero16: 
                 mov al, '0'
                call my_putchar
                jmp fin16
         fin16:
        loop verificarBit16
    pop ebx
    pop ebp
    ret

pBin32b: 
    push ebp
    mov ebp, esp
    push esi               
    mov esi, [ebp + 8]   
    mov ecx, 32
    verificarBit32:
        shl esi, 1         
        jc imprimirUno32
        jnc imprimirCero32
            imprimirUno32:
                mov al, '1'
                call my_putchar
                jmp fin32
            imprimirCero32: 
                mov al, '0'
                call my_putchar
                jmp fin32
        fin32:
        loop verificarBit32
    pop esi                 
    pop ebp
    ret

pBin64b: 
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, [ebp + 12]     
    mov ebx, [ebp + 8]      

    mov ecx, 32
    verificarBitAlto:
        shl esi, 1
        jc imprimirUnoAlto
        jnc imprimirCeroAlto
            imprimirUnoAlto:
                mov al, '1'
                call my_putchar
                jmp finAlto

            imprimirCeroAlto: 
                mov al, '0'
                call my_putchar
                jmp finAlto
        finAlto:
        loop verificarBitAlto

    mov ecx, 32
    verificarBitBajo:
        shl ebx, 1
        jc imprimirUnoBajo
        jnc imprimirCeroBajo
            imprimirUnoBajo:
                mov al, '1'
                call my_putchar
                jmp finBajo

            imprimirCeroBajo: 
                mov al, '0'
                call my_putchar
                jmp finBajo
        finBajo:
        loop verificarBitBajo
    pop esi                
    pop ebx                 
    pop ebp                 
    ret

; sudo apt update