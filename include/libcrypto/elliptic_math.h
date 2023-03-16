#ifndef ELLIPTIC_MATH_H_
#define ELLIPTIC_MATH_H_

#include "bb_nn.h"

typedef struct {
    /* 0x00 */ short form;
    /* 0x04 */ field_2n a2;
    /* 0x24 */ field_2n a6;
} curve; // size = 0x44

typedef struct {
    /* 0x00 */ field_2n x;
    /* 0x20 */ field_2n y;
} point; // size = 0x40

typedef struct {
    /* 0x00 */ field_2n private_key;
    /* 0x20 */ point public_key;
} ec_keypair; // size = 0x60

typedef struct {
    /* 0x00 */ curve par_curve;
    /* 0x44 */ point par_point;
    /* 0x84 */ field_2n point_order;
    /* 0xA4 */ field_2n cofactor;
} ec_parameter; // size = 0xC4

void Init_233_bit(void);
void copy_point(point* p1, point* p2);
void poly_elliptic_sum(point* p1, point* p2, point* p3, curve* curv);
void poly_elliptic_double(point* p1, point* p3, curve* curv);
void poly_elliptic_sub(point* p1, point* p2, point* p3, curve* curv);
void poly_elliptic_mul_slow(field_2n* k, point* p, point* r, curve* curv);
void poly_elliptic_mul_four(field_2n* k, point* p, point* r, curve* curv);
void do_precompute_two(point* p, point* precompute, curve* curv);
void poly_elliptic_mul(field_2n* k, point* p, point* r, curve* curv);

#endif
