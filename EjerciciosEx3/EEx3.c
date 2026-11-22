#include <stdio.h>
#include <stdint.h>


int NotBit32b(int dato, int numbit);


int main() {
    // 1. Prueba NotBit32b
    int x1 = 15;
    int res1 = NotBit32b(x1, 1);
    printf("1. NotBit32b(%d, 1) = %d (Esperado: 0x00123454)\n", x1, res1);
    return 0;
}