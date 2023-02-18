#include "include_asm.h"

INCLUDE_ASM("asm/non_matchings/libcrypto/aes_api", aesMakeKey);

INCLUDE_ASM("asm/non_matchings/libcrypto/aes_api", aesCipherInit);

INCLUDE_ASM("asm/non_matchings/libcrypto/aes_api", aesBlockEncrypt);

INCLUDE_ASM("asm/non_matchings/libcrypto/aes_api", aesBlockDecrypt);
