#include "bbtypes.h"
#include "string.h"
#include "bcp.h"
#include "bbnand.h"
#include "libcrypto/aes.h"
#include "libcrypto/bsl.h"
#include "libcrypto/sha1.h"
#include "macros.h"

extern BbVirage01 virage01;

u32 cur_proc_allowed_skc_bitmask;

BbVirage2* virage2_offset = (BbVirage2*)PHYS_TO_K1(VIRAGE2_BASE_ADDR);
s8 g_last_loaded_virage01_num = -1;

/**
 * Generates the ECC public key associated with this console's ECC private key.
 */
void virage2_gen_public_key(u32* pubkeyOut) {
    u32 i;

    for (i = 0; i < ARRAY_COUNT(virage2_offset->publicKey); i++) {
        if (virage2_offset->publicKey[i] != 0) {
            wordcopy(pubkeyOut, virage2_offset->publicKey, ARRAY_COUNT(virage2_offset->publicKey));
            return;
        }
    }

    eccGenPublicKey(pubkeyOut, virage2_offset->privateKey);
    wordcopy(virage2_offset->publicKey, pubkeyOut, ARRAY_COUNT(virage2_offset->publicKey));
}


void set_proc_permissions(BbContentMetaDataHead* cmdHead) {
    s32 temp;

    IO_WRITE(PI_ALLOWED_IO, cmdHead->hwAccessRights & 0xFF);
    temp = ((cmdHead->hwAccessRights & 0x0000FF00) >> 8) & 1;
    IO_WRITE(USB0_CTRL_REG, temp);
    IO_WRITE(USB1_CTRL_REG, temp);
    temp = IO_READ(MI_SK_EXCEPTION_REG) & ~MI_SK_EXCEPTION_RAM_ACCESS;
    if (cmdHead->hwAccessRights & 0x200) {
        temp |= MI_SK_EXCEPTION_RAM_ACCESS;
    }
    IO_WRITE(MI_SK_EXCEPTION_REG, temp);
    cur_proc_allowed_skc_bitmask = cmdHead->secureKernelRights;
}

/**
 * @return
 *     -1 if either rsaSize was invalid or the signature is not valid for the data
 *      0 if the signature is valid for the data
 */
s32 rsa_verify_signature(RSADataBlock* dataBlocks, s32 numDataBlocks, const u32* certpublickey,
                          const u32 certexponent, BbSigType rsaSigType, u32* certsign) {
    BbShaHash digest;
    SHA1Context sha1ctx;
    s32 i;

    SHA1Reset(&sha1ctx);
    for (i = 0; i < numDataBlocks; i++) {
        if (dataBlocks[i].size != 0) {
            SHA1Input(&sha1ctx, dataBlocks[i].data, dataBlocks[i].size);
        }
    }
    SHA1Result(&sha1ctx, (SHA1_BYTE*)&digest);
    return rsa_check_signature(&digest, certpublickey, certexponent, rsaSigType, certsign);
}

/**
 * Checks whether the provided signature validates the provided SHA1 hash.
 *
 * @return
 *     -1 if either rsaSize was invalid or the signature is not valid for the hash
 *      0 if the signature is valid for the provided hash
 */
s32 rsa_check_signature(BbShaHash* digest, const u32* certpublickey, const u32 certexponent, BbSigType rsaSigType,
                        u32* certsign) {
    char result[512];
    s32 rsaBits;
    u32 rsaBytes;

    if (rsaSigType == SIGTYPE_RSA2048) {
        rsaBits = 2048;
        rsaBytes = 256;
    } else if (rsaSigType == SIGTYPE_RSA4096) {
        rsaBits = 4096;
        rsaBytes = 512;
    } else {
        return -1;
    }

    bsl_rsa_verify(result, certsign, certpublickey, &certexponent, rsaBits);

    rsaBytes -= sizeof(BbShaHash);
    if (memcmp(digest, &result[rsaBytes], sizeof(BbShaHash)) == 0) {
        return 0;
    }
    return -1;
}

