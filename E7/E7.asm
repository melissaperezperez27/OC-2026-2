%include "../LIB/pc_iox.inc"

;section .bss
;    arreglo resw 10
section .text
    extern getche
	global _start

_start:
        mov cx, 8
        mov bx, 1

        parte_alta:
            push cx
            mov cx, bx
            imprimir:
                push bx
                mov ax, '*'
                call putchar
                pop bx
                loop imprimir
            mov eax, 10
            call putchar
            pop cx
            inc bx
            loop parte_alta

        mov cx, 7
        mov bx, 7
        parte_baja:
            push cx
            mov cx, bx
            imprimir2:
                push bx
                mov al, '*'
                call putchar
                pop bx
            loop imprimir2
            mov eax, 10
            call putchar
            pop cx
            dec bx

        loop parte_baja



        mov eax, 10
        call putchar

        mov ecx, 10
        mov ebx, 0
        pedir_arreglo:
            call getche ; al
            mov [arreglo+ebx], eax
            mov eax, 10
            call putchar
            inc ebx
            loop pedir_arreglo

        mov edx, msg_datos
        call puts
        mov eax, 10
        call putchar
        mov ecx, 10
        mov ebx, 0
        mov eax, 0
        imprimir_arreglo:
            mov eax, [arreglo+ebx]
            call putchar
            mov eax, 10
            call putchar
            inc ebx
            loop imprimir_arreglo
            

	    mov ebx, 0
	    mov eax, 1
	    int 0x80

section .data
    msg_datos db "Datos capturados", 10, 0
	msg_menor db "es menor", 10, 0
	msg_mayor db "es mayor o igual", 10, 0
    msg_num db "es un número", 10, 0
    msg_letra db "es una letra", 10, 0
    msg_invalido db "es invalido", 10, 0
    arreglo db 0, 0, 0, 0, 0, 0, 0, 0, 0

    