#ifndef AES_H
#define AES_H

typedef struct {
    /* 0x00 */ unsigned char direction;
    /* 0x04 */ int Nr;
    /* 0x08 */ unsigned int rk[60];
    /* 0xF8 */ unsigned int ek[60];
} AesKeyInstance; // size = 0x1E8

typedef struct {
    /* 0x00 */ unsigned int mode;
    /* 0x04 */ unsigned char IV[16];
} AesCipherInstance; // size = 0x14

int aes_HwKeyExpand(u8* key, u8* expandedKey);
int aes_SwEncrypt(u8* key, u8* iv, u8* in, u32 size, u8* out);
int aes_SwDecrypt(u8* key, u8* iv, u8* in, u32 size, u8* out);

#endif