// nWords should be 4 or 8 in practice
s32 collect_random_data(u32* randomOut, s32 nWords) {
    SHA1Context sha1ctx;
    u8 randomBytes[512];
    u8 hashes[125][0x14];
    union {
        u32 words[5];
        u8 bytes[0x14];
    } digest;
    u8  randomByte;
    s32 i;
    s32 j;
    s32 k;

    if (nWords > 8) {
        return -1;
    }

    do {
        // Collect 125 SHA1 hashes of random data
        for (i = 0; i < 125; i++) {
            // Collect 4096 random bits from hardware
            for (j = 0; j < (signed)sizeof(randomBytes); j++) {
                randomByte = 0;
                for (k = 0; k < 8; k++) {
                    randomByte += ((IO_READ(MI_RANDOM_BIT) & 1) << k);
                }
                randomBytes[j] = randomByte;
            }
            // Hash the random bits to mix them
            SHA1Reset(&sha1ctx);
            SHA1Input(&sha1ctx, randomBytes, ARRAY_COUNT(randomBytes));
            SHA1Result(&sha1ctx, digest.bytes);
            memcpy(&hashes[i], digest.bytes, sizeof(digest));
        }
        // Repeat until the data passes the quality test
    } while (randomness_test((u8*)hashes, sizeof(hashes)) == -1);

    SHA1Reset(&sha1ctx);
    // Hash some random amount of the hash data?
    SHA1Input(&sha1ctx, (u8*)hashes, hashes[0][0] + 1);
    // Mix in the app state key and the self message key
    SHA1Input(&sha1ctx, (u8*)virage2_offset->appStateKey, sizeof(BbAesKey));
    SHA1Input(&sha1ctx, (u8*)virage2_offset->selfMsgKey, sizeof(BbAesKey));
    SHA1Result(&sha1ctx, digest.bytes);

    if (nWords > 4) {
        // This is the first 4 words of key material
        wordcopy(randomOut, digest.words, 4);
        // For the remaining key material, hash another random amount of hash data?
        // This can cope with up to 8 words
        SHA1Reset(&sha1ctx);
        SHA1Input(&sha1ctx, (u8*)hashes, hashes[0][1] + 1);
        SHA1Result(&sha1ctx, digest.bytes);
        wordcopy(&randomOut[4], digest.words, nWords - 4);
    } else {
        // This is our key material
        wordcopy(randomOut, digest.words, nWords);
    }
    return 0;
}

s32 gen_random_key_material(u32* randomOut, s32 nWords) {
    s32 temp_s3 = nWords / 8;
    s32 temp_s0 = nWords % 8;
    s32 i;

    if (temp_s0 > 0 && collect_random_data(randomOut, temp_s0) != 0) {
        return -1;
    }
    randomOut = &randomOut[temp_s0];

    for (i = 0; i < temp_s3; i++) {
        if (collect_random_data(&randomOut[i * 8], 8) != 0) {
            return -1;
        }
    }
    return 0;
}

/**
 * Signs the provided data with the Elliptic Curve Digital Signature Algorithm using the provided ECC private key and
 * identity. Random data is collected from hardware.
 *
 * @param data        The data to sign.
 * @param datasize    The size of the data.
 * @param private_key The ECC private key of the signer.
 * @param signature   The computed signature.
 * @param identity    Additional number attached to the end of the data to distinguish different signing functions.
 */
void ecc_sign_data(u8* data, u32 datasize, u32* private_key, BbEccSig* signature, u32 identity) {
    u32 random_data[8];

    do {
        gen_random_key_material(random_data, ARRAY_COUNT(random_data));
    } while (bsl_compute_ecc_sig(data, datasize, private_key, random_data, (u32*)signature, identity) != BSL_OK);
}

