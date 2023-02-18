#include "include_asm.h"
#include "ultratypes.h"

INCLUDE_ASM("asm/non_matchings/9FC031D0", virage2_gen_public_key);

INCLUDE_ASM("asm/non_matchings/9FC031D0", set_proc_permissions);

INCLUDE_ASM("asm/non_matchings/9FC031D0", rsa_verify_signature);

INCLUDE_ASM("asm/non_matchings/9FC031D0", rsa_check_signature);

INCLUDE_ASM("asm/non_matchings/9FC031D0", func_9FC03410);

INCLUDE_ASM("asm/non_matchings/9FC031D0", func_9FC035EC);

INCLUDE_ASM("asm/non_matchings/9FC031D0", func_9FC03694);

INCLUDE_ASM("asm/non_matchings/9FC031D0", verify_ecc_signature);

INCLUDE_ASM("asm/non_matchings/9FC031D0", func_9FC0374C);

INCLUDE_ASM("asm/non_matchings/9FC031D0", dma_from_cart);

INCLUDE_ASM("asm/non_matchings/9FC031D0", aes_cbc_set_key_iv);

INCLUDE_ASM("asm/non_matchings/9FC031D0", func_9FC0384C);

INCLUDE_ASM("asm/non_matchings/9FC031D0", card_read_block);

INCLUDE_ASM("asm/non_matchings/9FC031D0", func_9FC0391C);

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

INCLUDE_ASM("asm/non_matchings/9FC031D0", calc_virage01_checksum);

INCLUDE_ASM("asm/non_matchings/9FC031D0", read_virage01);

INCLUDE_ASM("asm/non_matchings/9FC031D0", write_virage01_data);

INCLUDE_ASM("asm/non_matchings/9FC031D0", set_virage01_selector);

INCLUDE_ASM("asm/non_matchings/9FC031D0", getTrialConsumptionByCid);

INCLUDE_ASM("asm/non_matchings/9FC031D0", check_untrusted_ptr_range);

INCLUDE_ASM("asm/non_matchings/9FC031D0", check_unknown_range);

INCLUDE_ASM("asm/non_matchings/9FC031D0", check_cert_ranges);

INCLUDE_ASM("asm/non_matchings/9FC031D0", func_9FC03ED0);
