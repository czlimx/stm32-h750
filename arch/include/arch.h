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

#ifndef ASSEMBLY

#endif /* ASSEMBLY */


#endif /* ARCH_M7_H_ */