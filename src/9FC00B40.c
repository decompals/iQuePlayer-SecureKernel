#include "bbtypes.h"
#include "string.h"
#include "bcp.h"
#include "bbnand.h"
#include "libcrypto/aes.h"
#include "libcrypto/bsl.h"
#include "libcrypto/sha1.h"
#include "macros.h"

BbContentMetaDataHead contentMetaDataHead;
BbTicketHead ticketHead;

u32 g_trial_time_counter;
u32 recrypt_size_processed;
AesKeyInstance recryptKeyInstance;
AesCipherInstance recryptCipherInstance;
u32 recrypt_began_from_list;
u32 recrypt_iv_continuation;
BbAesIv recrypt_iv;
u32 unused_pad[3]; // Unused
u32 g_cur_proc_trial_limit;
BbVirage01 virage01;
u32 g_trial_time_elapsed;
SHA1Context sha1_ctx;

BbTicketId g_cur_trial_tid = TRIAL_TID_UNSET;
s16 g_cur_trial_cc = 0;
u16 g_cur_proc_trial_type = TRIAL_TYPE_UNSET;
u32 g_app_flags = 0; // System app launch flags, passed as first arg to system app entrypoint

/**
 * @return true  if the ticket bundle pointers are all valid
 *         false if any of the ticket bundle pointers are invalid
 */
s32 check_ticket_bundle_ranges(BbTicketBundle* bundle) {
    if (CHECK_UNTRUSTED(bundle) &&
        CHECK_UNTRUSTED(bundle->ticket) &&
        check_cert_ranges(bundle->ticketChain) &&
        check_cert_ranges(bundle->cmdChain)) {
        return TRUE;
    }
    return FALSE;
}

/**
 * @return
 *     -1 if the ticket bundle did not verify, or does not match the console's BBID, or if a trial has expired
 *      0 if success
 */
