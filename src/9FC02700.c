#include "bbtypes.h"
#include "string.h"
#include "macros.h"

/**
 * Gets the size of the provided certificate.
 *
 * @return
 *     -1 If the type of the certificate is invalid.
 *    > 0 The size of the certificate.
 */
s32 cert_get_size(BbCertBase* certBase) {
    switch (certBase->certType) {
        case CERT_TYPE_ECDSA:
            return sizeof(BbEccCert);

        case CERT_TYPE_RSA:
            return sizeof(BbRsaCert);
    }
    return -1;
}

/**
 * Gets the size of the signature component of the provided certificate.
 *
 * @return
 *     -1 If the signature type of the certificate is invalid.
 *    > 0 The size of the signature.
 */
s32 cert_get_signature_size(BbCertBase* certBase) {
    switch (certBase->sigType) {
        case SIGTYPE_RSA2048:
        case SIGTYPE_RSA4096:
            return sizeof(BbRsaSig4096);

        case SIGTYPE_ECDSA:
            return sizeof(BbEccSig);
    }
    return -1;
}

/**
 * Gets a pointer to the signature component of the provided certificate.
 *
 * @param out The location to write the pointer to the signature to.
 *
 * @return
 *     -1 If the type of the certificate is invalid.
 *      0 If successful.
 */
s32 cert_get_signature(BbCertBase* certBase, void** out) {
    switch (certBase->certType) {
        case CERT_TYPE_ECDSA:
            *out = &((BbEccCert*)certBase)->signature;
            break;

        case CERT_TYPE_RSA:
            *out = &((BbRsaCert*)certBase)->signature;
            break;

        default:
            return -1;
    }
    return 0;
}

/**
 * Verifies the provided RSA certificate against another certificate.
 *
 * @param toVerify         The certificate to verify.
 * @param toVeryifyAgainst The certificate that may vouch for toVerify. May be NULL if toVerify was issued by Root.
 *
 * @return
 *      0 if success
 *     -1 if the certificate signature did not verify
 */
s32 verify_cert_signature(BbCertBase* toVerify, BbRsaCert* toVeryifyAgainst) {
    RSADataBlock dataBlock;
    void* signature;
    s32 certSize;
    s32 certSignatureSize;

    if (toVerify == NULL) {
        return -1;
    }

    certSize = cert_get_size(toVerify);
    certSignatureSize = cert_get_signature_size(toVerify);
    cert_get_signature(toVerify, &signature);
    dataBlock.data = toVerify;
    dataBlock.size = certSize - certSignatureSize;
    if (strcmp((const char*)toVerify->issuer, "Root") != 0 && toVeryifyAgainst == NULL) {
        return -1;
    }

    if (strcmp((const char*)toVerify->issuer, "Root") == 0) {
        // Use root key
        return rsa_verify_signature(&dataBlock, 1, rootRSAPublicKey, rootRSAExponent, SIGTYPE_RSA4096, signature);
    } else if (toVerify->sigType == SIGTYPE_RSA2048 || toVerify->sigType == SIGTYPE_RSA4096) {
        // Use next cert RSA
        return rsa_verify_signature(&dataBlock, 1, toVeryifyAgainst->publicKey, toVeryifyAgainst->exponent, toVerify->sigType, signature);
    }
    return -1;
}

/**
 * Verifies the provided certificate chain. Each cert in the chain must be vouched for by the next cert, the last cert
 * should be vouched for by Root. The certificate chain should be no longer than MAX_CERTS.
 *
 * @param certChain  Array of pointers to certificates comprising the cert chain, in order.
 * @param serverType Issuing server type (?)
 *
 * @return
 *      0 if success
 *     -1 if the certificate chain did not verify
 */
s32 verify_cert_chain(BbCertBase** certChain, BbServerType serverType) {
    s32 i;

    const char* serverName = "XS";
    if (serverType == SERVER_TYPE_CP) {
        serverName = "CP";
    }

    // Limit the maximum length of the cert chain
    for (i = 0; i < MAX_CERTS; i++) {
        // If not CA type, ensure that the server name is of the expected kind.
        if (serverType != SERVER_TYPE_CA && strncmp((const char*)certChain[i]->name.server, serverName, 2) != 0) {
            return -1;
        }

        // If the current cert is issued by root, verify against root and don't look further.
        if (strcmp((const char*)certChain[i]->issuer, "Root") == 0) {
            return verify_cert_signature(certChain[i], NULL);
        }

        // Otherwise, verify current against next.
        if (verify_cert_signature(certChain[i], (BbRsaCert*)certChain[i + 1]) != 0) {
            return -1;
        }
    }

    //! @bug Return success without verifying root cert if more than 5 non-root certs are provided.
    return 0;
}
