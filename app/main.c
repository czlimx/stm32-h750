#include "compiler.h"
#include "led.h"

unsigned int array_data[32] = {5};
unsigned int array_bss[32];
int main(void)
{

    led_init();
    led_trigger(LED_R, TURN_ON);
    volatile unsigned int TimeLine = 0;

    for (int i = 0; i < 32; i++)
    {
        array_data[i] = i;
        array_bss[i] = array_data[i];
    }

    return TimeLine;
}