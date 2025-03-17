#ifndef SHA1_H
#define SHA1_H

#include "PR/ultratypes.h"

typedef unsigned char SHA1_BYTE;
typedef long unsigned int SHA1_LONG;

#define SHA1_BLOCK_MAX_SIZE 64

typedef struct {
    /* 0x0000 */ SHA1_LONG digest[5];
    /* 0x0014 */ SHA1_LONG count_lo;
    /* 0x0018 */ SHA1_LONG count_hi;
    /* 0x001C */ SHA1_LONG data[SHA1_BLOCK_MAX_SIZE/sizeof(SHA1_LONG)];
} SHA1Context; // size = 0x5C

int SHA1Reset(SHA1Context* ctx);
int SHA1Input(SHA1Context* ctx, SHA1_BYTE* buffer, int count);
int SHA1Result(SHA1Context* ctx, SHA1_BYTE* digest);

#endif
