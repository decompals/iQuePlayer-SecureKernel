#ifndef ELLIPTIC_MATH_H_
#define ELLIPTIC_MATH_H_

#include "bb_nn.h"

// Represents an elliptic curve y^2 + xy = x^3 + a2 * x^2 + a6
typedef struct {
    /* 0x00 */ short form;
    /* 0x04 */ field_2n a2;
    /* 0x24 */ field_2n a6;
} curve; // size = 0x44

// Represents a point (x,y) on an elliptic curve
typedef struct {
    /* 0x00 */ field_2n x;
    /* 0x20 */ field_2n y;
} point; // size = 0x40

typedef struct {
    /* 0x00 */ field_2n private_key;
    /* 0x20 */ point public_key;
} ec_keypair; // size = 0x60

typedef struct {
    /* 0x00 */ curve par_curve;      // CURVE, elliptic curve polynomial
    /* 0x44 */ point par_point;      // G, base point of prime order n
    /* 0x84 */ field_2n point_order; // n, prime order of G
    /* 0xA4 */ field_2n cofactor;    // h, cofactor
} ec_parameter; // size = 0xC4

void Init_233_bit(void);
void copy_point(const point* p1, point* p2);
void poly_elliptic_sum(const point* p1, const point* p2, point* p3, const curve* curv);
void poly_elliptic_double(const point* p1, point* p3, const curve* curv);
void poly_elliptic_sub(const point* p1, const point* p2, point* p3, const curve* curv);
void poly_elliptic_mul_slow(const field_2n* k, const point* p, point* r, const curve* curv);
void poly_elliptic_mul_four(const field_2n* k, const point* p, point* r, const curve* curv);
void do_precompute_two(const point* p, point* precompute, const curve* curv);
void poly_elliptic_mul(const field_2n* k, const point* p, point* r, const curve* curv);

extern curve named_curve;
extern point named_point;
extern point precomputed_bp[16];

#endif
