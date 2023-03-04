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

#define MPU_RNR_BASE_ADDR           0xE000ED98
#define MPU_RBAR_BASE_ADDR          0xE000ED9C
#define MPU_RASR_BASE_ADDR          0xE000EDA0
#define MPU_RBAR_A1_BASE_ADDR       0xE000EDA4
#define MPU_RASR_A1_BASE_ADDR       0xE000EDA8
#define MPU_RBAR_A2_BASE_ADDR       0xE000EDAC
#define MPU_RASR_A2_BASE_ADDR       0xE000EDB0
#define MPU_RBAR_A3_BASE_ADDR       0xE000EDB4
#define MPU_RASR_A3_BASE_ADDR       0xE000EDB8

#ifndef ASSEMBLY

typedef struct mpu_region_attributes
{
    
}mpu_region_attributes_t;

void mpu_enable(void);
void mpu_disable(void);
void mpu_update_region(unsigned int number, unsigned int adderss, unsigned int attributes);

#endif /* ASSEMBLY */


#endif /* ARCH_MPU_H_ */