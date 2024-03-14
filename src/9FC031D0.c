#include "bbtypes.h"
#include "string.h"
#include "bcp.h"
#include "libcrypto/aes.h"
#include "libcrypto/bsl.h"
#include "libcrypto/sha1.h"
#include "macros.h"

u32 cur_proc_allowed_skc_bitmask;

BbVirage2* virage2_offset = (BbVirage2*)PHYS_TO_K1(VIRAGE2_BASE_ADDR);
s8 D_9FC0EBC4 = -1;

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
    temp = IO_READ(MI_SK_EXCEPTION_REG) & ~0x01000000;
    if (cmdHead->hwAccessRights & 0x200) {
        temp |= 0x01000000;
    }
    IO_WRITE(MI_SK_EXCEPTION_REG, temp);
    cur_proc_allowed_skc_bitmask = cmdHead->secureKernelRights;
}

s32 rsa_verify_signature(rsaDataBlock* dataBlocks, s32 numDataBlocks, const u32* certpublickey, const u32 certexponent,
                         RsaSize rsaSize, u32* certsign) {
    u8 digest[0x14];
    SHA1Context sha1ctx;
    s32 i;

    SHA1Reset(&sha1ctx);
    for (i = 0; i < numDataBlocks; i++) {
        if (dataBlocks[i].size != 0) {
            SHA1Input(&sha1ctx, dataBlocks[i].data, dataBlocks[i].size);
        }
    }
    SHA1Result(&sha1ctx, digest);
    return rsa_check_signature(digest, certpublickey, certexponent, rsaSize, certsign);
}

s32 rsa_check_signature(u8* digest, const u32* certpublickey, const u32 certexponent, RsaSize rsaSize, u32* certsign) {
    char result[512];
    s32 rsaBits;
    u32 rsaBytes;

    if (rsaSize == RSA_2048) {
        rsaBits = 2048;
        rsaBytes = 256;
    } else if (rsaSize == RSA_4096) {
        rsaBits = 4096;
        rsaBytes = 512;
    } else {
        return -1;
    }

    bsl_rsa_verify(result, certsign, certpublickey, &certexponent, rsaBits);

    rsaBytes -= 0x14;
    if (memcmp(digest, &result[rsaBytes], 0x14) == 0) {
        return 0;
    }

    return -1;
}

s32 func_9FC03410(u32* randomOut, s32 nWords) {
    SHA1Context sha1ctx;
    u8 randomBytes[0x200];
    u8 sp270[125][0x14];
    union {
        u32 words[5];
        u8 bytes[0x14];
    } spC38;
    u8 randomByte;
    s32 i;
    s32 j;
    s32 k;

    if (nWords > 8) {
        return -1;
    }

    do {
        for (i = 0; i < 125; i++) {
            for (j = 0; j < 0x200; j++) {
                randomByte = 0;
                for (k = 0; k < 8; k++) {
                    randomByte += ((IO_READ(MI_RANDOM_BIT) & 1) << k);
                }
                randomBytes[j] = randomByte;
            }
            SHA1Reset(&sha1ctx);
            SHA1Input(&sha1ctx, randomBytes, ARRAY_COUNT(randomBytes));
            SHA1Result(&sha1ctx, spC38.bytes);
            memcpy(&sp270[i], spC38.bytes, 0x14);
        }
    } while (func_9FC047CC((u8*)sp270, 0x9C4) == -1);
    SHA1Reset(&sha1ctx);
    SHA1Input(&sha1ctx, (u8*)sp270, sp270[0][0] + 1);
    SHA1Input(&sha1ctx, (u8*)virage2_offset->appStateKey, 0x10);
    SHA1Input(&sha1ctx, (u8*)virage2_offset->selfMsgKey, 0x10);
    SHA1Result(&sha1ctx, spC38.bytes);

    if (nWords > 4) {
        wordcopy(randomOut, spC38.words, 4);
        SHA1Reset(&sha1ctx);
        SHA1Input(&sha1ctx, (u8*)sp270, sp270[0][1] + 1);
        SHA1Result(&sha1ctx, spC38.bytes);
        wordcopy(&randomOut[4], spC38.words, nWords - 4);
    } else {
        wordcopy(randomOut, spC38.words, nWords);
    }
    return 0;
}

s32 func_9FC035EC(u32* randomOut, s32 nWords) {
    s32 temp_s3 = nWords / 8;
    s32 temp_s0 = nWords % 8;
    s32 i;

    if (temp_s0 > 0 && func_9FC03410(randomOut, temp_s0) != 0) {
        return -1;
    }
    randomOut = &randomOut[temp_s0];

    for (i = 0; i < temp_s3; i++) {
        if (func_9FC03410(&randomOut[i * 8], 8) != 0) {
            return -1;
        }
    }
    return 0;
}

