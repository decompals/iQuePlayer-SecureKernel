#ifndef BBTYPES_H
#define BBTYPES_H

#include "PR/ultratypes.h"

typedef u32 BbAesKey[4];
typedef u32 BbShaHash[5];
typedef u32 BbEccPrivateKey[8];
typedef u32 BbEccPublicKey[16];
typedef u32 BbRsaPublicKey2048[64];
typedef u32 BbRsaPublicKey4096[128];
typedef u32 BbRsaExponent;
typedef u32 BbRsaSig2048[64];
typedef u32 BbRsaSig4096[128];
typedef u32 BbEccSig[16];
typedef u32 BbId;

typedef struct BbVirage01 {
    /* 0x00 */ char unk00[0x3C];
    /* 0x3C */ u16 unk3C;
    /* 0x3E */ u16 csumAdjust;
} BbVirage01; // size = 0x40;

typedef struct BbVirage2 {
    /* 0x00 */ BbShaHash skHash;
    /* 0x14 */ u32 romPatch[16];
    /* 0x54 */ BbEccPublicKey publicKey;
    /* 0x94 */ BbId bbId;
    /* 0x98 */ BbEccPrivateKey privateKey;
    /* 0xB8 */ BbAesKey bootAppKey;
    /* 0xC8 */ BbAesKey recryptListKey;
    /* 0xD8 */ BbAesKey appStateKey;
    /* 0xE8 */ BbAesKey selfMsgKey;
    /* 0xF8 */ u32 csumAdjust;
    /* 0xFC */ u32 jtagEnable;
} BbVirage2; // size = 0x100

typedef u8 BbName[64];
typedef u8 BbServerName[64];
typedef u8 BbServerSuffix[64];

typedef struct BbCertId {
    /* 0x00 */ u32 certType;
    /* 0x04 */ u32 sigType;
    /* 0x08 */ u32 date;
    /* 0x0C */ BbServerName issuer;
    /* 0x4C */ union {
    /*      */    /* 0x00 */ BbServerSuffix server;
    /*      */    /* 0x00 */ BbName bbid;
    /*      */ } name; // size = 0x40
} BbCertId; // size = 0x8C

typedef BbCertId BbCertBase;

typedef union /* size=0x200 */ {
    /* 0x0000 */ BbRsaSig2048 rsa2048;
    /* 0x0000 */ BbRsaSig4096 rsa4096;
    /* 0x0000 */ BbEccSig ecc;
} BbGenericSig;

typedef struct /* size=0x2CC */ {
    /* 0x0000 */ BbCertId certId;
    /* 0x008C */ u32 publicKey[16];
    /* 0x00CC */ BbGenericSig signature;
} BbEccCert;

typedef struct /* size=0x390 */ {
    /* 0x0000 */ BbCertId certId;
    /* 0x008C */ BbRsaPublicKey2048 publicKey;
    /* 0x018C */ BbRsaExponent exponent;
    /* 0x0190 */ BbGenericSig signature;
} BbRsaCert;

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
