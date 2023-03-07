#include "include_asm.h"
#include "bb_nn.h"
#include "macros.h"

/**
 * Compute `a = b * c`
 */
void bigint_digit_mult(bigint_digit* a, bigint_digit b, bigint_digit c) {
    bigint_digit t;
    bigint_digit u;

    bigint_half_digit bHigh = b >> 16;
    bigint_half_digit bLow = b;
    bigint_half_digit cHigh = c >> 16;
    bigint_half_digit cLow = c;

    a[0] = bLow * cLow;
    a[1] = bHigh * cHigh;
    t = bLow * cHigh;
    u = bHigh * cLow;

    t += u;
    if (t < u) {
        a[1] += (1 << 16);
    }
    u = t << 16;

    a[0] += u;
    if (a[0] < u) {
        a[1]++;
    }
    a[1] += t >> 16;
}

/**
 * Compute `a = b + c * d`
 * Returns carry
 */
bigint_digit bigint_add_digit_mult(bigint_digit* a, bigint_digit* b, bigint_digit c, bigint_digit* d, int digits) {
    bigint_digit carry;
    bigint_digit t[2];
    int i;

    if (c == 0) {
        return 0;
    }
    carry = 0;

    for (i = 0; i < digits; i++) {
        bigint_digit_mult(t, c, d[i]);
        a[i] = b[i] + carry;
        if (a[i] < carry) {
            carry = 1;
        } else {
            carry = 0;
        }

        a[i] += t[0];
        if (a[i] < t[0]) {
            carry++;
        }
        carry += t[1];
    }
    return carry;
}

/**
 * Compute `a = b - c * d`
 */
bigint_digit bigint_sub_digit_mult(bigint_digit* a, bigint_digit* b, bigint_digit c, bigint_digit* d, int digits) {
    bigint_digit borrow;
    bigint_digit t[2];
    int i;

    if (c == 0) {
        return 0;
    }
    borrow = 0;

    for (i = 0; i < digits; i++) {
        bigint_digit_mult(t, c, d[i]);
        a[i] = b[i] - borrow;
        if (~borrow < a[i]) {
            borrow = 1;
        } else {
            borrow = 0;
        }
        a[i] -= t[0];
        if (~t[0] < a[i]) {
            borrow++;
        }
        borrow += t[1];
    }
    return borrow;
}

int bigint_digit_bits(bigint_digit a) {
    int i;

    for (i = 0; i < 32 && a != 0; i++, a >>= 1) {}
    return i;
}

#ifdef NON_EQUIVALENT
void bigint_digit_div(bigint_digit* a, bigint_digit* b, bigint_digit c) {
    bigint_digit t[2];
    bigint_digit u;
    bigint_digit v;
    bigint_half_digit aHigh;
    bigint_half_digit aLow;
    bigint_half_digit cHigh;
    bigint_half_digit cLow;

    u32 temp_v0_2;
    u16 var_t0;

    cHigh = c >> 0x10;
    cLow = c;
    t[0] = b[0];
    t[1] = b[1];

    if (cHigh == 0xFFFF) {
        aHigh = t[1] >> 0x10;
    } else {
        aHigh = t[1] / (cHigh + 1);
    }

    u = aHigh * cLow;
    v = aHigh * cHigh;
    temp_v0_2 = u << 0x10;

    t[0] -= temp_v0_2;
    if (~temp_v0_2 < t[0]) {
        t[1]--;
    }
    t[1] = (t[1] - (u >> 0x10)) - v;

    while (cHigh < t[1] || t[1] == cHigh) {
        if (t[0] < (cLow << 0x10)) {
            break;
        }
        temp_v0_2 = t[0] << 0x10;

        t[0] -= temp_v0_2;
        if (~temp_v0_2 < t[0]) {
            t[1]--;
        }
        aHigh++;
        t[1] -= cHigh;
    }

    if (cHigh == 0xFFFF) {
        var_t0 = t[1];
    } else {
        var_t0 = ((t[1] << 0x10) + (t[0] >> 0x10)) / (cHigh + 1);
    }

    u = var_t0 * cLow;
    v = var_t0 * cHigh;
    t[0] -= u;
    if (~u < t[0]) {
        t[1]--;
    }

    temp_v0_2 = v << 0x10;
    t[0] -= temp_v0_2;
    if (~temp_v0_2 < t[0]) {
        t[1]--;
    }

    t[1] -= (v >> 0x10);
    if (t[1] != 0) {
        goto loop_27;
    }
block_26:
    if (t[0] >= c) {
    loop_27:
        t[0] -= c;
        if (~c < t[0]) {
            t[1]--;
        }
        var_t0++;
        if (t[1] != 0) {
            goto loop_27;
        }
        goto block_26;
    }

    *a = (aHigh << 0x10) + var_t0;
}
#else
void bigint_digit_div(bigint_digit* a, bigint_digit* b, bigint_digit c);
INCLUDE_ASM("asm/non_matchings/libcrypto/bb_nn", bigint_digit_div);
#endif

