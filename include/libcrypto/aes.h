#ifndef AES_H
#define AES_H

aes_HwKeyExpand(u32* key, u32* expandedKey);
aes_SwEncrypt(u32* key, u32* iv, void* in, u32 size, void* out);
aes_SwDecrypt(u32* key, u32* iv, void* in, u32 size, void* out);

#endif