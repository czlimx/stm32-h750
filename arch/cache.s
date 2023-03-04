#include "cache.h"
#include "arch.h"

    .thumb
    .syntax unified
    .cpu cortex-m7
    .fpu softvfp

    .global Icache_enable
    .global Icache_disable
    .global Dcache_enable
    .global Dcache_disable
    .global Icache_invalidate_all
    .global Dcache_invalidate_all
    .global Dcache_clean_all
    .global Dcache_invalidate_by_address
    .global Dcache_invalidate_by_set_way
    .global Dcache_clean_by_address
    .global Dcache_clean_by_set_way
    .global Dcache_clean_and_invalidate_by_address
    .global Dcache_clean_and_invalidate_by_set_way

/* Cache maintenance operations by PoU can be used to synchronize data between 
   the Cortex-M7 data and instruction Caches, for example when the software uses 
   self-modifying code. 
   
   Cache maintenance operations by PoC can be used to synchronize data between 
   the Cortex-M7 data cache and an external agent such as a system DMA.
*/
    .section .text.cache
    .type Icache_enable, %function
Icache_enable:
    push {lr}
    bl Icache_invalidate_all
    ldr r1, =CCR_BASE_ADDR
    ldr r0, [r1]
    orr r0, r0, #(1 << CCR_IC)
    str r0, [r1]
    dsb
    dmb
    pop {lr}
    mov pc, lr

    .section .text.cache
    .type Icache_disable, %function
Icache_disable:
    ldr r1, =CCR_BASE_ADDR
    ldr r0, [r1]
    bic r0, r0, #(1 << CCR_IC)
    str r0, [r1]
    dsb
    dmb
    mov pc, lr

    .section .text.cache
    .type Dcache_enable, %function
Dcache_enable:
    push {lr}
    bl Dcache_invalidate_all
    ldr r1, =CCR_BASE_ADDR
    ldr r0, [r1]
    orr r0, r0, #(1 << CCR_DC)
    str r0, [r1]
    dsb
    dmb
    pop {lr}
    mov pc, lr

    .section .text.cache
    .type Dcache_disable, %function
Dcache_disable:
    push {lr}
    bl Dcache_clean_all
    ldr r1, =CCR_BASE_ADDR
    ldr r0, [r1]
    bic r0, r0, #(1 << CCR_DC)
    str r0, [r1]
    dsb
    dmb
    pop {lr}
    mov pc, lr

    .section .text.cache
    .type Icache_invalidate_all, %function
/* Instruction cache invalidate all to the Point of Unification(PoU) */
Icache_invalidate_all:
    mov r0, #0x0
    ldr r1, =ICIALLU_BASE_ADDR
    str r0, [r1]
    dsb
    dmb
    mov pc, lr

/* Data cache invalidate all to by set_way */
Dcache_invalidate_all:
    push {r4-r12, lr}
    mov r0, #0x0                /* select data cache, level 1 */
    ldr r1, =CSSELR_BASE_ADDR
    ldr r0, [r1]
    dsb

    ldr r0, =CCSIDR_BASE_ADDR
    ldr r1, [r0]
    and r2, r1, #0x7
    add r3, r2, #0x4
    ubfx r4, r1, #3,  #10       /* ways for cache */
    ubfx r5, r1, #13, #15       /* sets for cache */

    clz r6, r4                  /* calculate bit offset for “way” in DCISW */
    ldr r7, =DCISW_BASE_ADDR
Dcache_invalidate_all_loop1:
    mov r8, r4
    lsl r9, r5, r3

Dcache_invalidate_all_loop2:
    lsl r10, r8,  r6
    orr r10, r10, r9
    str r10, [r7]
    subs r8, r8, #1
    bge Dcache_invalidate_all_loop2

    subs r5, r5, #1
    bge Dcache_invalidate_all_loop1
    dsb
    isb
    pop {r4-r12, lr}
    mov pc, lr

    .section .text.cache
    .type Dcache_clean_all, %function
/* Data cache clean all to by set_way */
Dcache_clean_all:
    mov pc, lr

    .section .text.cache
    .type Dcache_invalidate_by_address, %function
/* Data cache invalidate by address to the Point of Coherency(PoC) */
Dcache_invalidate_by_address:

    .section .text.cache
    .type Dcache_clean_by_address, %function
/* Data cache clean by address to the PoC */
Dcache_clean_by_address:

    .section .text.cache
    .type Dcache_clean_and_invalidate_by_address, %function
/* Data cache clean and invalidate by address to the PoC */
Dcache_clean_and_invalidate_by_address:

    .end
