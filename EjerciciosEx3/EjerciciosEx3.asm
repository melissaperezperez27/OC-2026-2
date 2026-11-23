section .text
    global NotBit32b
    global XchgBits
	global str_cnt_chr
NotBit32b:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov cl, [ebp+12]
    ror eax, cl
    xor eax, 1
    rol eax, cl 
    pop ebp
    ret




XchgBits: 
	push ebp
	mov ebp, esp
	push ebx
	push esi
	
	mov eax, [ebp+8] ; original 14 = 1110
	mov bl, [ebp+12] ; posicion 0
	mov bh, [ebp+16] ; posicion 2
	
	mov cl, bl
	ror eax, cl 
	mov edx, eax ; 1110
	and edx, 1
	rol eax, cl ; 1110

	mov cl, bh
	ror eax, cl
	mov esi, eax
	and esi, 1
	rol eax, cl

	cmp edx, esi
	je nocambio ; iguales

	mov cl, bl
	ror eax, cl
	xor eax, 1
	rol eax, cl

	mov cl, bh
	ror eax, cl
	xor eax, 1
	rol eax, cl
	
	nocambio:
	pop esi
	pop ebx
	pop ebp
	ret

str_cnt_chr:
	push ebp
	mov ebp, esp
	mov edx, [ebp+8] ; cadena
	mov
	@@Do_while:	
	cmp al, 0
	je @@Do_while

	pop ebp
	ret


; sudo apt update

; sudo apt install gcc-multilib nasm -y
; cd EjerciciosEx3
; nasm -f elf32 EjerciciosEx3.asm -o EjerciciosEx3.o
; gcc -m32 -c EEx3.c -o EEx3.o
; gcc -m32 EEx3.o EjerciciosEx3.o -o EEx3
; ./EEx3
; 0000 - 0
; 0001
; 0010
; 0011
; 0100
; 0101
; 0110
; 0111
; 1000
; 1001
; 1010
; 1011
; 1100
; 1101
; 1110
; 1111
