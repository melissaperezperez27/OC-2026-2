#include <stdio.h>
extern void pBin8b(int dato);
extern void pBin16b(int dato);
extern void pBin32b(int dato);
extern void pBin64b(int dato);


int main() {
    pBin8b(27);
    return 0;
}