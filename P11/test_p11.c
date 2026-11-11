#include <stdio.h>
int str_len (char *str);
void str_mid( char *str_out, char *str1_in, int start, int end);
int clrBit( int value, int nbit);
int main(){
    char cadena1[27] = "Hola Melissa";
    char cadena2[27];
    printf("Longitud: %d\n", str_len(cadena1));
    str_mid(cadena2, cadena1, 5, 11);
    printf("Cadena: %s\n", cadena2);
    printf("Valor %d, Nuevo valor: %d\n", clrBit(27, 1));
    return 0;
}