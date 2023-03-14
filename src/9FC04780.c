#include "bbtypes.h"
#include "string.h"
#include "macros.h"

extern s16 D_9FC0BE30[];
extern s16 D_9FC0BE40[];
extern u8 D_9FC0BE50[];

void func_9FC04780(s32 a0, s32 a1, u32 (*a2)[7], s32 *a3) {
    if (a1 > 25) {
        (*a3)++;
    }

    if (a1 > 6) {
        a1 = 6;
    }

    a2[a0][a1]++;
}

s32 func_9FC047CC(u8* a0, s32 a1) {
    s32 sp10[16];
    u32 sp50[2][7];
    s32 sp88 = 0;
    u32 tmp0;
    u32 tmp1;
    u32 tmp2;
    u32 tmp3;
    u8* i = a0;
    s32 j;

    tmp0 = 0;

    for (; i < a0 + a1; i++) {
        tmp0 += D_9FC0BE50[*i];
    }

    if (tmp0 - 0x25fe >= 0x225) {
        sp88++;
    }

    memset(sp10, 0, sizeof(sp10));

    for (i = a0; i < a0 + a1; i++) {
        sp10[*i % 16]++;
        sp10[*i / 16]++;
    }

    tmp1 = 0;

    for (j = 0; j < 16; j++) {
        tmp1 += sp10[j] * sp10[j];
    }

    if (tmp1 * 16 / 5000 - 0x138b >= 0x2b) {
        sp88++;
    }

    memset(sp50, 0, sizeof(sp50));

    tmp2 = *a0 >> 7;
    tmp3 = 0;

    for (i = a0; i < a0 + a1; i++) {
        tmp0 = *i;

        for (j = 7; j >= 0; j--) {
            u32 bit = (tmp0 >> j) & 1;

            if (bit != tmp2) {
                func_9FC04780(tmp2, tmp3, sp50, &sp88);
                tmp3 = 0;
                tmp2 = bit;
            }

            tmp3++;
        }
    }

    func_9FC04780(tmp2, tmp3, sp50, &sp88);

    for (tmp3 = 1; tmp3 < 7; tmp3++) {
        for (tmp2 = 0; tmp2 < 2; tmp2++) {
            if (sp50[tmp2][tmp3] <= D_9FC0BE30[tmp3] || sp50[tmp2][tmp3] >= D_9FC0BE40[tmp3]) {
                sp88++;
            }
        }
    }

    if (sp88) {
        return -1;
    }

    return 0;
}
