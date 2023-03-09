#ifndef AES_H
#define AES_H

int aes_HwKeyExpand(u8* key, u8* expandedKey);
int aes_SwEncrypt(u8* key, u8* iv, u8* in, u32 size, u8* out);
int aes_SwDecrypt(u8* key, u8* iv, u8* in, u32 size, u8* out);

#endif
