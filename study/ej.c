#include <stdio.h>
#include <stdint.h>

extern uint32_t ClearBitRange( uint32_t dato, uint8_t start, uint8_t end );

int main() {
    uint32_t x = 0xFFFFFFFF;
    x = ClearBitRange(x, 4, 1); // Limpia los bits del 4 al 11 -> x resulta en 0xFFFFF00F
    printf("Resultado: 0x%08X\n", x);
    return 0;
}
