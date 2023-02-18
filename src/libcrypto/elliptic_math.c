#include "include_asm.h"

INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", Init_233_bit);

INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", copy_point);

INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_sum);

INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_double);

INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_sub);

INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_mul_slow);

INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_mul_four);

INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", do_precompute_two);

INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_mul);
