#include "libcrypto/bb_nn.h"
#include "libcrypto/poly_math.h"
#include "libcrypto/bsl.h"
#include "libcrypto/sha1.h"
#include "macros.h"

/**
 * Create an AES key from a public key and the console's private key via
 * Elliptic Curve Diffie-Hellman (ECDH) using the sect233r1 curve.
 */
BSL_error eccGenAesKey(u32* publicKey, u32* privateKey, u32* sharedKey) {
    field_2n pvtkey;
    field_2n sharedkey;
    point publickey;
    UNSIGNED int i;

    Init_233_bit();

    for (i = 0; i < 8u; i++) {
        pvtkey.e[i] = privateKey[i];
    }
    pvtkey.e[0] &= 0x1FF;

    for (i = 0; i < 8u; i++) {
        publickey.x.e[i] = publicKey[i];
    }
    for (i = 0; i < 8u; i++) {
        publickey.y.e[i] = publicKey[8 + i];
    }

    generate_shared_key(&named_point, &named_curve, &publickey, &pvtkey, &sharedkey);
    sharedKey[0] = sharedkey.e[1];
    sharedKey[1] = sharedkey.e[2];
    sharedKey[2] = sharedkey.e[3];
    sharedKey[3] = sharedkey.e[4];
    return BSL_OK;
}

/**
 * Generate `publicKey` corresponding to `privateKey` on the sect233r1 elliptic curve
 */
BSL_error eccGenPublicKey(u32* publicKey, u32* privateKey) {
    field_2n pvtkey;
    point publickey;
    BSL_error error;
    UNSIGNED int i;

    Init_233_bit();

    for (i = 0; i < 8u; i++) {
        pvtkey.e[i] = privateKey[i];
    }
    pvtkey.e[0] &= 0x1FF;

    error = generate_public_key(&named_point, &named_curve, &pvtkey, &publickey);

    for (i = 0; i < 8u; i++) {
        publicKey[0 + i] = publickey.x.e[i];
    }
    for (i = 0; i < 8u; i++) {
        publicKey[8 + i] = publickey.y.e[i];
    }
    return error;
}

/**
 * Internal function for eccGenPublicKey
 */
BSL_error generate_public_key(point* base_point, curve* E, field_2n* my_private, point* my_public) {
    UNSIGNED int i;
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

    // my_public = my_private x base_point
    poly_elliptic_mul_four(my_private, base_point, my_public, E);

    // Ensure the resulting key isn't zero
    notzero = 0;
    for (i = 0; i < 8u; i++) {
        notzero |= my_public->x.e[i];
    }
    for (i = 0; i < 8u; i++) {
        notzero |= my_public->y.e[i];
    }
    if (notzero == 0) {
        return BSL_BAD_KEY;
    }

    // Check that the resulting public key is on the curve:
    // y^2 + xy == x^3 + x^2 + a6

    for (i = 0; i < 8u; i++) {
        x.e[i] = my_public->x.e[i];
        y.e[i] = my_public->y.e[i];
    }

    poly_mul(&x, &y, &xy); // xy
    poly_mul(&y, &y, &yy); // y^2

    // y^2 + xy
    for (i = 0; i < 8u; i++) {
        yyxy.e[i] = xy.e[i] ^ yy.e[i];
    }

    poly_mul(&x, &x, &xx); // x^2
    poly_mul(&xx, &x, &xxx); // x^3

    // x^3 + x^2 + a6
    for (i = 0; i < 8u; i++) {
        xxxa6.e[i] = xxx.e[i] ^ E->a6.e[i];
        xxxa6.e[i] = xxxa6.e[i] ^ xx.e[i];
    }

    // Check y^2 + xy == x^3 + x^2 + a6
    isequal = TRUE;
    for (i = 0; i < 8u; i++) {
        if (xxxa6.e[i] != yyxy.e[i]) {
            isequal = FALSE;
        }
    }
    if (isequal == FALSE) {
        return BSL_BAD_KEY;
    }
    return BSL_OK;
}

/**
 * Implementation for eccGenAesKey
 */
BSL_error generate_shared_key(UNUSED point* base_point, curve* E, point* recipient_public, field_2n* my_private,
                              field_2n* shared_secret) {
    point tmp;
    // shared_secret = my_private x recipient_public
    poly_elliptic_mul_slow(my_private, recipient_public, &tmp, E);
    copy(&tmp.x, shared_secret);
    return BSL_OK;
}

