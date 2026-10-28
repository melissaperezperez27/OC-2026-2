#include <stdio.h>
extern int suma(int num1, int num2);
extern int mystrcmp(char *str1, char *str2);
//extern int mystrlen(char *str);
//extern int getBit(int value, int numbit);
//extern int setBit(int value, int numbit);

int main() {
    int resultado_suma = suma(9, 6);
    printf("int suma(9, 6)\nresultado de la suma = %d\n", resultado_suma);

    char cadena1[] = "melissa";
    char cadena2[] = "melissa";
    char cadena3[] = "jenifer";
    int cadena = mystrcmp(cadena1, cadena2);
    printf("int mystrcmp(cadena1, cadena2)\nresultado (1 no son iguales, 0 sí son iguales) = %d", cadena);
    cadena = mystrcmp(cadena1, cadena3);
    printf("int mystrcmp(cadena1, cadena3)\nresultado (1 no son iguales, 0 sí son iguales) = %d", cadena);
    return 0;
}