#include "bbtypes.h"
#include "string.h"
#include "macros.h"

const s16 D_9FC0BE30[8] = {
    0x0000, 0x090B, 0x045A, 0x020F, 0x00F0, 0x0067, 0x0067, 0x0000,
};

const s16 D_9FC0BE40[8] = {
    0x0000, 0x0A7D, 0x056A, 0x02D3, 0x0180, 0x00D1, 0x00D1, 0x0000,
};

const u8 popcount_table[] = {
    // clang-format off
    0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
    1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
    1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
    2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
    1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
    2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
    2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
    3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
    1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
    2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
    2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
    3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
    2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
    3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
    3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
    4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8,
    // clang-format on
};

void randomness_test_subroutine(s32 a0, s32 a1, u32 (*a2)[7], s32* fails) {
    if (a1 > 25) {
        (*fails)++;
    }

    if (a1 > 6) {
        a1 = 6;
    }

    a2[a0][a1]++;
}

/**
 * Determine whether the provided data is "sufficiently random" for the purposes of generating ECC signatures.
 *
 * @return
 *      0 If the data is sufficiently random.
 *     -1 If the data is not sufficiently random.
 */
s32 randomness_test(u8* data, u32 nbytes) {
    s32 sp10[16];
    u32 sp50[2][7];
    s32 numfails = 0;
    u32 tmp0;
    u32 tmp1;
    u32 tmp2;
    u32 tmp3;
    u8* h;
    s32 j;

    // Get the population count of the data sample
    for (h = data, tmp0 = 0; h < data + nbytes; h++) {
        tmp0 += popcount_table[*h];
    }

    if (tmp0 < 9726 || tmp0 > 10274) {
        numfails++;
    }

    memset(sp10, 0, sizeof(sp10));

    // Bin data in groups of 4 bits
    for (h = data; h < data + nbytes; h++) {
        sp10[*h % 16]++;
        sp10[*h / 16]++;
    }

    // Sum of squares of binned data
    tmp1 = 0;
    for (j = 0; j < (signed)ARRAY_COUNT(sp10); j++) {
        tmp1 += sp10[j] * sp10[j];
    }

    if (tmp1 * 16 / 5000 - 5003 >= 43) {
        numfails++;
    }

    memset(sp50, 0, sizeof(sp50));

    tmp2 = data[0] >> 7;
    tmp3 = 0;

    for (h = data; h < data + nbytes; h++) {
        tmp0 = *h;

        for (j = 7; j >= 0; j--) {
            u32 bit = (tmp0 >> j) & 1;

            if (bit != tmp2) {
                randomness_test_subroutine(tmp2, tmp3, sp50, &numfails);
                tmp3 = 0;
                tmp2 = bit;
            }

            tmp3++;
        }
    }

    randomness_test_subroutine(tmp2, tmp3, sp50, &numfails);

    for (tmp3 = 1; tmp3 < 7; tmp3++) {
        for (tmp2 = 0; tmp2 < 2; tmp2++) {
            if (sp50[tmp2][tmp3] <= (unsigned)D_9FC0BE30[tmp3] || sp50[tmp2][tmp3] >= (unsigned)D_9FC0BE40[tmp3]) {
                numfails++;
            }
        }
    }

    // If any failures, report bad quality
    if (numfails) {
        return -1;
    }
    // No failures, good enough quality
    return 0;
}
