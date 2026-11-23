#include <stdio.h>
#include <stdint.h>

extern uint32_t ClearBitRange( uint32_t dato, uint8_t start, uint8_t end );
extern uint8_t CountSetBits( uint32_t dato );
int main() {
    uint32_t x = 0xFFFFFFFF;
    x = ClearBitRange(x, 4, 11); 
    printf("Resultado: 0x%08X\n", x);

    uint8_t total;
    x = 0x00123456;
    total = CountSetBits( x );
    printf("Bits en 1 de 0x%08X: %u\n", x, total); // Debe imprimir 9

    // Casos extra para verificar extremos:
    printf("Bits en 1 de 0x00000000: %u\n", CountSetBits(0x00000000)); // Debe imprimir 0
    printf("Bits en 1 de 0xFFFFFFFF: %u\n", CountSetBits(0xFFFFFFFF)); // Debe imprimir 32
    return 0;
}