/**
 * Verifies the provided ecc signature over some data with the Elliptic Curve Digital Signature Algorithm using the
 * provided ECC public key and identity.
 *
 * @param data        The data to verify the signature of.
 * @param datasize    The size of the data.
 * @param public_key  The ECC public key of the signer.
 * @param signature   The signature to verify.
 * @param identity    Additional number attached to the end of the data to distinguish different signing functions.
 */
s32 verify_ecc_signature(u8* data, u32 datasize, u32* public_key, u32* signature, u32 identity) {
    BSL_boolean res;

    bsl_verify_ecc_sig(data, datasize, public_key, signature, &res, identity);

    return (res == BSL_TRUE) ? 0 : -1;
}

/**
 * Waits for an ongoing PI DMA to complete, checking for errors reported by the hardware.
 *
 * @return
 *     -1 If the DMA errored
 *      0 Otherwise
 */
s32 pi_dma_wait(void) {
    while(IO_READ(PI_STATUS_REG) & (PI_STATUS_DMA_BUSY | PI_STATUS_IO_BUSY)) {
        if (IO_READ(PI_STATUS_REG) & PI_STATUS_ERROR) {
            return -1;
        }
    }
    IO_WRITE(PI_STATUS_REG, PI_CLR_INTR);
    return 0;
}

/**
 * Synchronous DMA of data to or from a PI NAND buffer.
 *
 * @param bufSelect Determines the target PI buffer (0 or 1)
 * @param outBuf    DRAM pointer for source/destination
 * @param length    DMA length, up to 0x200 bytes
 * @param direction OS_READ (PI -> DRAM) or OS_WRITE (DRAM -> PI)
 *
 * @return
 *     -1 If the DMA errored
 *      0 Otherwise
 */
s32 pi_buffer_dma(s32 bufSelect, void* outBuf, s32 length, s32 direction) {
    IO_WRITE(PI_DRAM_ADDR_REG, outBuf);
    //! @bug offset of 0x400 instead of 0x200 for buffer 1
    IO_WRITE(PI_CART_ADDR_REG, (bufSelect) ? (2 * NAND_BYTES_PER_PAGE) : 0);

    if (direction == OS_READ) {
        IO_WRITE(PI_EX_WR_LEN_REG, length - 1);
    } else {
        IO_WRITE(PI_EX_RD_LEN_REG, length - 1);
    }
    return pi_dma_wait();
}

/**
 * Installs the provided AES key and initialization vector in the hardware registers for hardware AES decryption.
 * This function handles expanding the AES key schedule.
 */
void aes_cbc_set_key_iv(BbAesKey* key, BbAesIv* iv) {
    u32 expandedKey[AES_EXPANDED_KEY_LEN / 4];

    aes_HwKeyExpand((u8*)key, (u8*)expandedKey);
    wordcopy((void*)PHYS_TO_K1(PI_AES_EXPANDED_KEY_BUF(0)), &expandedKey, ARRAY_COUNT(expandedKey));
    wordcopy((void*)PHYS_TO_K1(PI_AES_IV_BUF(0)), iv, ARRAY_COUNT(*iv));
}

/**
 * Executes hardware AES decryption on the contents of the selected PI NAND buffer.
 *
 * @param bufSelect     Which PI buffer to decrypt the contents of.
 * @param continuation  Whether to source the IV from the end of the last decryption job.
 */
void AES_Run(s32 bufSelect, s32 continuation) {
    u32 ctrl = PI_AES_EXEC_CMD;

    ctrl |= bufSelect << 14;
    if (continuation) {
        ctrl |= 1; // IV from end of last decryption job
    } else {
        ctrl |= (0x4D0/0x10) << 1; // IV from the IV buffer
    }
    ctrl |= (0x200/0x10 - 1) << 16; // Decrypt whole buffer

    IO_WRITE(PI_AES_CTRL_REG, ctrl);
}

