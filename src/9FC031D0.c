#include "include_asm.h"
#include "ultratypes.h"
#include "bbtypes.h"
#include "libcrypto/sha1.h"
#include "PR/bcp.h"
#include "macros.h"

void* wordcopy(void* dst, void* src, s32 nWords);
void* memcpy(void* dst, void* src, u32 num);

extern BbVirage2* virage2_offset;

void virage2_gen_public_key(u32* pubkeyOut) {
    u32 i;

    for(i = 0; i < ARRAY_COUNT(virage2_offset->publicKey); i++) {
        if (virage2_offset->publicKey[i] != 0) {
            wordcopy(pubkeyOut, virage2_offset->publicKey, ARRAY_COUNT(virage2_offset->publicKey));
            return;
        }
    }

    eccGenPublicKey(pubkeyOut, virage2_offset->privateKey);
    wordcopy(virage2_offset->publicKey, pubkeyOut, ARRAY_COUNT(virage2_offset->publicKey));
}

extern u32 cur_proc_allowed_skc_bitmask;

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

void rsa_verify_signature(rsaDataBlock* dataBlocks, s32 numDataBlocks, s32 arg2, s32 arg3, s32 arg4, s32 arg5) {
    u32 digest[5];
    SHA1Context sha1ctx;
    s32 i;

    SHA1Reset(&sha1ctx);
    for(i = 0; i < numDataBlocks; i++) {
        if(dataBlocks[i].size != 0) {
            SHA1Input(&sha1ctx, dataBlocks[i].data, dataBlocks[i].size);
        }
    }
    SHA1Result(&sha1ctx, &digest);
    rsa_check_signature(&digest, arg2, arg3, arg4, arg5);
}

void bsl_rsa_verify(char* result, unsigned long* certsign, unsigned long* certpublickey, unsigned long* certexponent, int num_bits);

#ifdef NON_MATCHING
s32 rsa_check_signature(s32* digest, unsigned long* certpublickey, unsigned long certexponent, RsaSize rsaSize, unsigned long* certsign) {
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
    if (memcmp(digest, &result[rsaBytes - 0x14], 0x14) == 0) {
        return 0;
    }

    return -1;
}
#else
INCLUDE_ASM("asm/non_matchings/9FC031D0", rsa_check_signature);
#endif

s32 func_9FC03410(void* randomOut, s32 nWords) {
    SHA1Context sha1ctx;
    u8 randomBytes[0x200];
    u8 sp270[125][0x14];
    u32 spC38[5];
    u8  randomByte;
    s32 i;
    s32 j;
    s32 k;

    if (nWords > 8) {
        return -1;
    }
    
    do {
        for(i = 0; i < 125; i++) {
            for(j = 0; j < 0x200; j++) {
                randomByte = 0;
                for(k = 0; k < 8; k++) {
                    randomByte += ((IO_READ(MI_RANDOM_BIT) & 1) << k);
                }
                randomBytes[j] = randomByte;
            }
            SHA1Reset(&sha1ctx);
            SHA1Input(&sha1ctx, &randomBytes, 0x200);
            SHA1Result(&sha1ctx, spC38);
            memcpy(&sp270[i], spC38, 0x14);
        }
    } while (func_9FC047CC(sp270, 0x9C4) == -1);
    SHA1Reset(&sha1ctx);
    SHA1Input(&sha1ctx, sp270, sp270[0][0] + 1);
    SHA1Input(&sha1ctx, virage2_offset->appStateKey, 0x10);
    SHA1Input(&sha1ctx, virage2_offset->selfMsgKey, 0x10);
    SHA1Result(&sha1ctx, spC38);

    if (nWords > 4) {
        wordcopy(randomOut, spC38, 4);
        SHA1Reset(&sha1ctx);
        SHA1Input(&sha1ctx, sp270, sp270[0][1] + 1);
        SHA1Result(&sha1ctx, spC38);
        wordcopy(randomOut + 0x10, spC38, nWords - 4);
    } else {
        wordcopy(randomOut, spC38, nWords);
    }
    return 0;
}

INCLUDE_ASM("asm/non_matchings/9FC031D0", func_9FC035EC);

void func_9FC03694(s32 arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4) {
    u32 sp18[8];

    do {
        func_9FC035EC(&sp18, 8);
    } while (bsl_compute_ecc_sig(arg0, arg1, arg2, &sp18, arg3, arg4) != 0);
}

s32 verify_ecc_signature(s32 arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4) {
    s32 sp18;

    bsl_verify_ecc_sig(arg0, arg1, arg2, arg3, &sp18, arg4);

    return sp18 == 0 ? 0 : -1;
}

s32 func_9FC0374C(void) {
    while(IO_READ(PI_STATUS_REG) & ((1 << 1) | (1 << 0))) {
        if ((IO_READ(PI_STATUS_REG) & (1 << 2))) {
            return -1;
        }
    }
    IO_WRITE(PI_STATUS_REG, (1 << 1));
    return 0;
}

s32 dma_from_cart(s32 arg0, void* outBuf, s32 length, s32 direction) {
    s32 cartAddr;

    IO_WRITE(PI_DRAM_ADDR_REG, outBuf);
    IO_WRITE(PI_CART_ADDR_REG, arg0 == 0 ? 0 : 0x400);

    if (direction == 0) {
        IO_WRITE(PI_EX_WR_LEN_REG, length - 1);
    } else {
        IO_WRITE(PI_EX_RD_LEN_REG, length - 1);
    }

    return func_9FC0374C();
}

