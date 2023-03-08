#include "include_asm.h"
#include "bbtypes.h"
#include "bcp.h"
#include "macros.h"

extern BbTicketHead ticketHead;
extern BbVirage2* virage2_offset;
extern BbVirage01 D_9FC0F308;
extern s16 D_9FC0EBB2;
extern s32 D_9FC0EBB8;
extern u32 D_9FC0ED30;
extern s32 D_9FC0F304;
extern u16 g_cur_proc_trial_type;
extern s32 g_trial_time_elapsed;

void startup(void);

void write_virage01_data(BbVirage01*);

s32 check_cert_ranges(BbCertBase*);



s32 check_ticket_bundle_ranges(BbTicketBundle* bundle) {
    if (CHECK_UNTRUSTED(bundle) && CHECK_UNTRUSTED(bundle->ticket) && check_cert_ranges(bundle->ticketChain) &&
        check_cert_ranges(bundle->cmdChain)) {
        return 1;
    }
    return 0;
}

INCLUDE_ASM("asm/non_matchings/9FC00B40", func_9FC00BAC);

s32 skGetId(BbId* id) {
    if (!CHECK_UNTRUSTED(id)) {
        return -1;
    }
    *id = virage2_offset->bbId;
    return 0;
}

INCLUDE_ASM("asm/non_matchings/9FC00B40", func_9FC00DCC);

INCLUDE_ASM("asm/non_matchings/9FC00B40", skLaunchSetup);

INCLUDE_ASM("asm/non_matchings/9FC00B40", skLaunch);

INCLUDE_ASM("asm/non_matchings/9FC00B40", skRecryptListValid);

INCLUDE_ASM("asm/non_matchings/9FC00B40", skRecryptBegin);

INCLUDE_ASM("asm/non_matchings/9FC00B40", func_9FC0134C);

INCLUDE_ASM("asm/non_matchings/9FC00B40", skRecryptData);

INCLUDE_ASM("asm/non_matchings/9FC00B40", skRecryptComputeState);

INCLUDE_ASM("asm/non_matchings/9FC00B40", skRecryptEnd);

INCLUDE_ASM("asm/non_matchings/9FC00B40", skSignHash);

INCLUDE_ASM("asm/non_matchings/9FC00B40", skVerifyHash);

s32 skGetConsumption(u16* tidWindow, u16* cc) {
    if (!CHECK_UNTRUSTED(tidWindow) || !CHECK_UNTRUSTED_ARRAY(cc, ARRAY_COUNT(D_9FC0F308.cc))) {
        return -1;
    }
    *tidWindow = D_9FC0F308.tidWindow;
    memcpy(cc, D_9FC0F308.cc, sizeof(D_9FC0F308.cc));
    return 0;
}

void skAdvanceTicketWindow(void) {
    s32 i;

    for (i = 0; i < ARRAY_COUNT(D_9FC0F308.cc) - 1; i++) {
        D_9FC0F308.cc[i] = D_9FC0F308.cc[i + 1];
    }
    D_9FC0F308.cc[i] = 0;
    D_9FC0F308.tidWindow++;
    write_virage01_data(&D_9FC0F308);
}

s32 skSetLimit(u16 limit, u16 code) {
    if (ticketHead.issuer[0] == 0) {
        return -1;
    }
    if ((s16)ticketHead.tid < 0) {
        if (ticketHead.code >= 3) {
            ticketHead.code = code;
            ticketHead.limit = limit;
        } else if (limit < ticketHead.limit) {
            ticketHead.limit = limit;
        }
    } else {
        ticketHead.code = code;
        ticketHead.limit = limit;
    }
    return 0;
}

s32 skExit(void) {
    startup();
    return 0;
}

s32 skKeepAlive(void) {
    u32 temp_a0;
    u32 incr = 0xC800 - (IO_READ(MI_18_REG) >> 0x10);

    if (g_cur_proc_trial_type != 0) {
        return 0;
    }

    D_9FC0ED30 += incr;
    if (D_9FC0ED30 > 0xC800) {
        D_9FC0ED30 -= 0xC800;
        g_trial_time_elapsed++;
    }

    temp_a0 = g_trial_time_elapsed * 16;
    D_9FC0EBB2 = (temp_a0 + 30) / 60;

    if (temp_a0 >= D_9FC0F304 * 60) {
        D_9FC0EBB8 = 8;
        startup();
    }

    IO_WRITE(MI_18_REG, 0x7530C800);
    return 0;
}
