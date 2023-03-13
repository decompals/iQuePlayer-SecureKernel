#include "include_asm.h"
#include "libcrypto/bb_nn.h"
#include "bbtypes.h"
#include "macros.h"

void null(field_2n* a) {
    element* eptr = a->e;
    short i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        *eptr++ = 0;
    }
}

void double_null(field_double* a) {
    element* eptr = a->e;
    short i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        *eptr++ = 0;
    }
}

void double_add(field_double* a, field_double* b, field_double* c) {
    element* aptr = a->e;
    element* bptr = b->e;
    element* cptr = c->e;
    short i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        unsigned long tempA = *aptr++;
        unsigned long tempB = *bptr++;
        *cptr++ = tempA ^ tempB;
    }
}

void copy(field_2n* from, field_2n* to) {
    element* fromptr = from->e;
    element* toptr = to->e;
    short i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(from->e); i++) {
        *toptr++ = *fromptr++;
    }
}

void double_copy(field_double* from, field_double* to) {
    element* fromptr = from->e;
    element* toptr = to->e;
    short i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(from->e); i++) {
        *toptr++ = *fromptr++;
    }
}

void single_to_double(field_2n* from, field_double* to) {
    short i;

    double_null(to);

    for (i = 0; i < (unsigned)ARRAY_COUNT(from->e); i++) {
        to->e[i + ARRAY_COUNT(to->e) - ARRAY_COUNT(from->e)] = from->e[i];
    }
}

void double_to_single(field_double* from, field_2n* to) {
    short i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(to->e); i++) {
        to->e[i] = from->e[i + ARRAY_COUNT(from->e) - ARRAY_COUNT(to->e)];
    }
}

void multiply_shift(field_double* a) {
    element* eptr = &a->e[ARRAY_COUNT(a->e) - 1];
    element bit = 0;
    short i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++, eptr--) {
        element temp = *eptr;
        *eptr = (temp << 1) | bit;
        bit = temp >> 31;
    }
}

INCLUDE_ASM("asm/non_matchings/libcrypto/poly_math", poly_mul_partial);

INCLUDE_ASM("asm/non_matchings/libcrypto/poly_math", multiply_shift_n);

INCLUDE_ASM("asm/non_matchings/libcrypto/poly_math", divide_shift_n);

void extract_masked_bits(field_double* a, field_double* mask, field_double* result) {
    short i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        result->e[i] = a->e[i] & mask->e[i];
    }
}

void zero_masked_bits(field_double* a, field_double* mask) {
    short i;

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
    extract_mask.e[7] = -0x200;
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
    int moving_one;
    int num_words_divide;
    int num_bits_divide;
    int i;
    int j;
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
    int i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        if (a->e[i] == b->e[i]) {
            continue;
        } else if (a->e[i] < b->e[i]) {
            *result = BSL_TRUE;
            break;
        } else {
            *result = TRUE;
            break;
        }
    }
}

INCLUDE_ASM("asm/non_matchings/libcrypto/poly_math", poly_inv);

void poly_rot_right(field_2n* a) {
    element* eptr = a->e;
    element bit;
    element temp;
    short i;

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
