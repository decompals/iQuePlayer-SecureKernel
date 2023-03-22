#ifndef BSL_H_
#define BSL_H_

#include "elliptic_math.h"

typedef enum {
    /* 0 */ BSL_OK,
    /* 1 */ BSL_OVERFLOW,
    /* 2 */ BSL_DIVIDE_BY_ZERO,
    /* 3 */ BSL_SHA_ERROR,
    /* 4 */ BSL_BAD_KEY,
    /* 5 */ BSL_NULL_POINTER
} BSL_error;

typedef struct {
    /* 0x00 */ field_2n c;
    /* 0x20 */ field_2n d;
} bsl_signature; // size = 0x40

BSL_error eccGenAesKey(u32* publicKey, u32* privateKey, u32* sharedKey);
BSL_error eccGenPublicKey(u32* publicKey, u32* privateKey);
BSL_error generate_public_key(point* base_point, curve* E, field_2n* my_private, point* my_public);
BSL_error generate_shared_key(point* base_point, curve* E, point* recipient_public, field_2n* my_private,
                              field_2n* shared_secret);
BSL_error poly_key_gen_primitive(ec_parameter* Base, ec_keypair* key, unsigned long* random_input);
BSL_error hash_to_integer(unsigned char* message, unsigned long length, bigint_digit* hash_value, int num_bits,
                          u32 identity);
void Init_233_bit_ECDSA(ec_parameter* base, int num_bits);
BSL_error poly_ECDSA_signature(char* message, unsigned long length, ec_parameter* public_curve, field_2n* private_key,
                               bsl_signature* signature, unsigned long* rand_input, u32 identity);
BSL_error poly_DSA_verify(char* message, unsigned long length, ec_parameter* public_curve, point* signer_point,
                          bsl_signature* signature, BSL_boolean* result, unsigned long identity);
BSL_error bsl_compute_ecc_sig(u8* data, u32 datasize, u32* private_key, u32* random_data, u32* sign, u32 identity);
void bsl_verify_ecc_sig(u8* data, u32 datasize, u32* public_key, u32* sign, BSL_boolean* res, u32 identity);

#endif
