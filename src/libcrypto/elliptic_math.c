#include "include_asm.h"
#include "libcrypto/poly_math.h"
#include "libcrypto/elliptic_math.h"

point precomputed_signer = {
    { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
    { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
};

point precomputed_pk[4] = {
    {
        { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
        { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
    },
    {
        { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
        { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
    },
    {
        { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
        { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
    },
    {
        { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
        { { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, } },
    },
};

curve named_curve;
point named_point;
point precomputed_bp[16];

void Init_233_bit(void);
INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", Init_233_bit);

void copy_point(point* p1, point* p2);
INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", copy_point);

void poly_elliptic_sum(point* p1, point* p2, point* p3, curve* curv);
#if 0
    short int i;
    field_2n x1;
    field_2n y1;
    field_2n lambda;
    field_2n onex;
    field_2n lambda2;
    element check;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_sum);

void poly_elliptic_double(point* p1, point* p3, curve* curv);
#if 0
    field_2n x1;
    field_2n y1;
    field_2n lambda;
    field_2n lambda2;
    field_2n t1;
    short int i;
    element check;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_double);

void poly_elliptic_sub(point* p1, point* p2, point* p3, curve* curv);
#if 0
    point temp;
    short int i;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_sub);

void poly_elliptic_mul_slow(field_2n* k, point* p, point* r, curve* curv);
#if 0
    char balanced[234];
    short int i;
    short int bit_count;
    element notzero;
    field_2n number;
    point temp;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_mul_slow);

void poly_elliptic_mul_four(field_2n* k, point* p, point* r, curve* curv);
#if 0
    element columns[64];
    int i;
    int j;
    element mask;
    point temppoint;
    field_2n number;
    element notzero;
    int bit_num;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_mul_four);

void do_precompute_two(point* p, point* precompute, curve* curv);
#if 0
    int i;
    field_2n temp;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", do_precompute_two);

void poly_elliptic_mul(field_2n* k, point* p, point* r, curve* curv);
#if 0
    point precompute[4];
    element columns[128];
    int i;
    int j;
    int diff;
    int wordpos;
    element mask;
    point temppoint;
    field_2n number;
    element notzero;
    int bit_num;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/elliptic_math", poly_elliptic_mul);
