#include "bbtypes.h"
#include "string.h"
#include "bcp.h"
#include "libcrypto/aes.h"
#include "libcrypto/bsl.h"
#include "libcrypto/sha1.h"
#include "macros.h"

BbContentMetaDataHead contentMetaDataHead;
BbTicketHead ticketHead;

u32 D_9FC0ED30;
u32 D_9FC0F0DC;
AesKeyInstance D_9FC0F0E0;
AesCipherInstance D_9FC0F2C8;
u32 D_9FC0F2DC;
u32 D_9FC0F2E0;
BbAesIv D_9FC0F2E4;
u32 D_9FC0F304;
BbVirage01 D_9FC0F308;
u32 g_trial_time_elapsed;
SHA1Context sha1_ctx;

u16 D_9FC0EBB0 = 0xFFFF;
s16 D_9FC0EBB2 = 0;
u16 g_cur_proc_trial_type = 0xFFFF;
u32 D_9FC0EBB8 = 0;

s32 check_ticket_bundle_ranges(BbTicketBundle* bundle) {
    if (
            CHECK_UNTRUSTED(bundle) &&
            CHECK_UNTRUSTED(bundle->ticket) &&
            check_cert_ranges(bundle->ticketChain) &&
            check_cert_ranges(bundle->cmdChain)) {
        return TRUE;
    }

    return FALSE;
}

s32 func_9FC00BAC(BbTicketBundle* bundle) {
    BbAesKey key1;
    rsaDataBlock blocks[2];
    BbAesKey key2;
    u16* cc;
    s16 tid;
    BbTicketHead* head = &bundle->ticket->head;
    BbContentMetaDataHead* cmdHead = &bundle->ticket->cmd.head;

    if (verify_cert_chain(bundle->cmdChain, 2) != 0) {
        return -1;
    }

    if (verify_cert_chain(bundle->ticketChain, 1) != 0) {
        return -1;
    }

    if (head->bbId != virage2_offset->bbId) {
        return -1;
    }

    tid = head->tid;

    if (tid < 0) {
        cc = getTrialConsumptionByTid(head->tid);

        if (cc == NULL) {
            return -1;
        }

        if (head->code < 3 && *cc >= head->limit) {
            return -1;
        }
    }

    blocks[0].data = bundle->ticket;
    blocks[0].size = sizeof(BbTicket) - sizeof(BbRsaSig2048);

    if (rsa_verify_signature(
            blocks,
            1,
            ((BbRsaCert*) bundle->ticketChain[0])->publicKey,
            ((BbRsaCert*) bundle->ticketChain[0])->exponent,
            0,
            bundle->ticket->head.ticketSign) >= 0) {
        memcpy(&contentMetaDataHead, cmdHead, sizeof(BbContentMetaDataHead));
        eccGenAesKey(head->serverKey, virage2_offset->privateKey, key1);
        aes_SwDecrypt((u8*)key1, (u8*)head->cmdIv, (u8*)cmdHead->key, sizeof(BbAesKey), (u8*)contentMetaDataHead.key);

        blocks[0].data = &bundle->ticket->cmd.contentDesc;
        blocks[0].size = sizeof(BbContentDesc);
        blocks[1].data = &contentMetaDataHead;
        blocks[1].size = sizeof(BbContentMetaDataHead) - sizeof(BbRsaSig2048);

        if (rsa_verify_signature(
                blocks,
                2,
                ((BbRsaCert*) bundle->cmdChain[0])->publicKey,
                ((BbRsaCert*) bundle->cmdChain[0])->exponent,
                0,
                bundle->ticket->cmd.head.contentMetaDataSign) >= 0) {
            aes_SwDecrypt((u8*)virage2_offset->bootAppKey, (u8*)cmdHead->commonCmdIv, (u8*)contentMetaDataHead.key,
                          sizeof(BbAesKey), (u8*)key2);
            memcpy(contentMetaDataHead.key, key2, sizeof(BbAesKey));

            return 0;
        }
    }

    return -1;
}

s32 skGetId(BbId* id) {
    if (!CHECK_UNTRUSTED(id)) {
        return -1;
    }

    *id = virage2_offset->bbId;

    return 0;
}

s32 func_9FC00DCC(BbTicketBundle* bundle, BbAppLaunchCrls* crls, RecryptList* recryptList, s32 a3) {
    s32 ret;

    if (!check_ticket_bundle_ranges(bundle)) {
        return -1;
    }

    if (a3 && !(bundle->ticket->cmd.head.execFlags & 2)) {
        return 1;
    }

    if (!CHECK_UNTRUSTED(crls) || !CHECK_UNTRUSTED_RECRYPT_LIST(recryptList)) {
        return -1;
    }

    ret = check_ticket_bundle_revocations(bundle, crls);
    if (ret != 0) {
        return ret;
    }

    ret = func_9FC00BAC(bundle);
    if (ret != 0) {
        return ret;
    }

    return 0;
}

