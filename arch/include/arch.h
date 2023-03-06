/**
 * @file arch.h
 * @author czlimx (czlimx@163.com)
 * @brief 
 * @version 0.1
 * @date 2023-03-04
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#ifndef ARCH_M7_H_
#define ARCH_M7_H_

/* System control register */
#define SCR_BASE_ADDR       0xE000ED10
#define SCR_SEVONPEND       4
#define SCR_SLEEPDEEP       2
#define SCR_SLEEPONEXIT     1

/* Configuration and control register */
#define CCR_BASE_ADDR       0xE000ED14
#define CCR_BP              18
#define CCR_IC              17
#define CCR_DC              16
#define CCR_STKALIGN        9
#define CCR_BFHFNMIGN       8
#define CCR_DIV_0_TRP       4
#define CCR_UNALIGN_TRP     3
#define CCR_USERSETMPEND    1
#define CCR_NONBASETHRDENA  0

/* System handler control and state register */
#define SHCSR_BASE_ADDR     0xE000ED24
/* UsageFault enable bit, set to 1 to enable */
#define SHCSR_USGFAULTENA       18
/* BusFault enable bit, set to 1 to enable */
#define SHCSR_BUSFAULTENA       17
/* MemManage enable bit, set to 1 to enable */
#define SHCSR_MEMFAULTENA       16
/* SVCall pending bit, reads as 1 if exception is pending */
#define SHCSR_SVCALLPENDED      15
/* BusFault exception pending bit, reads as 1 if exception is pending */
#define SHCSR_BUSFAULTPENDED    14
/* MemManage exception pending bit, reads as 1 if exception is pending */
#define SHCSR_MEMFAULTPENDED    13
/* UsageFault exception pending bit, reads as 1 if exception is pending */
#define SHCSR_USGFAULTPENDED    12
/* SysTick exception active bit, reads as 1 if exception is active */
#define SHCSR_SYSTICKACT        11
/* PendSV exception active bit, reads as 1 if exception is active */
#define SHCSR_PENDSVACT         10
/* Debug monitor active bit, reads as 1 if Debug monitor is active */
#define SHCSR_MONITORACT        8
/* SVCall active bit, reads as 1 if SVC call is active */
#define SHCSR_SVCALLACT         7
/* UsageFault exception active bit, reads as 1 if exception is active */
#define SHCSR_USGFAULTACT       3
/*  BusFault exception active bit, reads as 1 if exception is active */
#define SHCSR_BUSFAULTACT       1
/* MemManage exception active bit, reads as 1 if exception is active */
#define SHCSR_MEMFAULTACT       0

#ifndef ASSEMBLY

#endif /* ASSEMBLY */


#endif /* ARCH_M7_H_ */