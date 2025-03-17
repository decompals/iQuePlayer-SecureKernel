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

/**
 * Computes c = a + b
 */
void double_add(const field_double* a, const field_double* b, field_double* c) {
    const element* aptr = a->e;
    const element* bptr = b->e;
    element* cptr = c->e;
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        unsigned long tempA = *aptr++;
        unsigned long tempB = *bptr++;
        *cptr++ = tempA ^ tempB;
    }
}

void copy(const field_2n* from, field_2n* to) {
    const element* fromptr = from->e;
    element* toptr = to->e;
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(from->e); i++) {
        *toptr++ = *fromptr++;
    }
}

void double_copy(const field_double* from, field_double* to) {
    const element* fromptr = from->e;
    element* toptr = to->e;
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(from->e); i++) {
        *toptr++ = *fromptr++;
    }
}

void single_to_double(const field_2n* from, field_double* to) {
    ITER_TYPE i;

    double_null(to);

    for (i = 0; i < (unsigned)ARRAY_COUNT(from->e); i++) {
        to->e[i + ARRAY_COUNT(to->e) - ARRAY_COUNT(from->e)] = from->e[i];
    }
}

void double_to_single(const field_double* from, field_2n* to) {
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(to->e); i++) {
        to->e[i] = from->e[i + ARRAY_COUNT(from->e) - ARRAY_COUNT(to->e)];
    }
}

/**
 * Computes a *= 2
 */
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

// Thank https://decomp.me/scratch/NRt8J
void poly_mul_partial(const field_2n* a, const field_2n* b, field_double* c) {
    ITER_TYPE i;
    short bit_count;
    UNSIGNED int word;
    element mask;
    field_double local_b;
    ITER_TYPE k;
    int num_shift;
    int b_start;
    element* eptr;
    element temp;
    element bit;
    element* local_bptr;
    element* cptr;
    field_double bprep[16];
    element multiplier;

    for (i = 0; i < 15u; i++) {
        bprep[0].e[i] = 0;
    }

    single_to_double(b, &bprep[1]);
    for (i = 0; i < 15u; i++) {
        local_b.e[i] = bprep[1].e[i];
    }

    multiply_shift(&local_b);
    for (i = 0; i < 15u; i++) {
        bprep[2].e[i] = local_b.e[i];
    }

    multiply_shift(&local_b);
    for (i = 0; i < 15u; i++) {
        bprep[4].e[i] = local_b.e[i];
    }

    multiply_shift(&local_b);
    for (i = 0; i < 15u; i++) {
        bprep[8].e[i] = local_b.e[i];
    }

    for (i = 0; i < 15u; i++) {
        bprep[ 3].e[i] = bprep[ 2].e[i] ^ bprep[1].e[i];
        bprep[ 5].e[i] = bprep[ 4].e[i] ^ bprep[1].e[i];
        bprep[ 6].e[i] = bprep[ 4].e[i] ^ bprep[2].e[i];
        bprep[ 7].e[i] = bprep[ 6].e[i] ^ bprep[1].e[i];
        bprep[ 9].e[i] = bprep[ 8].e[i] ^ bprep[1].e[i];
        bprep[10].e[i] = bprep[ 8].e[i] ^ bprep[2].e[i];
        bprep[11].e[i] = bprep[10].e[i] ^ bprep[1].e[i];
        bprep[12].e[i] = bprep[ 8].e[i] ^ bprep[4].e[i];
        bprep[13].e[i] = bprep[12].e[i] ^ bprep[1].e[i];
        bprep[14].e[i] = bprep[12].e[i] ^ bprep[2].e[i];
        bprep[15].e[i] = bprep[14].e[i] ^ bprep[1].e[i];
    }

    double_null(c);

    mask = 0xF0000000;
    multiplier = 7;
    for (i = 7; GEQ0(i); i--) {        
        for (bit_count = 7; bit_count >= 0; bit_count--) {
            num_shift = 7 - bit_count;
            b_start = (mask & a->e[bit_count]) >> (i * 4);
            local_bptr = &bprep[b_start].e[multiplier];
            cptr = &c->e[multiplier - num_shift];

            for (k = 0; k < 8u; k++) {
                *cptr = *local_bptr ^ *cptr;
                local_bptr++;
                cptr++;
            }
        }
        if (i != 0) {
            eptr = &c->e[14];
            bit = 0;
            for (word = 0; word < 15u; word++) {
                temp = *eptr;
                *eptr = (temp << 4) | bit;
                bit = temp >> (32 - 4);
                eptr--;
            }
        }
        mask >>= 4;
    }
}


/**
 * Computes a *= 2^n
 */
