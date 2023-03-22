#include "include_asm.h"
#include "libcrypto/bb_nn.h"
#include "libcrypto/poly_math.h"
#include "libcrypto/bsl.h"
#include "libcrypto/sha1.h"
#include "macros.h"

BSL_error eccGenAesKey(u32* publicKey, u32* privateKey, u32* sharedKey);
#if 0
    field_2n pvtkey;
    field_2n sharedkey;
    point publickey;
    int i;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", eccGenAesKey); // ecdh

BSL_error eccGenPublicKey(u32* publicKey, u32* privateKey);
#if 0
    field_2n pvtkey;
    point publickey;
    BSL_error error;
    int i;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", eccGenPublicKey);

BSL_error generate_public_key(point* base_point, curve* E, field_2n* my_private, point* my_public);
#if 0
    int i;
    element notzero;
    BSL_boolean isequal;
    field_2n yyxy;
    field_2n yy;
    field_2n xy;
    field_2n xx;
    field_2n xxx;
    field_2n xxxa6;
    field_2n x;
    field_2n y;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", generate_public_key);

BSL_error generate_shared_key(point* base_point, curve* E, point* recipient_public, field_2n* my_private,
                              field_2n* shared_secret);
#if 0
    point tmp;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", generate_shared_key);

BSL_error poly_key_gen_primitive(ec_parameter* Base, ec_keypair* key, unsigned long* random_input);
#if 0
    bigint_digit key_num[8];
    bigint_digit point_order[8];
    bigint_digit quotient[8];
    bigint_digit remainder[8];
    int key_num_digits;
    field_2n random_key;
    int i;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", poly_key_gen_primitive);

BSL_error hash_to_integer(unsigned char* message, unsigned long length, bigint_digit* hash_value, int num_bits,
                          u32 identity);
#if 0
    unsigned char MessageDigest[20];
    field_2n tmp;
    SHA1Context sha;
    int num_word;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", hash_to_integer);

void Init_233_bit_ECDSA(ec_parameter* base, int num_bits);
#if 0
    bigint_digit tmpbigint[8];
    int num_word;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", Init_233_bit_ECDSA);

BSL_error poly_ECDSA_signature(char* message, unsigned long length, ec_parameter* public_curve, field_2n* private_key,
                               bsl_signature* signature, unsigned long* rand_input, u32 identity);
#if 0
    bigint_digit hash_value[8];
    bigint_digit x_value[8];
    bigint_digit k_value[8];
    bigint_digit sig_value[8];
    bigint_digit c_value[8];
    bigint_digit temp[16];
    bigint_digit quotient[16];
    bigint_digit key_value[8];
    bigint_digit point_order[8];
    bigint_digit u_value[8];
    int x_value_digits;
    int point_order_digits;
    ec_keypair random_key;
    int not_zero;
    int i;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", poly_ECDSA_signature);

BSL_error poly_DSA_verify(char* message, unsigned long length, ec_parameter* public_curve, point* signer_point,
                          bsl_signature* signature, BSL_boolean* result, unsigned long identity);
#if 0
    bigint_digit hash_value[8];
    bigint_digit c_value[8];
    bigint_digit d_value[8];
    bigint_digit temp[16];
    bigint_digit quotient[16];
    bigint_digit h1[8];
    bigint_digit h2[8];
    bigint_digit check_value[8];
    bigint_digit point_order[8];
    point Temp1;
    point Temp2;
    point Verify;
    short int i;
    field_2n h1_field;
    field_2n h2_field;
    int temp_digits;
    int point_order_digits;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", poly_DSA_verify);

BSL_error bsl_compute_ecc_sig(u8* data, u32 datasize, u32* private_key, u32* random_data, u32* sign, u32 identity);
#if 0
    ec_parameter base;
    bsl_signature signature;
    field_2n pvtkey;
    int i;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", bsl_compute_ecc_sig);

void bsl_verify_ecc_sig(u8* data, u32 datasize, u32* public_key, u32* sign, BSL_boolean* res, u32 identity);
#if 0
    ec_parameter base;
    bsl_signature signature;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/algorithms", bsl_verify_ecc_sig);
