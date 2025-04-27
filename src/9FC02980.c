#include "bbtypes.h"
#include "string.h"
#include "macros.h"

/**
 * Gets the expected revocation list version for the provided CRL type, stored in Virage.
 *
 * @param type       The CRL type to get the expected version for.
 * @param versionOut Location to write the expected version to.
 *
 * @return
 *      0 If type was a valid crl type
 *     -1 If type was invalid
 */
s32 get_expected_revocation_list_version(u32 type, u32* versionOut) {
    switch (type) {
        case CRL_TYPE_TS:
            *versionOut = virage01.tsCrlVersion;
            return 0;

        case CRL_TYPE_CP:
            *versionOut = virage01.cpCrlVersion;
            return 0;

        case CRL_TYPE_CA:
            *versionOut = virage01.caCrlVersion;
            return 0;
    }
    return -1;
}

/**
 * Checks whether the provided CRL is of the expected type and whether the issuer is valid for that type.
 *
 * The valid issuers are:
 *      TS : Root-XSCA
 *      CP : Root-CPCA
 *      CA : Root
 *
 * @param crlHead      The CRL to check the issuer of.
 * @param expectedType The expected type of CRL.
 *
 * @return
 *     -1 If the provided CRL does not match the expected type or issuer.
 *      0 If the CRL passed the checks.
 */
s32 check_crl_root(BbCrlHead* crlHead, u32 expectedType) {
    if (crlHead->type != expectedType) {
        return -1;
    }

    switch (crlHead->type) {
        case CRL_TYPE_TS:
            // Check that TS-type issuers start with Root-XSCA
            if (strncmp((const char*)crlHead->issuer, "Root-XSCA", 9) != 0) {
                return -1;
            }
            break;

        case CRL_TYPE_CP:
            // Check that CP-type issuers start with Root-CPCA
            if (strncmp((const char*)crlHead->issuer, "Root-CPCA", 9) != 0) {
                return -1;
            }
            break;

        case CRL_TYPE_CA:
            // Check that the CA-type issuer is Root
            if (strncmp((const char*)crlHead->issuer, "Root", 5) != 0) {
                return -1;
            }
            break;

        default:
            return -1;
    }
    return 0;
}