/**
 * Reads the selected page from the NAND into the selected PI NAND buffer.
 *
 * ECC is checked on the page to either automatically correct single-bit errors or detect uncorrectable errors.
 *
 * @param pageNum   The NAND page number to read.
 * @param bufSelect The PI NAND buffer to read the page into.
 *
 * @return
 *     -3 If the memory card was removed during the transfer
 *     -2 If the page contains an unrecoverable double-bit error in its contents
 *      0 Otherwise
 */
s32 card_read_page(u32 pageNum, s32 bufSelect) {
    IO_WRITE(PI_CARD_BLK_OFFSET_REG, NAND_PAGE_TO_ADDR(pageNum));

    if (bufSelect != 0) {
        IO_WRITE(PI_NAND_CTRL_REG, NAND_READ_0(NAND_BYTES_PER_PAGE + NAND_PAGE_SPARE_SIZE, 1, 0, TRUE, FALSE));
    } else {
        IO_WRITE(PI_NAND_CTRL_REG, NAND_READ_0(NAND_BYTES_PER_PAGE + NAND_PAGE_SPARE_SIZE, 0, 0, TRUE, FALSE));
    }

    do {
        if (IO_READ(MI_HW_INTR_REG) & MI_HW_INTR_CARD_NOT_PRESENT) {
            IO_WRITE(PI_NAND_CTRL_REG, NAND_CTRL_CLR_INTR);
            return -3;
        }
    } while (IO_READ(PI_NAND_CTRL_REG) & NAND_STATUS_BUSY);

    if (IO_READ(PI_NAND_CTRL_REG) & NAND_STATUS_ERROR_DB) {
        return -2;
    }
    return 0;
}

// TODO: File split here?

char* strchr(char* str, char c) {
    for ( ; *str != c; str++) {
        if (*str == '\0') {
            return NULL;
        }
    }

    return str;
}

size_t strlen(const char* str) {
    const char* end = str;

    while (*end != '\0') {
        end++;
    }
    return end - str;
}

int strcmp(const char* str1, const char* str2) {
    while (*str1 == *str2) {
        if (*str1 == '\0') {
            return 0;
        }
        str1++;
        str2++;
    }
    return *str1 - *str2;
}

int strncmp(const char* str1, const char* str2, int num) { // num is signed?
    int ret = 0;
    int n;

    for (n = 0; n < num; n++) {
        if (str1[n] != str2[n]) {
            ret = -1;
        }
        // no null termination check
    }
    return ret;
}

const char* strstr(const char* str1, const char* str2) {
    int len1;
    int len2;

    len2 = strlen(str2);
    if (len2 == 0) {
        return str1;
    }

    len1 = strlen(str1);
    if (len1 < len2) {
        return NULL;
    }

    while (len1 >= len2) {
        len1--;
        if (memcmp(str1, str2, len2) == 0) {
            return str1;
        }
        str1++;
    }
    return NULL;
}

void* memcpy(void* dst, void* src, size_t num) {
    u8* dstp = (u8*)dst;
    u8* srcp = (u8*)src;

    while (num != 0) {
        *dstp++ = *srcp++;
        num--;
    }
    return dst;
}

void* wordcopy(void* dst, void* src, s32 nWords) {
    s32* srcp = (s32*)src;
    s32* dstp = (s32*)dst;

    while (nWords != 0) {
        *dstp++ = *srcp++;
        nWords--;
    }
    return dst;
}

void* memset(void* ptr, int value, size_t num) {
    size_t n;

    for (n = 0; n < num; n++) {
        ((u8*)ptr)[n] = value;
    }
    return ptr;
}

void memclear(void* ptr, size_t num) {
    memset(ptr, 0, num);
}

int memcmp(const void* ptr1, const void* ptr2, size_t num) {
    u8 v1;
    u8 v2;
    const u8* p1 = ptr1;
    const u8* p2 = ptr2;

    while (num-- > 0) {
        v2 = *p2++;
        v1 = *p1++;
        if (v1 != v2) {
            return v1 - v2;
        }
    }
    return 0;
}

