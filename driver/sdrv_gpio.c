/**
 * @file gpio.c
 * @author czlimx (czlimx@163.com)
 * @brief 
 * @version 0.1
 * @date 2023-03-06
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "sdrv_gpio.h"
#include "compiler.h"

void gpio_set_mode(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_mode_t mode)
{
    unsigned int value = readl(base_address + GPIOx_MODER);
    value &= ~(0x3U << (index * 0x2U));
    value |=  (mode << (index * 0x2U));
    writel(value, base_address + GPIOx_MODER);
}

void gpio_set_output_type(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_output_type_t type)
{
    unsigned int value = readl(base_address + GPIOx_OTYPER);
    if (OUTPUT_PUSHPULL == type)
        value &= ~(0x1U << index);
    else
        value |=  (0x1U << index);
    writel(value, base_address + GPIOx_OTYPER);
}

void gpio_set_output_speed(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_output_speed_t speed)
{
    unsigned int value = readl(base_address + GPIOx_OSPEEDR);
    value &= ~(0x3U << (index * 0x2U));
    value |=  (speed << (index * 0x2U));
    writel(value, base_address + GPIOx_OSPEEDR);
}

void gpio_set_pull(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_pull_t pull)
{
    unsigned int value = readl(base_address + GPIOA_PUPDR);
    value &= ~(0x3U << (index * 0x2U));
    value |=  (pull << (index * 0x2U));
    writel(value, base_address + GPIOA_PUPDR);
}

unsigned int gpio_get_input_data(const unsigned int base_address, const sdrv_gpio_index_t index)
{
    return (readl(base_address + GPIOx_IDR) >> index) & 0x1U;
}

void gpio_set_output_data(const unsigned int base_address, const sdrv_gpio_index_t index, const unsigned int level)
{
    unsigned int value = readl(base_address + GPIOx_BSRR);
    if (0x1U == level)
        value |= (0x1U << index);
    else
        value |= (0x1U << (index + 16));
    writel(value, base_address + GPIOx_BSRR);
}

int gpio_set_configurate_lock(const unsigned int base_address, const sdrv_gpio_index_t index)
{
    unsigned int value = readl(base_address + GPIOx_LCKR);

    /* deblocking sequence */
    value |= (0x1U << index) | (0x1U << 16);
    writel(value, base_address + GPIOx_LCKR);

    value &= ~(0x1U << 16);
    writel(value, base_address + GPIOx_LCKR);

    value |= (0x1U << 16);
    writel(value, base_address + GPIOx_LCKR);

    value = readl(base_address + GPIOx_LCKR);
    if ((value >> 16) & 0x1U)
        return  0;
    else
        return -1;
}

void gpio_config_alternate_function(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_alternate_t alternate)
{
    unsigned int value = 0x0U;

    if (index > GPIO_7)
        value = readl(base_address + GPIOx_AFRH);
    else
        value = readl(base_address + GPIOx_AFRL);

    value &= ~(0xFU << (index * 0x4U));
    value |=  (alternate << (index * 0x4U));

    if (index > GPIO_7)
        writel(value, base_address + GPIOx_AFRH);
    else
        writel(value, base_address + GPIOx_AFRL);
}