void multiply_shift_n(field_double* a, int n) {
    element* eptr;
    element temp;
    element bit;
    ITER_TYPE i;
    UNSIGNED short num_words_shift;

    num_words_shift = (unsigned)n / 32;
    n = (unsigned)n % 32;

    for (i = 0; i <= (unsigned)ARRAY_COUNT(a->e) - 1 - num_words_shift; i++) {
        a->e[i] = a->e[i + num_words_shift];
    }
    for (i = (unsigned)ARRAY_COUNT(a->e) - num_words_shift; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        a->e[i] = 0;
    }

    eptr = &a->e[(unsigned)ARRAY_COUNT(a->e) - 1];
    bit = 0;
    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        temp = (*eptr << n) | bit;
        bit = (*eptr & leftmask[n]) >> (32 - n);
        *eptr-- = temp;
    }
}

/**
 * Computes a /= 2^n
 */
void divide_shift_n(field_double* a, int n) {
    element* eptr;
    element temp;
    element bit;
    ITER_TYPE i;
    UNSIGNED short num_words_shift;

    num_words_shift = (unsigned)n / 32;
    n = (unsigned)n % 32;

    for (i = (unsigned)ARRAY_COUNT(a->e) - 1 - num_words_shift; GEQ0(i); i--) {
        a->e[i + num_words_shift] = a->e[i];
    }
    for (i = 0; i < num_words_shift; i++) {
        a->e[i] = 0;
    }

    eptr = &a->e[0];
    bit = 0;
    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        temp = (*eptr >> n) | bit;
        bit= (*eptr & rightmask[n]) << (32 - n);
        *eptr++ = temp;
    }
}

void extract_masked_bits(const field_double* a, const field_double* mask, field_double* result) {
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        result->e[i] = a->e[i] & mask->e[i];
    }
}

void zero_masked_bits(field_double* a, const field_double* mask) {
    ITER_TYPE i;

    for (i = 0; i < (unsigned)ARRAY_COUNT(a->e); i++) {
        a->e[i] &= ~mask->e[i];
    }
}

/**
 * 
 */
void shift_and_add(field_double* temp, const field_double* extract_mask) {
    field_double temp1;
    field_double temp_masked;

    // temp_masked = temp & extract_mask
    extract_masked_bits(temp, extract_mask, &temp_masked);
    // zero the mask bits in temp
    zero_masked_bits(temp, extract_mask);
    // temp_masked /= 2^{233 - 74}
    divide_shift_n(&temp_masked, 233 - 74);
    // temp1 = temp + temp_masked
    double_add(temp, &temp_masked, &temp1);
    // temp_masked /= 2^74
    divide_shift_n(&temp_masked, 74);
    // temp = temp1 + temp_masked
    double_add(&temp1, &temp_masked, temp);
}

/* Computes c = (a * b) mod x^233 + x^74 + 1 */
void poly_mul(const field_2n* a, const field_2n* b, field_2n* c) {
    field_double temp;
    field_double extract_mask;

    double_null(&extract_mask);
    extract_mask.e[0] = 0x000FFFFF;
    extract_mask.e[1] = 0xFFFFFFFF;
    extract_mask.e[2] = 0xFFFFFFFF;
    extract_mask.e[3] = 0xFFFFFFFF;
    extract_mask.e[4] = 0xFFFFFFFF;
    extract_mask.e[5] = 0xFFE00000;
    poly_mul_partial(a, b, &temp); // temp = a * b
    shift_and_add(&temp, &extract_mask);
    divide_shift_n(&extract_mask, 233 - 74);
    extract_mask.e[7] = 0xFFFFFE00;
    extract_mask.e[8] = 0x00000000;
    extract_mask.e[9] = 0x00000000;
    extract_mask.e[10] = 0x00000000;
    extract_mask.e[11] = 0x00000000;
    extract_mask.e[12] = 0x00000000;
    extract_mask.e[13] = 0x00000000;
    extract_mask.e[14] = 0x00000000;
    shift_and_add(&temp, &extract_mask);
    double_to_single(&temp, c);
}

