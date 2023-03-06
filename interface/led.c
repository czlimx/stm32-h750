#include "sdrv_gpio.h"
#include "led.h"

void led_init(void)
{
    /* configure R */
    gpio_set_mode(GPIOB_BASE_ADDR, GPIO_0, OUTPUT_MODE);
    gpio_set_pull(GPIOB_BASE_ADDR, GPIO_0, PULL_UP);
    gpio_set_output_speed(GPIOB_BASE_ADDR, GPIO_0, LOW_SPEED);
    gpio_set_output_type(GPIOB_BASE_ADDR, GPIO_0, OUTPUT_PUSHPULL);
    
    /* configure G */
    gpio_set_mode(GPIOB_BASE_ADDR, GPIO_1, OUTPUT_MODE);
    gpio_set_pull(GPIOB_BASE_ADDR, GPIO_1, PULL_UP);
    gpio_set_output_speed(GPIOB_BASE_ADDR, GPIO_1, LOW_SPEED);
    gpio_set_output_type(GPIOB_BASE_ADDR, GPIO_1, OUTPUT_PUSHPULL);

    /* configure B */
    gpio_set_mode(GPIOA_BASE_ADDR, GPIO_3, OUTPUT_MODE);
    gpio_set_pull(GPIOA_BASE_ADDR, GPIO_3, PULL_UP);
    gpio_set_output_speed(GPIOA_BASE_ADDR, GPIO_3, LOW_SPEED);
    gpio_set_output_type(GPIOA_BASE_ADDR, GPIO_3, OUTPUT_PUSHPULL);
}

void led_trigger(const led_index_t index, const led_on_off_t on_off)
{
    switch (index)
    {
        case LED_R:
            gpio_set_output_data(GPIOB_BASE_ADDR, GPIO_0, on_off);
            break;
        case LED_G:
            gpio_set_output_data(GPIOB_BASE_ADDR, GPIO_1, on_off);
            break;
        case LED_B:
            gpio_set_output_data(GPIOA_BASE_ADDR, GPIO_3, on_off);
            break;
        default:
            gpio_set_output_data(GPIOB_BASE_ADDR, GPIO_0, on_off);
            gpio_set_output_data(GPIOB_BASE_ADDR, GPIO_1, on_off);
            gpio_set_output_data(GPIOA_BASE_ADDR, GPIO_3, on_off);
            break;
    }
}

void led_reback(const led_index_t index)
{
    unsigned int value = 0x0U;
    
    switch (index)
    {
        case LED_R:
            value = gpio_get_input_data(GPIOB_BASE_ADDR, GPIO_0);
            led_trigger(index, ~value);
            break;
        case LED_G:
            value = gpio_get_input_data(GPIOB_BASE_ADDR, GPIO_1);
            led_trigger(index, ~value);
            break;
        case LED_B:
            value = gpio_get_input_data(GPIOA_BASE_ADDR, GPIO_3);
            led_trigger(index, ~value);
            break;
        default:
            value = gpio_get_input_data(GPIOB_BASE_ADDR, GPIO_0);
            led_trigger(index, ~value);
            value = gpio_get_input_data(GPIOB_BASE_ADDR, GPIO_1);
            led_trigger(index, ~value);
            value = gpio_get_input_data(GPIOA_BASE_ADDR, GPIO_3);
            led_trigger(index, ~value);
            break;
    }
}
