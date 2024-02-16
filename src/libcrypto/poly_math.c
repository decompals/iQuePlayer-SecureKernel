#include "include_asm.h"
#include "libcrypto/poly_math.h"
#include "macros.h"

const field_2n poly_prime = {
    { 0x00000200, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0x00000000, 0x00000001 },
};

const element rightmask[32] = {
    0x00000000, 0x00000001, 0x00000003, 0x00000007, 0x0000000F, 0x0000001F, 0x0000003F, 0x0000007F,
    0x000000FF, 0x000001FF, 0x000003FF, 0x000007FF, 0x00000FFF, 0x00001FFF, 0x00003FFF, 0x00007FFF,
    0x0000FFFF, 0x0001FFFF, 0x0003FFFF, 0x0007FFFF, 0x000FFFFF, 0x001FFFFF, 0x003FFFFF, 0x007FFFFF,
    0x00FFFFFF, 0x01FFFFFF, 0x03FFFFFF, 0x07FFFFFF, 0x0FFFFFFF, 0x1FFFFFFF, 0x3FFFFFFF, 0x7FFFFFFF,
};

const element leftmask[32] = {
    0x00000000, 0x80000000, 0xC0000000, 0xE0000000, 0xF0000000, 0xF8000000, 0xFC000000, 0xFE000000,
    0xFF000000, 0xFF800000, 0xFFC00000, 0xFFE00000, 0xFFF00000, 0xFFF80000, 0xFFFC0000, 0xFFFE0000,
    0xFFFF0000, 0xFFFF8000, 0xFFFFC000, 0xFFFFE000, 0xFFFFF000, 0xFFFFF800, 0xFFFFFC00, 0xFFFFFE00,
    0xFFFFFF00, 0xFFFFFF80, 0xFFFFFFC0, 0xFFFFFFE0, 0xFFFFFFF0, 0xFFFFFFF8, 0xFFFFFFFC, 0xFFFFFFFE,
};

const u8 shift_by[256] = {
    8, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
};

#ifndef NON_MATCHING
#define ITER_TYPE short
#define UNSIGNED
#else
#define ITER_TYPE unsigned
#define UNSIGNED unsigned
#endif

void null(field_2n* a) {
    element* eptr = a->e;
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        *eptr++ = 0;
    }
}

void double_null(field_double* a) {
    element* eptr = a->e;
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        *eptr++ = 0;
    }
}

void double_add(field_double* a, field_double* b, field_double* c) {
    element* aptr = a->e;
    element* bptr = b->e;
    element* cptr = c->e;
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        unsigned long tempA = *aptr++;
        unsigned long tempB = *bptr++;
        *cptr++ = tempA ^ tempB;
    }
}

void copy(field_2n* from, field_2n* to) {
    element* fromptr = from->e;
    element* toptr = to->e;
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(from->e); i++) {
        *toptr++ = *fromptr++;
    }
}

void double_copy(field_double* from, field_double* to) {
    element* fromptr = from->e;
    element* toptr = to->e;
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(from->e); i++) {
        *toptr++ = *fromptr++;
    }
}

void single_to_double(field_2n* from, field_double* to) {
    ITER_TYPE i;

    double_null(to);

    for (i = 0; i < (unsigned)ARRAY_COUNT(from->e); i++) {
        to->e[i + ARRAY_COUNT(to->e) - ARRAY_COUNT(from->e)] = from->e[i];
    }
}

void double_to_single(field_double* from, field_2n* to) {
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(to->e); i++) {
        to->e[i] = from->e[i + ARRAY_COUNT(from->e) - ARRAY_COUNT(to->e)];
    }
}

void multiply_shift(field_double* a) {
    element* eptr = &a->e[ARRAY_COUNT(a->e) - 1];
    element bit = 0;
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++, eptr--) {
        element temp = *eptr;
        *eptr = (temp << 1) | bit;
        bit = temp >> 31;
    }
}

void poly_mul_partial(field_2n* a, field_2n* b, field_double* c);
#if 0
    short int i;
    short int bit_count;
    short int word;
    element mask;
    field_double local_b;
    int k;
    int num_shift;
    int b_start;
    element* eptr;
    element temp;
    element bit;
    element* local_bptr;
    element* cptr;
    field_double bprep[16];
    element multiplier;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/poly_math", poly_mul_partial);

void multiply_shift_n(field_double* a, int n);
#if 0
    element* eptr;
    element temp;
    element bit;
    short int i;
    short int num_words_shift;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/poly_math", multiply_shift_n);

void divide_shift_n(field_double* a, int n);
#if 0
    element* eptr;
    element temp;
    element bit;
    short int i;
    short int num_words_shift;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/poly_math", divide_shift_n);

void extract_masked_bits(field_double* a, field_double* mask, field_double* result) {
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        result->e[i] = a->e[i] & mask->e[i];
    }
}

void zero_masked_bits(field_double* a, field_double* mask) {
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        a->e[i] &= ~mask->e[i];
    }
}

