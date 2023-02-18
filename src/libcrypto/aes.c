#include "include_asm.h"

INCLUDE_ASM("asm/non_matchings/libcrypto/aes", aes_HwKeyExpand);

INCLUDE_ASM("asm/non_matchings/libcrypto/aes", aes_SwEncrypt);

INCLUDE_ASM("asm/non_matchings/libcrypto/aes", aes_SwDecrypt);
