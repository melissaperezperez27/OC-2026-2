#include <stdio.h>
#include <stdint.h>

extern uint32_t NotBit32b(uint32_t dato, uint8_t numbit);
extern uint32_t XchgBits(uint32_t dato, uint8_t numbit1, uint8_t numbit2);
extern int str_cnt_chr(char *str, char letra);
extern uint8_t isPrime(uint32_t dato);
extern int shr_s(int dato);

int main() {
    // 1. NotBit32b
    int dato = 15;
    int numbit1 = 1;
    int resultado1 = NotBit32b(dato, numbit1);
    printf("Función: uint32_t NotBit32b(uint32_t dato, uint8_t numbit)\ndato: %d\nnumbit: %d\nresultado: %d\n\n", dato, numbit1, resultado1);

    // 2. XchgBits
    int num = 14, n1 = 0, n2 = 1;
    int numres = XchgBits(num, n1, n2);
    printf("Función: uint32_t XchgBits(uint32_t dato, uint8_t numbit1, uint8_t numbit2)\ndato: %d\nnumbit1: %d\nnumbit2: %d\nresultado: %d\n\n", num, n1, n2, numres);

    // 3. str_cnt_chr
    char cadena[15] = "hola mundo";
    char letra = 'o';
    int cts = str_cnt_chr(cadena, letra);
    printf("Función: int str_cnt_chr(char *str, char letra)\nstr: \"%s\"\nletra: '%c'\nresultado: %d\n\n", cadena, letra, cts);

    // 4. isPrime
    int num_primo = 3;
    int primo = isPrime(num_primo);
    printf("Función: uint8_t isPrime(uint32_t dato)\ndato: %d\nresultado: %d\n\n", num_primo, primo);

    // 5. shr_s
    int dato_shr = -50;
    int res = shr_s(dato_shr);
    printf("Función: int shr_s(int dato)\ndato: %d\nresultado: %d\n", dato_shr, res);
    return 0;
}