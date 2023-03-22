#ifndef SHA1_H
#define SHA1_H

#include "PR/ultratypes.h"

typedef struct SHA1Context {
  /* 0x00 */ u32 digest[5];
  /* 0x14 */ u32 count_lo;
  /* 0x18 */ u32 count_hi;
  /* 0x1C */ u32 data[16];
} SHA1Context; // size = 0x5C

int SHA1Reset(SHA1Context* ctx);
int SHA1Input(SHA1Context* ctx, u8* buffer, int count);
int SHA1Result(SHA1Context* ctx, u8* digest);

#endif
