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

typedef u8 BbContentDesc[0x2800];

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
    /* 0x0000 */ BbContentDesc contentDesc;
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

typedef enum {
    CRL_TS,
    CRL_CA,
    CRL_CP
} BbCrlNum;

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
    /* 0x00 */ BbContentId contentId;
    /* 0x04 */ BbAesKey contentKey;
    /* 0x14 */ u32 unk14;
    /* 0x18 */ char unk18[8];
} RecryptListEntry;

typedef struct {
    /* 0x00 */ BbEccSig signature;
    /* 0x40 */ u32 numEntries;
    /* 0x44 */ RecryptListEntry entries[1/*numEntries*/];
} RecryptList;

#define RECRYPT_LIST_MAX_SIZE 0x4000

s32 check_untrusted_ptr_range(void* ptr, u32 size, u32 alignment);
s32 check_unknown_range(void* ptr, u32 size, u32 alignment);

#define CHECK_UNTRUSTED(ptr) \
    check_untrusted_ptr_range((ptr), sizeof(*(ptr)), ALIGNOF(*(ptr)))

#define CHECK_UNTRUSTED_ARRAY(ptr, count) \
    check_untrusted_ptr_range((ptr), (count)*sizeof(*(ptr)), ALIGNOF(*(ptr)))

#define CHECK_UNTRUSTED_RECRYPT_LIST(ptr) \
    check_untrusted_ptr_range((ptr), RECRYPT_LIST_MAX_SIZE, ALIGNOF(*(ptr)))

#define CHECK_SKRAM_RANGE(ptr) \
    check_unknown_range((ptr), sizeof(*(ptr)), ALIGNOF(*(ptr)))

#define CHECK_SKRAM_ARRAY_RANGE(ptr, count) \
    check_unknown_range((ptr), (count)*sizeof(*(ptr)), ALIGNOF(*(ptr)))

#define OS_READ  0
#define OS_WRITE 1

// TODO sort these
void startup(void);
void launch_app_trampoline(void);
s32 write_virage01_data(BbVirage01* virageData);
u16* getTrialConsumptionByTid(u16 tid);
s32 verify_cert_chain(BbCertBase** certChain, s32 serverType);
s32 check_cert_ranges(BbCertBase**);
s32 check_ticket_bundle_revocations(BbTicketBundle* ticketBundle, BbAppLaunchCrls* crls);
s32 recrypt_list_get_key_for_cid(RecryptList* list, BbAesKey* key, BbContentId contentId);
void aes_cbc_set_key_iv(BbAesKey* key, BbAesIv* iv);
void set_proc_permissions(BbContentMetaDataHead* cmdHead);
s32 recrypt_list_verify_size_and_sig(RecryptList* list);
s32 recrypt_list_add_new_entry(RecryptList* list, BbContentId contentId, u32 arg2);
s32 dma_from_cart(s32 bufSelect, void* outBuf, s32 length, s32 direction);
void func_9FC0384C(s32 arg0, s32 continuation);
void func_9FC03694(u8* data, u32 datasize, u32* private_key, BbEccSig* signature, u32 identity);
s32 check_crlbundle_ranges(BbAppLaunchCrls* launchCrls);
s32 verify_all_crlbundles(BbCrlBundle* carl, s32 requiredCarlVersion,
                          BbCrlBundle* cprl, s32 requiredCprlVersion,
                          BbCrlBundle* tsrl, s32 requiredTsrlVersion);
s32 verify_ecc_signature(u8* data, u32 datasize, u32* public_key, u32* signature, u32 identity);
void virage2_gen_public_key(u32* pubkeyOut);
s32 write_virage2(void);
s32 write_virage_data(u32 controller, u32 *data, s32 size);
s32 set_virage01_selector(BbVirage01* virageData);
s32 card_read_block(u32 block, s32 bufSelect);
s32 check_certs_against_revocation_list(BbContentMetaDataHead* cmdHead, BbCertBase** chain,
                                        BbAppLaunchCrls* appLaunchCrls);
void osInvalDCache(void* buf, s32 len);
s32 func_9FC04220(void);
s32 func_9FC0425C(u32 ctrlReg);
s32 func_9FC04304(u32 ctrlReg);
void* wordcopy(void* dst, void* src, s32 nWords);
s32 func_9FC047CC(u8* a0, s32 a1);
void initialize_virage_controllers(void);
s32 func_9FC035EC(u32* randomOut, s32 nWords);
s32 rsa_verify_signature(rsaDataBlock* dataBlocks, s32 numDataBlocks, const u32* certpublickey, const u32 certexponent,
                         RsaSize rsaSize, u32* certsign);
s32 rsa_check_signature(u8* digest, const u32* certpublickey, const u32 certexponent, RsaSize rsaSize, u32* certsign);

extern const u32 rootRSAPublicKey[];
extern const u32 rootRSAExponent;

extern BbVirage2* virage2_offset;
extern u16 D_9FC0EBB0;
extern s16 D_9FC0EBB2;
extern u16 g_cur_proc_trial_type;

#endif
