#include "include_asm.h"

INCLUDE_ASM("asm/non_matchings/libcrypto/aes_imp", rijndaelKeySetupEnc);

INCLUDE_ASM("asm/non_matchings/libcrypto/aes_imp", rijndaelKeySetupDec);

INCLUDE_ASM("asm/non_matchings/libcrypto/aes_imp", rijndaelEncrypt);

INCLUDE_ASM("asm/non_matchings/libcrypto/aes_imp", rijndaelDecrypt);