void cus_times_u_to_n(const field_2n* a, unsigned int n, field_2n* b) {
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

    // Divide in chunks of 2^32 first
    for (i = 0; i < num_words_divide; i++) {
        // temp_masked = a_copy & extract_mask
        extract_masked_bits(&a_copy, &extract_mask, &temp_masked);
        fromptr = temp_masked.e;
        temp1ptr = temp1.e;
        temp2ptr = temp2.e;

        // temp1 = temp2 = temp_masked
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
        // temp1 = a_copy * (1 + 2^74 + 2^233)
        double_add(&temp3, &temp2, &temp1);
        // temp1 &= ~extract_mask
        zero_masked_bits(&temp1, &extract_mask);
        // temp1 /= 2^32
        divide_shift_n(&temp1, 32);
        // a_copy = temp1
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

void is_less_than(const field_2n* a, const field_2n* b, BSL_boolean* result) {
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

/**
 * Inverts the polynomial `a` in GF(2^m) using the Almost Inverse algorithm
 *
 * Schroeppel, R., Orman, H., O’Malley, S., Spatscheck, O. (1995).
 * Fast Key Exchange with Elliptic Curve Systems.
 * In: Coppersmith, D. (eds) Advances in Cryptology — CRYPT0’ 95. CRYPTO 1995.
 *     Lecture Notes in Computer Science, vol 963. Springer, Berlin, Heidelberg.
 * https://doi.org/10.1007/3-540-44750-4_4
 *
 * https://www.cs.arizona.edu/sites/default/files/TR95-03.pdf
 */
void poly_inv(const field_2n* a, field_2n* dest) {
    field_2n f;
    field_2n b;
    field_2n c;
    field_2n g;
    ITER_TYPE i;
    ITER_TYPE j;
    short m;
    short n;
    UNSIGNED short f_top;
    UNSIGNED short c_top;
    element bits;
    unsigned int longword = ARRAY_COUNT(a->e) - 1;

    null(&c); // C = 0
    null(&b);
    copy(a, &f); // F = a
    copy(&poly_prime, &g); // G = p
    c_top = longword;
    f_top = 0;
    b.e[longword] = 1; // B = 1

    n = 0;
    do {
        i = shift_by[f.e[longword] & 0xFF];
        n += i;

        if (i == 0) {
            break;
        }

        m = 0;
        for (j = f_top; j <= longword; j++) {
            bits = f.e[j];
            f.e[j] = (bits >> i) | ((element)m << (32 - i));
            m = bits;
        }
    } while (i == 8 && (f.e[longword] & 1) == 0);

    for (j = 0; j < longword; j++) {
        if (f.e[j] != 0) {
            break;
        }
    }

    if (j >= longword && f.e[longword] == 1) {
        goto end;
    }

    do {
        while (f.e[f_top] == 0 && g.e[f_top] == 0) {
            f_top++;
        }

        if (f.e[f_top] < g.e[f_top]) {
            // deg(f) < deg(g), swap f and g
            goto backward;
        }
    forward:

        // f = f + g
        for (i = f_top; i <= longword; i++) {
            f.e[i] ^= g.e[i];
        }

        // b = b + c
        for (i = c_top; i <= longword; i++) {
            b.e[i] ^= c.e[i];
        }

        // Shift f down and c up until f is odd
        do {
            i = shift_by[f.e[longword] & 0xFF];
            n += i;

            m = 0;
            for (j = longword; j >= c_top; j--) {
                bits = c.e[j];
                c.e[j] = (bits << i) | m;
                m = bits >> (32 - i);
            }

            if (m != 0) {
                c_top = j;
                c.e[c_top] = m;
            }

            m = 0;
            for (j = f_top; j <= longword; j++) {
                bits = f.e[j];
                f.e[j] = (bits >> i) | ((element)m << (32 - i));
                m = bits;
            }
        } while (i == 8 && (f.e[longword] & 1) == 0);

        for (j = f_top; j < longword; j++) {
            if (f.e[j] != 0) {
                break;
            }
        }
    } while (j < longword || f.e[longword] != 1);

    if (j > 0) {
        goto end;
    }

    do {
        while (g.e[f_top] == 0 && f.e[f_top] == 0) {
            f_top++;
        }

        if (g.e[f_top] < f.e[f_top]) {
            // deg(g) < deg(f), swap g and f
            goto forward;
        }
    backward:

        // g = g + f
        for (i = f_top; i <= longword; i++) {
            g.e[i] ^= f.e[i];
        }

        // c = c + b
        for (i = c_top; i <= longword; i++) {
            c.e[i] ^= b.e[i];
        }

        // Shift g down and b up until g is odd
        do {
            i = shift_by[g.e[longword] & 0xFF];
            n += i;

            m = 0;
            for (j = longword; j >= c_top; j--) {
                bits = b.e[j];
                b.e[j] = (bits << i) | m;
                m = bits >> (32 - i);
            }

            if (m != 0) {
                c_top = j;
                b.e[c_top] = m;
            }

            m = 0;
            for (j = f_top; j <= longword; j++) {
                bits = g.e[j];
                g.e[j] = (bits >> i) | ((element)m << (32 - i));
                m = bits;
            }
        } while (i == 8 && (g.e[longword] & 1) == 0);

        for (j = f_top; j < longword; j++) {
            if (g.e[j] != 0) {
                break;
            }
        }
    } while (j < longword || g.e[longword] != 1);

    copy(&c, &b);

end:
    cus_times_u_to_n(&b, n, dest);
}

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
