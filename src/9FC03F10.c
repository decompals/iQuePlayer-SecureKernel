#include "bbtypes.h"
#include "bcp.h"

void delay(s32 n) {
    s32 i;

    for (i = 0; i < n; i++)
#ifdef NON_MATCHING
        __asm__ volatile ("")
#endif
        ;
}

void initialize_virage_controller(u32 statusReg) {
    u32 baseReg = statusReg & 0xFFFF0000;

    IO_WRITE(baseReg + 0x8000, 0x8A);
    IO_WRITE(baseReg + 0x8004, 0x13);
    IO_WRITE(baseReg + 0x8008, 0x80);
    IO_WRITE(baseReg + 0x800C, 0x92);
    IO_WRITE(baseReg + 0x8010, 0x18);
    IO_WRITE(baseReg + 0x8014, 0x05);
}

void initialize_virage_controllers(void) {
    IO_WRITE(VIRAGE2_STATUS_REG, 0);
    initialize_virage_controller(VIRAGE0_STATUS_REG);
    initialize_virage_controller(VIRAGE1_STATUS_REG);
    initialize_virage_controller(VIRAGE2_STATUS_REG);
}

/**
 * Writes new data into Virage memory, storing to the backing flash memory.
 * Performs error checking but little recovery.
 *
 * @return
 *     -1 If error for any reason
 *      0 If success
 */
s32 write_virage_data(u32 statusReg, u32 *data, s32 size) {
    s32 wait;
    s32 div;
    u32 baseReg = statusReg & 0xFFFF0000;
    s32 i;
    u32 status;

    div = get_clock_divider();

    // Reset something?
    IO_WRITE(statusReg, 0);
    // Wait for something?
    IO_WRITE(MI_1C_REG, (1000 / div) + 1);
    delay(640000 / div);
    // Bit 0 should be unset
    status = IO_READ(statusReg);
    if (status & VIRAGEx_STATUS_00000001) {
        // If it's set, wait more
        wait = 20000 / div;
        delay(wait);
        delay(wait);
        // If it's still set, fail
        status = IO_READ(statusReg);
        if (status & VIRAGEx_STATUS_00000001) {
            return -1;
        }
    }

    // Bit 30 better be set
    status = IO_READ(statusReg);
    if (!(status & VIRAGEx_STATUS_40000000)) {
        return -1;
    }

    // Write some data into SRAM
    for (i = 0; i < size; i++) {
        IO_WRITE(baseReg + i * 4, data[i]);
        status = IO_READ(baseReg + i * 4);
        if (status != data[i]) {
            return -1;
        }
    }

    // Store SRAM to Flash
    if (virage_store_sram(statusReg) != 0) {
        return -1;
    }

    // Write all 0s into SRAM
    for (i = 0; i < size; i++) {
        IO_WRITE(baseReg + i * 4, 0);
        status = IO_READ(baseReg + i * 4);
        if (status != 0) {
            return -1;
        }
    }

    // Reload Flash to SRAM
    if (virage_load_flash(statusReg) != 0) {
        return -1;
    }

    // Compare results
    for (i = 0; i < size; i++) {
        status = IO_READ(baseReg + i * 4);
        if (status != data[i]) {
            return -1;
        }
    }

    return 0;
}

s32 get_clock_divider(void) {
    u32 clockId = PI_GPIO_GET_CLOCK(IO_READ(PI_GPIO_REG));

    if (clockId == 0) {
        return 16;
    } else if (clockId == 1) {
        return 12;
    } else {
       return 10;
    }
}

/**
 * Loads Virage Flash to SRAM
 *
 * @return
 *     -1 If error
 *      0 If success
 */
s32 virage_load_flash(u32 statusReg) {
    u32 controlReg = statusReg | 0x2000;
    s32 baseDelay;

    baseDelay = 44018 / get_clock_divider();
    // Load flash -> sram
    IO_WRITE(controlReg, VIRAGEx_CMD_LOAD_FLASH);
    // Wait
    delay(baseDelay + 100);
    delay(baseDelay + 400);
    // If bit is unset following the delay, it failed?
    if (!(IO_READ(statusReg) & VIRAGEx_STATUS_40000000)) {
        return -1;
    }
    return 0;
}

/**
 * Stores Virage SRAM to Flash
 *
 * @return
 *     -1 If error
 *      0 If success
 */
s32 virage_store_sram(u32 statusReg) {
    u32 commandReg = statusReg | 0x2000;
    s32 status;

    // Start a store of SRAM -> Flash
    IO_WRITE(commandReg, VIRAGEx_CMD_STORE_SRAM);
    // Wait
    delay(100);
    // Bit 30 must NOT be set yet
    status = IO_READ(statusReg);
    if (status & VIRAGEx_STATUS_40000000) {
        return -1;
    }

    // Wait for bit 30 to be set
    for (status = IO_READ(statusReg); !(status & VIRAGEx_STATUS_40000000); status = IO_READ(statusReg)) {
        delay(100);
    }

    // If bit 29 isn't set, fail
    if (!(status & VIRAGEx_STATUS_20000000)) {
        return -1;
    }
    return 0;
}
