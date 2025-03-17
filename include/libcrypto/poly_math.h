#ifndef POLY_MATH_H_
#define POLY_MATH_H_

#include "bb_nn.h"

void null(field_2n* a);
void double_null(field_double* a);
void double_add(const field_double* a, const field_double* b, field_double* c);
void copy(const field_2n* from, field_2n* to);
void double_copy(const field_double* from, field_double* to);
void single_to_double(const field_2n* from, field_double* to);
void double_to_single(const field_double* from, field_2n* to);
void multiply_shift(field_double* a);
void poly_mul_partial(const field_2n* a, const field_2n* b, field_double* c);
void multiply_shift_n(field_double* a, int n);
void divide_shift_n(field_double* a, int n);
void extract_masked_bits(const field_double* a, const field_double* mask, field_double* result);
void zero_masked_bits(field_double* a, const field_double* mask);
void shift_and_add(field_double* temp, const field_double* extract_mask);
void poly_mul(const field_2n* a, const field_2n* b, field_2n* c);
void cus_times_u_to_n(const field_2n* a, unsigned int n, field_2n* b);
void is_less_than(const field_2n* a, const field_2n* b, BSL_boolean* result);
void poly_inv(const field_2n* a, field_2n* dest);
void poly_rot_right(field_2n* a);

#endif