void bigint_encode(u8* a, int len, bigint_digit* b, int digits) {
    bigint_digit t;
    int j;
    unsigned int i;
    unsigned int u;

    len--;
    for (i = 0; i < digits; i++) {
        if (len < 0) {
            return;
        }

        t = b[i];
        for (j = 0; len >= 0 && (unsigned)j < 32; j += 8) {
            a[len--] = t >> j;
        }
    }
    while (len >= 0) {
        a[len--] = 0;
    }
}

void bigint_copy(bigint_digit* a, bigint_digit* b, int digits) {
    int i;

    for (i = 0; i < digits; i++) {
        a[i] = b[i];
    }
}

void bigint_zero(bigint_digit* a, int digits) {
    int i;

    for (i = 0; i < digits; i++) {
        a[i] = 0;
    }
}

/**
 * Computes `a = b + c`
 */
bigint_digit bigint_add(bigint_digit* a, bigint_digit* b, bigint_digit* c, int digits) {
    bigint_digit ai;
    bigint_digit bi;
    bigint_digit ci;
    bigint_digit carry;
    int i;

    carry = 0;
    for (i = 0; i < digits; i++) {
        bi = b[i] + carry;

        if (bi < carry) {
            ai = c[i];
        } else {
            ci = c[i];
            ai = bi + ci;

            if (ai < ci) {
                carry = 1;
            } else {
                carry = 0;
            }
        }
        a[i] = ai;
    }
    return carry;
}

/**
 * Computes `a = b - c`
 */
bigint_digit bigint_sub(bigint_digit* a, bigint_digit* b, bigint_digit* c, int digits) {
    bigint_digit ai;
    bigint_digit bi;
    bigint_digit ci;
    bigint_digit borrow;
    int i;

    borrow = 0;
    for (i = 0; i < digits; i++) {
        bi = b[i] - borrow;

        if (~borrow < bi) {
            ai = ~c[i];
        } else {
            ci = c[i];
            ai = bi - ci;

            if (~ci < ai) {
                borrow = 1;
            } else {
                borrow = 0;
            }
        }
        a[i] = ai;
    }
    return borrow;
}

int bigint_digits(bigint_digit* a, int digits) {
    int i;

    while (--digits >= 0) {
        if (a[digits] != 0) {
            break;
        }
    }
    return digits + 1;
}

/**
 * Computes `a = b * c`
 */
void bigint_mult(bigint_digit* a, bigint_digit* b, bigint_digit* c, int digits) {
    bigint_digit t[258];
    int bDigits;
    int cDigits;
    int i;

    bigint_zero(t, digits * 2);

    bDigits = bigint_digits(b, digits);
    cDigits = bigint_digits(c, digits);
    for (i = 0; i < bDigits; i++) {
        t[i + cDigits] += bigint_add_digit_mult(&t[i], &t[i], b[i], c, cDigits);
    }
    bigint_copy(a, t, digits * 2);
}

/**
 * Computes `a = b << c`
 * Returns carry
 */
bigint_digit bigint_left_shift(bigint_digit* a, bigint_digit* b, int c, int digits) {
    bigint_digit bi;
    bigint_digit carry;
    int i;
    int t;

    if (c >= 32) {
        return 0;
    }
    t = 32 - c;

    carry = 0;
    for (i = 0; i < digits; i++) {
        bi = b[i];
        a[i] = (bi << c) | carry;
        if (c != 0) {
            carry = bi >> t;
        } else {
            carry = 0;
        }
    }
    return carry;
}

/**
 * Computes `a = b >> c`
 * Returns carry
 */
bigint_digit bigint_right_shift(bigint_digit* a, bigint_digit* b, int c, int digits) {
    bigint_digit bi;
    bigint_digit carry;
    int i;
    unsigned int t;

    carry = 0;
    if (c >= 32) {
        return 0;
    }
    t = 32 - c;

    for (i = digits - 1; i >= 0; i--) {
        bi = b[i];
        a[i] = (bi >> c) | carry;
        if (c != 0) {
            carry = bi << t;
        } else {
            carry = 0;
        }
    }
    return carry;
}

