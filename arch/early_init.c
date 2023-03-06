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

static const mpu_region_t mpu_region_arry[] = 
{
    /* code : ITCM(64KB) + Flash(128KB) 0x00000000 - 0x1FFFFFFF */
    [0] = {
        .attributes     = {
            .execute_never      = DISABLE,
            .access_permission  = AP_RO_RO,
            .type_extension     = 0x0,
            .shareable          = DISABLE,
            .cacheable          = ENABLE,
            .bufferable         = DISABLE,
            .subregion          = 0x0,
            .size               = 0b11100,
            .enable             = ENABLE
        },
        .region_number  = 0x0,
        .base_address   = 0x00000000
    },

    /* ram : DTCM(128K) + SRAM(512K + 288K + 64K) 0x20000000 - 0x3FFFFFFF */
    [1] = {
        .attributes     = {
            .execute_never      = ENABLE,
            .access_permission  = AP_RW_RW,
            .type_extension     = 0x1,
            .shareable          = DISABLE,
            .cacheable          = ENABLE,
            .bufferable         = ENABLE,
            .subregion          = 0x0,
            .size               = 0b11100,
            .enable             = ENABLE
        },
        .region_number  = 0x1,
        .base_address   = 0x20000000
    },


    /* Peripherals : 0x40000000 - 0x5FFFFFFF */
    [2] = {
        .attributes     = {
            .execute_never      = ENABLE,
            .access_permission  = AP_RW_RW,
            .type_extension     = 0x0,
            .shareable          = ENABLE,
            .cacheable          = DISABLE,
            .bufferable         = ENABLE,
            .subregion          = 0x0,
            .size               = 0b11100,
            .enable             = ENABLE
        },
        .region_number  = 0x2,
        .base_address   = 0x40000000
    },

    /* External Memories : 0x60000000 - 0x9FFFFFFF */
    [3] = {
        .attributes     = {
            .execute_never      = ENABLE,
            .access_permission  = AP_RW_RW,
            .type_extension     = 0x0,
            .shareable          = DISABLE,
            .cacheable          = ENABLE,
            .bufferable         = ENABLE,
            .subregion          = 0x0,
            .size               = 0b11101,
            .enable             = ENABLE
        },
        .region_number  = 0x3,
        .base_address   = 0x60000000
    },

    /* External Devices : 0xA0000000 - 0xDFFFFFFF */
    [4] = {
        .attributes     = {
            .execute_never      = ENABLE,
            .access_permission  = AP_RW_RW,
            .type_extension     = 0x0,
            .shareable          = DISABLE,
            .cacheable          = ENABLE,
            .bufferable         = ENABLE,
            .subregion          = 0x0,
            .size               = 0b11101,
            .enable             = ENABLE
        },
        .region_number  = 0x4,
        .base_address   = 0xA0000000
    }
};

static unsigned int mpu_set_attributes(const mpu_attributes_t *attributes)
{
    unsigned int value = 0x0;

    value = (attributes->execute_never << MPU_RASR_XN) |
            ((attributes->access_permission & 0x7) << MPU_RASR_AP) |
            ((attributes->type_extension & 0x7) << MPU_RASR_TEX) |
            (attributes->shareable << MPU_RASR_S) |
            (attributes->cacheable << MPU_RASR_C) |
            (attributes->bufferable >> MPU_RASR_B) |
            ((attributes->subregion & 0xFF) << MPU_RASR_SRD) | 
            ((attributes->size & 0x3F) << MPU_RASR_SIZE) |
            (attributes->enable << MPU_RASR_ENABLE);

    return value;
}

static __init__ void mpu_init(void)
{
    unsigned int attributes = 0;
    unsigned int number = sizeof(mpu_region_arry) / sizeof(mpu_region_arry[0]);

    mpu_disable();
    for (int i = 0; i < number; i++)
    {
        attributes = mpu_set_attributes(&mpu_region_arry[i].attributes);
        mpu_update_region(mpu_region_arry[i].region_number, mpu_region_arry[i].base_address, attributes);
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