s32 verify_and_load_ticket_bundle(BbTicketBundle* bundle) {
    BbAesKey key1;
    RSADataBlock blocks[2];
    BbAesKey decryptedKey;
    u16* cc;
    s16 tid;
    BbTicketHead* head = &bundle->ticket->head;
    BbContentMetaDataHead* cmdHead = &bundle->ticket->cmd.head;
    BbRsaCert* ticketCert;
    BbRsaCert* cmdCert;

    if (verify_cert_chain(bundle->cmdChain, SERVER_TYPE_CP) != 0) {
        return -1;
    }

    if (verify_cert_chain(bundle->ticketChain, SERVER_TYPE_TS) != 0) {
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

    ticketCert = (BbRsaCert*)bundle->ticketChain[0];
    if (rsa_verify_signature(blocks, 1, ticketCert->publicKey, ticketCert->exponent, SIGTYPE_RSA2048,
        bundle->ticket->head.ticketSign) >= 0) {
        // Ticket chain verified, save the CMD head
        memcpy(&contentMetaDataHead, cmdHead, sizeof(BbContentMetaDataHead));
        // Derive the AES key for decrypting the CMD key from the server's public key and the console's private key
        eccGenAesKey(head->serverKey, virage2_offset->privateKey, key1);
        aes_SwDecrypt((u8*)key1, (u8*)head->cmdIv, (u8*)cmdHead->key, sizeof(BbAesKey), (u8*)contentMetaDataHead.key);

        blocks[0].data = &bundle->ticket->cmd.contentDesc;
        blocks[0].size = sizeof(BbContentDesc);
        blocks[1].data = &contentMetaDataHead;
        blocks[1].size = sizeof(BbContentMetaDataHead) - sizeof(BbRsaSig2048);

        cmdCert = (BbRsaCert*)bundle->cmdChain[0];
        if (rsa_verify_signature(blocks, ARRAY_COUNT(blocks), cmdCert->publicKey, cmdCert->exponent, SIGTYPE_RSA2048,
            bundle->ticket->cmd.head.contentMetaDataSign) >= 0) {
            aes_SwDecrypt((u8*)virage2_offset->bootAppKey, (u8*)cmdHead->commonCmdIv, (u8*)contentMetaDataHead.key,
                          sizeof(BbAesKey), (u8*)decryptedKey);
            memcpy(contentMetaDataHead.key, decryptedKey, sizeof(BbAesKey));
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

/**
 * @return
 *      0 If success
 *      1 If recrypt flag
 *     -1 If any inputs are invalid, or ticket BBID does not match console BBID, or trial expired
 *     -2 if verification of tsrl failed
 *     -3 if the carl crlbundle failed to verify
 *     -4 if verification of cprl failed
 *     -9 if any certificates in cprl or tsrl or the ticket bundle were revoked
 */
s32 verify_ticket_bundle_against_crls(BbTicketBundle* bundle, BbAppLaunchCrls* crls, RecryptList* recryptList, s32 recrypt) {
    s32 ret;

    // Check if the ticket bundle has valid pointers
    if (!check_ticket_bundle_ranges(bundle)) {
        return -1;
    }

    // If recrypt and not recrypt on first launch, fail
    if (recrypt && !(bundle->ticket->cmd.head.execFlags & CMD_EXEC_FLAG_RECRYPT)) {
        return 1;
    }

    // Check if crls or recryptList are invalid pointers
    if (!CHECK_UNTRUSTED(crls) || !CHECK_UNTRUSTED_RECRYPT_LIST(recryptList)) {
        return -1;
    }

    // Check the bundle against the certificate revocation list
    ret = check_ticket_bundle_revocations(bundle, crls);
    if (ret != 0) {
        return ret;
    }

    // Verify the ticket bundle
    ret = verify_and_load_ticket_bundle(bundle);
    if (ret != 0) {
        return ret;
    }

    return 0;
}

/**
 * If the ticket bundle has the recrypt flag set, recryptList must be provided
 *
 * @return
 *      0 If Success
 *      3 If recrypt status is not 2
 *      4 If recrypt status is not 2
 *     -1 If any inputs are invalid, or ticket BBID does not match console BBID, or trial expired
 *     -2 if verification of tsrl failed
 *     -3 if verification of carl failed
 *     -4 if verification of cprl failed
 *     -9 if any certificates in cprl or tsrl or the ticket bundle were revoked
 */
s32 skLaunchSetup(BbTicketBundle* bundle, BbAppLaunchCrls* crls, RecryptList* recryptList) {
    BbAesKey recryptKey;
    BbTicketHead* head;
    u32 ret;

    ret = verify_ticket_bundle_against_crls(bundle, crls, recryptList, FALSE);
    if (ret != 0) {
        return ret;
    }

    head = &bundle->ticket->head;

    if (contentMetaDataHead.execFlags & CMD_EXEC_FLAG_RECRYPT) {
        // If recrypt list is NULL, fail
        if (recryptList == NULL) {
            return -1;
        }

        // Lookup the AES key in the recrypt list for the CID
        ret = recrypt_list_get_key_for_cid(recryptList, &recryptKey, contentMetaDataHead.id);
        if (ret != RECRYPT_STATUS_COMPLETE) {
            return ret;
        }

        aes_cbc_set_key_iv(&recryptKey, &contentMetaDataHead.iv);
    } else {
        aes_cbc_set_key_iv(&contentMetaDataHead.key, &contentMetaDataHead.iv);
    }

    // Set the provided ticket as the active ticket
    memcpy(&ticketHead, head, sizeof(BbTicketHead));
    IO_WRITE(PI_AES_CTRL_REG, PI_AES_CLR_INTR);
    return 0;
}

/**
 * @return
 *      -1 If the entrypoint is an invalid pointer,
 *          or if content verification failed for non-recrypted apps,
 *          or if a trial has expired
 *      Does not return if successful.
 */
s32 skLaunch(void* app_entrypoint) {
    BbShaHash digest;
    u8* ptr;
    u16* cc;
    s32 a1;

    if (!check_untrusted_ptr_range(app_entrypoint, 0, 4)) {
        return -1;
    }

    if (!(contentMetaDataHead.execFlags & CMD_EXEC_FLAG_RECRYPT)) {
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

    g_cur_proc_trial_type = TRIAL_TYPE_UNSET;
    g_cur_proc_trial_limit = ticketHead.limit;

    if ((s16)ticketHead.tid < 0) {
        cc = getTrialConsumptionByTid(ticketHead.tid);

        if (cc == NULL) {
            return -1;
        }

        if (*cc >= ticketHead.limit) {
            return -1;
        }

        g_cur_proc_trial_type = ticketHead.code;

        if (ticketHead.code == TRIAL_TYPE_2 || ticketHead.code == TRIAL_TYPE_0) {
            a1 = ((s32)g_cur_proc_trial_limit - *cc + 3) / 4;

            g_trial_time_elapsed = *cc * 15 >> 2;
            g_cur_trial_cc = *cc;

            if (a1 > 0) {
                *cc += a1;
            } else {
                *cc = g_cur_proc_trial_limit;
            }

            g_cur_trial_tid = ticketHead.tid;
        } else {
            (*cc)++;
        }

        write_virage01_data(&virage01);
    } else if (g_cur_proc_trial_limit != 0) {
        g_cur_proc_trial_type = ticketHead.code;
    }

    set_proc_permissions(&contentMetaDataHead);

    if (PI_GPIO_IS_HW_V2(IO_READ(PI_GPIO_REG))) {
        IO_WRITE(MI_HW_INTR_MASK_REG, MI_HW_INTR_MASK_CLR_PWR_BTN);
        IO_WRITE(MI_HW_INTR_MASK_REG, MI_HW_INTR_MASK_SET_PWR_BTN);
        IO_WRITE(MI_SK_EXCEPTION_REG, IO_READ(MI_SK_EXCEPTION_REG) | MI_SK_EXCEPTION_UNK25);
    }

    if (g_cur_proc_trial_type == TRIAL_TYPE_2 || g_cur_proc_trial_type == TRIAL_TYPE_0) {
        IO_WRITE(MI_SK_TIMER_REG, MI_SK_TIMER(0x7530, 0xC800));
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
    BbAesKey recryptKey;
    BbTicketHead* head = &bundle->ticket->head;
    s32 ret;

    ret = verify_ticket_bundle_against_crls(bundle, crls, recryptList, TRUE);
    if (ret != 0) {
        return ret;
    }

    ret = recrypt_list_get_key_for_cid(recryptList, &recryptKey, contentMetaDataHead.id);
    if (ret == RECRYPT_STATUS_PARTIAL) {
        // Set key and IV from recrypt list
        recrypt_began_from_list = TRUE;
        aes_cbc_set_key_iv(&recryptKey, &contentMetaDataHead.iv);
    } else {
        // Set key and IV from the CMD
        recrypt_began_from_list = FALSE;
        aes_cbc_set_key_iv(&contentMetaDataHead.key, &contentMetaDataHead.iv);
        aesCipherInit(&recryptCipherInstance, AES_MODE_2, (u8*)&contentMetaDataHead.iv);
        // Make a new entry for this recrypted content
        recrypt_list_add_new_entry(recryptList, contentMetaDataHead.id, RECRYPT_STATUS_PARTIAL);
    }

    aesMakeKey(&recryptKeyInstance, AES_ENCRYPT, 128, (u8*)&recryptKey);
    SHA1Reset(&sha1_ctx);
    memcpy(&ticketHead, head, sizeof(BbTicketHead));

    recrypt_size_processed = 0;
    recrypt_iv_continuation = FALSE;
    return ret;
}

s32 recrypt_data(u8* buf, u32 size, s32 doEncrypt) {
    u32 chunkSize = NAND_BYTES_PER_PAGE;
    u32 left;
    u32 i;

    for (i = 0; i < size; i += chunkSize) {
        // Read into the PI buffer
        if (pi_buffer_dma(0, (void*)K0_TO_PHYS((uintptr_t)buf), chunkSize, OS_WRITE) < 0) {
            return -1;
        }

        // Use hardware AES to decrypt the content
        AES_Run(0, recrypt_iv_continuation);
        recrypt_iv_continuation = TRUE;

        while (IO_READ(PI_AES_STATUS_REG) & PI_AES_BUSY);

        left = contentMetaDataHead.size - recrypt_size_processed;

        // Hash straight out of the PI buffer
        if (left >= chunkSize) {
            SHA1Input(&sha1_ctx, (u8*)PHYS_TO_K1(PI_NAND_DATA_BUFFER(0, 0x000)), chunkSize);
            recrypt_size_processed += chunkSize;
        } else {
            SHA1Input(&sha1_ctx, (u8*)PHYS_TO_K1(PI_NAND_DATA_BUFFER(0, 0x000)), left);
            recrypt_size_processed = contentMetaDataHead.size;
        }

        if (doEncrypt) {
            // Re-encrypt data in-place in the PI buffer
            aesBlockEncrypt(&recryptCipherInstance, &recryptKeyInstance, (u8*)PHYS_TO_K1(PI_NAND_DATA_BUFFER(0, 0x000)),
                            chunkSize * 8, buf);
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

    if (recrypt_began_from_list == TRUE) {
        iv1 = &recrypt_iv;
        iv2 = (BbAesIv*)(buf + size - sizeof(BbAesIv));

        if (buf == NULL) {
            iv1 = &contentMetaDataHead.iv;
            iv2 = &contentMetaDataHead.iv;
        }

        aesCipherInit(&recryptCipherInstance, AES_MODE_2, (u8*)iv1);
        aes_cbc_set_key_iv(&contentMetaDataHead.key, iv2);

        recrypt_iv_continuation = FALSE;
        recrypt_began_from_list = FALSE;
    } else {
        recrypt_data(buf, size, TRUE);
    }
    return 0;
}

s32 skRecryptComputeState(u8* buf, u32 size) {
    BbAesIv* src = (BbAesIv*)(buf + size - sizeof(BbAesIv));

    if (!CHECK_UNTRUSTED_ARRAY(buf, size)) {
        return -1;
    }

    memcpy(&recrypt_iv, src, sizeof(BbAesIv));
    recrypt_data(buf, size, FALSE);
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

    if (recrypt_list_add_new_entry(recryptList, contentMetaDataHead.id, RECRYPT_STATUS_COMPLETE)) {
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

    ecc_sign_data((u8*)hash, sizeof(*hash), virage2_offset->privateKey, outSignature, 1);
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
        // If a certChain is provided, verify either RSA or ECC.

        // Verify the cert chain
        if (!check_cert_ranges(certChain)) {
            return -1;
        }
        if (verify_cert_chain(certChain, SERVER_TYPE_CA) < 0) {
            return -1;
        }

        // Verify the CRLs
        if (!check_applaunch_crl_ranges(crls)) {
            return -1;
        }
        if (verify_all_crlbundles(
                &crls->carl, virage01.caCrlVersion,
                &crls->cprl, virage01.cpCrlVersion,
                &crls->tsrl, virage01.tsCrlVersion)) {
            return -1;
        }

        // Ensure carl was not revoked
        if (crls->carl.head != NULL) {
            for (i = 0; i < crls->carl.head->numberRevoked; i++) {
                if (strstr((const char*)&certChain[1]->name, (const char*)crls->carl.list[i]) != NULL) {
                    return -9;
                }
            }
        }

        if (certChain[0]->certType == CERT_TYPE_RSA) {
            // Ensure cprl was not revoked
            if (crls->cprl.head != NULL) {
                for (i = 0; i < crls->cprl.head->numberRevoked; i++) {
                    if (strstr((const char*)&certChain[0]->name, (const char*)crls->cprl.list[i]) != NULL) {
                        return -9;
                    }
                }
            }

            // Ensure tsrl was not revoked
            if (crls->tsrl.head != NULL) {
                for (i = 0; i < crls->tsrl.head->numberRevoked; i++) {
                    if (strstr((const char*)&certChain[0]->name, (const char*)crls->tsrl.list[i]) != NULL) {
                        return -9;
                    }
                }
            }

            // Check RSA2048 signature
            return rsa_check_signature(hash,
                ((BbRsaCert*)certChain[0])->publicKey,
                ((BbRsaCert*)certChain[0])->exponent,
                SIGTYPE_RSA2048, signature);
        } else {
            // Check ECDSA signature
            ret = verify_ecc_signature((u8*)hash, sizeof(*hash), ((BbEccCert*)certChain[0])->publicKey,
                                       signature, 1);
        }
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
    if (!CHECK_UNTRUSTED(tidWindow) || !CHECK_UNTRUSTED_ARRAY(cc, ARRAY_COUNT(virage01.cc))) {
        return -1;
    }
    *tidWindow = virage01.tidWindow;
    memcpy(cc, virage01.cc, sizeof(virage01.cc));
    return 0;
}

s32 skAdvanceTicketWindow(void) {
    s32 i;

    for (i = 0; i < ARRAY_COUNT(virage01.cc) - 1; i++) {
        virage01.cc[i] = virage01.cc[i + 1];
    }
    virage01.cc[i] = 0;
    virage01.tidWindow++;
    return write_virage01_data(&virage01);
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
    u32 seconds;
    u32 incr = 0xC800 - (IO_READ(MI_SK_TIMER_REG) >> 16);

    if (g_cur_proc_trial_type != TRIAL_TYPE_0) {
        return 0;
    }

    g_trial_time_counter += incr;
    if (g_trial_time_counter > 0xC800) {
        g_trial_time_counter -= 0xC800;
        g_trial_time_elapsed++;
    }

    seconds = g_trial_time_elapsed * 16;
    g_cur_trial_cc = (seconds + 30) / 60;

    if (seconds >= g_cur_proc_trial_limit * 60) {
        g_app_flags = 8;
        startup();
    }

    IO_WRITE(MI_SK_TIMER_REG, MI_SK_TIMER(0x7530, 0xC800));

    return 0;
}
