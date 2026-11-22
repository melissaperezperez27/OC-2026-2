#include <stdio.h>
#include <stdint.h>


int NotBit32b(int dato, int numbit);

int XchgBits(int dato, int numbit1, int numbit2);

int str_cnt_chr(char *str, char letra);

int main() {
    // 1. Prueba NotBit32b
    int x1 = 15;
    int res1 = NotBit32b(x1, 1);
    printf("1. NotBit32b(%d, 1) = %d (Esperado: 0x00123454)\n", x1, res1);

    int num = 14, n1 =0, n2=1;
    int numres = XchgBits(num, n1, n2);
    printf("\n%d", numres);

    char cadena[15] = "aoaoa";
    int cts = str_cnt_chr(cadena, 'a');
    printf("\n%d\n", cts);
    return 0;
}