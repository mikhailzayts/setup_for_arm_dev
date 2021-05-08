#include "stdint.h"

static uint32_t fibonachi(uint32_t num);

uint32_t var = 0;

int main(void)
{
    var = fibonachi(10);
    for(;;);
}

static uint32_t fibonachi(uint32_t num)
{
    return (1 == num ? num : num + fibonachi(num - 1));
}