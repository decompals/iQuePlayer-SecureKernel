#include "include_asm.h"
#include "bbtypes.h"
#include "libcrypto/sha1.h"
#include "bcp.h"
#include "macros.h"

extern BbContentMetaDataHead contentMetaDataHead;
extern BbTicketHead ticketHead;
extern BbVirage2* virage2_offset;
extern s16 D_9FC0EBB2;
extern s32 D_9FC0EBB8;
extern u32 D_9FC0ED30;
extern u32 D_9FC0F0DC;
extern u32 D_9FC0F0E0[0x7A]; // AesKeyInstance
extern u32 D_9FC0F2C8[5]; // AesCipherInstance
extern u32 D_9FC0F2DC;
extern u32 D_9FC0F2E0;
extern BbAesIv D_9FC0F2E4;
extern s32 D_9FC0F304;
extern BbVirage01 D_9FC0F308;
extern u16 g_cur_proc_trial_type;
extern s32 g_trial_time_elapsed;
extern SHA1Context sha1_ctx;

void startup(void);

void write_virage01_data(BbVirage01*);

s32 check_cert_ranges(BbCertBase**);

s32 check_ticket_bundle_ranges(BbTicketBundle* bundle) {
    if (CHECK_UNTRUSTED(bundle) && CHECK_UNTRUSTED(bundle->ticket) && check_cert_ranges(bundle->ticketChain) &&
        check_cert_ranges(bundle->cmdChain)) {
        return TRUE;
    }

    return FALSE;
}

INCLUDE_ASM("asm/non_matchings/9FC00B40", func_9FC00BAC);

s32 skGetId(BbId* id) {
    if (!CHECK_UNTRUSTED(id)) {
        return -1;
    }
    *id = virage2_offset->bbId;
    return 0;
}

// TODO: a1 type unknown
s32 func_9FC00DCC(BbTicketBundle* bundle, void* a1, RecryptList* recryptList, s32 a3) {
    s32 ret;

    if (!check_ticket_bundle_ranges(bundle)) {
        return -1;
    }

    if (a3 && (bundle->ticket->cmd.head.execFlags & 2) == 0) {
        return 1;
    }

    if (!check_untrusted_ptr_range(a1, 0x54, 4) || !CHECK_UNTRUSTED_RECRYPT_LIST(recryptList)) {
        return -1;
    }

    ret = check_ticket_bundle_revocations(bundle, a1);

    if (ret == 0) {
        ret = func_9FC00BAC(bundle);

        if (ret == 0) {
            return 0;
        }
    }

    return ret;
}

// TODO: a1 type unknown
s32 skLaunchSetup(BbTicketBundle* bundle, void* a1, RecryptList* recryptList) {
    BbAesKey sp10;
    BbAesKey* key;
    BbTicketHead* head;
    s32 ret;

    ret = func_9FC00DCC(bundle, a1, recryptList, FALSE);

    if (ret) {
        return ret;
    }

    head = &bundle->ticket->head;

    if (contentMetaDataHead.execFlags & 2) {
        if (recryptList == NULL) {
            return -1;
        }

        ret = recrypt_list_get_key_for_cid(recryptList, &sp10, contentMetaDataHead.id);

        if (ret != 2) {
            return ret;
        }

        aes_cbc_set_key_iv(&sp10, &contentMetaDataHead.iv);
    } else {
        aes_cbc_set_key_iv(&contentMetaDataHead.key, &contentMetaDataHead.iv);
    }

    memcpy(&ticketHead, head, sizeof(BbTicketHead));
    IO_WRITE(PI_AES_CTRL_REG, 0);

    return 0;
}

INCLUDE_ASM("asm/non_matchings/9FC00B40", skLaunch);

s32 skRecryptListValid(RecryptList* recryptList) {
    if (!CHECK_UNTRUSTED_RECRYPT_LIST(recryptList)) {
        return -1;
    }

    return recrypt_list_verify_size_and_sig(recryptList);
}

// TODO: a1 type unknown
s32 skRecryptBegin(BbTicketBundle* bundle, void* a1, RecryptList* recryptList) {
    BbAesKey sp10;
    BbTicketHead* head;
    s32 ret;

    head = &bundle->ticket->head;
    ret = func_9FC00DCC(bundle, a1, recryptList, TRUE);

    if (ret) {
        return ret;
    }

    ret = recrypt_list_get_key_for_cid(recryptList, &sp10, contentMetaDataHead.id);

    if (ret == 3) {
        D_9FC0F2DC = 1;
        aes_cbc_set_key_iv(&sp10, &contentMetaDataHead.iv);
    } else {
        D_9FC0F2DC = 0;
        aes_cbc_set_key_iv(&contentMetaDataHead.key, &contentMetaDataHead.iv);
        aesCipherInit(&D_9FC0F2C8, 2, &contentMetaDataHead.iv);
        recrypt_list_add_new_entry(recryptList, contentMetaDataHead.id, 3);
    }

    aesMakeKey(&D_9FC0F0E0, 0, 0x80, &sp10);
    SHA1Reset(&sha1_ctx);
    memcpy(&ticketHead, head, sizeof(BbTicketHead));

    D_9FC0F0DC = 0;
    D_9FC0F2E0 = 0;

    return ret;
}

INCLUDE_ASM("asm/non_matchings/9FC00B40", func_9FC0134C);

s32 skRecryptData(u8* buf, s32 size) {
    BbAesIv* iv1;
    BbAesIv* iv2;

    if (buf != NULL && !CHECK_UNTRUSTED_ARRAY(buf, size)) {
        return -1;
    }

    if (D_9FC0F2DC == 1) {
        iv1 = &D_9FC0F2E4;
        iv2 = (BbAesIv *) (buf + size - sizeof(BbAesIv));

        if (buf == NULL) {
            iv1 = &contentMetaDataHead.iv;
            iv2 = &contentMetaDataHead.iv;
        }

        aesCipherInit(&D_9FC0F2C8, 2, iv1);
        aes_cbc_set_key_iv(contentMetaDataHead.key, iv2);

        D_9FC0F2E0 = 0;
        D_9FC0F2DC = 0;

        return 0;
    }

    func_9FC0134C(buf, size, 1);

    return 0;
}

s32 skRecryptComputeState(u8* buf, s32 size) {
    BbAesIv* src = (BbAesIv *) (buf + size - sizeof(BbAesIv));

    if (!CHECK_UNTRUSTED_ARRAY(buf, size)) {
        return -1;
    }

    memcpy(&D_9FC0F2E4, src, sizeof(BbAesIv));
    func_9FC0134C(buf, size, 0);

    return 0;
}

s32 skRecryptEnd(RecryptList* recryptList) {
    BbShaHash digest;

    if (!CHECK_UNTRUSTED_RECRYPT_LIST(recryptList)) {
        return -1;
    }

    SHA1Result(&sha1_ctx, digest);

    if (memcmp(digest, &contentMetaDataHead.hash, sizeof(BbShaHash)) != 0) {
        return -1;
    }

    if (recrypt_list_add_new_entry(recryptList, contentMetaDataHead.id, 2)) {
        return -1;
    }

    return 0;
}

s32 skSignHash(BbShaHash* hash, BbEccSig* outSignature) {
    if (!CHECK_UNTRUSTED(hash)) {
        return -1;
    }

    if (!CHECK_UNTRUSTED(outSignature)) {
        return -1;
    }

    func_9FC03694(hash, sizeof(*hash), virage2_offset->privateKey, outSignature, 1);

    return 0;
}

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
