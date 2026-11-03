#include <stdio.h>
extern void pBin8b(int dato);
extern void pBin16b(int dato);
extern void pBin32b(int dato);
extern void pBin64b(int dato);


int main() {
    int bits8 = 8, bits16 =16;
    printf("El número %d en binario es \n", bits8);
    pBin16b(8);
    printf("\n\n");
    return 0;
}