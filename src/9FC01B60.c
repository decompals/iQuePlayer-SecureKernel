#include "bbtypes.h"
#include "string.h"
#include "bcp.h"
#include "bbnand.h"
#include "libcrypto/aes.h"
#include "libcrypto/sha1.h"
#include "macros.h"

extern BbVirage01 virage01;
extern u32 g_cur_proc_trial_limit;
extern u32 g_trial_time_elapsed;

#define SKRAM_START 0x9FC40000

/**
 * Reads the next good block number from the block spare bytes [7:4]
 * The block number is duplicated into 3 bytes in case of corruption
 *  [B1, B2, B3, _]
 * If B2 == B3, return that. Otherwise, return B1.
 */
u32 fs_next_good_block(u32 curSpare) {
    u32 blockNum = (curSpare >> 8) & 0xFF;

    if (blockNum == ((curSpare >> 0x10) & 0xFF)) {
        return blockNum;
    }
    return curSpare >> 0x18;
}

s32 card_read_block(s32 blockNum) {
    s32 ret;
    s32 numErrors;
    u32 spare;
    s32 i;

    while (TRUE) {
        ret = card_read_page(NAND_BLOCK_TO_PAGE(blockNum), 0);
        if (ret == -3) {
            // Memory card removed
            return -3;
        }
        spare = IO_READ(PI_NAND_SPARE_BUFFER(0, 4));

        numErrors = 0;
        for (i = 0; i < 8; i++) {
            if (!((spare >> (16 + i)) & 1)) {
                numErrors++;
            }
        }

        blockNum++;
        if (numErrors < 2) {
            // Sufficiently few errors, break out
            break;
        }
    }
    if (ret == -2) {
        return -2;
    }
    return blockNum - 1;
}

s32 card_read_blocks(s32 blockStart, s32 nBlocks) {
    s32 blockNum;
    s32 i;

    for (blockNum = blockStart, i = 0; nBlocks >= i; i++, blockNum++) {
        blockNum = card_read_block(blockNum);
        if (blockNum < 0) {
            break;
        }
    }
    return blockNum - 1;
}

