/**
 * @file gpio.h
 * @author czlimx (czlimx@163.com)
 * @brief 
 * @version 0.1
 * @date 2023-03-06
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#ifndef SDRV_GPIO_H_
#define SDRV_GPIO_H_

#define GPIOA_BASE_ADDR     0x58020000
#define GPIOB_BASE_ADDR     0x58020400
#define GPIOC_BASE_ADDR     0x58020800
#define GPIOD_BASE_ADDR     0x58020C00
#define GPIOE_BASE_ADDR     0x58021000
#define GPIOF_BASE_ADDR     0x58021400
#define GPIOG_BASE_ADDR     0x58021800
#define GPIOH_BASE_ADDR     0x58021C00
#define GPIOI_BASE_ADDR     0x58022000
#define GPIOJ_BASE_ADDR     0x58022400
#define GPIOK_BASE_ADDR     0x58022800

/* gpio register list */
#define GPIOx_MODER         0x00
#define GPIOx_OTYPER        0x04
#define GPIOx_OSPEEDR       0x08
#define GPIOA_PUPDR         0x0C
#define GPIOx_IDR           0x10
#define GPIOx_ODR           0x14
#define GPIOx_BSRR          0x18
#define GPIOx_LCKR          0x1C
#define GPIOx_AFRL          0x20
#define GPIOx_AFRH          0x24

#ifndef ASSEMBLY

typedef enum sdrv_gpio_index
{
    GPIO_0 = 0x0U,
    GPIO_1, 
    GPIO_2, 
    GPIO_3, 
    GPIO_4, 
    GPIO_5, 
    GPIO_6, 
    GPIO_7, 
    GPIO_8, 
    GPIO_9, 
    GPIO_10,
    GPIO_11,
    GPIO_12,
    GPIO_13,
    GPIO_14,
    GPIO_15
}sdrv_gpio_index_t;

typedef enum sdrv_gpio_alternate
{
    AF_0 = 0x0U,
    AF_1, 
    AF_2, 
    AF_3, 
    AF_4, 
    AF_5, 
    AF_6, 
    AF_7, 
    AF_8, 
    AF_9, 
    AF_10,
    AF_11,
    AF_12,
    AF_13,
    AF_14,
    AF_15
}sdrv_gpio_alternate_t;

typedef enum sdrv_gpio_mode
{
    INPUT_MODE = 0x0U,
    OUTPUT_MODE,
    FUNCTION_MODE,
    ANALOG_MODE
}sdrv_gpio_mode_t;

typedef enum sdrv_gpio_output_type
{
    OUTPUT_PUSHPULL = 0x0U,
    OUTPUT_OPEN_DRAIN
}sdrv_gpio_output_type_t;

typedef enum sdrv_gpio_output_speed
{
    LOW_SPEED = 0x0U,
    MEDIUM_SPEED,
    HIGH_SPEED,
    VERY_HIGH_SPEED
}sdrv_gpio_output_speed_t;

typedef enum sdrv_gpio_pull
{
    NO_PULL = 0x0U,
    PULL_UP,
    PULL_DOWN,
    RESERVED
}sdrv_gpio_pull_t;

typedef struct sdrv_gpio
{
    unsigned int mode;
    unsigned int otype;
    unsigned int ospeed;
    unsigned int pupd;
    unsigned int idr;
    unsigned int odr;
    unsigned int bsrr;
    unsigned int lckr;
    unsigned int afrl;
    unsigned int afrh;
}sdrv_gpio_t;

void gpio_set_mode(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_mode_t mode);

void gpio_set_output_type(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_output_type_t type);

void gpio_set_output_speed(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_output_speed_t speed);

void gpio_set_pull(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_pull_t pull);

unsigned int gpio_get_input_data(const unsigned int base_address, const sdrv_gpio_index_t index);

void gpio_set_output_data(const unsigned int base_address, const sdrv_gpio_index_t index, const unsigned int level);

int gpio_set_configurate_lock(const unsigned int base_address, const sdrv_gpio_index_t index);

void gpio_config_alternate_function(const unsigned int base_address, const sdrv_gpio_index_t index, const sdrv_gpio_alternate_t alternate);

#endif /* ASSEMBLY */

#endif /* SDRV_GPIO_H_ */