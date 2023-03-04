/**
 * @file early_init.c
 * @author czlimx (czlimx@163.com)
 * @brief 
 * @version 0.1
 * @date 2023-03-05
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "mpu.h"
#include "cache.h"
#include "compiler.h"

#define MPU_MAX_REGION      8

static const mpu_region_attributes_t mpu_region_attributes_arry[MPU_MAX_REGION] = 
{
    [0] = {},
    [1] = {},
    [2] = {},
    [3] = {},
    [4] = {},
    [5] = {},
    [6] = {},
    [7] = {}
};

static __init__ void mpu_init(void)
{
    unsigned int number = 0;
    unsigned int address = 0;
    unsigned int attributes = 0;

    mpu_disable();

    for (int i = 0; i < MPU_MAX_REGION; i++)
    {
        

        mpu_update_region(number, address, attributes);
    }

    mpu_enable();
}

static __init__ void cache_init(void)
{
    Icache_enable();
    Dcache_enable();
}

__init__ void early_init(void)
{
    mpu_init();
    cache_init();
}
