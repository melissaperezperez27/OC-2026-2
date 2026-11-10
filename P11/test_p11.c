#include <stdio.h>
int str_len (char *str);
void str_mid( char *str_out, char *str1_in, int start, int end);
int clrBit( int value, int nbit);
int main(){
    char cadena1[27] = "holamundo";
    char cadena2[27] = "holabola";
    printf("Longitud: %d\n", str_len(cadena1));
    str_mid(cadena1, cadena2, 5, 9);
    printf("\n%s", cadena1);
    return 0;
}