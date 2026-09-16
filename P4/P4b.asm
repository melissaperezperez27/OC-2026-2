%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ; referencia para inicio de programa
	
_start:                   
	mov edx, msg		; edx = dirección de la cadena msg
	call puts			; imprime la cadena original msg terminada en valor nulo (0)
    
    mov ebx, msg        ; ebx = dirección de la cadena msg
    add ebx, 23         ; se le suma 23 para llegar a 'x'
	mov al, 'X'			; al = Registro con el carácter	
    mov byte [ebx], al 	; cambia 'x' por 'X' utilizando direccionamiento indirecto
    mov edx, msg        ; edx = dirección de la cadena msg
    call puts           ; imprime la cadena modificada msg terminada en valor nulo (0)

	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 