void func_9FC03694(u8* data, u32 datasize, u32* private_key, BbEccSig* signature, u32 identity) {
    u32 random_data[8];

    do {
        func_9FC035EC(random_data, ARRAY_COUNT(random_data));
    } while (bsl_compute_ecc_sig(data, datasize, private_key, random_data, (u32*)signature, identity) != BSL_OK);
}

s32 verify_ecc_signature(u8* data, u32 datasize, u32* public_key, u32* signature, u32 identity) {
    BSL_boolean res;

    bsl_verify_ecc_sig(data, datasize, public_key, signature, &res, identity);

    return (res == BSL_TRUE) ? 0 : -1;
}

s32 func_9FC0374C(void) {
    while (IO_READ(PI_STATUS_REG) & (PI_STATUS_IO_BUSY | PI_STATUS_DMA_BUSY)) {
        if ((IO_READ(PI_STATUS_REG) & PI_STATUS_ERROR)) {
            return -1;
        }
    }
    IO_WRITE(PI_STATUS_REG, PI_CLR_INTR);
    return 0;
}

s32 dma_from_cart(s32 bufSelect, void* outBuf, s32 length, s32 direction) {
    IO_WRITE(PI_DRAM_ADDR_REG, outBuf);
    IO_WRITE(PI_CART_ADDR_REG, (bufSelect) ? 0x400 : 0);

    if (direction == OS_READ) {
        IO_WRITE(PI_EX_WR_LEN_REG, length - 1);
    } else {
        IO_WRITE(PI_EX_RD_LEN_REG, length - 1);
    }

    return func_9FC0374C();
}

void aes_cbc_set_key_iv(BbAesKey* key, BbAesIv* iv) {
    u32 expandedKey[AES_EXPANDED_KEY_LEN / 4];

    aes_HwKeyExpand((u8*)key, (u8*)expandedKey);
    wordcopy((void*)PHYS_TO_K1(PI_AES_EXPANDED_KEY_BUF(0)), &expandedKey, ARRAY_COUNT(expandedKey));
    wordcopy((void*)PHYS_TO_K1(PI_AES_IV_BUF(0)), iv, ARRAY_COUNT(*iv));
}

void AES_Run(s32 bufSelect, s32 continuation) {
    u32 ctrl = PI_AES_EXEC_CMD;

    ctrl |= bufSelect << 14;
    if (continuation) {
        ctrl |= 1;
    } else {
        ctrl |= 0x9A;
    }
    ctrl |= (0x200 / 0x10 - 1) << 16;

    IO_WRITE(PI_AES_CTRL_REG, ctrl);
}

s32 card_read_page(u32 block, s32 bufSelect) {
    IO_WRITE(PI_CARD_BLK_OFFSET_REG, block * 512);

    if (bufSelect != 0) {
        IO_WRITE(PI_CARD_CNT_REG, 0x9F008A10 | (1 << 14));
    } else {
        IO_WRITE(PI_CARD_CNT_REG, 0x9F008A10 | 0);
    }

    do {
        if ((IO_READ(MI_HW_INTR_REG) & 0x02000000) != 0) {
            IO_WRITE(PI_CARD_CNT_REG, 0);
            return -3;
        }
    } while ((IO_READ(PI_CARD_CNT_REG) & (1 << 31)));

    if (IO_READ(PI_CARD_CNT_REG) & (1 << 10)) {
        return -2;
    }
    return 0;
}

// TODO: File split here?

char* strchr(char* str, char c) {
    for (; *str != c; str++) {
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
        *(dstp++) = *(srcp++);
        num--;
    }
    return dst;
}

void* wordcopy(void* dst, void* src, s32 nWords) {
    s32* srcp = (s32*)src;
    s32* dstp = (s32*)dst;

    while (nWords != 0) {
        *(dstp++) = *(srcp++);
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
        v2 = *(p2++);
        v1 = *(p1++);
        if (v1 != v2) {
            return v1 - v2;
        }
    }
    return 0;
}

// TODO: File split here?

s32 calc_virage01_checksum(void* d) {
    u16* data = d;
    u16 sum;
    s32 i;

    sum = 0;
    for (i = 0; i < 0x20; i++) {
        sum += data[i];
    }
    return sum;
}

s32 read_virage01(s32* virageController, BbVirage01* virageData) {
    // Read virage data from specified virage controller. 0x10 words, 0x40 bytes
    wordcopy(virageData, (void*)PHYS_TO_K1((u32)virageController), 0x10);

    // Check that checksum is correct
    if (calc_virage01_checksum(virageData) == 0x7ADC) {
        return virageData->seq;
    }

    return -1;
}

