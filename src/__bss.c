#include "bbtypes.h"
#include "libcrypto/aes.h"
#include "libcrypto/sha1.h"
#include "libcrypto/elliptic_math.h"

// Forces the order of bss variables for matching purposes

#define ATTRIBUTE_BSS __attribute__((section(".bss")))

#ifndef NON_MATCHING
ATTRIBUTE_BSS u32 D_9FC0ED30;
ATTRIBUTE_BSS BbContentMetaDataHead contentMetaDataHead;
ATTRIBUTE_BSS BbTicketHead ticketHead;
ATTRIBUTE_BSS SHA1Context sha1_ctx;
ATTRIBUTE_BSS u32 D_9FC0F0DC;
ATTRIBUTE_BSS AesKeyInstance D_9FC0F0E0;
ATTRIBUTE_BSS AesCipherInstance D_9FC0F2C8;
ATTRIBUTE_BSS u32 D_9FC0F2DC;
ATTRIBUTE_BSS u32 D_9FC0F2E0;
ATTRIBUTE_BSS u32 D_9FC0F2E4[7]; // aes key IV? should be [4]?
ATTRIBUTE_BSS u32 g_trial_time_elapsed;
ATTRIBUTE_BSS u32 D_9FC0F304;
ATTRIBUTE_BSS BbVirage01 D_9FC0F308;
ATTRIBUTE_BSS u32 cur_proc_allowed_skc_bitmask;
ATTRIBUTE_BSS curve named_curve;
ATTRIBUTE_BSS point precomputed_bp[16];
ATTRIBUTE_BSS point named_point;
#endif
