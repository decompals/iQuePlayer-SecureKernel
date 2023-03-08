#ifndef BBTYPES_H
#define BBTYPES_H

#include "PR/ultratypes.h"

typedef u32 BbAesKey[4];

typedef struct Virage01 {
    /* 0x00 */ char unk00[0x3C];
    /* 0x3C */ u16 unk3C;
    /* 0x3E */ u16 csumAdjust;
} Virage01; // size = 0x40;

typedef struct Virage2 {
    /* 0x00 */ u32 skHash[5];
    /* 0x14 */ u32 romPatch[4][4];
    /* 0x54 */ u32 publicKey[0x10];
    /* 0x94 */ u32 bbId;
    /* 0x98 */ u32 privateKey[8];
    /* 0xB8 */ BbAesKey bootAppKey[4];
    /* 0xC8 */ BbAesKey recryptListKey[4];
    /* 0xD8 */ BbAesKey appStateKey[4];
    /* 0xE8 */ BbAesKey selfMsgKey[4];
    /* 0xF8 */ u32 csumAdjust;
    /* 0xFC */ u32 jtagEnable;
} Virage2; // size = 0x100

typedef struct BbContentMetaDataHead {
    /* 0x00 */ u32  reserved;
    /* 0x04 */ u32  caCrlVersion;
    /* 0x08 */ u32  cpCrlVersion;
    /* 0x0C */ u32  size;
    /* 0x10 */ u32  descFlags;
    /* 0x14 */ u8   commonCmdIv[16];
    /* 0x24 */ u8   hash[20];
    /* 0x38 */ u8   iv[16];
    /* 0x48 */ u32  execFlags;   
    /* 0x4C */ u32  hwAccessRights;
    /* 0x50 */ u32  secureKernelRights;
    /* 0x54 */ u32  bbid;
    /* 0x58 */ u8   issuer[64];
    /* 0x98 */ u32  id;
    /* 0x9C */ u8   titleKey[16];
    /* 0xAC */ u8   contentMetaDataSign[256];
} BbContentMetaDataHead; // size = 0x1AC

typedef struct TrialTimes {
    /* 0x00 */ u16 minContentId;
    /* 0x02 */ u16 trialTimes[13];
} TrialTimes; // size = 0x1C

typedef struct rsaDataBlock {
    /* 0x00 */ void* data;
    /* 0x04 */ u32 size;
} rsaDataBlock; // size = 8

typedef enum RsaSize {
    RSA_2048 = 0,
    RSA_4096
} RsaSize;

#endif