/* generate a public-private keypair from random data */
BSL_error poly_key_gen_primitive(ec_parameter* Base, ec_keypair* key, unsigned long* random_input) {
    bigint_digit key_num[8];
    bigint_digit point_order[8];
    bigint_digit quotient[8];
    bigint_digit remainder[8];
    int key_num_digits;
    field_2n random_key;
    int i;

    bigint_zero(key_num, ARRAY_COUNT(key_num));
    bigint_zero(point_order, ARRAY_COUNT(point_order));
    bigint_zero(quotient, ARRAY_COUNT(quotient));
    bigint_zero(remainder, ARRAY_COUNT(remainder));

    null(&random_key);
    for (i = 0; i < 8; i++) {
        random_key.e[i] = random_input[i];
    }

    field_to_bigint(&random_key, key_num, 8);
    field_to_bigint(&Base->point_order, point_order, 8);

    // Compute k = random_key % point_order
    // This is to ensure the random data is within [0, point_order), the case of k == 0 will be discarded later
    key_num_digits = bigint_digits(key_num, 8);
    bigint_div(quotient, remainder, key_num, key_num_digits, point_order, bigint_digits(point_order, 8));

    // The private key is just k
    bigint_to_field(remainder, &key->private_key, 8);

    // The public key is computed by elliptic curve point multiplication with the private key and base point
    // QA = dA x G
    poly_elliptic_mul_four(&key->private_key, &Base->par_point, &key->public_key, &Base->par_curve);
    return BSL_OK;
}

/**
 * Produce a hash of `message` up to `num_bits`
 */
BSL_error hash_to_integer(unsigned char* message, unsigned long length, bigint_digit* hash_value, int num_bits,
                          u32 identity) {
    union {
        unsigned char b[20];
        unsigned long w[5];
    } MessageDigest;
    field_2n tmp;
    SHA1Context sha;
    int num_word = (u32)num_bits / 32;

    SHA1Reset(&sha);
    SHA1Input(&sha, (u8*)message, length);
    SHA1Input(&sha, (u8*)&identity, sizeof(identity));
    SHA1Result(&sha, MessageDigest.b);

    null(&tmp);
    tmp.e[num_word - 4] = MessageDigest.w[0];
    tmp.e[num_word - 3] = MessageDigest.w[1];
    tmp.e[num_word - 2] = MessageDigest.w[2];
    tmp.e[num_word - 1] = MessageDigest.w[3];
    tmp.e[num_word - 0] = MessageDigest.w[4];
    tmp.e[0] = tmp.e[0] & 0x1FF;
    field_to_bigint(&tmp, hash_value, 8);

    return BSL_OK;
}

void Init_233_bit_ECDSA(ec_parameter* base, int num_bits) {
    bigint_digit tmpbigint[8];
    int num_word = (u32)num_bits / 32;

    bigint_zero(&tmpbigint[0], 8);
    Init_233_bit();
    // Set the point order n of the base point (named_point)
    tmpbigint[7] = 0x00000100;
    tmpbigint[6] = 0x00000000;
    tmpbigint[5] = 0x00000000;
    tmpbigint[4] = 0x00000000;
    tmpbigint[3] = 0x0013E974;
    tmpbigint[2] = 0xE72F8A69;
    tmpbigint[1] = 0x22031D26;
    tmpbigint[0] = 0x03CFE0D7;
    bigint_to_field(&tmpbigint[0], &base->point_order, 8);
    // Cofactor h = 2
    null(&base->cofactor);
    base->cofactor.e[num_word] = 2;
    // Base point
    copy_point(&named_point, &base->par_point);
    // a2 and a6 curve coefficients
    copy(&named_curve.a2, &base->par_curve.a2);
    copy(&named_curve.a6, &base->par_curve.a6);
    base->par_curve.form = named_curve.form;
}

/*
 * ECDSA Signature Generation using CURVE = sect233r1 / NIST B-233 (y^2 + xy = x^3 + ax^2 + b mod x^233 + x^74 + 1)
 */