void shift_and_add(field_double* temp, field_double* extract_mask) {
    field_double temp1;
    field_double temp_masked;

    extract_masked_bits(temp, extract_mask, &temp_masked);
    zero_masked_bits(temp, extract_mask);
    divide_shift_n(&temp_masked, 159);
    double_add(temp, &temp_masked, &temp1);
    divide_shift_n(&temp_masked, 74);
    double_add(&temp1, &temp_masked, temp);
}

void poly_mul(field_2n* a, field_2n* b, field_2n* c) {
    field_double temp;
    field_double extract_mask;

    double_null(&extract_mask);
    extract_mask.e[0] = 0xFFFFF;
    extract_mask.e[1] = 0xFFFFFFFF;
    extract_mask.e[2] = 0xFFFFFFFF;
    extract_mask.e[3] = 0xFFFFFFFF;
    extract_mask.e[4] = 0xFFFFFFFF;
    extract_mask.e[5] = 0xFFE00000;
    poly_mul_partial(a, b, &temp);
    shift_and_add(&temp, &extract_mask);
    divide_shift_n(&extract_mask, 159);
    extract_mask.e[7] = 0xFFFFFE00;
    extract_mask.e[8] = 0;
    extract_mask.e[9] = 0;
    extract_mask.e[10] = 0;
    extract_mask.e[11] = 0;
    extract_mask.e[12] = 0;
    extract_mask.e[13] = 0;
    extract_mask.e[14] = 0;
    shift_and_add(&temp, &extract_mask);
    double_to_single(&temp, c);
}

void cus_times_u_to_n(field_2n* a, unsigned int n, field_2n* b) {
    field_double extract_mask;
    field_double temp1;
    field_double temp2;
    field_double temp3;
    field_double temp_masked;
    field_double a_copy;
    UNSIGNED int moving_one;
    UNSIGNED int num_words_divide;
    UNSIGNED int num_bits_divide;
    UNSIGNED int i;
    UNSIGNED int j;
    element* fromptr;
    element* temp1ptr;
    element* temp2ptr;

    single_to_double(a, &a_copy);
    double_null(&extract_mask);
    extract_mask.e[ARRAY_COUNT(extract_mask.e) - 1] = 0xFFFFFFFF;

    num_words_divide = n >> 5;
    num_bits_divide = n & 0x1F;

    for (i = 0; i < num_words_divide; i++) {
        extract_masked_bits(&a_copy, &extract_mask, &temp_masked);
        fromptr = temp_masked.e;
        temp1ptr = temp1.e;
        temp2ptr = temp2.e;

        for (j = 0; j < (unsigned)ARRAY_COUNT(temp_masked.e); j++) {
            *temp1ptr = *fromptr;
            *temp2ptr = *fromptr;
            fromptr++;
            temp1ptr++;
            temp2ptr++;
        }

        multiply_shift_n(&temp1, 233);
        multiply_shift_n(&temp2, 74);
        double_add(&a_copy, &temp1, &temp3);
        double_add(&temp3, &temp2, &temp1);
        zero_masked_bits(&temp1, &extract_mask);
        divide_shift_n(&temp1, 32);
        double_copy(&temp1, &a_copy);
    }

    double_null(&extract_mask);

    moving_one = 1;
    for (j = 0; j < num_bits_divide; j++) {
        extract_mask.e[ARRAY_COUNT(extract_mask.e) - 1] |= moving_one;
        moving_one <<= 1;
    }

    extract_masked_bits(&a_copy, &extract_mask, &temp_masked);
    double_copy(&temp_masked, &temp1);
    double_copy(&temp_masked, &temp2);
    multiply_shift_n(&temp1, 233);
    multiply_shift_n(&temp2, 74);
    double_add(&a_copy, &temp1, &temp3);
    double_add(&temp3, &temp2, &temp1);
    zero_masked_bits(&temp1, &extract_mask);
    divide_shift_n(&temp1, num_bits_divide);
    double_copy(&temp1, &a_copy);
    double_to_single(&a_copy, b);
}

void is_less_than(field_2n* a, field_2n* b, BSL_boolean* result) {
    UNSIGNED int i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        if (a->e[i] == b->e[i]) {
            continue;
        } else if (a->e[i] < b->e[i]) {
            *result = BSL_TRUE;
            break;
        } else {
            *result = BSL_FALSE;
            break;
        }
    }
}

void poly_inv(field_2n* a, field_2n* dest);
#if 0
    field_2n f;
    field_2n b;
    field_2n c;
    field_2n g;
    short i;
    short j;
    short m;
    short n;
    short f_top;
    short c_top;
    element bits;
    unsigned int longword;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/poly_math", poly_inv);

void poly_rot_right(field_2n* a) {
    /* element* eptr; */
    element bit;
    element temp;
    ITER_TYPE i;

    if (a->e[ARRAY_COUNT(a->e) - 1] & 1) {
        bit = 0x100;
    } else {
        bit = 0;
    }

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        temp = (a->e[i] >> 1) | bit;
        if (a->e[i] & 1) {
            bit = 0x80000000;
        } else {
            bit = 0;
        }
        a->e[i] = temp;
    }
    a->e[0] &= 0x1FF;
}
