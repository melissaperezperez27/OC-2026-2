#include <stdio.h>
#include <stdint.h>


int NotBit32b(int dato, int numbit);

int XchgBits(int dato, int numbit1, int numbit2);

int main() {
    // 1. Prueba NotBit32b
    int x1 = 15;
    int res1 = NotBit32b(x1, 1);
    printf("1. NotBit32b(%d, 1) = %d (Esperado: 0x00123454)\n", x1, res1);

    int num = 1193046, n1 =1, n2=3;
    int numres = XchgBits(num, n1, n2);
    printf("\n%d", numres);
    return 0;
}