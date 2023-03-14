#ifndef AES_H
#define AES_H

#include "ultratypes.h"

typedef struct {
    /* 0x00 */ u8 direction;
    /* 0x04 */ int Nr;
    /* 0x08 */ u32 rk[60];
    /* 0xF8 */ u32 ek[60];
} AesKeyInstance; // size = 0x1E8

typedef struct {
    /* 0x0 */ u32 mode;
    /* 0x4 */ u8 IV[16];
} AesCipherInstance; // size = 0x14

void* memcpy(void* dst, void* src, u32 num);
void memclear(void* ptr, size_t num);

// internal

int aesMakeKey(AesKeyInstance* key, u8 direction, int keyLen, u8* keyMaterial);
int aesCipherInit(AesCipherInstance* cipher, u8 mode, u8* IV);
int aesBlockEncrypt(AesCipherInstance* cipher, AesKeyInstance* key, u8* input, int inputLen, u8* outBuffer);
int aesBlockDecrypt(AesCipherInstance* cipher, AesKeyInstance* key, u8* input, int inputLen, u8* outBuffer);

int rijndaelKeySetupEnc(u32* rk, u8* cipherKey, int keyBits);
int rijndaelKeySetupDec(u32* rk, u8* cipherKey, int keyBits);
void rijndaelEncrypt(u32* rk, int Nr, u8* pt, u8* ct);
void rijndaelDecrypt(u32* rk, int Nr, u8* ct, u8* pt);

// public

int aes_HwKeyExpand(u8* key, u8* expandedKey);
int aes_SwEncrypt(u8* key, u8* iv, u8* in, u32 size, u8* out);
int aes_SwDecrypt(u8* key, u8* iv, u8* in, u32 size, u8* out);

#endif