BSL_error poly_ECDSA_signature(char* message, unsigned long length, ec_parameter* public_curve, field_2n* private_key,
                               bsl_signature* signature, unsigned long* rand_input, u32 identity) {
    bigint_digit hash_value[8];
    bigint_digit x_value[8];
    bigint_digit k_value[8];
    bigint_digit sig_value[8];
    bigint_digit c_value[8];
    bigint_digit temp[16];
    bigint_digit quotient[8];
    bigint_digit key_value[8];
    bigint_digit point_order[8];
    bigint_digit u_value[8];
    int x_value_digits;
    int point_order_digits;
    ec_keypair random_key;
    int not_zero;
    UNSIGNED int i;

    bigint_zero(hash_value, ARRAY_COUNT(hash_value));
    bigint_zero(x_value, ARRAY_COUNT(x_value));
    bigint_zero(k_value, ARRAY_COUNT(k_value));
    bigint_zero(temp, ARRAY_COUNT(temp));
    bigint_zero(quotient, ARRAY_COUNT(quotient));
    bigint_zero(sig_value, ARRAY_COUNT(sig_value));
    bigint_zero(c_value, ARRAY_COUNT(c_value));
    bigint_zero(point_order, ARRAY_COUNT(point_order));
    bigint_zero(u_value, ARRAY_COUNT(u_value));
    bigint_zero(key_value, ARRAY_COUNT(key_value));

    // Hash the message with SHA1
    hash_to_integer((unsigned char*)message, length, hash_value, 233, identity);

    // Generate a public-private keypair from the random data
    poly_key_gen_primitive(public_curve, &random_key, rand_input);

    // point_order = public_curve->point_order
    field_to_bigint(&public_curve->point_order, point_order, ARRAY_COUNT(point_order));
    // x_value = random_key.public_key.x
    field_to_bigint(&random_key.public_key.x, x_value, ARRAY_COUNT(x_value));

    // c_value = x_value % point_order   (r = x % n)
    x_value_digits = bigint_digits(x_value, ARRAY_COUNT(x_value));
    point_order_digits = bigint_digits(point_order, ARRAY_COUNT(key_value));
    bigint_div(quotient, c_value, x_value, x_value_digits, point_order, point_order_digits);

    bigint_to_field(c_value, &signature->c, ARRAY_COUNT(c_value));

    // Either the private key was 0 or the reduction of the public key was 0, cannot proceed
    not_zero = 0;
    for (i = 0; i < 8u; i++) {
        not_zero |= signature->c.e[i];
    }
    if (not_zero == 0) {
        return BSL_DIVIDE_BY_ZERO;
    }

    field_to_bigint(private_key, key_value, ARRAY_COUNT(key_value));

    // temp = hash_value + c_value * key_value      (z + r * dA)
    bigint_mult(temp, key_value, c_value, 8);
    bigint_add(temp, hash_value, temp, 8);
    // k_value = temp % point_order                 (z  r * da) mod n
    bigint_div(quotient, k_value, temp, bigint_digits(temp, ARRAY_COUNT(temp)), point_order, point_order_digits);

    // u_value = private_key^{-1} % point_order
    field_to_bigint(&random_key.private_key, temp, 8);
    bigint_mod_inv(u_value, temp, point_order, 8);

    // sig_value = (u_value * k_value) % point_order
    bigint_mult(temp, u_value, k_value, 8);
    bigint_div(quotient, sig_value, temp, bigint_digits(temp, ARRAY_COUNT(temp)), point_order, point_order_digits);
    bigint_to_field(sig_value, &signature->d, 8);

    // If sig_value turns out to be 0 it cannot be used (verification requires that the modular inverse exists)
    not_zero = 0;
    for (i = 0; i < 8u; i++) {
        not_zero |= signature->d.e[i];
    }
    if (not_zero == 0) {
        return BSL_DIVIDE_BY_ZERO;
    }

    return BSL_OK;
}

/**
 * Elliptic Curve Digital Signature Verification
 *
 * message:      The message to authenticate with the provided signature
 * length:       The length of the message
 * public_curve: The elliptic curve parameters agreed upon in advance
 * signer_point: Signer's public key curve point
 * signature:    The signature tuple (r,s)
 * result:       Whether the message is valid for the given signature
 * identity:     Additional 32 bits to append to the message when hashing
 */
