section .text
    global ClearBitRange

ClearBitRange:

push ebp 
mov ebp, esp 

mov eax, [ebp+8] ; cadena 
mov ecx, [ebp+12] ; inicio
mov edx, [ebp+16] ; fin

ciclo:
mov [eax+ecx], 0
cmp edx,ecx
inc ecx 
jne ciclo

pop ebp 
ret