// TODO: File split here?

/**
 * Computes the Virage01 checksum, taken as the sum of u16 data elements mod 2^16.
 */
u16 calc_virage01_checksum(void* d) {
    u16* data = d;
    s32 i;

    u16 sum = 0;
    for (i = 0; i < (s32)(sizeof(BbVirage01) / sizeof(u16)); i++) {
        sum += data[i];
    }
    return sum;
}

/**
 * Reads the contents of either Virage0 or Virage1 and verifies the checksum.
 *
 * @param baseAddr   Base address of the Virage memory to read.
 * @param virageData Location to copy contents to.
 *
 * @return
 *     -1 If the checksum verification failed.
 *   >= 0 Sequence number of the Virage memory that was successfully read.
 */
s32 read_virage01(u32 baseAddr, BbVirage01* virageData) {
    // Read virage data from specified virage controller. 0x10 words, 0x40 bytes
    wordcopy(virageData, (void*)PHYS_TO_K1(baseAddr), sizeof(BbVirage01) / sizeof(u32));

    // Check that checksum is correct
    if (calc_virage01_checksum(virageData) == VIRAGE01_EXPECTED_CHECKSUM) {
        return virageData->seq;
    }
    return -1;
}

/**
 * Writes the provided Virage memory to either Virage0 or Virage1, depending on which one was least recently used.
 *
 * @param virageData Memory to store to Virage 0 or 1.
 *
 * @return
 *     -1 If the write failed for any reason.
 *      0 If successful.
 */
s32 write_virage01_data(BbVirage01* virageData) {
    u32 virageBase;

    virageData->sum = 0;
    virageData->seq++;
    virageData->sum = VIRAGE01_EXPECTED_CHECKSUM - calc_virage01_checksum(virageData);

    // Write to the opposite Virage memory than was last read
    virageBase = (g_last_loaded_virage01_num == 1) ? VIRAGE0_BASE_ADDR : VIRAGE1_BASE_ADDR;

    if (write_virage_data(VIRAGE_STATUS(virageBase), (void*)virageData, sizeof(BbVirage01) / sizeof(u32)) < 0) {
        return -1;
    }

    g_last_loaded_virage01_num ^= 1;
    return 0;
}

s32 set_virage01_selector(BbVirage01* virageData) {
    s32 v0WriteCount;
    s32 v1WriteCount;

    // init all virage memories
    initialize_virage_controllers();

    // read virage0
    if (virage_load_flash(VIRAGE0_STATUS_REG) < 0) {
        return -1;
    }
    v0WriteCount = read_virage01(PHYS_TO_K1(VIRAGE0_BASE_ADDR), virageData);

    // read virage1
    if (virage_load_flash(VIRAGE1_STATUS_REG) < 0) {
        return -1;
    }
    v1WriteCount = read_virage01(PHYS_TO_K1(VIRAGE1_BASE_ADDR), virageData);

    // if both failed the checksum, reset the data to 0 and write to v1
    if (v0WriteCount < 0 && v1WriteCount < 0) {
        memset(virageData, 0, sizeof(BbVirage01));
        g_last_loaded_virage01_num = 0;
        return write_virage01_data(virageData);
    }

    if (v1WriteCount < v0WriteCount) {
        // if the v1 write count is less than the v0 write count (or if v1 failed the checksum),
        // use v0 data but use v1 for next write
        if (virage_load_flash(VIRAGE0_STATUS_REG) < 0 || read_virage01(PHYS_TO_K1(VIRAGE0_BASE_ADDR), virageData) < 0) {
            return -1;
        }
        g_last_loaded_virage01_num = 0;
    } else {
        // if the v0 write count is less than the v1 write count (or if v0 failed the checksum),
        // use v1 data but use v0 for next write
        g_last_loaded_virage01_num = 1;
    }
    return 0;
}

