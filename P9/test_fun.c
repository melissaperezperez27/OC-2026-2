#include <stdio.h>
extern int suma(int num1, int num2);
extern int mystrcmp(char *str1, char *str2);
extern int mystrlen(char *str);
extern int getBit(int value, int numbit);
//extern int setBit(int value, int numbit);

int main() {
    int n1 = 9, n2 = 6;
    int resultado_suma = suma(n1, n2);
    printf("int suma(n1, n2)\nn1 = 9\nn2 = 6\nresultado de la suma = %d\n\n", resultado_suma);

    char c1[] = "melissa", c2[] = "melissa", c3[] = "jenifer";
    int c = mystrcmp(c1, c2);
    printf("int mystrcmp(c1, c2)\nc1 = \"melissa\"\nc2 = \"melissa\"\nresultado = %d\n", c);
    c = mystrcmp(c1, c3);
    printf("int mystrcmp(c1, c3)\nc1 = \"melissa\"\nc3 = \"jenifer\"\nresultado = %d\n\n", c);
    

    int cantidad = mystrlen(c1);
    printf("int mystrlen(c1)\nc1 = \"melissa\"\nresultado = %d\n\n", cantidad);

    int value = 27, numbit = 1;
    int posicion = getBit(value, numbit);
    printf("int getBit(int value, int numbit)\nvalue = 27\nnumbit = 1\nresultado = %d\n\n", posicion);
    return 0;

    
}