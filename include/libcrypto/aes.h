#ifndef AES_H
#define AES_H

void aes_HwKeyExpand(u32* key, u32* expandedKey);
void aes_SwEncrypt(u32* key, u32* iv, void* in, u32 size, void* out);
void aes_SwDecrypt(u32* key, u32* iv, void* in, u32 size, void* out);

#endif