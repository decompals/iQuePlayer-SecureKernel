#include "ultratypes.h"
#include "string.h"
#include "libcrypto/aes.h"

int aes_HwKeyExpand(u8* key, u8* expandedKey) {
    AesKeyInstance keyI;

    if (aesMakeKey(&keyI, 1, 128, key) == 1) {
        memcpy(expandedKey, &keyI.rk, AES_EXPANDED_KEY_LEN);
        return 0;
    }
    return -1;
}

int aes_SwEncrypt(u8* key, u8* iv, u8* in, u32 size, u8* out) {
    AesKeyInstance keyI;
    AesCipherInstance cipher;

    if (aesMakeKey(&keyI, 0, 128, key) == 1 && aesCipherInit(&cipher, 2, iv) == 1 &&
        (unsigned)aesBlockEncrypt(&cipher, &keyI, in, size * 8, out) == size * 8) {
        return 0;
    }
    return -1;
}

int aes_SwDecrypt(u8* key, u8* iv, u8* in, u32 size, u8* out) {
    AesKeyInstance keyI;
    AesCipherInstance cipher;

    if (aesMakeKey(&keyI, 1, 128, key) == 1 && aesCipherInit(&cipher, 2, iv) == 1 &&
        (unsigned)aesBlockDecrypt(&cipher, &keyI, in, size * 8, out) == size * 8) {
        return 0;
    }
    return -1;
}
