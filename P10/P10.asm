section	.text
    global pBin8b       
    global pBin16b   
    global pBin32b
    global pBin34b
    global my_putchar

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

;pBin8b: 
;    push ebp
;    mov ebp, esp
;    push ebx
;    mov bl, [ebp + 8]
    
;    mov ecx, 8
;    verificarBit8:
;        shl bl, 1
;        jc imprimirUno
;        jnc imprimirCero
;            imprimirUno:
;                mov al, '1'
;                call my_putchar
;                jmp fin

;            imprimirCero: 
;                mov al, '0'
;                call my_putchar
;                jmp fin

;        fin:
;        loop verificarBit8
;    pop ebx
;    pop esp
;    pop ebp

;    ret

; pBin16b: 
;    push ebp
;    mov ebp, esp
;    mov bx, [ebp + 12]   
;    mov ecx, 16
;    verificarBit16:
;        shl bx, 1
;        jc imprimirUno16
;        jnc imprimirCero16
;            imprimirUno16:
;                mov al, '1'
;                call my_putchar
;                jmp fin16
;            imprimirCero16: 
;                 mov al, '0'
;                call my_putchar
;                jmp fin16
;         fin16:
;        loop verificarBit16
;    pop esp
;    pop ebp
;    ret

;pBin32b: 
;    push ebp
;    mov ebp, esp
;    mov ebx, [ebp + 8]   
;    mov ecx, 32
;    verificarBit32:
;        shl ebx, 1
;        jc imprimirUno32
;        jnc imprimirCero32
;            imprimirUno32:
;                mov al, '1'
;                call my_putchar
;                jmp fin32
;            imprimirCero32: 
;                 mov al, '0'
;                call my_putchar
;                jmp fin32
;         fin32:
;        loop verificarBit32
;    pop esp
;    pop ebp
;    ret

pBin64b: 
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8]
    mov edx, [ebp + 12]     
    mov ecx, 64
    verificarBit64:
        shl ebx, 1
        jc imprimirUno64
        jnc imprimirCero64
            imprimirUno64:
                mov al, '1'
                call my_putchar
                jmp fin64
            imprimirCero64: 
                 mov al, '0'
                call my_putchar
                jmp fin64
         fin64:
        loop verificarBit64
    pop esp
    pop ebp
    ret

