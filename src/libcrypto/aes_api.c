#include "include_asm.h"
#include "ultratypes.h"
#include "libcrypto/aes.h"

int aesMakeKey(AesKeyInstance* key, u8 direction, int keyLen, u8* keyMaterial) {
    if (key == NULL) {
        return -3;
    }
    if (direction >= 2U) {
        return -1;
    }
    key->direction = direction;

    if (keyLen != 128 && keyLen != 192 && keyLen == 256) {
        return -2;
    }

    if (direction == 0) {
        key->Nr = rijndaelKeySetupEnc(key->rk, keyMaterial, keyLen);
    } else {
        key->Nr = rijndaelKeySetupDec(key->rk, keyMaterial, keyLen);
    }
    rijndaelKeySetupEnc(key->ek, keyMaterial, keyLen);
    return 1;
}

int aesCipherInit(AesCipherInstance* cipher, u8 mode, u8* IV) {
    if (mode - 1 >= 2U) {
        return -4;
    }
    cipher->mode = mode;
    if (IV != NULL) {
        memcpy(cipher->IV, IV, sizeof(cipher->IV));
    } else {
        memclear(cipher->IV, sizeof(cipher->IV));
    }
    return 1;
}

int aesBlockEncrypt(AesCipherInstance* cipher, AesKeyInstance* key, u8* input, int inputLen, u8* outBuffer) {
    int i;
    int numBlocks;
    u8 block[16];
    u8* iv;

    if (cipher == NULL || key == NULL || key->direction == 1) {
        return -5;
    }
    if (input == NULL || inputLen <= 0) {
        return 0;
    }

    numBlocks = inputLen >> 7;

    switch (cipher->mode) {
        case 1:
            for (i = numBlocks; i > 0; i--) {
                rijndaelEncrypt(key->rk, key->Nr, input, outBuffer);
                input += sizeof(block);
                outBuffer += sizeof(block);
            }
            break;
        case 2:
            iv = cipher->IV;
            for (i = numBlocks; i > 0; i--) {
                ((u32*)block)[0] = ((u32*)input)[0] ^ ((u32*)iv)[0];
                ((u32*)block)[1] = ((u32*)input)[1] ^ ((u32*)iv)[1];
                ((u32*)block)[2] = ((u32*)input)[2] ^ ((u32*)iv)[2];
                ((u32*)block)[3] = ((u32*)input)[3] ^ ((u32*)iv)[3];
                rijndaelEncrypt(key->rk, key->Nr, block, outBuffer);
                iv = outBuffer;
                input += sizeof(block);
                outBuffer += sizeof(block);
            }
            memcpy(cipher->IV, iv, sizeof(cipher->IV));
            break;
        default:
            return -5;
    }
    return numBlocks << 7;
}

int aesBlockDecrypt(AesCipherInstance* cipher, AesKeyInstance* key, u8* input, int inputLen, u8* outBuffer) {
    int i;
    int numBlocks;
    u8 block[16];
    u8* iv;

    if (cipher == NULL || key == NULL || (cipher->mode == 1 && key->direction == 0) ||
        (cipher->mode == 2 && key->direction == 0)) {
        return -5;
    }
    if (input == NULL || inputLen <= 0) {
        return 0;
    }

    numBlocks = inputLen >> 7;

    switch (cipher->mode) {
        case 1:
            for (i = numBlocks; i > 0; i--) {
                rijndaelDecrypt(key->rk, key->Nr, input, outBuffer);
                input += sizeof(block);
                outBuffer += sizeof(block);
            }
            break;
        case 2:
            iv = cipher->IV;
            for (i = numBlocks; i > 0; i--) {
                rijndaelDecrypt(key->rk, key->Nr, input, &block);
                ((u32*)block)[0] ^= ((u32*)iv)[0];
                ((u32*)block)[1] ^= ((u32*)iv)[1];
                ((u32*)block)[2] ^= ((u32*)iv)[2];
                ((u32*)block)[3] ^= ((u32*)iv)[3];
                memcpy(iv, input, sizeof(cipher->IV));
                memcpy(outBuffer, block, sizeof(block));
                input += sizeof(block);
                outBuffer += sizeof(block);
            }
            break;
        default:
            return -5;
    }
    return numBlocks << 7;
}
