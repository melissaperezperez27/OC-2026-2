#include <stdio.h>

int NotBit32b(int dato, int numbit);
int XchgBits(int dato, int numbit1, int numbit2);
int str_cnt_chr(char *str, char letra);
int isPrime(int dato);
int shr_s(int dato);

int main() {
    int x1 = 15;
    int res1 = NotBit32b(x1, 1);
    printf("1. NotBit32b(%d, 1) = %d (Esperado: 0x00123454)\n", x1, res1);

    int num = 14, n1 =0, n2=1;
    int numres = XchgBits(num, n1, n2);
    printf("\n%d", numres);

    char cadena[15] = "hola mundo";
    int cts = str_cnt_chr(cadena, 'o');
    printf("\n%d\n", cts);

    int primo = isPrime(3);
    printf("\n%d\n", primo);

    int sdr_ = shr_s(-50);
    printf("\n%d\n", sdr_);
    return 0;
}