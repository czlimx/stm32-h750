/**
 * @file mpu.h
 * @author czlimx (czlimx@163.com)
 * @brief 
 * @version 0.1
 * @date 2023-03-05
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#ifndef ARCH_MPU_H_
#define ARCH_MPU_H_

#define MPU_TYPE_BASE_ADDR          0xE000ED90
#define MPU_CTRL_BASE_ADDR          0xE000ED94
#define MPU_CTRL_ENABLE             0
#define MPU_CTRL_HFNMIENA           1
#define MPU_CTRL_PRIVDEFENA         2

#define MPU_RNR_BASE_ADDR           0xE000ED98
#define MPU_RBAR_BASE_ADDR          0xE000ED9C
#define MPU_RASR_BASE_ADDR          0xE000EDA0
#define MPU_RASR_XN                 28
#define MPU_RASR_AP                 24
#define MPU_RASR_TEX                19
#define MPU_RASR_S                  18
#define MPU_RASR_C                  17
#define MPU_RASR_B                  16
#define MPU_RASR_SRD                8
#define MPU_RASR_SIZE               1
#define MPU_RASR_ENABLE             0

#ifndef ASSEMBLY

typedef enum enable_bit
{
    DISABLE = 0,
    ENABLE
}enable_bit_t;

typedef enum access_permission
{
    AP_NO_NO = 0,       /* Privileged NO, Unprivileged NO */
    AP_RW_NO,           /* Privileged RW, Unprivileged NO */
    AP_RW_RO,           /* Privileged RW, Unprivileged RO */
    AP_RW_RW,           /* Privileged RW, Unprivileged RW */
    RESERVED,
    AP_RO_NO,           /* Privileged RO, Unprivileged NO */
    AP_RO_RO            /* Privileged RO, Unprivileged RO */
}access_permission_t;

typedef struct mpu_attributes
{
    enable_bit_t execute_never;
    access_permission_t access_permission;
    unsigned int type_extension;
    enable_bit_t shareable; 
    enable_bit_t cacheable;
    enable_bit_t bufferable;  
    unsigned int subregion;
    unsigned int size;
    enable_bit_t enable;
}mpu_attributes_t;

typedef struct mpu_region
{
    mpu_attributes_t attributes;
    unsigned int region_number;
    unsigned int base_address;
}mpu_region_t;

void mpu_enable(void);
void mpu_disable(void);
void mpu_update_region(unsigned int number, unsigned int adderss, unsigned int attributes);

#endif /* ASSEMBLY */


#endif /* ARCH_MPU_H_ */