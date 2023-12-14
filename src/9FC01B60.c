#include "bbtypes.h"
#include "string.h"
#include "bcp.h"
#include "libcrypto/aes.h"
#include "libcrypto/sha1.h"
#include "macros.h"

#define SKRAM_START 0x9FC40000

u32 func_9FC01B60(u32 regVal) {
    u32 temp_v1 = (regVal >> 8) & 0xFF;

    if (temp_v1 == ((regVal >> 0x10) & 0xFF)) {
        return temp_v1;
    }
    return regVal >> 0x18;
}

s32 func_9FC01B88(s32 blockNum) {
    s32 ret;
    s32 var_a0;
    u32 var;
    s32 i;

    while (TRUE) {
        ret = card_read_page(blockNum << 5, 0);
        if (ret == -3) {
            return -3;
        }
        var = IO_READ(PI_10404_REG);

        var_a0 = 0;
        for (i = 0; i < 8; i++) {
            if (!((var >> (16 + i)) & 1)) {
                var_a0++;
            }
        }

        blockNum++;
        if (var_a0 < 2) {
            break;
        }
    }
    if (ret == -2) {
        return -2;
    }
    return blockNum - 1;
}

s32 func_9FC01C24(s32 blockStart, s32 nBlocks) {
    s32 blockNum;
    s32 i;

    for (blockNum = blockStart, i = 0; nBlocks >= i; i++, blockNum++) {
        blockNum = func_9FC01B88(blockNum);
        if (blockNum < 0) {
            break;
        }
    }
    return blockNum - 1;
}