u16 *getTrialConsumptionByTid(BbTicketId tid) {
    tid &= 0x7FFF;

    if (tid < virage01.tidWindow || tid >= virage01.tidWindow + ARRAY_COUNT(virage01.cc)) {
        return NULL;
    }
    return &virage01.cc[tid - virage01.tidWindow];
}

/**
 * Verifies that the provided pointer and the data it covers is fully contained within DRAM, and that the pointer is
 * appropriately aligned.
 *
 * @param pointer   Pointer to check. Should be in DRAM.
 * @param size      Size of data this pointer is allowed to access. The size should not allow accessing out of bounds
 *                  of DRAM.
 * @param alignment Required alignment this pointer would be accessed with. Should be the minimum alignment to ensure
 *                  unaligned access exceptions do not occur.
 *
 * @return
 *      FALSE If the pointer is invalid.
 *      TRUE  If the pointer is valid.
 */
s32 check_untrusted_ptr_range(void* pointer, u32 size, u32 alignment) {
    u32 ptr = (u32)pointer;
    return (ptr - 0x80000000 <= 0x800000) &        // pointer is within DRAM bounds
           (ptr + size - 0x80000000 <= 0x800000) & // end pointer is within DRAM bounds
           ((ptr & (alignment - 1)) == 0);         // pointer is aligned
}

/**
 * Verifies that the provided pointer and the data it covers is fully contained within the lower half of SK RAM, and
 * that the pointer is appropriately aligned.
 *
 * @param pointer   Pointer to check. Should be in the lower half of SK RAM.
 * @param size      Size of data this pointer is allowed to access. The size should not allow accessing out of bounds
 *                  of the lower half of SK RAM.
 * @param alignment Required alignment this pointer would be accessed with. Should be the minimum alignment to ensure
 *                  unaligned access exceptions do not occur.
 *
 * @return
 *      FALSE If the pointer is invalid.
 *      TRUE  If the pointer is valid.
 */
s32 check_sk_ptr_range(void* pointer, u32 size, u32 alignment) {
    u32 ptr = (u32)pointer;
    return (ptr - 0x9FC40000 <= 0x4000) &        // pointer is within SKRAM bounds
           (ptr + size - 0x9FC40000 <= 0x4000) & // end pointer is within SKRAM bounds
           ((ptr & (alignment - 1)) == 0);       // pointer is aligned
}

/**
 * Validates pointers related to the provided certificate chain.
 *
 * An RSA certificate chain will check up to 2 entries, but only 1 entry is checked if the first cert is issued by Root.
 * An ECC certificate chain will always check 3 entries, an ECC cert followed by 2 RSA certs.
 *
 * @param certChain Array of pointers to certificates.
 *
 * @return
 *      FALSE If any of the necessary contents of this certificate chain are invalid.
 *      TRUE  If the certificate chain is deemed valid.
 */
s32 check_cert_ranges(BbCertBase** certChain) {
    if (!CHECK_UNTRUSTED(certChain)) {
        return FALSE;
    }

    if (!CHECK_UNTRUSTED(certChain[0])) {
        return FALSE;
    }

    if (certChain[0]->certType == CERT_TYPE_RSA) {
        // RSA(root) or RSA -> RSA
        if (CHECK_UNTRUSTED((BbRsaCert*)certChain[0]) &&
            (strcmp((const char*)certChain[0]->issuer, "Root") == 0 || CHECK_UNTRUSTED((BbRsaCert*)certChain[1]))) {
            return TRUE;
        }
    } else {
        // ECC -> RSA -> RSA
        if (CHECK_UNTRUSTED((BbEccCert*)certChain[0]) && CHECK_UNTRUSTED((BbRsaCert*)certChain[1]) && CHECK_UNTRUSTED((BbRsaCert*)certChain[2])) {
            return TRUE;
        }
    }
    return FALSE;
}
