#include <stdio.h>
extern int suma(int num1, int num2);
extern int mystrcmp(char *str1, char *str2);
//extern int mystrlen(char *str);
//extern int getBit(int value, int numbit);
//extern int setBit(int value, int numbit);

int main() {
    int n1 = 9, n2 = 6;
    int resultado_suma = suma(n1, n2);
    printf("int suma(n1, n2)\nn1 = 9\nn2 = 6\nresultado de la suma = %d\n", resultado_suma);

    char cadena1[] = "melissa", cadena2[] = "melissa", cadena3[] = "jenifer";
    int cadena = mystrcmp(cadena1, cadena2);
    printf("int mystrcmp(cadena1, cadena2)\ncadena1 = \"melissa\"\ncadena2 = \"melissa\"\nresultado (1 no son iguales, 0 sí son iguales) = %d\n", cadena);
    cadena = mystrcmp(cadena1, cadena3);
    printf("int mystrcmp(cadena1, cadena3)\ncadena1 = \"melissa\"\ncadena3 = \"jenifer\"\nresultado (1 no son iguales, 0 sí son iguales) = %d\n", cadena);
    return 0;
}