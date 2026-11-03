section	.text
    global my_pBin8b           
    global my_pBin16b   
    global my_pBin32b
    global my_pBin34b

my_putchar: pushad                 ; salvar todos los registros
                        push eax              ; salvar EAX -- meter el caracter a la pila
                        mov eax,4            ; seleccionar el tipo llamada al sistema --> write (sys_write)
                        mov ebx,1            ;  seleccionar la salida a pantalla ---> File descriptor 1 - standard output
                        mov ecx,esp        ; ECX debe apuntar a la cadena, en este caso un caracter que está en la pila
                        mov edx,1            ; EDX debe tener la longitud de la cadena, en este caso uno solo caracter
                        int 80h                 ; llamar al sistema (escritura al standard output -- pantalla)
                        pop eax                ; recuperar EXA 
                        popad                  ; recuperar todos los registros
                        ret