s32 check_crlbundle_version(BbCrlBundle* crlBundle) {
    BbCrlHead* crlHead = crlBundle->head;

    switch (crlHead->type) {
        case CRL_TYPE_TS:
            if (virage01.tsCrlVersion < crlHead->versionNumber) {
                virage01.tsCrlVersion = crlHead->versionNumber;
            } else {
                return 0;
            }
            break;

        case CRL_TYPE_CP:
            if (virage01.cpCrlVersion < crlHead->versionNumber) {
                virage01.cpCrlVersion = crlHead->versionNumber;
            } else {
                return 0;
            }
            break;

        case CRL_TYPE_CA:
            if (virage01.caCrlVersion < crlHead->versionNumber) {
                virage01.caCrlVersion = crlHead->versionNumber;
                virage01.tsCrlVersion = virage01.contentRlVersion = virage01.cpCrlVersion = 0;
            } else {
                return 0;
            }
            break;

        default:
            return -1;
    }

    if (write_virage01_data(&virage01) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Verifies the validity and authenticity of the provided CRL bundle.
 *
 * @return
 *     -1 if verification failed
 *      0 if verification passed
 */
s32 verify_crlbundle(BbCrlBundle* bundle, u32 type, u32 requiredVersion) {
    RSADataBlock dataBlocks[2];
    u32 expectedVersion;
    s32 ret;

    // Fetch the expected CRL version
    if (get_expected_revocation_list_version(type, &expectedVersion) != 0) {
        return -1;
    }

    if (bundle->head == NULL) {
        // If the CRL in the bundle is NULL, it may still be valid if
        // both the expected and required CRL versions are 0.
        if (expectedVersion != 0) {
            return -1;
        }
        if (requiredVersion != 0) {
            return -1;
        }
        return 0;
    }

    // If the expected version is greater than the version of this CRL,
    // it is invalid (no downgrades)
    if (expectedVersion > bundle->head->versionNumber) {
        return -1;
    }

    // If the required version is greater than the version of this CRL,
    // also consider it invalid.
    if (requiredVersion > bundle->head->versionNumber) {
        return -1;
    }

    // Check the type and issuer of the CRL
    if (check_crl_root(bundle->head, type) != 0) {
        return -1;
    }

    // If the CRL type is not CA, also verify the certificate chain in the bundle.
    if (type != CRL_TYPE_CA) {
        BbServerType serverType;
        switch (type) {
            case CRL_TYPE_TS:
                serverType = SERVER_TYPE_TS;
                break;

            case CRL_TYPE_CP:
                serverType = SERVER_TYPE_CP;
                break;

            default:
                return -1;
        }

        if (verify_cert_chain(bundle->certChain, serverType)) {
            return -1;
        }
    }

    // Signature check is over the CRL head excluding the signature itself
    dataBlocks[0].data = &bundle->head->type;
    dataBlocks[0].size = sizeof(BbCrlHead) - sizeof(BbGenericSig);

    // Signature check is also over the list of server suffixes the CRL revokes
    dataBlocks[1].data = bundle->list;
    dataBlocks[1].size = bundle->head->numberRevoked * sizeof(BbServerSuffix);

    if (strcmp((const char*)bundle->head->issuer, "Root") == 0) {
        // Verify the CRL signature against Root
        ret = rsa_verify_signature(dataBlocks, ARRAY_COUNT(dataBlocks), rootRSAPublicKey, rootRSAExponent,
                                   SIGTYPE_RSA4096, (u32*)&bundle->head->signature);
    } else {
        // Verify the CRL signature against the first cert in the cert chain, which is itself verified by the other
        // certs in the chain, the last of which should be verified by Root
        BbRsaCert* cert = (BbRsaCert*)bundle->certChain[0];
        ret = rsa_verify_signature(dataBlocks, ARRAY_COUNT(dataBlocks), cert->publicKey, cert->exponent,
                                   bundle->head->sigType, (u32*)&bundle->head->signature);
    }

    // Finally, if the signature verified succesfully, check the CRL version against the versions in Virage
    if (ret == 0) {
        ret = check_crlbundle_version(bundle);
    }
    return ret;
}

/**
 * @return
 *      0 If success
 *     -3 if the carl crlbundle failed to verify
 *     -9 if any certificates in cprl or tsrl were revoked
 *     -4 if verification of cprl failed
 *     -2 if verification of tsrl failed
 */
s32 verify_all_crlbundles(BbCrlBundle* carl, s32 requiredCarlVersion, BbCrlBundle* cprl, s32 requiredCprlVersion,
                          BbCrlBundle* tsrl, s32 requiredTsrlVersion) {
    u32 i;

    if (verify_crlbundle(carl, CRL_TYPE_CA, requiredCarlVersion) != 0) {
        return -3;
    }

    if (carl->head != NULL) {
        for (i = 0; i < carl->head->numberRevoked; i++) {
            if (strstr((const char*)cprl->certChain[0]->name.server, (const char*)&carl->list[i]) != NULL) {
                return -9;
            }

            if (requiredTsrlVersion >= 0 &&
                strstr((const char*)tsrl->certChain[0]->name.server, (const char*)carl->list[i]) != NULL) {
                return -9;
            }
        }
    }

    if ((verify_crlbundle(cprl, CRL_TYPE_CP, requiredCprlVersion) != 0)) {
        return -4;
    }

    if ((requiredTsrlVersion >= 0) && (verify_crlbundle(tsrl, CRL_TYPE_TS, requiredTsrlVersion) != 0)) {
        return -2;
    }

    return 0;
}

/**
 * @return
 *      0 If success
 *     -1 if crls has invalid pointers
 *     -3 if the carl crlbundle failed to verify
 *     -9 if any certificates in cprl or tsrl or the ticket bundle were revoked
 *     -4 if verification of cprl failed
 *     -2 if verification of tsrl failed
 */
s32 check_ticket_bundle_revocations(BbTicketBundle* ticketBundle, BbAppLaunchCrls* crls) {
    s32 ret;
    u32 i;

    if (!check_applaunch_crl_ranges(crls)) {
        return -1;
    }

    ret = verify_all_crlbundles(&crls->carl, ticketBundle->ticket->cmd.head.caCrlVersion, &crls->cprl,
                                ticketBundle->ticket->cmd.head.cpCrlVersion, &crls->tsrl,
                                ticketBundle->ticket->head.tsCrlVersion);
    if (ret != 0) {
        return ret;
    }

    if (crls->carl.head != NULL) {
        for (i = 0; i < crls->carl.head->numberRevoked; i++) {
            if (strstr((const char*)ticketBundle->ticketChain[1]->name.server, (const char*)crls->carl.list[i]) !=
                NULL) {
                return -9;
            }

            if (strstr((const char*)ticketBundle->cmdChain[1]->name.server, (const char*)crls->carl.list[i]) != NULL) {
                return -9;
            }
        }
    }

    if (crls->cprl.head != NULL) {
        for (i = 0; i < crls->cprl.head->numberRevoked; i++) {
            if (strstr((const char*)ticketBundle->cmdChain[0]->name.server, (const char*)crls->cprl.list[i]) != NULL) {
                return -9;
            }
        }
    }

    if (crls->tsrl.head != NULL) {
        for (i = 0; i < crls->tsrl.head->numberRevoked; i++) {
            if (strstr((const char*)ticketBundle->ticketChain[0]->name.server, (const char*)crls->tsrl.list[i]) !=
                NULL) {
                return -9;
            }
        }
    }

    return 0;
}

s32 check_certs_against_revocation_list(BbContentMetaDataHead* cmdHead, BbCertBase** chain,
                                        BbAppLaunchCrls* appLaunchCrls) {
    s32 ret;
    u32 i;

    if (appLaunchCrls->carl.head != NULL) {
        if (!CHECK_SKRAM_RANGE(appLaunchCrls->carl.head)) {
            return -1;
        }

        if (check_sk_ptr_range(appLaunchCrls->carl.list,
                               appLaunchCrls->carl.head->numberRevoked * sizeof(BbServerSuffix), 4) == 0) {
            return -1;
        }
    }

    if (appLaunchCrls->cprl.head != NULL) {
        if (!CHECK_SKRAM_RANGE(appLaunchCrls->cprl.head)) {
            return -1;
        }

        if (check_sk_ptr_range(appLaunchCrls->cprl.list,
                               appLaunchCrls->cprl.head->numberRevoked * sizeof(BbServerSuffix), 4) == 0) {
            return -1;
        }

        if (!CHECK_SKRAM_RANGE(appLaunchCrls->cprl.certChain)) {
            return -1;
        }

        if (!CHECK_SKRAM_RANGE((BbRsaCert*)appLaunchCrls->cprl.certChain[0])) {
            return -1;
        }
    }

    ret = verify_all_crlbundles(&appLaunchCrls->carl, cmdHead->caCrlVersion, // force formatting
                                &appLaunchCrls->cprl, cmdHead->cpCrlVersion, //
                                &appLaunchCrls->tsrl, -1);
    if (ret != 0) {
        return ret;
    }

    if (appLaunchCrls->carl.head != NULL) {
        for (i = 0; i < appLaunchCrls->carl.head->numberRevoked; i++) {
            if (strstr((const char*)chain[1]->name.server, (const char*)appLaunchCrls->carl.list[i]) != 0) {
                return -9;
            }
        }
    }

    if (appLaunchCrls->cprl.head != NULL) {
        for (i = 0; i < appLaunchCrls->cprl.head->numberRevoked; i++) {
            if (strstr((const char*)chain[0]->name.server, (const char*)appLaunchCrls->cprl.list[i]) != 0) {
                return -9;
            }
        }
    }

    return 0;
}

/**
 * @return
 *      FALSE If failed
 *      TRUE  If success
 */
s32 check_applaunch_crl_ranges(BbAppLaunchCrls* launchCrls) {
    u32 i = 0;
    BbCrlBundle* bundle;

    // For each tsrl, carl, cprl
    for (i = 0, bundle = &launchCrls->tsrl; i < 3; i++, bundle++) {
        if (bundle->head == NULL) {
            continue;
        }

        if (!CHECK_UNTRUSTED(bundle->head)) {
            return FALSE;
        }

        //! @bug this range check can pass for very large bundle->head->numberRevoked, which can later get used
        //! before the signature of the CRL head is checked (since it needs to know the size of the CRL to compute
        //! the hash to check)
        if (check_untrusted_ptr_range(bundle->list, bundle->head->numberRevoked * sizeof(BbServerSuffix), 4) == 0) {
            return FALSE;
        }

        if (bundle->head->type != CRL_TYPE_CA && !check_cert_ranges(bundle->certChain)) {
            return FALSE;
        }
    }

    return TRUE;
}
