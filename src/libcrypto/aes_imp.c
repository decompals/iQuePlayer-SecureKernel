#include "include_asm.h"
#include "ultratypes.h"
#include "libcrypto/aes.h"

extern u32 Te0[256];
extern u32 Te1[256];
extern u32 Te2[256];
extern u32 Te3[256];
extern u32 Te4[256];
extern u32 Td0[256];
extern u32 Td1[256];
extern u32 Td2[256];
extern u32 Td3[256];
extern u32 Td4[256];

int rijndaelKeySetupEnc(u32* rk, u8* cipherKey, int keyBits);
#if 0
    int i;
    u32 temp;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/aes_imp", rijndaelKeySetupEnc);

int rijndaelKeySetupDec(u32* rk, u8* cipherKey, int keyBits);
#if 0
    int Nr;
    int i;
    int j;
    u32 temp;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/aes_imp", rijndaelKeySetupDec);

void rijndaelEncrypt(u32* rk, int Nr, u8* pt, u8* ct);
#if 0
    u32 s0;
    u32 s1;
    u32 s2;
    u32 s3;
    u32 t0;
    u32 t1;
    u32 t2;
    u32 t3;
    int r;

#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/aes_imp", rijndaelEncrypt);

void rijndaelDecrypt(u32* rk, int Nr, u8* ct, u8* pt);
#if 0
    u32 s0;
    u32 s1;
    u32 s2;
    u32 s3;
    u32 t0;
    u32 t1;
    u32 t2;
    u32 t3;
    int r;
#endif
INCLUDE_ASM("asm/non_matchings/libcrypto/aes_imp", rijndaelDecrypt);