s32 skLaunchSetup(BbTicketBundle* bundle, BbAppLaunchCrls* crls, RecryptList* recryptList) {
    BbAesKey sp10;
    BbTicketHead* head;
    s32 ret;

    ret = func_9FC00DCC(bundle, crls, recryptList, FALSE);
    if (ret != 0) {
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

s32 skLaunch(void* app_entrypoint) {
    BbShaHash digest;
    u8* ptr;
    u16* cc;
    s32 a1;

    if (!check_untrusted_ptr_range(app_entrypoint, 0, 4)) {
        return -1;
    }

    if (!(contentMetaDataHead.execFlags & 2)) {
        ptr = (u8*) app_entrypoint - 0x1000;

        if (!check_untrusted_ptr_range(ptr, contentMetaDataHead.size, 4)) {
            return -1;
        }

        SHA1Reset(&sha1_ctx);
        SHA1Input(&sha1_ctx, ptr, contentMetaDataHead.size);
        SHA1Result(&sha1_ctx, (u8*)&digest);

        if (memcmp(&digest, contentMetaDataHead.hash, sizeof(BbShaHash)) != 0) {
            return -1;
        }
    }

    g_cur_proc_trial_type = 0xffff;
    D_9FC0F304 = ticketHead.limit;

    if ((s16) ticketHead.tid < 0) {
        cc = getTrialConsumptionByTid(ticketHead.tid);

        if (cc == NULL) {
            return -1;
        }

        if (*cc >= ticketHead.limit) {
            return -1;
        }

        g_cur_proc_trial_type = ticketHead.code;

        if (ticketHead.code == 2 || ticketHead.code == 0) {
            a1 = ((s32)D_9FC0F304 - *cc + 3) / 4;

            g_trial_time_elapsed = *cc * 15 >> 2;
            D_9FC0EBB2 = *cc;

            if (a1 > 0) {
                *cc += a1;
            } else {
                *cc = D_9FC0F304;
            }

            D_9FC0EBB0 = ticketHead.tid;
        } else {
            (*cc)++;
        }

        write_virage01_data(&D_9FC0F308);
    } else if (D_9FC0F304 != 0) {
        g_cur_proc_trial_type = ticketHead.code;
    }

    set_proc_permissions(&contentMetaDataHead);

    if (IO_READ(PI_MISC_REG) & 0xc0000000) {
        IO_WRITE(MI_3C_REG, 0x01000000);
        IO_WRITE(MI_3C_REG, 0x02000000);
        IO_WRITE(MI_SK_EXCEPTION_REG, IO_READ(MI_SK_EXCEPTION_REG) | 0x02000000);
    }

    if (g_cur_proc_trial_type == 2 || g_cur_proc_trial_type == 0) {
        IO_WRITE(MI_18_REG, 0x7530C800);
    }

    // launch the app, this does not return
    __asm__(
        "move $v0, %0;"
        "la   $t0, %1;"
        "jr   $t0;"
        : : "r" (app_entrypoint), "i" (launch_app_trampoline) : "v0", "t0"
    );

    return -1;
}

s32 skRecryptListValid(RecryptList* recryptList) {
    if (!CHECK_UNTRUSTED_RECRYPT_LIST(recryptList)) {
        return -1;
    }

    return recrypt_list_verify_size_and_sig(recryptList);
}

s32 skRecryptBegin(BbTicketBundle* bundle, BbAppLaunchCrls* crls, RecryptList* recryptList) {
    BbAesKey sp10;
    BbTicketHead* head;
    s32 ret;

    head = &bundle->ticket->head;

    ret = func_9FC00DCC(bundle, crls, recryptList, TRUE);
    if (ret != 0) {
        return ret;
    }

    ret = recrypt_list_get_key_for_cid(recryptList, &sp10, contentMetaDataHead.id);

    if (ret == 3) {
        D_9FC0F2DC = TRUE;
        aes_cbc_set_key_iv(&sp10, &contentMetaDataHead.iv);
    } else {
        D_9FC0F2DC = FALSE;
        aes_cbc_set_key_iv(&contentMetaDataHead.key, &contentMetaDataHead.iv);
        aesCipherInit(&D_9FC0F2C8, 2, (u8*)&contentMetaDataHead.iv);
        recrypt_list_add_new_entry(recryptList, contentMetaDataHead.id, 3);
    }

    aesMakeKey(&D_9FC0F0E0, 0, 128, (u8*)&sp10);
    SHA1Reset(&sha1_ctx);
    memcpy(&ticketHead, head, sizeof(BbTicketHead));

    D_9FC0F0DC = 0;
    D_9FC0F2E0 = FALSE;

    return ret;
}

s32 func_9FC0134C(u8* buf, u32 size, s32 isRecrypt) {
    u32 chunkSize = 0x200;
    u32 left;
    u32 i;

    for (i = 0; i < size; i += chunkSize) {
        if (dma_from_cart(0, (void*)K0_TO_PHYS((uintptr_t)buf), chunkSize, OS_WRITE) < 0) {
            return -1;
        }

        func_9FC0384C(0, D_9FC0F2E0);
        D_9FC0F2E0 = TRUE;

        while (IO_READ(PI_AES_STATUS_REG) & PI_AES_BUSY);

        left = contentMetaDataHead.size - D_9FC0F0DC;

        if (left >= chunkSize) {
            SHA1Input(&sha1_ctx, (u8*)PHYS_TO_K1(PI_10000_BUF_START), chunkSize);
            D_9FC0F0DC += chunkSize;
        } else {
            SHA1Input(&sha1_ctx, (u8*)PHYS_TO_K1(PI_10000_BUF_START), left);
            D_9FC0F0DC = contentMetaDataHead.size;
        }

        if (isRecrypt) {
            aesBlockEncrypt(&D_9FC0F2C8, &D_9FC0F0E0, (u8*)PHYS_TO_K1(PI_10000_BUF_START), chunkSize * 8, buf);
        }

        buf += chunkSize;
    }

    return 0;
}

s32 skRecryptData(u8* buf, u32 size) {
    BbAesIv* iv1;
    BbAesIv* iv2;

    if (buf != NULL && !CHECK_UNTRUSTED_ARRAY(buf, size)) {
        return -1;
    }

    if (D_9FC0F2DC == TRUE) {
        iv1 = &D_9FC0F2E4;
        iv2 = (BbAesIv*) (buf + size - sizeof(BbAesIv));

        if (buf == NULL) {
            iv1 = &contentMetaDataHead.iv;
            iv2 = &contentMetaDataHead.iv;
        }

        aesCipherInit(&D_9FC0F2C8, 2, (u8*)iv1);
        aes_cbc_set_key_iv(&contentMetaDataHead.key, iv2);

        D_9FC0F2E0 = FALSE;
        D_9FC0F2DC = FALSE;

        return 0;
    }

    func_9FC0134C(buf, size, TRUE);

    return 0;
}

s32 skRecryptComputeState(u8* buf, u32 size) {
    BbAesIv* src = (BbAesIv*) (buf + size - sizeof(BbAesIv));

    if (!CHECK_UNTRUSTED_ARRAY(buf, size)) {
        return -1;
    }

    memcpy(&D_9FC0F2E4, src, sizeof(BbAesIv));
    func_9FC0134C(buf, size, FALSE);

    return 0;
}

s32 skRecryptEnd(RecryptList* recryptList) {
    BbShaHash digest;

    if (!CHECK_UNTRUSTED_RECRYPT_LIST(recryptList)) {
        return -1;
    }

    SHA1Result(&sha1_ctx, (u8*)&digest);

    if (memcmp(&digest, &contentMetaDataHead.hash, sizeof(BbShaHash)) != 0) {
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

    func_9FC03694((u8*)hash, sizeof(*hash), virage2_offset->privateKey, outSignature, 1);

    return 0;
}

s32 skVerifyHash(BbShaHash* hash, u32* signature, BbCertBase** certChain, BbAppLaunchCrls* crls) {
    BbEccPublicKey key;
    u32 ret;
    u32 i;

    if (!CHECK_UNTRUSTED(hash)) {
        return -1;
    }

    if (certChain != NULL) {
        if (!check_cert_ranges(certChain)) {
            return -1;
        }

        if (verify_cert_chain(certChain, 0) < 0) {
            return -1;
        }

        if (!check_crlbundle_ranges(crls)) {
            return -1;
        }

        if (verify_all_crlbundles(
                &crls->carl, D_9FC0F308.caCrlVersion,
                &crls->cprl, D_9FC0F308.cpCrlVersion,
                &crls->tsrl, D_9FC0F308.tsCrlVersion)) {
            return -1;
        }

        if (crls->carl.head != NULL) {
            for (i = 0; i < crls->carl.head->numberRevoked; i++) {
                if (strstr((const char*)&certChain[CRL_CA]->name, (const char*)crls->carl.list[i]) != NULL) {
                    return -9;
                }
            }
        }

        if (certChain[CRL_TS]->certType == 1) {
            if (crls->cprl.head != NULL) {
                for (i = 0; i < crls->cprl.head->numberRevoked; i++) {
                    //! CRL_TS instead of CRL_CP?
                    if (strstr((const char*)&certChain[CRL_TS]->name, (const char*)crls->cprl.list[i]) != NULL) {
                        return -9;
                    }
                }
            }

            if (crls->tsrl.head != NULL) {
                for (i = 0; i < crls->tsrl.head->numberRevoked; i++) {
                    if (strstr((const char*)&certChain[CRL_TS]->name, (const char*)crls->tsrl.list[i]) != NULL) {
                        return -9;
                    }
                }
            }

            return rsa_check_signature(
                (u8*)hash,
                ((BbRsaCert*) certChain[CRL_TS])->publicKey,
                ((BbRsaCert*) certChain[CRL_TS])->exponent,
                0,
                signature);
        }

        ret = verify_ecc_signature((u8*)hash, sizeof(*hash), ((BbEccCert*)certChain[CRL_TS])->publicKey,
                                   signature, 1);
    } else {
        virage2_gen_public_key(key);

        ret = verify_ecc_signature((u8*)hash, sizeof(*hash), key, signature, 1);
    }

    if (ret == 0) {
        return 0;
    }

    return -1;
}

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
    u32 incr = 0xC800 - (IO_READ(MI_18_REG) >> 16);

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