/**
 * Checks a == b
 *
 * Returns
 *  +1 if b < a
 *  -1 if a < b
 *   0 if they are equal
 */
int bigint_cmp(bigint_digit* a, bigint_digit* b, int digits) {
    bigint_digit ai;
    bigint_digit bi;
    int i;

    for (i = digits - 1; i >= 0; i--) {
        ai = a[i];
        bi = b[i];
        if (bi < ai) {
            return 1;
        }
        if (ai < bi) {
            return -1;
        }
    }
    return 0;
}

#ifdef NON_EQUIVALENT
/**
 * Computes `a = c / d + b`
 */
void bigint_div(bigint_digit* a, bigint_digit* b, bigint_digit* c, int cDigits, bigint_digit* d, int dDigits) {
    bigint_digit ai;
    bigint_digit cc[259];
    bigint_digit dd[129];
    bigint_digit t;
    int i;
    int ddDigits;
    int shift;

    u32 var_v0;

    ddDigits = bigint_digits(d, dDigits);
    if (ddDigits == 0) {
        return;
    }
    shift = 32 - bigint_digit_bits(d[ddDigits - 1]);
    bigint_zero(dd, ddDigits);
    dd[cDigits] = bigint_left_shift(dd, c, shift, cDigits);
    bigint_left_shift(cc, d, shift, ddDigits);
    t = cc[ddDigits - 1];
    bigint_zero(a, cDigits);

    for (i = cDigits - ddDigits; i >= 0; i--) {
        if (t == -1) {
            ai = dd[i + ddDigits];
        } else {
            bigint_digit_div(&ai, &dd[i + ddDigits - 1], t + 1);
        }
        var_v0 = bigint_sub_digit_mult(&dd[i], &dd[i], ai, cc, ddDigits);
loop_9:
        dd[i + ddDigits] -= var_v0;
        if (dd[i + ddDigits] != 0) {
block_8:
            ai++;
            var_v0 = bigint_sub(&dd[i], &dd[i], cc, ddDigits);
            goto loop_9;
        }
        if (bigint_cmp(&dd[i], cc, ddDigits) >= 0) {
            goto block_8;
        }
        a[i] = ai;
    }

    bigint_zero(b, dDigits);
    bigint_right_shift(b, &dd[0], shift, ddDigits);
}
#else
void bigint_div(bigint_digit* a, bigint_digit* b, bigint_digit* c, int cDigits, bigint_digit* d, int dDigits);
INCLUDE_ASM("asm/non_matchings/libcrypto/bb_nn", bigint_div);
#endif

/**
 * Computes `a = b % c`
 */
void bigint_mod(bigint_digit* a, bigint_digit* b, int bDigits, bigint_digit* c, int cDigits) {
    bigint_digit t[258];

    bigint_div(t, a, b, bDigits, c, cDigits);
}

/**
 * Computes `a = (b * c) % d`
 */
void bigint_mod_mult(bigint_digit* a, bigint_digit* b, bigint_digit* c, bigint_digit* d, int digits) {
    bigint_digit t[258];

    bigint_mult(t, b, c, digits);
    bigint_mod(a, t, digits * 2, d, digits);
}

#ifdef NON_MATCHING
// Regalloc only
/**
 * Computes `a = (b ^ c) % d`
 * via binary exponentiation (with both 2 and 4)
 */
