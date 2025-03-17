#include "string.h"
#include "libcrypto/sha1.h"
#include "macros.h"

#define ROL(x, n) (((x) << (n)) | ((x) >> (32 - (n))))

static void SHA1Transform(SHA1Context* ctx) {
    int i;
    SHA1_LONG temp;
    SHA1_LONG A;
    SHA1_LONG B;
    SHA1_LONG C;
    SHA1_LONG D;
    SHA1_LONG E;
    SHA1_LONG W[0x50];

    for (i = 0; i < ARRAY_COUNT(ctx->data); i++) {
        W[i] = ctx->data[i];
    }

    for (i = 0x10; i < 0x50; i++) {
        SHA1_LONG temp2 = W[0x0D + i - 0x10] ^ W[0x08 + i - 0x10] ^ W[0x02 + i - 0x10] ^ W[0x00 + i - 0x10];
        W[i] = ROL(temp2, 1);
    }

    B = ctx->digest[1];
    C = ctx->digest[2];
    D = ctx->digest[3];
    E = ctx->digest[4];
    temp = ctx->digest[0];

    for (i = 0; i < 0x14; i++) {
        A = ROL(temp, 5) + ((B & C) | (~B & D)) + E + W[i] + 0x5A827999;
        E = D;
        D = C;
        C = ROL(B, 30);
        B = temp;
        temp = A;
    }

    for (i = 0x14; i < 0x28; i++) {
        A = ROL(A, 5) + (B ^ C ^ D) + E + W[i] + 0x6ED9EBA1;
        E = D;
        D = C;
        C = ROL(B, 30);
        B = temp;
        temp = A;
    }

    for (i = 0x28; i < 0x3C; i++) {
        A = ROL(A, 5) + ((B & (C | D)) | (C & D)) + E + W[i] + 0x8F1BBCDC;
        E = D;
        D = C;
        C = ROL(B, 30);
        B = temp;
        temp = A;
    }

    for (i = 0x3C; i < 0x50; i++) {
        A = ROL(A, 5) + (B ^ C ^ D) + E + W[i] + 0xCA62C1D6;
        E = D;
        D = C;
        C = ROL(B, 30);
        B = temp;
        temp = A;
    }

    ctx->digest[0] += A;
    ctx->digest[1] += B;
    ctx->digest[2] += C;
    ctx->digest[3] += D;
    ctx->digest[4] += E;
}


int SHA1Reset(SHA1Context* ctx) {
    ctx->digest[0] = 0x67452301;
    ctx->digest[1] = 0xEFCDAB89;
    ctx->digest[2] = 0x98BADCFE;
    ctx->digest[3] = 0x10325476;
    ctx->digest[4] = 0xC3D2E1F0;
    ctx->count_lo = 0;
    ctx->count_hi = 0;
    return 0;
}

int SHA1Input(SHA1Context* ctx, SHA1_BYTE* buffer, int count) {
    int res = (ctx->count_lo / 8) % 0x40;

    // Increment count_hi when overflows
    if (ctx->count_lo + count * 8 < ctx->count_lo) {
        ctx->count_hi++;
    }

    // Add size to size processed.
    ctx->count_lo += count * 8;
    ctx->count_hi += (SHA1_LONG)count >> 29;

    // A previous block wasn't divisible by 0x40
    // Fill up the rest of the block before processing
    if (res != 0) {
        // Total size to process is current position + size
        int res2 = res + count;

        // We're processing more than 0x40 bytes and guaranteed to not be divisible by 0x40.
        // Add the remaining data to the block and then process
        if (res2 >= 0x40) {
            // Copy the rest of the data into the processing buffer
            memcpy((SHA1_BYTE*)ctx->data + res, buffer, 0x40 - res);

            // set size to sizeToProcess
            count = res2;

            // Subtract position from data so later increment ends up at the correct offset.
            buffer -= res;

            // Now that we've aligned to 0x40, position is 0.
            res = 0;

            // Process block
            SHA1Transform(ctx);

            // Adjust size and data ptr
            buffer += 0x40;
            count -= 0x40;
        }
    }

    // Process 0x40 aligned blocks
    while(count >= 0x40) {
        // Copy in next block to process
        memcpy(ctx->data, buffer, 0x40);

        // Porcess block
        SHA1Transform(ctx);

        // Adjust size and data ptr
        buffer += 0x40;
        count -= 0x40;
    }

    // Copy in the next chunk of unaligned data, if any.
    memcpy((SHA1_BYTE*)ctx->data + res, buffer, count);
    return 0;
}

int SHA1Result(SHA1Context* ctx, SHA1_BYTE* digest) {
    int count;
    SHA1_LONG lo_bit_count = ctx->count_lo;
    SHA1_LONG hi_bit_count = ctx->count_hi;

    count = (lo_bit_count >> 3) & 0x3F;
    ((SHA1_BYTE*)ctx->data)[count++] = 0x80;
    if (count > (int)sizeof(ctx->data) - 8) {
        memclear(&((SHA1_BYTE*)ctx->data)[count], sizeof(ctx->data) - count);
        SHA1Transform(ctx);
        memclear(ctx->data, sizeof(ctx->data) - 8);
    } else {
        memclear(&((SHA1_BYTE*)ctx->data)[count], sizeof(ctx->data) - 8 - count);
    }
    ctx->data[14] = hi_bit_count;
    ctx->data[15] = lo_bit_count;
    SHA1Transform(ctx);
    memcpy(digest, ctx->digest, sizeof(ctx->digest));
    return 0;
}