void dram_init(void) {
    s32 i;

    IO_READ(PI_GPIO_REG);

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
    RSADataBlock rsa;
    s32 blockNum;
    s32 i;
    s32 j;
    s32 ret;
    BbContentMetaDataHead* cmd = (BbContentMetaDataHead*)SKRAM_START;
    u32* skramPtr = (u32*)SKRAM_START;
    BbAppLaunchCrls* appLaunchCrls;

    ret = blockNum = card_read_blocks(*blockPtr, 4); // 4 here is the number of good blocks for SK
    if (ret < 0) {
        return ret;
    }

    for (i = 0; i < NAND_PAGES_PER_BLOCK; i++) {
        ret = card_read_page(NAND_BLOCK_TO_PAGE(blockNum) + i, 0);
        if (ret < 0) {
            return ret;
        }

        if (i == 0) {
            u32 regVal = IO_READ(PI_NAND_SPARE_BUFFER(0, 0));
            *blockPtr = fs_next_good_block(regVal);
        }

        for (j = 0; j < NAND_BYTES_PER_PAGE; j += sizeof(*skramPtr)) {
            *skramPtr++ = IO_READ(PI_NAND_DATA_BUFFER(0, j));
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
    if (verify_cert_chain((BbCertBase**)certChain, SERVER_TYPE_CP) < 0) {
        return -1;
    }

    rsa.data = (void*)cmd;
    rsa.size = sizeof(*cmd) - sizeof(cmd->contentMetaDataSign);

    if (rsa_verify_signature(&rsa, 1, (void*)&certChain[0]->publicKey, certChain[0]->exponent, SIGTYPE_RSA2048, cmd->contentMetaDataSign) < 0) {
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

s32 card_hash_page(s32 block, s32 bufSelect, s32 continuation, void** outBufPtr, u32 length, SHA1Context* sha1ctx, s32 firstBlock) {
    s32 ret;
    void** entrypointP;

    ret = card_read_page(block, bufSelect);
    if (ret < 0) {
        return ret;
    }

    AES_Run(bufSelect, continuation);

    while (IO_READ(PI_AES_STATUS_REG) & PI_AES_BUSY) {
        ;
    }

    if (firstBlock) {
        entrypointP = (void**)PHYS_TO_K1((bufSelect != 0) ? PI_NAND_DATA_BUFFER(1, 8) : PI_NAND_DATA_BUFFER(0, 8));

        if (check_untrusted_ptr_range(*entrypointP, 0, ALIGNOF(*entrypointP)) == 0) {
            return -1;
        }
        *outBufPtr = (void*)KDM_TO_PHYS(*entrypointP);
    }
    osInvalDCache((void*)PHYS_TO_K0(*outBufPtr), NAND_BYTES_PER_PAGE);

    ret = pi_buffer_dma(bufSelect, *outBufPtr, length, OS_READ);
    if (ret < 0) {
        return ret;
    }
    SHA1Input(sha1ctx, (void*)PHYS_TO_K0(*outBufPtr), length);
    return 0;
}

s32 load_system_app(u32* systemAppEntrypointOut) {
    BbContentMetaDataHead* cmd = (BbContentMetaDataHead*)SKRAM_START;
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

    endBlock = (cmd->size + NAND_BYTES_PER_PAGE) / NAND_BYTES_PER_PAGE;

    aes_cbc_set_key_iv(&cmd->key, &cmd->iv);
    SHA1Reset(&sha1ctx);

    aesContinuation = FALSE;
    length = NAND_BYTES_PER_PAGE;
    for (i = 0; i < 8; i++) {
        block = NAND_BLOCK_TO_PAGE(blockStart) + i;
        ret = card_hash_page(block, 0, aesContinuation, (void**)&bufPtr, length, &sha1ctx, i == 0);
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
        block = NAND_BLOCK_TO_PAGE(blockStart) + i;
        if (remaining > NAND_BYTES_PER_PAGE) {
            length = NAND_BYTES_PER_PAGE;
            remaining -= NAND_BYTES_PER_PAGE;
        } else {
            length = remaining;
            remaining = 0;
        }

        ret = card_hash_page(block, 0, TRUE, (void**)&bufPtr, length, &sha1ctx, FALSE);
        if (ret < 0) {
            return ret;
        }

        if (i++ == NAND_PAGES_PER_BLOCK - 1) {
            i = 0;
            blockStart = fs_next_good_block(IO_READ(PI_NAND_SPARE_BUFFER(0, 0)));
        }
        bufPtr += NAND_BYTES_PER_PAGE;
    }

    SHA1Result(&sha1ctx, (u8*)&systemAppHash);
    if (memcmp(&systemAppHash, cmd->hash, sizeof(systemAppHash)) != 0) {
        return -1;
    }
    set_proc_permissions(cmd);
    return ret;
}

#define THROW_EXCEPTION() \
    ((void (*)())PHYS_TO_K1(R_VEC + 0x200 + E_VEC))()

u32 setup_system(void) {
    u32 systemAppEntrypoint;

    // Latch power, LED on
    IO_WRITE(PI_GPIO_REG, (PI_GPIO_O_PWR | PI_GPIO_PWR_ON) | (PI_GPIO_O_LED | PI_GPIO_LED_ON));

    IO_WRITE(MI_HW_INTR_MASK_REG, MI_HW_INTR_MASK_CLR_PWR_BTN);
    IO_WRITE(MI_SK_EXCEPTION_REG, IO_READ(MI_SK_EXCEPTION_REG) & ~MI_SK_EXCEPTION_UNK25);
    IO_WRITE(MI_SK_TIMER_REG, MI_SK_TIMER(0, 0));
    IO_WRITE(PI_STATUS_REG, PI_CLR_INTR | PI_SET_RESET); // reset PI
    IO_WRITE(PI_NAND_CTRL_REG, NAND_CTRL_CLR_INTR);
    IO_WRITE(PI_AES_CTRL_REG, PI_AES_CLR_INTR);
    IO_WRITE(VI_CURRENT_REG, 0); // clears VI interrupt
    IO_WRITE(SP_STATUS_REG, SP_CLR_RSPSIGNAL | SP_CLR_INTR);
    IO_WRITE(AI_STATUS_REG, AI_CONTROL_DMA_ON);
    IO_WRITE(SI_STATUS_REG, 0); // clears SI interrupt
    IO_WRITE(MI_MODE_REG, MI_CLR_DP_INTR);
    IO_WRITE(MI_INTR_MASK_REG, MI_INTR_MASK_CLR_SP | MI_INTR_MASK_CLR_SI | MI_INTR_MASK_CLR_AI | MI_INTR_MASK_CLR_VI |
            MI_INTR_MASK_CLR_PI | MI_INTR_MASK_CLR_DP); // clears n64 interrupts
    IO_WRITE(MI_HW_INTR_MASK_REG, MI_HW_INTR_MASK_CLR_FLASH | MI_HW_INTR_MASK_CLR_AES | MI_HW_INTR_MASK_CLR_IDE |
             MI_HW_INTR_MASK_CLR_PI_ERR | MI_HW_INTR_MASK_CLR_USB0 | MI_HW_INTR_MASK_CLR_USB1 |
             MI_HW_INTR_MASK_CLR_PWR_BTN | MI_HW_INTR_MASK_CLR_MD); // disables ique interrupts

    set_virage01_selector(&virage01);

    if ((IO_READ(MI_SK_EXCEPTION_REG) & 0xFC) || g_cur_proc_trial_type == TRIAL_TYPE_0) {
        // Warm boot
        if (g_cur_trial_tid != TRIAL_TID_UNSET) {
            // Update the trial time of the app that just exited, if it was on a trial
            u16* ccptr = getTrialConsumptionByTid(g_cur_trial_tid);
            if (ccptr != NULL) {
                *ccptr = g_cur_trial_cc;
                write_virage01_data(&virage01);
            }
            g_cur_proc_trial_type = TRIAL_TYPE_UNSET;
            g_cur_trial_tid = TRIAL_TID_UNSET;
        }
    } else {
        // Cold boot
        dram_init();
    }
    if (write_virage2() != 0) {
        THROW_EXCEPTION();
    }
    if (load_system_app(&systemAppEntrypoint) != 0) {
        THROW_EXCEPTION();
    }
    IO_WRITE(PI_GPIO_REG, (PI_GPIO_O_PWR | PI_GPIO_PWR_ON) | (PI_GPIO_O_LED | PI_GPIO_LED_OFF));
    g_cur_proc_trial_type = TRIAL_TYPE_UNSET;
    return systemAppEntrypoint;
}

s32 compute_sk_hash(BbShaHash* skHashOut) {
    SHA1Context sha1ctx;
    s32 i;
    s32 blockNum;
    s32 remainingPages;
    s32 var_s3 = 0;
    s32 ret;

    SHA1Reset(&sha1ctx);
    blockNum = 0;
    remainingPages = 4 * NAND_PAGES_PER_BLOCK;
    while (remainingPages > 0) {
        blockNum = card_read_block(blockNum);
        if (blockNum < 0) {
            return blockNum;
        }
        var_s3++;

        for (i = 0; i < NAND_PAGES_PER_BLOCK; i++) {
            if (i == 0) {
                if (var_s3 == 1) {
                    AES_Run(0, FALSE);
                } else {
                    AES_Run(0, TRUE);
                }
            } else {
                ret = card_read_page(NAND_BLOCK_TO_PAGE(blockNum) + i, 0);
                if (ret < 0) {
                    return ret;
                }
                AES_Run(0, TRUE);
            }

            while (IO_READ(PI_AES_STATUS_REG) & PI_AES_BUSY) {
                ;
            }

            SHA1Input(&sha1ctx, (void*)PHYS_TO_K1(PI_NAND_DATA_BUFFER(0, 0)), NAND_BYTES_PER_PAGE);
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
    ret = compute_sk_hash(&skHash);
    if (ret != 0) {
        return ret;
    }

    // Copy new hash and `jr $t0` to Virage2
    wordcopy(&virage2_offset->skHash, &skHash, ARRAY_COUNT(skHash));
    virage2_offset->romPatch[0] = 0x01000008; // jr $t0

    // Recompute checksum
    virage2_offset->csumAdjust = 0;
    v2words = (u32*)virage2_offset;
    for (i = 0, checksum = 0; i < sizeof(BbVirage2) / 4; i++) {
        checksum += *v2words++;
    }
    virage2_offset->csumAdjust = 0xBBC0DE - checksum;

    // Write data
    ret = write_virage_data(VIRAGE2_STATUS_REG, (void*)virage2_offset, sizeof(BbVirage2) / 4);
    if (ret >= 0) {
        ret = 0;
    }
    return ret;
}

s32 check_trial_timer(void) {
    u32 seconds;

    g_trial_time_elapsed++;
    seconds = g_trial_time_elapsed * 16;
    g_cur_trial_cc = (seconds + 30) / 60;
    if (g_cur_proc_trial_type == TRIAL_TYPE_0) {
        startup();
    }
    if (seconds >= g_cur_proc_trial_limit * 60) {
        startup();
    }
    IO_WRITE(MI_SK_TIMER_REG, MI_SK_TIMER(0x7530, 0xC800));
    return 0;
}
