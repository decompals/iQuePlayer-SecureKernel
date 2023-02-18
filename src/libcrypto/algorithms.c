#include "include_asm.h"

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", eccGenAesKey); // ecdh

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", eccGenPublicKey);

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", generate_public_key);

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", generate_shared_key);

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", poly_key_gen_primitive);

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", hash_to_integer);

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", Init_233_bit_ECDSA);

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", poly_ECDSA_signature);

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", poly_DSA_verify);

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", bsl_compute_ecc_sig);

INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", bsl_verify_ecc_sig);