void bigint_mod_exp(bigint_digit* a, bigint_digit* b, bigint_digit* c, int cDigits, bigint_digit* d, int dDigits) {
    bigint_digit bPower[3][129];    // sp18, sp21C, sp420
    bigint_digit ci;                //
    bigint_digit t[129];            // sp628
    int i;                          //
    unsigned int ciBits;            //
    unsigned int j;                 //
    unsigned int s;                 //
    bigint_digit exp;               //
    unsigned int need[4];           // sp830[4]
    bigint_digit setbits;           //

    need[0] = 1;
    need[1] = 1;
    need[2] = 0;
    need[3] = 0;

    ciBits = c[0];
    for (i = 0; i < 16; i++) {
        need[ciBits % 4]++;
        ciBits >>= 2;
    }

    if (need[3]) {
        need[2] = 1;
    }
    bigint_copy(bPower[0], b, dDigits);
    if (need[2]) {
        bigint_mod_mult(bPower[1], bPower[0], b, d, dDigits);
    }
    if (need[3]) {
        bigint_mod_mult(bPower[2], bPower[1], b, d, dDigits);
    }
    bigint_zero(t, dDigits);
    t[0] = 1;

    ciBits = bigint_digits(c, cDigits) - 1;
    for (i = ciBits; i >= 0 ; i--) {
        ci = c[i];
        setbits = 32;
        if (i == ciBits) {
            while ((ci >> 30) == 0) {
                ci <<= 2;
                setbits -= 2;
            }
        }

        for (j = 0; j < setbits; j += 2, ci <<= 2) {
            bigint_mod_mult(t, t, t, d, dDigits);
            bigint_mod_mult(t, t, t, d, dDigits);
            s = ci >> 30;
            if (s != 0) {
                bigint_mod_mult(t, t, bPower[s - 1], d, dDigits);
            }
        }
    }
    bigint_copy(a, t, dDigits);
}
#else
void bigint_mod_exp(bigint_digit* a, bigint_digit* b, bigint_digit* c, int cDigits, bigint_digit* d, int dDigits);
INCLUDE_ASM("asm/non_matchings/libcrypto/bb_nn", bigint_mod_exp);
#endif

int bigint_iszero(bigint_digit* a, int digits) {
    int i;

    for (i = 0; i < digits; i++) {
        if (a[i] != 0) {
            return FALSE;
        }
    }
    return TRUE;
}

int bigint_bits(bigint_digit* a, int digits) {
    digits = bigint_digits(a, digits);
    if (digits == 0) {
        return 0;
    }
    return (digits - 1) * 32 + bigint_digit_bits(a[digits - 1]);
}

void bsl_rsa_verify(char* result, unsigned long* certsign, unsigned long* certpublickey,
                    unsigned long* certexponent, int num_bits) {
    unsigned long nDigits;
    bigint_digit bign[129];
    bigint_digit bigm[129];
    bigint_digit bige[129];
    bigint_digit bigc[129];
    int i;
    int num_words = num_bits / 32;

    for (i = 0; i < ARRAY_COUNT(bign); i++) {
        bign[i] = 0;
        bigm[i] = 0;
        bige[i] = 0;
        bigc[i] = 0;
    }

    for (i = 0; i < num_words; i++) {
        bign[num_words - 1 - i] = certpublickey[i];
    }
    for (i = 0; i < num_words; i++) {
        bigm[num_words - 1 - i] = certsign[i];
    }

    bige[0] = *certexponent;
    nDigits = bigint_digits(bign, ARRAY_COUNT(bign));
    bigint_mod_exp(bigc, bigm, bige, 1, bign, nDigits);
    bigint_encode(result, (num_bits + 7) / 8, bigc, nDigits);
}

void field_to_bigint(field_2n* a, bigint_digit* b, int digits) {
    short i;

    for (i = 0; i < digits; i++) {
        b[digits - 1 - i] = a->e[i];
    }
}

void null(field_2n*);

void bigint_to_field(bigint_digit* a, field_2n* b, int digits) {
    short i;

    null(b);
    for (i = 0; i < digits; i++) {
        b->e[i] = a[digits - 1 - i];
    }
}

/**
 * Computes the modular multiplicative inverse `a = b^{-1} mod c`
 * via the extended euclidean algorithm
 */
void bigint_mod_inv(bigint_digit* a, bigint_digit* b, bigint_digit* c, int digits) {
    bigint_digit q[8];
    bigint_digit t1[8];
    bigint_digit t3[8];
    bigint_digit u1[8];
    bigint_digit u3[8];
    bigint_digit v1[8];
    bigint_digit v3[8];
    bigint_digit w[16];
    int u1Sign;

    bigint_zero(u1, digits);
    u1[0] = 1;
    bigint_zero(v1, digits);
    bigint_copy(u3, b, digits);
    bigint_copy(v3, c, digits);

    u1Sign = 1;
    while (!bigint_iszero(v3, digits)) {
        bigint_div(q, t3, u3, digits, v3, digits);
        bigint_mult(w, q, v1, digits);
        bigint_add(t1, u1, w, digits);
        bigint_copy(u1, v1, digits);
        bigint_copy(v1, t1, digits);
        bigint_copy(u3, v3, digits);
        bigint_copy(v3, t3, digits);
        u1Sign = -u1Sign;
    }
    if (u1Sign < 0) {
        bigint_sub(a, c, u1, digits);
    } else {
        bigint_copy(a, u1, digits);
    }
}
