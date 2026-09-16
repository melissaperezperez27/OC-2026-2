%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ; referencia para inicio de programa
	
_start:                   
	mov edx, msg		; edx = dirección de la cadena msg
	call puts			; imprime la cadena original msg terminada en valor nulo (0)
    
    mov ebx, msg        ; ebx = registro base (inicio de la cadena)
    mov ecx, 25         ; ecx = registro índice (posición de la letra 'z')
	mov al, 'Z'			; al = registro con el carácter
    mov byte [ebx+ecx], al	; cambia 'z' por 'Z' utilizando direccionamiento base más índice 
    mov edx, msg        ; edx = dirección de la cadena msg
    call puts           ; imprime la cadena modificada msg terminada en valor nulo (0)
    
	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 