void aes_cbc_set_key_iv(s32* key, s32* iv) {
    s32 expandedKey[0xB0 / 4];

    aes_HwKeyExpand(key, &expandedKey);
    wordcopy((void*)PHYS_TO_K1(PI_AES_EXPANDED_KEY_BUF(0)), &expandedKey, 0xB0 / 4);
    wordcopy((void*)PHYS_TO_K1(PI_AES_IV_BUF(0)), iv, 4);
}

void func_9FC0384C(s32 arg0, s32 arg1) {
    s32 ctrl = 0;

    ctrl |= PI_AES_CMD;
    ctrl |= (arg0 << 0xE);
    if (arg1 != 0) {
        ctrl |= 1;
    } else {
        ctrl |= 0x9A;
    }

    ctrl |= 0x1F0000;

    IO_WRITE(PI_AES_CTRL_REG, ctrl);
}

s32 card_read_block(u32 block, s32 bufSelect) {
    IO_WRITE(PI_CARD_BLK_OFFSET_REG, block * 512);

    if (bufSelect != 0) {
        IO_WRITE(PI_CARD_CNT_REG, 0x9F008A10 | (1 << 14));
    } else {
        IO_WRITE(PI_CARD_CNT_REG, 0x9F008A10 | 0);
    }
    
    do {
        if((IO_READ(MI_HW_INTR_REG) & 0x02000000) != 0) {
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
    for( ; *str != c; str++) {
        if(*str == '\0')
            return NULL;
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
    if (*str1 != *str2) {
        return *str1 - *str2;
    }
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

int memcmp(const void* ptr1, const void* ptr2, size_t num);
 
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

void* memcpy(void* dst, void* src, u32 num) {
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
    for(i = 0; i < 0x20; i++) {
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

extern s8 D_9FC0EBC4;
s32 write_virage_data(void* controller, BbVirage01* data, s32 size);

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
    
    if (write_virage_data((void*)(virageController | 0xC000), virageData, 0x10) < 0) {
        return -1;
    }
    
    D_9FC0EBC4 ^= 1;
    return 0;
}

s32 set_virage01_selector(BbVirage01* virageData) {
    s32 v0WriteCount;
    s32 v1WriteCount;

    initialize_virage_controllers();
    if (func_9FC0425C(VIRAGE0_STATUS_REG) < 0) {
        return -1;
    }
    v0WriteCount = read_virage01((void*)PHYS_TO_K1(VIRAGE0_BASE_ADDR), virageData);


    if (func_9FC0425C(VIRAGE1_STATUS_REG) < 0) {
        return -1;
    }
    v1WriteCount = read_virage01((void*)PHYS_TO_K1(VIRAGE1_BASE_ADDR), virageData);
    
    if ((v0WriteCount < 0) && (v1WriteCount < 0)) {
        memset(virageData, 0, 0x40);
        D_9FC0EBC4 = 0;
        return write_virage01_data(virageData);
    }

    if (v1WriteCount < v0WriteCount) {
        if ((func_9FC0425C(VIRAGE0_STATUS_REG) < 0) || (read_virage01((void*)PHYS_TO_K1(VIRAGE0_BASE_ADDR), virageData) < 0)) {
            return -1;
        }
        D_9FC0EBC4 = 0;
    } else {
        D_9FC0EBC4 = 1;
    }
    return 0;
}

extern BbVirage01 D_9FC0F308;

u16 *getTrialConsumptionByCid(u16 cid) {
    cid &= 0x7FFF;

    if ((cid < D_9FC0F308.tidWindow) || (cid >= (s32)(D_9FC0F308.tidWindow + ARRAY_COUNT(D_9FC0F308.cc)))) {
        return NULL;
    }

    return &D_9FC0F308.cc[cid - D_9FC0F308.tidWindow];
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

extern const char aRoot_1[];

s32 check_cert_ranges(BbCertBase** arg0) {

    if (!CHECK_UNTRUSTED(arg0)) {
        return 0;
    }
    if (!CHECK_UNTRUSTED(arg0[0])) {
        return 0;
    }

    if (arg0[0]->certType == 1) {
        // RSA(root) or RSA -> RSA
        if (CHECK_UNTRUSTED((BbRsaCert*)arg0[0]) && 
            (strcmp(arg0[0]->issuer, aRoot_1) == 0 || CHECK_UNTRUSTED((BbRsaCert*)arg0[1]))) {
            return 1;
        }
    } else { 
        // ECC -> RSA -> RSA
        if (CHECK_UNTRUSTED((BbEccCert*)arg0[0]) && CHECK_UNTRUSTED((BbRsaCert*)arg0[1]) && CHECK_UNTRUSTED((BbRsaCert*)arg0[2])) {
            return 1;
        }
    }
    return 0;
}

extern const char aEntering_excep[];

typedef void (*ExceptionCallback)(const char*);

void func_9FC03ED0(ExceptionCallback cb) {
    cb((char*)PHYS_TO_K1((s32)aEntering_excep));
    IO_WRITE(PI_MISC_REG, 0x30);
    while(1);
}
