#include "mpu.h"
#include "arch.h"

    .thumb
    .syntax unified
    .cpu cortex-m7
    .fpu softvfp

    .global mpu_enable
    .global mpu_disable
    .global mpu_update_region

    .section .text.mpu
    .type mpu_enable, %function
mpu_enable:
    /* enable mpu */
    ldr r1, =MPU_CTRL_BASE_ADDR
    ldr r0, [r1]
    orr r0, r0, #(1 << MPU_CTRL_ENABLE)
    orr r0, r0, #(1 << MPU_CTRL_PRIVDEFENA)
    str r0, [r1]

    /* enable memfault exception */
    ldr r1, =SHCSR_BASE_ADDR
    ldr r0, [r1]
    orr r0, r0, #(1 << SHCSR_MEMFAULTENA)
    str r0, [r1]

    dsb
    isb
    mov pc, lr

    .section .text.mpu
    .type mpu_disable, %function
mpu_disable:
    dmb

    /* disable memfault exception */
    ldr r1, =SHCSR_BASE_ADDR
    ldr r0, [r1]
    bic r0, r0, #(1 << SHCSR_MEMFAULTENA)
    str r0, [r1]

    /* disable mpu */
    ldr r1, =MPU_CTRL_BASE_ADDR
    ldr r0, [r1]
    bic r0, r0, #(1 << MPU_CTRL_ENABLE)
    str r0, [r1]
    mov pc, lr

    .section .text.mpu
    .type mpu_update_region, %function
/* r0 = number, 
   r1 = adderss, 
   r2 = attributes */
mpu_update_region:
    ldr r3, =MPU_RNR_BASE_ADDR
    str r0, [r3, #0]
    str r1, [r3, #4]
    str r2, [r3, #8]
    mov pc, lr

    .end