#include "bcp.h"
#include "ultratypes.h"

void delay(s32 arg0) {
    s32 i;

    for(i = 0; i < arg0; i++);
}

void initialize_virage_controller(void* controller) {
    u32 temp = (u32)controller & 0xFFFF0000;

    IO_WRITE(temp + 0x8000, 0x8A);
    IO_WRITE(temp + 0x8004, 0x13);
    IO_WRITE(temp + 0x8008, 0x80);
    IO_WRITE(temp + 0x800C, 0x92);
    IO_WRITE(temp + 0x8010, 0x18);
    IO_WRITE(temp + 0x8014, 5);
}

void initialize_virage_controllers(void) {
    IO_WRITE(VIRAGE2_STATUS_REG, 0);
    initialize_virage_controller(VIRAGE0_STATUS_REG);
    initialize_virage_controller(VIRAGE1_STATUS_REG);
    initialize_virage_controller(VIRAGE2_STATUS_REG);
}

s32 write_virage_data(void* controller, s32 *data, s32 size) {
    s32 temp_a0;
    s32 temp_a1;
    s32 temp_lo;
    s32 temp_s1;
    u32 temp_s4;
    s32 i;
    u32 temp;
    u32 temp2;

    temp_s4 = (u32)controller & 0xFFFF0000;
    temp_s1 = func_9FC04220();
    IO_WRITE(controller, 0);
    IO_WRITE(MI_1C_REG, (1000 / temp_s1) + 1);
    delay(640000 / temp_s1);
    temp = IO_READ(controller);
    if (temp & 1) {
        temp_lo = 20000 / temp_s1;
        delay(temp_lo);
        delay(temp_lo);
        temp = IO_READ(controller);
        if (temp & 1) {
            return -1;
        }
    }

    temp = IO_READ(controller);
    if (!(temp & 0x40000000)) {
        return -1;
    }

    for(i = 0; i < size; i++) {
        IO_WRITE(temp_s4 + (i * 4), data[i]);
        temp = IO_READ(temp_s4 + (i * 4));
        if(temp != data[i]) {
            return -1;
        }
    }

    if (func_9FC04304(controller) != 0) {
        return -1;
    }

    for(i = 0; i < size; i++) {
        IO_WRITE(temp_s4 + (i * 4), 0);
        temp = IO_READ(temp_s4 + (i * 4));
        if(temp != 0) {
            return -1;
        }
    }

    if (func_9FC0425C(controller) != 0) {
        return -1;
    }

    for(i = 0; i < size; i++) {
        temp = IO_READ(temp_s4 + (i * 4));
        if(temp != data[i]) {
            return -1;
        }
    }

    return 0;
}

s32 func_9FC04220(void) {
    u32 temp = (IO_READ(PI_MISC_REG) >> 25) & 3;

    if(temp == 0) {
        return 16;
    } else if(temp == 1) {
        return 12;
    } else {
       return 10;
    }
}

s32 func_9FC0425C(void* controller) {
    u32 temp = (u32)controller | 0x2000;
    s32 baseDelay;

    baseDelay = 44018 / func_9FC04220();
    IO_WRITE(temp, 0x03000000);
    delay(baseDelay + 100);
    delay(baseDelay + 400);
    if (!(IO_READ(controller) & 0x40000000)) {
        return -1;
    }
    return 0;
}

s32 func_9FC04304(void* controller) {
    u32 temp2 = (u32)controller;
    u32 temp = (u32)controller | 0x2000;
    s32 var_v1;

    IO_WRITE(temp, 0x02000000);
    delay(100);
    var_v1 = IO_READ(temp2);
    if (var_v1 & 0x40000000) {
        return -1;
    }

    for(var_v1 = IO_READ(temp2); !(var_v1 & 0x40000000); var_v1 = IO_READ(temp2)) {
        delay(100);
    }

    if (!(var_v1 & 0x20000000)) {
        return -1;
    }
    return 0;
}
