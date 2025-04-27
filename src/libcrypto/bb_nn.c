#include "libcrypto/bb_nn.h"
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
bigint_digit bigint_add_digit_mult(bigint_digit* a, const bigint_digit* b, bigint_digit c, const bigint_digit* d,
                                   int digits) {
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
bigint_digit bigint_sub_digit_mult(bigint_digit* a, const bigint_digit* b, bigint_digit c, const bigint_digit* d,
                                   int digits) {
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

void bigint_digit_div(bigint_digit* a, const bigint_digit* b, const bigint_digit c) {
    bigint_digit t[2];
    bigint_digit u;
    bigint_digit v;
    bigint_half_digit aHigh;
    bigint_half_digit aLow;
    bigint_half_digit cHigh;
    bigint_half_digit cLow;
    bigint_digit temp; // ?

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

    temp = u << 0x10;
    t[0] -= temp;
    if (~temp < t[0]) {
        t[1]--;
    }
    t[1] = t[1] - (u >> 0x10) - v;

    while (cHigh < t[1] || (t[1] == cHigh && t[0] >= (unsigned)(cLow << 0x10))) {
        temp = cLow << 0x10;
        t[0] -= temp;
        if (~temp < t[0]) {
            t[1]--;
        }
        aHigh++;
        t[1] -= cHigh;
    }

    if (cHigh == 0xFFFF) {
        aLow = t[1];
    } else {
        aLow = ((t[1] << 0x10) + (t[0] >> 0x10)) / (cHigh + 1);
    }

    u = aLow * cLow;
    v = aLow * cHigh;
    t[0] -= u;
    if (~u < t[0]) {
        t[1]--;
    }

    temp = v << 0x10;
    t[0] -= temp;
    if (~temp < t[0]) {
        t[1]--;
    }

    t[1] -= v >> 0x10;
    while (t[1] > 0 || (t[1] == 0 && t[0] >= c)) {
        t[0] -= c;
        if (~c < t[0]) {
            t[1]--;
        }
        aLow++;
    }
    *a = (aHigh << 0x10) + aLow;
}

void bigint_encode(u8* a, int len, const bigint_digit* b, int digits) {
    bigint_digit t;
    int j;
    unsigned int i;
    /* unsigned int u; */

    len--;
    for (i = 0; i < (unsigned)digits; i++) {
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

void bigint_copy(bigint_digit* a, const bigint_digit* b, int digits) {
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
bigint_digit bigint_add(bigint_digit* a, const bigint_digit* b, const bigint_digit* c, int digits) {
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
bigint_digit bigint_sub(bigint_digit* a, const bigint_digit* b, const bigint_digit* c, int digits) {
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

int bigint_digits(const bigint_digit* a, int digits) {
    /* int i; */

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
void bigint_mult(bigint_digit* a, const bigint_digit* b, const bigint_digit* c, int digits) {
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
bigint_digit bigint_left_shift(bigint_digit* a, const bigint_digit* b, int c, int digits) {
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
bigint_digit bigint_right_shift(bigint_digit* a, const bigint_digit* b, int c, int digits) {
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
int bigint_cmp(const bigint_digit* a, const bigint_digit* b, int digits) {
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

/**
 * Computes `a = c / d` and `b = c % d`
 * such that `c = d * a + b`
 */
void bigint_div(bigint_digit* a, bigint_digit* b, const bigint_digit* c, int cDigits, const bigint_digit* d,
                int dDigits) {
    bigint_digit ai;
    bigint_digit cc[259];
    bigint_digit dd[129];
    bigint_digit t;
    int i;
    int ddDigits;
    int shift;

    ddDigits = bigint_digits(d, dDigits);
    if (ddDigits == 0) {
        return;
    }
    shift = 32 - bigint_digit_bits(d[ddDigits - 1]);
    bigint_zero(cc, ddDigits);
    cc[cDigits] = bigint_left_shift(cc, c, shift, cDigits);
    bigint_left_shift(dd, d, shift, ddDigits);
    t = dd[ddDigits - 1];
    bigint_zero(a, cDigits);

    for (i = cDigits - ddDigits; i >= 0; i--) {
        if (t == (bigint_digit)(-1)) {
            ai = cc[i + ddDigits];
        } else {
            bigint_digit_div(&ai, &cc[i + ddDigits - 1], t + 1);
        }

        cc[i + ddDigits] -= bigint_sub_digit_mult(&cc[i], &cc[i], ai, dd, ddDigits);

        while (cc[i + ddDigits] != 0 || bigint_cmp(&cc[i], dd, ddDigits) >= 0) {
            ai++;
            cc[i + ddDigits] -= bigint_sub(&cc[i], &cc[i], dd, ddDigits);
        }
        a[i] = ai;
    }

    bigint_zero(b, dDigits);
    bigint_right_shift(b, cc, shift, ddDigits);
}

/**
 * Computes `a = b % c`
 */
void bigint_mod(bigint_digit* a, const bigint_digit* b, int bDigits, const bigint_digit* c, int cDigits) {
    bigint_digit t[258];

    bigint_div(t, a, b, bDigits, c, cDigits);
}

/**
 * Computes `a = (b * c) % d`
 */
void bigint_mod_mult(bigint_digit* a, const bigint_digit* b, const bigint_digit* c, const bigint_digit* d, int digits) {
    bigint_digit t[258];

    bigint_mult(t, b, c, digits);
    bigint_mod(a, t, digits * 2, d, digits);
}

/**
 * Computes `a = (b ^ c) % d`
 * via binary exponentiation (with both 2 and 4)
 */
void bigint_mod_exp(bigint_digit* a, const bigint_digit* b, const bigint_digit* c, int cDigits, const bigint_digit* d,
                    int dDigits) {
    bigint_digit bPower[3][129];
    bigint_digit ci;
    bigint_digit t[129];
    int i;
    unsigned int ciBits;
    unsigned int j;
    unsigned int s;
    bigint_digit exp;
    unsigned int need[4];
    bigint_digit setbits;

    need[0] = 1;
    need[1] = 1;
    need[2] = 0;
    need[3] = 0;

    exp = c[0];
    for (i = 0; i < 16; i++) {
        need[exp % 4]++;
        exp >>= 2;
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
    for (i = ciBits; i >= 0; i--) {
        ci = c[i];
        setbits = 32;
        if ((unsigned)i == ciBits) {
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

int bigint_iszero(const bigint_digit* a, int digits) {
    int i;

    for (i = 0; i < digits; i++) {
        if (a[i] != 0) {
            return FALSE;
        }
    }
    return TRUE;
}

int bigint_bits(const bigint_digit* a, int digits) {
    digits = bigint_digits(a, digits);
    if (digits == 0) {
        return 0;
    }
    return (digits - 1) * 32 + bigint_digit_bits(a[digits - 1]);
}

void bsl_rsa_verify(char* result, const unsigned long* certsign, const unsigned long* certpublickey,
                    const unsigned long* certexponent, int num_bits) {
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
    bigint_encode((u8*)result, (num_bits + 7) / 8, bigc, nDigits);
}

void field_to_bigint(const field_2n* a, bigint_digit* b, int digits) {
    short i;

    for (i = 0; i < digits; i++) {
        b[digits - 1 - i] = a->e[i];
    }
}

void null(field_2n*);

void bigint_to_field(const bigint_digit* a, field_2n* b, int digits) {
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
void bigint_mod_inv(bigint_digit* a, const bigint_digit* b, const bigint_digit* c, int digits) {
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
