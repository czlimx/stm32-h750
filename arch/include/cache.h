/**
 * @file cache.h
 * @author czlimx (czlimx@163.com)
 * @brief 
 * @version 0.1
 * @date 2023-03-04
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#ifndef ARCH_CACHE_H_
#define ARCH_CACHE_H_

#define ICIALLU_BASE_ADDR     0xE000EF50
#define ICIMVAU_BASE_ADDR     0xE000EF58
#define DCIMVAC_BASE_ADDR     0xE000EF5C
#define DCISW_BASE_ADDR       0xE000EF60
#define DCCMVAU_BASE_ADDR     0xE000EF64
#define DCCMVAC_BASE_ADDR     0xE000EF68
#define DCCSW_BASE_ADDR       0xE000EF6C
#define DCCIMVAC_BASE_ADDR    0xE000EF70
#define DCCISW_BASE_ADDR      0xE000EF74
#define CLIDR_BASE_ADDR       0xE000ED78
#define CTR_BASE_ADDR         0xE000ED7C
#define CCSIDR_BASE_ADDR      0xE000ED80
#define CSSELR_BASE_ADDR      0xE000ED84

#ifndef ASSEMBLY

void Icache_enable(void);
void Icache_disable(void);
void Dcache_enable(void);
void Dcache_disable(void);
void Icache_invalidate_all(void);
void Dcache_invalidate_all(void);
void Dcache_clean_all(void);
void Dcache_invalidate_by_address(unsigned int address, unsigned int size);
void Dcache_clean_by_address(unsigned int address, unsigned int size);
void Dcache_clean_and_invalidate_by_address(unsigned int address, unsigned int size);

#endif /* ASSEMBLY */


#endif /* ARCH_CACHE_H_ */