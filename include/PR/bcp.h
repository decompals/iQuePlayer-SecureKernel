#ifndef BCP_H
#define BCP_H

#include "rcp.h"

/**
 * Additional MIPS Interface (MI) Registers
 */

#define MI_10_REG             (MI_BASE_REG + 0x10)

#define MI_SK_EXCEPTION_REG   (MI_BASE_REG + 0x14)

#define MI_18_REG             (MI_BASE_REG + 0x18)

#define MI_1C_REG             (MI_BASE_REG + 0x1C)

#define MI_RANDOM_BIT         (MI_BASE_REG + 0x2C)

#define MI_HW_INTR_REG        (MI_BASE_REG + 0x38)

#define MI_3C_REG             (MI_BASE_REG + 0x3C)

/**
 * Additional Peripheral Interface (PI) Registers
 */

#define PI_CARD_STATUS_REG  (PI_BASE_REG + 0x38)

#define PI_CARD_CNT_REG     (PI_BASE_REG + 0x48)

#define PI_AES_CTRL_REG     (PI_BASE_REG + 0x50) // for writing
#define PI_AES_EXEC_CMD     0x80000000
#define PI_AES_STATUS_REG   (PI_BASE_REG + 0x50) // for reading
#define PI_AES_BUSY         0x80000000

#define PI_ALLOWED_IO       (PI_BASE_REG + 0x54)

#define PI_EX_RD_LEN_REG    (PI_BASE_REG + 0x58)

#define PI_EX_WR_LEN_REG    (PI_BASE_REG + 0x5C)

#define PI_MISC_REG         (PI_BASE_REG + 0x60)

#define PI_64_REG           (PI_BASE_REG + 0x64)

#define PI_CARD_BLK_OFFSET_REG      (PI_BASE_REG + 0x70)

#define PI_10000_BUF_START  (PI_BASE_REG + 0x10000)
#define PI_10000_BUF(n)     (PI_10000_BUF_START + (n))

#define PI_10400_REG        (PI_BASE_REG + 0x10400)

#define PI_10404_REG        (PI_BASE_REG + 0x10404)

#define PI_AES_EXPANDED_KEY_BUF(n)  (PI_BASE_REG + 0x10420 + 4 * (n))

#define PI_AES_IV_BUF(n)    (PI_BASE_REG + 0x104D0 + 4 * (n))

#define PI_20000_REG        (PI_BASE_REG + 0x20000)

#define PI_RDB_E0000_REG    (PI_BASE_REG + 0xE0000)

#define PI_FFFEA_REG        (PI_BASE_REG + 0xFFFEA)

#define PI_FFFFA_REG        (PI_BASE_REG + 0xFFFFA)


/**
 * Additional RDRAM Interface (RI) Registers
 */

// Info from K4D263238E-GC33 datasheet
// Describes the init process using the MODE register
// MODE register seems to be the only thing "native" to the DRAM, the others are for the memory controller?

#undef RI_MODE_REG // undef the rcp.h definition
#define RI_MODE_REG (RI_BASE_REG + 0x20)

// Extended Mode, the meaning of bits [11: 0] changes
#define RI_MODE_NEXTENDED (0 << 13)
#define RI_MODE_EXTENDED  (1 << 13) // TODO check shift

// Burst Length
#define RI_MODE_BURST_LEN_2    ((1) << 0) // 0b001
#define RI_MODE_BURST_LEN_4    ((2) << 0) // 0b010
#define RI_MODE_BURST_LEN_8    ((3) << 0) // 0b011
#define RI_MODE_BURST_LEN_PAGE ((7) << 0) // 0b111, valid only for Sequential Burst Type

// Burst Type
#define RI_MODE_BT_SEQ    (0 << 3)
#define RI_MODE_BT_INTERL (1 << 3)

// CAS Latency
#define RI_MODE_CAS_LATENCY_3 ((3) << 4)
#define RI_MODE_CAS_LATENCY_4 ((4) << 4)
#define RI_MODE_CAS_LATENCY_5 ((5) << 4)

// Test Mode
#define RI_MODE_TM_NORMAL (0 << 7)
#define RI_MODE_TM_TEST   (1 << 7)

// DLL
#define RI_MODE_DLL_NRESET (0 << 8)
#define RI_MODE_DLL_RESET  (1 << 8)

// Extended: DLL Enable
#define RI_MODE_DLL_ENABLE  (0 << 0)
#define RI_MODE_DLL_DISABLE (1 << 0)

// Extended: Driver Impedance Control
#define RI_MODE_DIC_WEAK ((1 << 1) | (0 << 6))

// Command: Auto Refresh
#define RI_MODE_CMD_AUTO_REFRESH  (1 << 30)
#define RI_MODE_CMD_PRECHARGE_ALL (1 << 31)

#define RI_30_REG   (RI_BASE_REG + 0x30)
#define RI_40_REG   (RI_BASE_REG + 0x40)
#define RI_60_REG   (RI_BASE_REG + 0x60)
#define RI_80_REG   (RI_BASE_REG + 0x80)


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
 * USB0 controller 
 */

#define USB0_BASE_ADDR      0x04900000

#define USB0_STATUS_REG     (USB0_BASE_ADDR + 0x40010) // for reading

#define USB0_CTRL_REG       (USB0_BASE_ADDR + 0x40010) // for writing

/**
 * USB1 controller 
 */

#define USB1_BASE_ADDR      0x04A00000

#define USB1_STATUS_REG     (USB1_BASE_ADDR + 0x40010) // for reading

#define USB1_CTRL_REG       (USB1_BASE_ADDR + 0x40010) // for writing

/**
 * Virage0
 */

#define VIRAGE0_BASE_ADDR  0x1FC80000

#define VIRAGE0_STATUS_REG  (VIRAGE0_BASE_ADDR + 0xC000)

/**
 * Virage1
 */

#define VIRAGE1_BASE_ADDR  0x1FC90000

#define VIRAGE1_STATUS_REG  (VIRAGE1_BASE_ADDR + 0xC000)

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
