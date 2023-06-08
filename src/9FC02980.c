#include "bbtypes.h"
#include "string.h"
#include "macros.h"

extern BbVirage01 D_9FC0F308;

s32 get_expected_revocation_list_version(u32 type, u32* versionOut) {
    switch (type) {
        case 0:
            *versionOut = D_9FC0F308.tsCrlVersion;
            return 0;
        case 1:
            *versionOut = D_9FC0F308.cpCrlVersion;
            return 0;
        case 2:
            *versionOut = D_9FC0F308.caCrlVersion;
            return 0;
        default:
            return -1;
    }
}

s32 check_crl_root(BbCrlHead* crlHead, u32 expectedType) {
    if (crlHead->type != expectedType) {
        return -1;
    }

    switch (crlHead->type) {
        case 0:
            if (strncmp((const char*)crlHead->issuer, "Root-XSCA", 9) != 0) {
                return -1;
            }
            break;
        case 1:
            if (strncmp((const char*)crlHead->issuer, "Root-CPCA", 9) != 0) {
                return -1;
            }
            break;
        case 2:
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
        case 0:
            if (D_9FC0F308.tsCrlVersion < crlHead->versionNumber) {
                D_9FC0F308.tsCrlVersion = crlHead->versionNumber;
            } else {
                return 0;
            }
            break;
        case 1:
            if (D_9FC0F308.cpCrlVersion < crlHead->versionNumber) {
                D_9FC0F308.cpCrlVersion = crlHead->versionNumber;
            } else {
                return 0;
            }
            break;
        case 2:
            if (D_9FC0F308.caCrlVersion < crlHead->versionNumber) {
                D_9FC0F308.caCrlVersion = crlHead->versionNumber;
                D_9FC0F308.tsCrlVersion = D_9FC0F308.contentRlVersion = D_9FC0F308.cpCrlVersion = 0;
            } else {
                return 0;
            }
            break;
        default:
            return -1;
    }

    if (write_virage01_data(&D_9FC0F308) != 0) {
        return -1;
    }
    
    return 0;
}

s32 verify_crlbundle(BbCrlBundle* bundle, u32 type, u32 requiredVersion) {
    rsaDataBlock dataBlocks[2];
    u32 expectedVersion;
    s32 t;
    s32 ret;
    BbRsaCert* cert;

    if (get_expected_revocation_list_version(type, &expectedVersion) != 0) {
        return -1;
    }

    if (bundle->head == 0) {
        if (expectedVersion != 0) {
            return -1;
        }

        if (requiredVersion != 0) {
            return -1;
        }

        return 0;
    }

    if (expectedVersion > bundle->head->versionNumber) {
        return -1;
    }

    if (requiredVersion > bundle->head->versionNumber) {
        return -1;
    }

    if (check_crl_root(bundle->head, type) != 0) {
        return -1;
    }

    if (type != 2) {
        switch (type) {
            case 0:
                t = 1;
                break;
    
            case 1:
                t = 2;
                break;
    
            default:
                return -1;
        }

        if (verify_cert_chain(bundle->certChain, t)) {
            return -1;
        }
    }
    
    dataBlocks[0].data = &bundle->head->type;
    dataBlocks[0].size = sizeof(BbCrlHead) - sizeof(BbGenericSig);

    dataBlocks[1].data = bundle->list;
    dataBlocks[1].size = bundle->head->numberRevoked * sizeof(BbServerSuffix);

    if (strcmp((const char*)bundle->head->issuer, "Root") == 0) {
        ret = rsa_verify_signature(dataBlocks, ARRAY_COUNT(dataBlocks), pubkey, exponent, 1, (u32*)&bundle->head->signature);
    } else {
        cert = (BbRsaCert*) bundle->certChain[0];
        ret = rsa_verify_signature(dataBlocks, ARRAY_COUNT(dataBlocks), cert->publicKey, cert->exponent, bundle->head->sigType, (u32*)&bundle->head->signature);
    }

    if (ret == 0) {
        ret = check_crlbundle_version(bundle);
    }

    return ret;
}

