#ifndef SDRV_RCC_H_
#define SDRV_RCC_H_

#define RCC_BASE_ADDR           0x58024400

/* gpio register list */
#define RCC_CR                      0x00
#define RCC_ICSCR                   0x04
#define RCC_HSICFGR                 0x04
#define RCC_CRRCR                   0x08
#define RCC_CSICFGR                 0x0C
#define RCC_CFGR                    0x10
#define RCC_D1CFGR                  0x18
#define RCC_D2CFGR                  0x1C
#define RCC_D3CFGR                  0x20
#define RCC_PLLCKSELR               0x28
#define RCC_PLLCFGR                 0x2C
#define RCC_PLL1DIVR                0x30
#define RCC_PLL1FRACR               0x34
#define RCC_PLL2DIVR                0x38
#define RCC_PLL2FRACR               0x3C
#define RCC_PLL3DIVR                0x40
#define RCC_PLL3FRACR               0x44
#define RCC_D1CCIPR                 0x4C
#define RCC_D2CCIP1R                0x50
#define RCC_D2CCIP2R                0x54
#define RCC_D3CCIPR                 0x58
#define RCC_CIER                    0x60
#define RCC_CIFR                    0x64
#define RCC_CICR                    0x68
#define RCC_BDCR                    0x70
#define RCC_CSR                     0x74
#define RCC_AHB3RSTR                0x7C
#define RCC_AHB1RSTR                0x80
#define RCC_AHB2RSTR                0x84
#define RCC_AHB4RSTR                0x88
#define RCC_APB3RSTR                0x8C
#define RCC_APB1LRSTR               0x90
#define RCC_APB1HRSTR               0x94
#define RCC_APB2RSTR                0x98
#define RCC_APB4RSTR                0x9C
#define RCC_GCR                     0xA0
#define RCC_D3AMR                   0xA8
#define RCC_RSR                     0xD0
#define RCC_AHB3ENR                 0xD4
#define RCC_AHB1ENR                 0xD8
#define RCC_AHB2ENR                 0xDC
#define RCC_AHB4ENR                 0xE0

#define RCC_APB3ENR                 0xE4
#define RCC_APB1LENR                0xE8
#define RCC_APB1HENR                0xEC
#define RCC_APB2ENR                 0xF0
#define RCC_APB4ENR                 0xF4
#define RCC_AHB3LPENR               0xFC
#define RCC_AHB1LPENR               0x100
#define RCC_AHB2LPENR               0x104
#define RCC_AHB4LPENR               0x108
#define RCC_APB3LPENR               0x10C
#define RCC_APB1LLPENR              0x110
#define RCC_APB1HLPENR              0x114
#define RCC_APB2LPENR               0x118
#define RCC_APB4LPENR               0x11C
#define RCC_C1_AHB3ENR              0x134
#define RCC_C1_AHB1ENR              0x138
#define RCC_C1_AHB2ENR              0x13C
#define RCC_C1_AHB4ENR              0x140
#define RCC_C1_APB3ENR              0x144
#define RCC_C1_APB1LENR             0x148
#define RCC_C1_APB1HENR             0x14C
#define RCC_C1_APB2ENR              0x150
#define RCC_C1_APB4ENR              0x154
#define RCC_C1_AHB3LPENR            0x158
#define RCC_C1_AHB1LPENR            0x160
#define RCC_C1_AHB2LPENR            0x164
#define RCC_C1_AHB4LPENR            0x168
#define RCC_C1_APB3LPENR            0x16C
#define RCC_C1_APB1LLPENR           0x170
#define RCC_C1_APB1HLPENR           0x174
#define RCC_C1_APB2LPENR            0x178
#define RCC_C1_APB4LPENR            0x17C

#ifndef ASSEMBLY

#endif /* ASSEMBLY */

#endif /* SDRV_RCC_H_ */