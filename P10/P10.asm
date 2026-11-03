section	.text
    global pBin8b       
    global pBin16b   
    global pBin32b
    global pBin34b
    global my_putchar

pBin8b:
    
    push ebp
    mov ebp, esp
    mov al, [ebp + 8]
    
    mov ecx, 7
    verificarBit8:
        shl al, 1
        cmp al, 1
        jc imprimirUno
        jnc imprimirCero


            imprimirUno:
                mov bl, '1'
                call my_putchar
                jmp fin

            imprimirCero: 
                mov bl, '0'
                call my_putchar
                jmp fin

        fin:
        loop verificarBit8
    pop esp
    pop ebp
    ret


my_putchar:
    pushad                 ; salvar todos los registros
    push eax              ; salvar EAX -- meter el caracter a la pila
    mov eax,4            ; seleccionar el tipo llamada al sistema --> write (sys_write)
    mov ebx,1            ;  seleccionar la salida a pantalla ---> File descriptor 1 - standard output
    mov ecx,esp        ; ECX debe apuntar a la cadena, en este caso un caracter que está en la pila
    mov edx,1            ; EDX debe tener la longitud de la cadena, en este caso uno solo caracter
    int 80h                 ; llamar al sistema (escritura al standard output -- pantalla)
    pop eax                ; recuperar EXA 
    popad                  ; recuperar todos los registros
    ret