BSL_error poly_DSA_verify(char* message, unsigned long length, ec_parameter* public_curve, point* signer_point,
                          bsl_signature* signature, BSL_boolean* result, unsigned long identity) {
    bigint_digit hash_value[8];
    bigint_digit c_value[8];
    bigint_digit d_value[8];
    bigint_digit temp[16];
    bigint_digit quotient[8];
    bigint_digit h1[8];
    bigint_digit h2[8];
    bigint_digit check_value[8];
    bigint_digit point_order[8];
    point Temp1;
    point Temp2;
    point Verify;
    ITER_TYPE i;
    field_2n h1_field;
    field_2n h2_field;
    int temp_digits;
    int point_order_digits;

    bigint_zero(hash_value, ARRAY_COUNT(hash_value));
    bigint_zero(c_value, ARRAY_COUNT(c_value));
    bigint_zero(d_value, ARRAY_COUNT(d_value));
    bigint_zero(temp, ARRAY_COUNT(temp));
    bigint_zero(quotient, ARRAY_COUNT(quotient));
    bigint_zero(h1, ARRAY_COUNT(h1));
    bigint_zero(h2, ARRAY_COUNT(h2));
    bigint_zero(check_value, ARRAY_COUNT(check_value));
    bigint_zero(point_order, ARRAY_COUNT(point_order));

    // d_value = d^{-1} mod point_order
    field_to_bigint(&public_curve->point_order, point_order, 8);
    field_to_bigint(&signature->d, temp, 8);
    bigint_mod_inv(d_value, temp, point_order, 8);

    // Hash the message
    hash_to_integer((u8*)message, length, hash_value, 233, identity);

    // h1 = (hash_value * d_value) % point_order
    bigint_mult(temp, hash_value, d_value, 8);
    temp_digits = bigint_digits(temp, 0x10);
    point_order_digits = bigint_digits(point_order, 8);
    bigint_div(quotient, h1, temp, temp_digits, point_order, point_order_digits);
    bigint_to_field(h1, &h1_field, 8);

    // h2 = (d_value * c_value) % point_order
    field_to_bigint(&signature->c, c_value, 8);
    bigint_mult(temp, d_value, c_value, 8);
    temp_digits = bigint_digits(temp, 0x10);
    bigint_div(quotient, h2, temp, temp_digits, point_order, point_order_digits);
    bigint_to_field(h2, &h2_field, 8);

    // Temp1 = h1 x G
    poly_elliptic_mul_four(&h1_field, &public_curve->par_point, &Temp1, &public_curve->par_curve);
    // Temp2 = h2 x pubkey
    poly_elliptic_mul(&h2_field, signer_point, &Temp2, &public_curve->par_curve);
    // Verify = Temp1 + Temp2
    poly_elliptic_sum(&Temp1, &Temp2, &Verify, &public_curve->par_curve);

    *result = BSL_FALSE;
    for (i = 0; i < 8u; i++) {
        if (Verify.x.e[i] != 0 || Verify.y.e[i] != 0) {
            *result = BSL_TRUE;
        }
    }
    if (*result == BSL_FALSE) {
        return BSL_DIVIDE_BY_ZERO;
    }

    // check_value = temp % point_order
    field_to_bigint(&Verify.x, temp, 8);
    temp_digits = bigint_digits(temp, 8);
    bigint_div(quotient, check_value, temp, temp_digits, point_order, point_order_digits);
    // temp = c_value - check_value
    bigint_sub(temp, c_value, check_value, 8);

    // Make sure temp is 0
    *result = BSL_TRUE;
    for (i = 0; i < 8; i++) {
        if (temp[i] != 0) {
            *result = BSL_FALSE;
        }
    }
    return BSL_OK;
}

/**
 * Compute a new ECC signature `sign` that can be used to verify `data`.
 */
BSL_error bsl_compute_ecc_sig(u8* data, u32 datasize, u32* private_key, u32* random_data, u32* sign, u32 identity) {
    ec_parameter base;
    bsl_signature signature;
    field_2n pvtkey;
    UNSIGNED int i;

    Init_233_bit_ECDSA(&base, 233);

    for (i = 0; i < (unsigned)ARRAY_COUNT(pvtkey.e); i++) {
        pvtkey.e[i] = (element)private_key[i];
    }
    pvtkey.e[0] &= 0x1FF;

    if (poly_ECDSA_signature((char*)data, datasize, &base, &pvtkey, &signature, random_data, identity) == BSL_OK) {
        copy(&signature.c, (field_2n*)(sign + 0));
        copy(&signature.d, (field_2n*)(sign + 8));
        return BSL_OK;
    }
    return BSL_DIVIDE_BY_ZERO;
}

/**
 * Verify the ECC signature `sign`
 */
void bsl_verify_ecc_sig(u8* data, u32 datasize, u32* public_key, u32* sign, BSL_boolean* res, u32 identity) {
    ec_parameter base;
    bsl_signature signature;

    Init_233_bit_ECDSA(&base, 233);
    copy((field_2n*)(sign + 0), &signature.c);
    copy((field_2n*)(sign + 8), &signature.d);
    //! @bug public_key (an (x,y) elliptic curve point ) is not verified for whether it actually is a point on sect233r1
    //! but it seems unimportant in practice as the signatures themselves can only come from the first cert in a certificate
    //! chain which is then protected by an RSA signature.
    poly_DSA_verify((char*)data, datasize, &base, (point*)public_key, &signature, res, identity);
}
