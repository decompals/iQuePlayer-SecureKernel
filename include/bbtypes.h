#ifndef BBTYPES_H
#define BBTYPES_H

#include "PR/ultratypes.h"

typedef u32 BbId;
typedef u32 BbContentId;
typedef u32 BbAesKey[4];
typedef u32 BbAesIv[4];
typedef u32 BbEccPrivateKey[8];
typedef u32 BbEccPublicKey[16];
typedef u32 BbRsaPublicKey2048[64];
typedef u32 BbRsaPublicKey4096[128];
typedef u32 BbRsaExponent;
typedef u32 BbRsaSig2048[64];
typedef u32 BbRsaSig4096[128];
typedef u32 BbEccSig[16];
typedef u32 BbOwnerId;
typedef u32 BbRandomMix[8];
typedef u16 BbTicketId;

typedef u32 BbShaHash[5];

typedef u8 BbName[64];
typedef u8 BbServerName[64];
typedef u8 BbServerSuffix[64];

typedef struct {
    /* 0x00 */ u8 tsCrlVersion;
    /* 0x01 */ u8 caCrlVersion;
    /* 0x02 */ u8 cpCrlVersion;
    /* 0x03 */ u8 contentRlVersion;
    /* 0x04 */ u16 ticketRlVersion;
    /* 0x06 */ u16 tidWindow;
    /* 0x08 */ u16 cc[26];
    /* 0x3C */ u16 seq;
    /* 0x3E */ u16 sum;
} BbVirage01; // size = 0x40

typedef struct {
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

typedef struct {
    /* 0x00 */ u32 certType;
    /* 0x04 */ u32 sigType;
    /* 0x08 */ u32 date;
    /* 0x0C */ BbServerName issuer;
    /* 0x4C */ union {
    /*      */     BbServerSuffix server;
    /*      */     BbName bbid;
    /*      */ } name;
} BbCertId, BbCertBase; // size = 0x8C

typedef union {
    BbRsaSig2048 rsa2048;
    BbRsaSig4096 rsa4096;
    BbEccSig ecc;
} BbGenericSig; // size = 0x200

typedef struct {
    /* 0x00 */ BbCertId certId;
    /* 0x8C */ u32 publicKey[16];
    /* 0xCC */ BbGenericSig signature;
} BbEccCert; // size = 0x2CC

typedef struct {
    /* 0x000 */ BbCertId certId;
    /* 0x08C */ BbRsaPublicKey2048 publicKey;
    /* 0x18C */ BbRsaExponent exponent;
    /* 0x190 */ BbGenericSig signature;
} BbRsaCert; // size = 0x390

typedef struct {
    /* 0x00 */ u32  unusedPadding;
    /* 0x04 */ u32  caCrlVersion;
    /* 0x08 */ u32  cpCrlVersion;
    /* 0x0C */ u32  size;
    /* 0x10 */ u32  descFlags;
    /* 0x14 */ BbAesIv commonCmdIv;
    /* 0x24 */ BbShaHash hash;
    /* 0x38 */ BbAesIv iv;
    /* 0x48 */ u32  execFlags;   
    /* 0x4C */ u32  hwAccessRights;
    /* 0x50 */ u32  secureKernelRights;
    /* 0x54 */ u32  bbid;
    /* 0x58 */ BbServerName issuer;
    /* 0x98 */ BbContentId id;
    /* 0x9C */ BbAesKey key;
    /* 0xAC */ BbRsaSig2048 contentMetaDataSign;
} BbContentMetaDataHead; // size = 0x1AC

typedef struct {
    /* 0x0000 */ u8 contentDesc[0x2800];
    /* 0x2800 */ BbContentMetaDataHead head;
} BbContentMetaData; // size = 0x29AC

typedef struct {
    /* 0x00 */ BbId bbId;
    /* 0x04 */ BbTicketId tid;
    /* 0x06 */ u16 code;
    /* 0x08 */ u16 limit;
    /* 0x0A */ u16 reserved;
    /* 0x0C */ u32 tsCrlVersion;
    /* 0x10 */ BbAesIv cmdIv;
    /* 0x20 */ BbEccPublicKey serverKey;
    /* 0x60 */ BbServerName issuer;
    /* 0xA0 */ BbRsaSig2048 ticketSign;
} BbTicketHead; // size = 0x1A0

typedef struct {
    /* 0x0000 */ BbContentMetaData cmd;
    /* 0x29AC */ BbTicketHead head;
} BbTicket; // size = 0x2B4C

#define MAX_CERTS 5

typedef struct {
    /* 0x00 */ BbTicket* ticket;
    /* 0x04 */ BbCertBase* ticketChain[MAX_CERTS];
    /* 0x18 */ BbCertBase* cmdChain[MAX_CERTS];
} BbTicketBundle; // size = 0x2C

typedef enum {
    CRL_UNUSED0 = 0,
    CRL_UNUSED1 = 1,
    CRL_UNUSED2 = 2
} BbCrlUnusedEnumType;

typedef struct {
    /* 0x0000 */ BbGenericSig signature;
    /* 0x0200 */ u32 type;
    /* 0x0204 */ u32 sigType;
    /* 0x0208 */ BbCrlUnusedEnumType unusedPadding;
    /* 0x020C */ u32 versionNumber;
    /* 0x0210 */ u32 date;
    /* 0x0214 */ BbServerName issuer;
    /* 0x0254 */ u32 numberRevoked;
} BbCrlHead; // size = 0x258

typedef struct {
    /* 0x0000 */ BbCrlHead* head;
    /* 0x0004 */ BbServerSuffix* list;
    /* 0x0008 */ BbCertBase* certChain[MAX_CERTS];
} BbCrlBundle; // size = 0x1C

typedef struct {
    /* 0x0000 */ BbCrlBundle tsrl;
    /* 0x001C */ BbCrlBundle carl;
    /* 0x0038 */ BbCrlBundle cprl;
} BbAppLaunchCrls; // size = 0x54

typedef struct {
    /* 0x00 */ void* data;
    /* 0x04 */ u32 size;
} rsaDataBlock; // size = 8

typedef enum {
    RSA_2048 = 0,
    RSA_4096
} RsaSize;

typedef struct {
    /* 0x00 */ u32 contentId;
    /* 0x04 */ BbAesKey contentKey;
    /* 0x14 */ u32 unk14;
    /* 0x18 */ char unk18[8];
} RecryptListEntry;

typedef struct {
    /* 0x00 */ BbEccSig signature;
    /* 0x40 */ s32 numEntries;
    /* 0x44 */ RecryptListEntry entries[0];
} RecryptList;

s32 check_untrusted_ptr_range(void* ptr, u32 size, u32 alignment);
s32 check_unknown_range(void* ptr, u32 size, u32 alignment);

#define CHECK_UNTRUSTED(ptr) \
    check_untrusted_ptr_range((ptr), sizeof(*(ptr)), ALIGNOF(*(ptr)))

#define CHECK_UNTRUSTED_ARRAY(ptr, count) \
    check_untrusted_ptr_range((ptr), (count)*sizeof(*(ptr)), ALIGNOF(*(ptr)))

#define CHECK_SKRAM_RANGE(ptr) \
    check_unknown_range((ptr), sizeof(*(ptr)), ALIGNOF(*(ptr)))

#define CHECK_SKRAM_ARRAY_RANGE(ptr, count) \
    check_unknown_range((ptr), (count)*sizeof(*(ptr)), ALIGNOF(*(ptr)))

#endif