s32 verify_all_crlbundles(BbCrlBundle* carl, s32 requiredCarlVersion,
                          BbCrlBundle* cprl, s32 requiredCprlVersion,
                          BbCrlBundle* tsrl, s32 requiredTsrlVersion) {
    u32 i;

    if (verify_crlbundle(carl, 2, requiredCarlVersion) != 0) {
        return -3;
    }

    if (carl->head != NULL) {
        for(i = 0; i < carl->head->numberRevoked; i++) {            
            if (strstr((const char*)cprl->certChain[0]->name.server, (const char*)&carl->list[i]) != NULL) {
                return -9;
            }

            if (requiredTsrlVersion >= 0 && strstr((const char*)tsrl->certChain[0]->name.server, (const char*)carl->list[i]) != NULL) {
                return -9;
            }
        }
    }

    if ((verify_crlbundle(cprl, 1, requiredCprlVersion) != 0)) {
        return -4;
    }

    if((requiredTsrlVersion >= 0) && (verify_crlbundle(tsrl, 0, requiredTsrlVersion) != 0)) {
        return -2;
    }

    return 0;
}

s32 check_ticket_bundle_revocations(BbTicketBundle* ticketBundle, BbAppLaunchCrls* crls) {
    s32 ret;
    u32 i;

    if (check_crlbundle_ranges(crls) == 0) {
        return -1;
    }

    ret = verify_all_crlbundles(&crls->carl, ticketBundle->ticket->cmd.head.caCrlVersion, 
                                &crls->cprl, ticketBundle->ticket->cmd.head.cpCrlVersion,
                                &crls->tsrl, ticketBundle->ticket->head.tsCrlVersion);
    if (ret != 0) {
        return ret;
    }

    if(crls->carl.head != NULL) {
        for (i = 0; i < crls->carl.head->numberRevoked; i++) {
            if (strstr((const char*)ticketBundle->ticketChain[1]->name.server, (const char*)crls->carl.list[i]) != NULL) {
                return -9;
            }

            if (strstr((const char*)ticketBundle->cmdChain[1]->name.server, (const char*)crls->carl.list[i]) != NULL) {
                return -9;
            }

        }
    }

    if(crls->cprl.head != NULL) {
        for (i = 0; i < crls->cprl.head->numberRevoked; i++) {
            if (strstr((const char*)ticketBundle->cmdChain[0]->name.server, (const char*)crls->cprl.list[i]) != NULL) {
                return -9;
            }
        }
    }

    if(crls->tsrl.head != NULL) {
        for (i = 0; i < crls->tsrl.head->numberRevoked; i++) {
            if (strstr((const char*)ticketBundle->ticketChain[0]->name.server, (const char*)crls->tsrl.list[i]) != NULL) {
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
        if (!CHECK_SKRAM_RANGE(appLaunchCrls->carl.head)){
            return -1;
        }

        if (check_unknown_range(appLaunchCrls->carl.list,
                                appLaunchCrls->carl.head->numberRevoked * sizeof(BbServerSuffix), 4) == 0) {
            return -1;
        }
    }

    if (appLaunchCrls->cprl.head != NULL) {
        if (!CHECK_SKRAM_RANGE(appLaunchCrls->cprl.head)){
            return -1;
        }

        if (check_unknown_range(appLaunchCrls->cprl.list,
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

    ret = verify_all_crlbundles(&appLaunchCrls->carl, cmdHead->caCrlVersion,
                                &appLaunchCrls->cprl, cmdHead->cpCrlVersion,
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

s32 check_crlbundle_ranges(BbAppLaunchCrls* launchCrls) { // TODO: rename check_applaunch_crl_ranges
    u32 i = 0;
    BbCrlBundle* bundle;

    for (i = 0, bundle = &launchCrls->tsrl; i < 3; i++, bundle++) {
        if(bundle->head != NULL) {
            if (!CHECK_UNTRUSTED(bundle->head)) {
                return 0;
            }

            if(check_untrusted_ptr_range(bundle->list, bundle->head->numberRevoked * sizeof(BbServerSuffix), 4) == 0) {
                return 0;
            }

            if (bundle->head->type != 2 && check_cert_ranges(bundle->certChain) == 0) {
                return 0;
            }
        }
    }

    return 1;
}