void dram_init(void) {
    s32 i;

    IO_READ(PI_MISC_REG);

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

s32 verify_system_app(s32* blockPtr) {
    BbAesKey decryptedKey;
    BbRsaCert* certChain[3];
    rsaDataBlock rsa;
    s32 blockNum;
    s32 i;
    s32 j;
    s32 ret;
    BbContentMetaDataHead* cmd = (BbContentMetaDataHead*)SKRAM_START;
    u32* skramPtr = (u32*)SKRAM_START;
    BbAppLaunchCrls* appLaunchCrls;

    ret = blockNum = func_9FC01C24(*blockPtr, 4);
    if (ret < 0) {
        return ret;
    }

    for (i = 0; i < 32; i++) {
        ret = card_read_page((blockNum << 5) + i, 0);
        if (ret < 0) {
            return ret;
        }

        if (i == 0) {
            u32 regVal = IO_READ(PI_10400_REG);
            *blockPtr = func_9FC01B60(regVal);
        }

        for (j = 0; j < 0x200; j += sizeof(*skramPtr)) {
            *skramPtr++ = IO_READ(PI_10000_BUF(j));
        }
    }

    certChain[0] = (BbRsaCert*)(cmd + 1);
    certChain[1] = (BbRsaCert*)(certChain[0] + 1);
    certChain[2] = NULL;

    appLaunchCrls = (BbAppLaunchCrls*)(SKRAM_START + sizeof(*cmd) + (ARRAY_COUNT(certChain) - 1) * sizeof(BbRsaCert));

#define RELOCATE_PTR(field) { (field) = (void*)((u8*)(field) + SKRAM_START); }(void)0

    if (appLaunchCrls->carl.head != NULL) {
        RELOCATE_PTR(appLaunchCrls->carl.head);
    }
    RELOCATE_PTR(appLaunchCrls->carl.list);
    RELOCATE_PTR(appLaunchCrls->carl.certChain[0]);
    RELOCATE_PTR(appLaunchCrls->carl.certChain[1]);

    if (appLaunchCrls->cprl.head != NULL) {
        RELOCATE_PTR(appLaunchCrls->cprl.head);
    }
    RELOCATE_PTR(appLaunchCrls->cprl.list);
    RELOCATE_PTR(appLaunchCrls->cprl.certChain[0]);
    RELOCATE_PTR(appLaunchCrls->cprl.certChain[1]);

    if (check_certs_against_revocation_list(cmd, (BbCertBase**)certChain, appLaunchCrls) < 0) {
        return -1;
    }
    if (verify_cert_chain((BbCertBase**)certChain, 2) < 0) {
        return -1;
    }

    rsa.data = (void*)cmd;
    rsa.size = sizeof(*cmd) - sizeof(cmd->contentMetaDataSign);

    if (rsa_verify_signature(&rsa, 1, (void*)&certChain[0]->publicKey, certChain[0]->exponent, RSA_2048, cmd->contentMetaDataSign) < 0) {
        return -1;
    }
    if (aes_SwDecrypt((u8*)&virage2_offset->bootAppKey, (u8*)cmd->commonCmdIv, (u8*)cmd->key, sizeof(cmd->key), (u8*)&decryptedKey) < 0) {
        return -1;
    }

    memcpy(cmd->key, &decryptedKey, sizeof(cmd->key));

    if (cmd->bbid != 0 && cmd->bbid != virage2_offset->bbId) {
        return -1;
    }
    return 0;
}

s32 func_9FC01FBC(s32 block, s32 bufSelect, s32 continuation, void** outBufPtr, u32 length, SHA1Context* sha1ctx, s32 arg6) {
    s32 ret;
    void** var_s0;

    ret = card_read_page(block, bufSelect);
    if (ret < 0) {
        return ret;
    }

    AES_Run(bufSelect, continuation);

    while (IO_READ(PI_AES_STATUS_REG) & PI_AES_BUSY) {
        ;
    }

    if (arg6) {
        var_s0 = (void**)PHYS_TO_K1((bufSelect != 0) ? PI_10000_BUF(0x208) : PI_10000_BUF(8));

        if (check_untrusted_ptr_range(*var_s0, 0, ALIGNOF(*var_s0)) == 0) {
            return -1;
        }
        *outBufPtr = (void*)KDM_TO_PHYS(*var_s0);
    }
    osInvalDCache((void*)PHYS_TO_K0(*outBufPtr), 0x200);

    ret = dma_from_cart(bufSelect, *outBufPtr, length, OS_READ);
    if (ret < 0) {
        return ret;
    }
    SHA1Input(sha1ctx, (void*)PHYS_TO_K0(*outBufPtr), length);
    return 0;
}

s32 load_system_app(u32* systemAppEntrypointOut) {
    BbContentMetaDataHead* cmd = (BbContentMetaDataHead*)0x9FC40000;
    SHA1Context sha1ctx;
    BbShaHash systemAppHash;
    s32 blockStart = 0;
    u8* bufPtr;
    s32 aesContinuation;
    s32 ret;
    u32 endBlock;
    u32 i;
    u32 j;
    u32 remaining;
    u32 length;
    u32 block;

    ret = verify_system_app(&blockStart);
    if (ret < 0) {
        return ret;
    }

    endBlock = (cmd->size + 0x200) / 0x200;

    aes_cbc_set_key_iv(&cmd->key, &cmd->iv);
    SHA1Reset(&sha1ctx);

    aesContinuation = FALSE;
    length = 0x200;
    for (i = 0; i < 8; i++) {
        block = (blockStart << 5) + i;
        ret = func_9FC01FBC(block, 0, aesContinuation, (void**)&bufPtr, length, &sha1ctx, i == 0);
        if (ret < 0) {
            return ret;
        }
        aesContinuation = TRUE;
        if (i == 0) {
            *systemAppEntrypointOut = *(u32*)PHYS_TO_K0((u32)bufPtr + 8);
        }
    }

    remaining = cmd->size - 0x1000;
    for (j = i; j < endBlock; j++) {
        block = (blockStart << 5) + i;
        if (remaining > 0x200) {
            length = 0x200;
            remaining -= 0x200;
        } else {
            length = remaining;
            remaining = 0;
        }

        ret = func_9FC01FBC(block, 0, 1, (void**)&bufPtr, length, &sha1ctx, 0);
        if (ret < 0) {
            return ret;
        }

        if (i++ == 31) {
            i = 0;
            blockStart = func_9FC01B60(IO_READ(PI_10400_REG));
        }
        bufPtr += 0x200;
    }

    SHA1Result(&sha1ctx, (u8*)&systemAppHash);
    if (memcmp(&systemAppHash, cmd->hash, sizeof(systemAppHash)) != 0) {
        return -1;
    }
    set_proc_permissions(cmd);
    return ret;
}

extern BbVirage01 D_9FC0F308;

#define THROW_EXCEPTION() \
    ((void (*)())PHYS_TO_K1(R_VEC + 0x200 + E_VEC))()

u32 setup_system(void) {
    u32 systemAppEntrypoint;

    IO_WRITE(PI_MISC_REG, 0x31);
    IO_WRITE(MI_3C_REG, 0x01000000);
    IO_WRITE(MI_SK_EXCEPTION_REG, IO_READ(MI_SK_EXCEPTION_REG) & ~0x02000000);
    IO_WRITE(MI_18_REG, 0);
    IO_WRITE(PI_STATUS_REG, PI_CLR_INTR | PI_SET_RESET); // reset PI
    IO_WRITE(PI_CARD_CNT_REG, 0);
    IO_WRITE(PI_AES_CTRL_REG, 0);
    IO_WRITE(VI_CURRENT_REG, 0); // clears VI interrupt
    IO_WRITE(SP_STATUS_REG, SP_CLR_RSPSIGNAL | SP_CLR_INTR);
    IO_WRITE(AI_STATUS_REG, AI_CONTROL_DMA_ON);
    IO_WRITE(SI_STATUS_REG, 0); // clears SI interrupt
    IO_WRITE(MI_MODE_REG, MI_CLR_DP_INTR);
    IO_WRITE(MI_INTR_MASK_REG, MI_INTR_MASK_CLR_SP | MI_INTR_MASK_CLR_SI | MI_INTR_MASK_CLR_AI | MI_INTR_MASK_CLR_VI |
            MI_INTR_MASK_CLR_PI | MI_INTR_MASK_CLR_DP);
    IO_WRITE(MI_3C_REG, 0x05555000); // clears ique specific interrupts

    set_virage01_selector(&D_9FC0F308);

    if ((IO_READ(MI_SK_EXCEPTION_REG) & 0xFC) || g_cur_proc_trial_type == 0) {
        if (D_9FC0EBB0 != 0xFFFF) {
            u16* temp_v0 = getTrialConsumptionByTid(D_9FC0EBB0);
            if (temp_v0 != NULL) {
                *temp_v0 = D_9FC0EBB2;
                write_virage01_data(&D_9FC0F308);
            }
            g_cur_proc_trial_type = 0xFFFF;
            D_9FC0EBB0 = 0xFFFF;
        }
    } else {
        dram_init();
    }
    if (write_virage2() != 0) {
        THROW_EXCEPTION();
    }
    if (load_system_app(&systemAppEntrypoint) != 0) {
        THROW_EXCEPTION();
    }
    IO_WRITE(PI_MISC_REG, 0x33);
    g_cur_proc_trial_type = 0xFFFF;
    return systemAppEntrypoint;
}

s32 func_9FC02488(BbShaHash* skHashOut) {
    SHA1Context sha1ctx;
    s32 i;
    s32 blockNum;
    s32 remainingPages;
    s32 var_s3 = 0;
    s32 ret;

    SHA1Reset(&sha1ctx);
    blockNum = 0;
    remainingPages = 4 * 0x20;
    while (remainingPages > 0) {
        blockNum = func_9FC01B88(blockNum);
        if (blockNum < 0) {
            return blockNum;
        }
        var_s3++;

        for (i = 0; i < 32; i++) {
            if (i == 0) {
                if (var_s3 == 1) {
                    AES_Run(0, FALSE);
                } else {
                    AES_Run(0, TRUE);
                }
            } else {
                ret = card_read_page((blockNum << 5) + i, 0);
                if (ret < 0) {
                    return ret;
                }
                AES_Run(0, TRUE);
            }

            while (IO_READ(PI_AES_STATUS_REG) & PI_AES_BUSY) {
                ;
            }

            SHA1Input(&sha1ctx, (void*)PHYS_TO_K1(PI_10000_BUF(0)), 0x200);
            remainingPages--;
            if (remainingPages == 0) {
                break;
            }
        }
        blockNum++;
    }

    SHA1Result(&sha1ctx, (u8*)skHashOut);
    return 0;
}

s32 write_virage2(void) {
    BbShaHash skHash;
    u32 checksum;
    s32 ret;
    u32 i;
    u32* v2words;

    if (virage2_offset->romPatch[0] == 0x01000008) { // jr $t0
        return 0;
    }

    // Compute SK hash
    ret = func_9FC02488(&skHash);
    if (ret != 0) {
        return ret;
    }

    // Copy new hash and `jr $t0` to Virage2
    wordcopy(&virage2_offset->skHash, &skHash, ARRAY_COUNT(skHash));
    virage2_offset->romPatch[0] = 0x01000008; // jr $t0

    // Recompute checksum
    virage2_offset->csumAdjust = 0;
    v2words = (u32*)virage2_offset;
    for (i = 0, checksum = 0; i < 0x40; i++) {
        checksum += *v2words++;
    }
    virage2_offset->csumAdjust = 0xBBC0DE - checksum;

    // Write data
    ret = write_virage_data(0x1FCAC000, (void*)virage2_offset, 0x40);
    if (ret >= 0) {
        ret = 0;
    }
    return ret;
}

extern u32 D_9FC0F304;
extern u32 g_trial_time_elapsed;

s32 check_trial_timer(void) {
    u32 temp_s0;

    g_trial_time_elapsed++;
    temp_s0 = g_trial_time_elapsed * 16;
    D_9FC0EBB2 = (temp_s0 + 30) / 60;
    if (g_cur_proc_trial_type == 0) {
        startup();
    }
    if (temp_s0 >= D_9FC0F304 * 60) {
        startup();
    }
    IO_WRITE(MI_18_REG, 0x7530C800);
    return 0;
}
