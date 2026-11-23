section .text
    global NotBit32b
    global XchgBits
	global str_cnt_chr
	global isPrime
	global shr_s

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
	
	mov eax, [ebp+8] ; original 
	mov bl, [ebp+12] ; posicion 
	mov bh, [ebp+16] ; posicion 
	
	mov cl, bl
	ror eax, cl 
	mov edx, eax 
	and edx, 1
	rol eax, cl 

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
	push esi
	push ebx
	mov esi, [ebp+8] ; cadena
	mov cl, [ebp+12] ; caracter
	mov ebx, 0
	mov eax, 0
	@@Do_while:	
	mov dl, [esi+ebx]
	cmp dl, cl
	jne noequal 
	inc eax
	noequal:
	inc ebx
	cmp dl, 0
	jne @@Do_while
	pop ebx
	pop esi
	pop ebp
	ret


isPrime:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	mov cx, 2
	cmp eax, 1
	je noprimo
	cmp eax, 0
	je noprimo
	buscar:
	imul cx, cx
	cmp ecx, eax ; i*i > n
	ja siprimo
	div cx
	cmp edx, 0
	je noprimo
	inc ecx
	jmp buscar
	
	noprimo:
	pop ebp
	mov eax, 0
	ret

	siprimo:
	pop ebp
	mov eax, 1
	ret

shr_s:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8] 
	mov edx, eax
	shr eax, 1 		
	rol edx, 1
	and edx, 1
	rol eax, 1
	add eax, edx
	ror eax, 1
	
	pop ebp
	ret


; sudo apt update
; sudo apt install gcc-multilib nasm -y
; cd EjerciciosEx3
; nasm -f elf32 EjerciciosEx3.asm -o EjerciciosEx3.o
; gcc -m32 -c EEx3.c -o EEx3.o
; gcc -m32 EEx3.o EjerciciosEx3.o -o EEx3
; ./EEx3