%include "../LIB/pc_iox.inc"

section .text

    global _start

_start:
    ; --- Inciso a: Carga de 32 bits y suma de matrícula ---
    mov ebx, 0x5C4B2A60         ; Carga valor base de 32 bits en EBX
    add ebx, 0x02228661         ; Suma el valor de la matrícula a EBX
    mov eax, ebx                ; Copia el resultado a EAX para imprimir
    call pHex_dw                ; Imprime el resultado de 32 bits en hexadecimal
    mov eax, 0x0A               ; Carga el código ASCII del salto de línea (\n)
    call putchar                ; Imprime el salto de línea

    ; --- Inciso b: Guarda los 16 bits menos significativos en la pila ---
    push bx                     ; Empuja la parte baja de 16 bits (BX) al stack

    ; --- Inciso c: Multiplicación sin signo (8 bits) y almacenamiento en N ---
    mov al, bl                  ; Toma el byte menos significativo (BL) y lo coloca en AL
    mov cl, 8                   ; Carga el multiplicador (8)
    mul cl                      ; Multiplica AL * CL, el resultado de 16 bits se guarda en AX
    mov [N], ax                 ; Guarda el resultado obtenido en la variable N
    movzx eax, word [N]         ; Extiende N a 32 bits para poder imprimirlo
    call pHex_w                 ; Imprime el valor de N (16 bits)
    mov eax, 0x0A               ; Carga salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso d: Incremento en memoria ---
    inc word [N]                ; Incrementa en 1 el valor almacenado en la variable N
    movzx eax, word [N]         ; Carga N actualizado
    call pHex_w                 ; Imprime el nuevo valor de N
    mov eax, 0x0A               ; Carga salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso e: División sin signo (16 bits) y visualización ---
    mov ax, bx                  ; Coloca la parte de 16 bits de EBX en AX (dividendo)
    mov dx, 0                   ; Limpia DX para asegurar división limpia DX:AX / CX
    mov cx, 0x00FF              ; Carga el divisor (0xFF) en CX
    div cx                      ; Divide DX:AX entre CX (Cociente queda en AX, Residuo en DX)
    mov [residuo], dx           ; Guarda el residuo en memoria para el siguiente paso
    movzx eax, ax               ; Prepara el cociente para imprimir
    call pHex_w                 ; Imprime el cociente
    mov eax, 0x0A               ; Carga salto de línea
    call putchar                ; Imprime salto de línea
    movzx eax, dx               ; Prepara el residuo para imprimir
    call pHex_w                 ; Imprime el residuo
    mov eax, 0x0A               ; Carga salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso f: Suma de la variable N con el residuo ---
    mov ax, [residuo]           ; Carga el residuo guardado anteriormente
    add [N], ax                 ; Suma el residuo directamente a la variable N
    movzx eax, word [N]         ; Carga el valor actualizado de N
    call pHex_w                 ; Imprime el nuevo valor de N
    mov eax, 0x0A               ; Carga salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso g: Decremento y lectura del registro de banderas ---
    dec word [N]                ; Decrementa en 1 la variable N
    lahf                        ; Copia los bits principales del registro EFLAGS hacia AH
    mov al, ah                  ; Mueve las banderas a AL para su despliegue
    movzx eax, al               ; Prepara el byte de banderas para imprimir
    call pHex_b                 ; Imprime el estado del registro de banderas
    mov eax, 0x0A               ; Carga salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Inciso h: Recuperación de datos de la pila ---
    pop cx                      ; Extrae de la pila los 16 bits guardados en el inciso b
    movzx eax, cx               ; Prepara el valor recuperado para imprimir
    call pHex_w                 ; Imprime el valor rescatado del stack
    mov eax, 0x0A               ; Carga salto de línea
    call putchar                ; Imprime salto de línea

    ; --- Finalización limpia del programa ---
    mov ebx, 0                  ; Retorna código 0 al SO para indicar ejecución exitosa
    mov eax, 1                  ; Llamada al sistema sys_exit
    int 0x80                    ; Ejecuta la interrupción del sistema

section .data
    N dw 0                      ; Variable N de tipo word (16 bits)
    residuo dw 0                ; Variable temporal para conservar el residuo