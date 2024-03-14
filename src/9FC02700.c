#include "bbtypes.h"
#include "string.h"
#include "macros.h"

s32 cert_get_size(BbCertBase* certBase) {
    switch (certBase->certType) {
        case 0:
            return sizeof(BbEccCert);
        case 1:
            return sizeof(BbRsaCert);
        default:
            return -1;
    }
}

s32 cert_get_signature_size(BbCertBase* certBase) {
    switch (certBase->sigType) {
        case 0:
        case 1:
            return sizeof(BbRsaSig4096);
        case 2:
            return sizeof(BbEccSig);
        default:
            return -1;
    }
}

s32 cert_get_signature(BbCertBase* certBase, void** out) { // TODO: rename cert_get_signature
    switch (certBase->certType) {
        case 0:
            *out = &((BbEccCert*)certBase)->signature;
            break;
        case 1:
            *out = &((BbRsaCert*)certBase)->signature;
            break;
        default:
            return -1;
    }

    return 0;
}

s32 verify_cert_signature(BbCertBase* toVerify, BbRsaCert* toVeryifyAgainst) {
    rsaDataBlock dataBlock;
    void* signature;
    s32 certSize;
    s32 certSignatureSize;

    if (toVerify == 0) {
        return -1;
    }

    certSize = cert_get_size(toVerify);
    certSignatureSize = cert_get_signature_size(toVerify);
    cert_get_signature(toVerify, &signature);
    dataBlock.data = toVerify;
    dataBlock.size = certSize - certSignatureSize;
    if ((strcmp((const char*)toVerify->issuer, "Root") != 0) && (toVeryifyAgainst == NULL)) {
        return -1;
    }

    if (strcmp((const char*)toVerify->issuer, "Root") == 0) {
        return rsa_verify_signature(&dataBlock, 1, rootRSAPublicKey, rootRSAExponent, 1, signature);
    } else if ((u32)toVerify->sigType < 2u) {
        return rsa_verify_signature(&dataBlock, 1, toVeryifyAgainst->publicKey, toVeryifyAgainst->exponent,
                                    toVerify->sigType, signature);
    }

    return -1;
}

s32 verify_cert_chain(BbCertBase** certChain, s32 serverType) {
    const char* serverName;
    s32 i;

    serverName = "XS";
    if (serverType == 2) {
        serverName = "CP";
    }

    for (i = 0; i < MAX_CERTS; i++) {
        if (serverType != 0 && strncmp((const char*)certChain[i]->name.server, serverName, 2) != 0) {
            return -1;
        }

        if (strcmp((const char*)certChain[i]->issuer, "Root") == 0) {
            return verify_cert_signature(certChain[i], NULL);
        }

        if (verify_cert_signature(certChain[i], (BbRsaCert*)certChain[i + 1]) != 0) {
            return -1;
        }
    }

    // BUG! Return success without verifying root cert if more than 5 non-root certs are provided.
    return 0;
}
