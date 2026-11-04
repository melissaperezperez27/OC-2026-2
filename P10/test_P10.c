#include <stdio.h>
extern void pBin8b(int dato);
extern void pBin16b(int dato);
extern void pBin32b(int dato);
extern void pBin64b(int dato);


int main() {
    int num_bits8 = 8, num_bits16 = 255, num_bits32 = 255, num_bits64 = 65535;
    printf("El número %d en binario (8 bits) es \n", num_bits8);
    pBin8b(num_bits8);
    printf("\nEl número %d en binario (16 bits) es \n", num_bits16);
    pBin16b(num_bits16);
    printf("\nEl número %d en binario (32 bits) es \n", num_bits32);
    pBin32b(num_bits32);
    printf("\nEl número %d en binario (64 bits) es \n", num_bits64);
    pBin32b(num_bits64);
    printf("\n");
    return 0;
}


