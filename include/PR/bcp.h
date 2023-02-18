#ifndef BCP_H
#define BCP_H

#include "rcp.h"

/**
 * Additional MIPS Interface (MI) Registers
 */

#define MI_10_REG   (MI_BASE_REG + 0x10)

#define MI_14_REG   (MI_BASE_REG + 0x14)

#define MI_18_REG   (MI_BASE_REG + 0x18)

#define MI_38_REG   (MI_BASE_REG + 0x38)


/**
 * Additional Peripheral Interface (PI) Registers
 */

#define PI_48_REG           (PI_BASE_REG + 0x48)

#define PI_AES_CTRL_REG     (PI_BASE_REG + 0x50) // for writing
#define PI_AES_CMD          0x80000000
#define PI_AES_STATUS_REG   (PI_BASE_REG + 0x50) // for reading
#define PI_AES_BUSY         0x80000000

#define PI_60_REG           (PI_BASE_REG + 0x60)

#define PI_64_REG           (PI_BASE_REG + 0x64)

#define PI_70_REG           (PI_BASE_REG + 0x70)

#define PI_10000_BUF(n)     (PI_BASE_REG + 0x10000 + (n))

#define PI_10404_REG        (PI_BASE_REG + 0x10404)

#define PI_AES_EXPANDED_KEY_BUF(n)  (PI_BASE_REG + 0x10420 + 4 * (n))

#define PI_AES_IV_BUF(n)    (PI_BASE_REG + 0x104D0 + 4 * (n))

#define PI_20000_REG        (PI_BASE_REG + 0x20000)

#define PI_RDB_E0000_REG    (PI_BASE_REG + 0xE0000)

#define PI_FFFEA_REG        (PI_BASE_REG + 0xFFFEA)

#define PI_FFFFA_REG        (PI_BASE_REG + 0xFFFFA)


/**
 * RDB 
 */

#ifdef _LANGUAGE_ASSEMBLY
#define RDB_SHORT_WR(addr, reg) \
    sh reg, addr

#define RDB_SHORT_RD(addr, reg) \
    lw reg, addr

#define RDB_WRITE_16(val)                       \
    li      t7, val                            ;\
    sh      t7, PHYS_TO_K1(PI_RDB_E0000_REG)   ;\
    lw      t7, PHYS_TO_K1(PI_20000_REG)

#define RDB_WRITE_REG(reg)                      \
    sh      reg, PHYS_TO_K1(PI_RDB_E0000_REG)  ;\
    srl     t7, reg, 0x10                      ;\
    sh      t7, PHYS_TO_K1(PI_RDB_E0000_REG)   ;\
    lw      t7, PHYS_TO_K1(PI_20000_REG)

#else
#define RDB_SHORT_WR(addr, val) \
    (*(volatile u16*)PHYS_TO_K1(addr) = (val))

#define RDB_SHORT_RD(addr) \
    (*(volatile u16*)PHYS_TO_K1(addr))

#define RDB_WRITE_16(val)                       \
    {                                           \
        RDB_SHORT_WR(PI_RDB_E0000_REG, (val));  \
        RDB_SHORT_RD(PI_20000_REG);             \
    }(void)0
#endif

/**
 * Virage2
 */

#define VIRAGE2_BASE_ADDR   0x1FCA0000

#define VIRAGE2_STATUS_REG  (VIRAGE2_BASE_ADDR + 0xC000)

// Contents offsets

// 0 <= n < 5
#define VIRAGE2_SK_HASH(n)  (VIRAGE2_BASE_ADDR + (n) * 4)

// 0 <= n < 16
#define VIRAGE2_ROMPATCH(n) (VIRAGE2_BASE_ADDR + 0x14 + (n) * 4)

#endif
