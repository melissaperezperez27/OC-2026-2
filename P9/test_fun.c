#include <stdio.h>
extern int suma(int num1, int num2);
//extern int mystrcmp(char *str1, char *str2);
//extern int mystrlen(char *str);
//extern int getBit(int value, int numbit);
//extern int setBit(int value, int numbit);

int main() {
    int resultado_suma = suma(9, 6);
    printf("int suma(int num1, int num2);\n")
    printf("resultado de la suma = %d\n", resultado_suma);
    return 0;
}