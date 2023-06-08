#ifndef BB_NN_H_
#define BB_NN_H_

#include "ultratypes.h"

// TODO different header?
typedef enum {
    /* 0 */ BSL_TRUE,
    /* 1 */ BSL_FALSE
} BSL_boolean, boolean;

typedef u32 bigint_digit;
typedef u16 bigint_half_digit;

typedef unsigned long element;

typedef struct {
    /* 0x00 */ element e[8];
} field_2n; // size = 0x20

typedef struct {
    /* 0x00 */ element e[15];
} field_double; // size = 0x3C

void bigint_digit_mult(bigint_digit* a, bigint_digit b, bigint_digit c);
bigint_digit bigint_add_digit_mult(bigint_digit* a, bigint_digit* b, bigint_digit c, bigint_digit* d, int digits);
bigint_digit bigint_sub_digit_mult(bigint_digit* a, bigint_digit* b, bigint_digit c, bigint_digit* d, int digits);
int bigint_digit_bits(bigint_digit a);
void bigint_digit_div(bigint_digit* a, bigint_digit* b, bigint_digit c);
void bigint_encode(u8* a, int len, bigint_digit* b, int digits);
void bigint_copy(bigint_digit* a, bigint_digit* b, int digits);
void bigint_zero(bigint_digit* a, int digits);
bigint_digit bigint_add(bigint_digit* a, bigint_digit* b, bigint_digit* c, int digits);
bigint_digit bigint_sub(bigint_digit* a, bigint_digit* b, bigint_digit* c, int digits);
int bigint_digits(bigint_digit* a, int digits);
void bigint_mult(bigint_digit* a, bigint_digit* b, bigint_digit* c, int digits);
bigint_digit bigint_left_shift(bigint_digit* a, bigint_digit* b, int c, int digits);
bigint_digit bigint_right_shift(bigint_digit* a, bigint_digit* b, int c, int digits);
int bigint_cmp(bigint_digit* a, bigint_digit* b, int digits);
void bigint_div(bigint_digit* a, bigint_digit* b, bigint_digit* c, int cDigits, bigint_digit* d, int dDigits);
void bigint_mod(bigint_digit* a, bigint_digit* b, int bDigits, bigint_digit* c, int cDigits);
void bigint_mod_mult(bigint_digit* a, bigint_digit* b, bigint_digit* c, bigint_digit* d, int digits);
void bigint_mod_exp(bigint_digit* a, bigint_digit* b, bigint_digit* c, int cDigits, bigint_digit* d, int dDigits);
int bigint_iszero(bigint_digit* a, int digits);
int bigint_bits(bigint_digit* a, int digits);
void bsl_rsa_verify(char* result, unsigned long* certsign, const unsigned long* certpublickey, const unsigned long* certexponent,
                    int num_bits);
void field_to_bigint(field_2n* a, bigint_digit* b, int digits);
void bigint_to_field(bigint_digit* a, field_2n* b, int digits);
void bigint_mod_inv(bigint_digit* a, bigint_digit* b, bigint_digit* c, int digits);

#endif