s32 write_virage01_data(BbVirage01* virageData) {
    u32 virageController;

    virageData->sum = 0;
    virageData->seq++;
    virageData->sum = 0x7ADC - calc_virage01_checksum(virageData);

    if (D_9FC0EBC4 == 1) {
        virageController = VIRAGE0_BASE_ADDR;
    } else {
        virageController = VIRAGE1_BASE_ADDR;
    }

    if (write_virage_data(virageController | 0xC000, (void*)virageData, 0x10) < 0) {
        return -1;
    }

    D_9FC0EBC4 ^= 1;
    return 0;
}

s32 set_virage01_selector(BbVirage01* virageData) {
    s32 v0WriteCount;
    s32 v1WriteCount;

    initialize_virage_controllers();

    // read virage0
    if (func_9FC0425C(VIRAGE0_STATUS_REG) < 0) {
        return -1;
    }
    v0WriteCount = read_virage01((void*)PHYS_TO_K1(VIRAGE0_BASE_ADDR), virageData);

    // read virage1
    if (func_9FC0425C(VIRAGE1_STATUS_REG) < 0) {
        return -1;
    }
    v1WriteCount = read_virage01((void*)PHYS_TO_K1(VIRAGE1_BASE_ADDR), virageData);

    // if both failed the checksum, zero data and use v1 for writes
    if ((v0WriteCount < 0) && (v1WriteCount < 0)) {
        memset(virageData, 0, 0x40);
        D_9FC0EBC4 = 0;
        return write_virage01_data(virageData);
    }

    if (v1WriteCount < v0WriteCount) {
        // if the v1 write count is less than the v0 write count (or if v1 failed the checksum), use v0 data but use v1
        // for writes
        if ((func_9FC0425C(VIRAGE0_STATUS_REG) < 0) ||
            (read_virage01((void*)PHYS_TO_K1(VIRAGE0_BASE_ADDR), virageData) < 0)) {
            return -1;
        }
        D_9FC0EBC4 = 0;
    } else {
        // if the v0 write count is less than the v1 write count (or if v0 failed the checksum), use v1 data but use v0
        // for writes
        D_9FC0EBC4 = 1;
    }
    return 0;
}

extern BbVirage01 D_9FC0F308;

u16* getTrialConsumptionByTid(BbTicketId tid) {
    tid &= 0x7FFF;

    if ((tid < D_9FC0F308.tidWindow) || (tid >= (s32)(D_9FC0F308.tidWindow + ARRAY_COUNT(D_9FC0F308.cc)))) {
        return NULL;
    }

    return &D_9FC0F308.cc[tid - D_9FC0F308.tidWindow];
}

s32 check_untrusted_ptr_range(void* pointer, u32 size, u32 alignment) {
    u32 ptr = (u32)pointer;
    return ((ptr - 0x80000000) <= 0x800000) &        // pointer is within DRAM bounds
           ((ptr + size - 0x80000000) <= 0x800000) & // end pointer is within DRAM bounds
           ((ptr & (alignment - 1)) == 0);           // pointer is aligned
}

s32 check_unknown_range(void* pointer, u32 size, u32 alignment) {
    u32 ptr = (u32)pointer;
    return ((ptr - 0x9FC40000) <= 0x4000) &        // pointer is within SKRAM bounds
           ((ptr + size - 0x9FC40000) <= 0x4000) & // end pointer is within SKRAM bounds
           ((ptr & (alignment - 1)) == 0);         // pointer is aligned
}

s32 check_cert_ranges(BbCertBase** arg0) {
    if (!CHECK_UNTRUSTED(arg0)) {
        return FALSE;
    }

    if (!CHECK_UNTRUSTED(arg0[0])) {
        return FALSE;
    }

    if (arg0[0]->certType == 1) {
        // RSA(root) or RSA -> RSA
        if (CHECK_UNTRUSTED((BbRsaCert*)arg0[0]) &&
            (strcmp((const char*)arg0[0]->issuer, "Root") == 0 || CHECK_UNTRUSTED((BbRsaCert*)arg0[1]))) {
            return TRUE;
        }
    } else {
        // ECC -> RSA -> RSA
        if (CHECK_UNTRUSTED((BbEccCert*)arg0[0]) && CHECK_UNTRUSTED((BbRsaCert*)arg0[1]) &&
            CHECK_UNTRUSTED((BbRsaCert*)arg0[2])) {
            return TRUE;
        }
    }

    return FALSE;
}
