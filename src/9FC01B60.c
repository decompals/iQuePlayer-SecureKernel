#include "include_asm.h"
#include "bcp.h"

// Info from K4D263238E-GC33 datasheet
// Describes the init process using the MODE register
// MODE register seems to be the only thing "native" to the DRAM, the others are for the memory controller?

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

INCLUDE_ASM("asm/non_matchings/9FC01B60", func_9FC01B60);

INCLUDE_ASM("asm/non_matchings/9FC01B60", func_9FC01B88);

INCLUDE_ASM("asm/non_matchings/9FC01B60", func_9FC01C24);

void dram_init(void) {
    s32 i;

    IO_READ(PI_60_REG);

    IO_WRITE(RI_MODE_REG, RI_MODE_CMD_PRECHARGE_ALL);
    IO_READ(RI_MODE_REG);
    IO_WRITE(RI_MODE_REG, RI_MODE_EXTENDED | RI_MODE_DIC_WEAK | RI_MODE_DLL_ENABLE);
    IO_READ(RI_MODE_REG);
    IO_WRITE(RI_MODE_REG, RI_MODE_DLL_RESET);
    IO_READ(RI_MODE_REG);
    IO_WRITE(RI_MODE_REG, RI_MODE_CMD_PRECHARGE_ALL);
    IO_READ(RI_MODE_REG);
    IO_WRITE(RI_MODE_REG, RI_MODE_CMD_AUTO_REFRESH);
    IO_READ(RI_MODE_REG);
    IO_WRITE(RI_MODE_REG, RI_MODE_CMD_AUTO_REFRESH);
    IO_READ(RI_MODE_REG);
    IO_WRITE(RI_MODE_REG, RI_MODE_DLL_NRESET | RI_MODE_CAS_LATENCY_3 | RI_MODE_BT_INTERL | RI_MODE_BURST_LEN_4);
    IO_READ(RI_MODE_REG);
    IO_WRITE(RI_40_REG, 0x031111E4);
    IO_READ(RI_30_REG);
    IO_READ(RI_30_REG);
    IO_WRITE(RI_60_REG, 1);
    IO_READ(RI_30_REG);
    IO_WRITE(RI_80_REG, 1);
    IO_READ(RI_30_REG);

    for (i = 0; i < 100; i++) {
        IO_READ(RI_30_REG);
    }
    IO_WRITE(RI_30_REG, 0x000011E0);
    IO_READ(RI_30_REG);
}

INCLUDE_ASM("asm/non_matchings/9FC01B60", func_9FC01D54);

INCLUDE_ASM("asm/non_matchings/9FC01B60", func_9FC01FBC);

INCLUDE_ASM("asm/non_matchings/9FC01B60", func_9FC020C4);

INCLUDE_ASM("asm/non_matchings/9FC01B60", func_9FC022A8);

INCLUDE_ASM("asm/non_matchings/9FC01B60", func_9FC02488);

INCLUDE_ASM("asm/non_matchings/9FC01B60", write_virage2);

INCLUDE_ASM("asm/non_matchings/9FC01B60", check_trial_timer);
