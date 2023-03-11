#include "include_asm.h"
#include "bbtypes.h"

s32 func_9FC02700(BbCertBase* certBase) { // TODO: rename cert_get_size
	switch(certBase->certType) {
        case 0:
            return sizeof(BbEccCert);
        case 1:
            return sizeof(BbRsaCert);
        default:
            return -1;
    }
}

s32 func_9FC02734(BbCertBase* certBase) { // TODO: rename cert_get_signature_size
    switch(certBase->sigType) {
        case 0:
        case 1:
            return sizeof(BbRsaSig4096);
        case 2:
            return sizeof(BbEccSig);
        default:
            return -1;
    }

}

s32 get_cert_body(BbCertBase* certBase, void** out) { // TODO: rename cert_get_signature
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

extern const char aRoot[];

// TODO: rename these
extern const u8 pubkey[];
extern const u32 exponent;

s32 verify_cert_signature(BbCertBase* toVerify, BbRsaCert* toVeryifyAgainst) {
    rsaDataBlock dataBlock;
    rsaDataBlock* dataBlockPtr;
    void* signature;
    s32 certSize;
    s32 certSignatureSize;

    if (toVerify == 0) {
        return -1;
    }

    certSize = func_9FC02700(toVerify);
    certSignatureSize = func_9FC02734(toVerify);
    get_cert_body(toVerify, &signature);
    dataBlock.data = toVerify;
    dataBlock.size = certSize - certSignatureSize;
    if ((strcmp(toVerify->issuer, &aRoot) != 0) && (toVeryifyAgainst == NULL)) {
        return -1;
    }

    if (strcmp(toVerify->issuer, &aRoot) == 0) {
        return rsa_verify_signature(&dataBlock, 1, pubkey, exponent, 1, signature);
    } else if ((u32)toVerify->sigType < 2u) {
        return rsa_verify_signature(&dataBlock, 1, toVeryifyAgainst->publicKey, toVeryifyAgainst->exponent, toVerify->sigType, signature);
    } else {
        return -1;
    }
}

extern const char aXS[];
extern const char aCP[];

s32 verify_cert_chain(BbCertBase** certChain, s32 serverType) {
    const char *serverName;
    s32 i;

    serverName = aXS;
    if (serverType == 2) {
        serverName = aCP;
    }

    for (i = 0; i < 5; i++) {
        if((serverType != 0) && strncmp(certChain[i]->name.server, serverName, 2) != 0) {
            return -1;
        }

        if (strcmp(certChain[i]->issuer, &aRoot) == 0) {
            return verify_cert_signature(certChain[i], NULL);
        }

        if ((verify_cert_signature(certChain[i], (BbRsaCert*)certChain[i + 1]) != 0)){
            return -1;
        }
    }

    // BUG! Return success without verifying root cert if more than 5 non-root certs are provided.
    return 0;
}

extern BbVirage01 D_9FC0F308;

s32 get_expected_revocation_list_version(u32 type, s32* versionOut) {
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

extern const char aRootCpca[];
extern const char aRootXsca[];
extern const char aRoot_0[];

s32 check_crl_root(BbCrlHead* crlHead, s32 expectedType) {
    if (crlHead->type != expectedType) {
        return -1;
    }

    switch (crlHead->type) {
        case 0:
            if (strncmp(crlHead->issuer, aRootXsca, 9) != 0) {
                return -1;
            }
            break;
        case 1:
            if (strncmp(crlHead->issuer, aRootCpca, 9) != 0) {
                return -1;
            }
            break;
        case 2:
            if (strncmp(crlHead->issuer, aRoot_0, 5) != 0) {
                return -1;
            }
            break;
        default:
            return -1;
    }

    return 0;
}

extern BbVirage01 D_9FC0F308;

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

#ifdef NON_EQUIVALENT
s32 verify_crlbundle(BbCrlBundle *bundle, s32 type, s32 requiredVersion) {
    rsaDataBlock dataBlocks[2];
    u32 expectedVersion;
    s32 var_v0;
    BbRsaCert* temp_a2;

    if (get_expected_revocation_list_version(type, &expectedVersion) == 0) {
        return -1;
    }

    if (bundle->head == NULL) {
        if (expectedVersion != 0) {
            return -1;
        }

        if (requiredVersion != 0) {
            return -1;
        }

        return 0;
    }

    if(bundle->head->versionNumber < expectedVersion) {
        return -1;
    }

    if(bundle->head->versionNumber < requiredVersion) {
        return -1;
    }

    if(check_crl_root(bundle->head, type) != 0) {
        return -1;
    }

    switch (type) {
        case 0:
            if (verify_cert_chain(bundle->certChain, 1) != 0) {
                return -1;
            }

            dataBlocks[0].data = &bundle->head->type;
            dataBlocks[0].size = 0x58;

            dataBlocks[1].data = bundle->list;
            dataBlocks[1].size = bundle->head->numberRevoked * sizeof(BbServerSuffix);

            if (strcmp(bundle->head->issuer, aRoot_0) == 0) {
                var_v0 = rsa_verify_signature(dataBlocks, 2, pubkey, exponent, 1, &bundle->head->signature);
            } else {
                temp_a2 = (BbRsaCert*)bundle->certChain[0];
                var_v0 = rsa_verify_signature(dataBlocks, 2, temp_a2->publicKey, temp_a2->exponent, 2, &bundle->head->signature);
            }

            if (var_v0 == 0) {
                var_v0 = check_crlbundle_version(bundle);
            }

            return var_v0;

        case 1:
            if (verify_cert_chain(bundle->certChain, 2) != 0) {
                return -1;
            }

            dataBlocks[0].data = &bundle->head->type;
            dataBlocks[0].size = 0x58;

            dataBlocks[1].data = bundle->list;
            dataBlocks[1].size = bundle->head->numberRevoked * sizeof(BbServerSuffix);

            if (strcmp(bundle->head->issuer, aRoot_0) == 0) {
                var_v0 = rsa_verify_signature(dataBlocks, 2, pubkey, exponent, 1, &bundle->head->signature);
            } else {
                temp_a2 = (BbRsaCert*)bundle->certChain[0];
                var_v0 = rsa_verify_signature(dataBlocks, 2, temp_a2->publicKey, temp_a2->exponent, 2, &bundle->head->signature);
            }

            if (var_v0 == 0) {
                var_v0 = check_crlbundle_version(bundle);
            }

            return var_v0;

        case 2:
            dataBlocks[0].data = &bundle->head->type;
            dataBlocks[0].size = 0x58;

            dataBlocks[1].data = bundle->list;
            dataBlocks[1].size = bundle->head->numberRevoked * sizeof(BbServerSuffix);

            if (strcmp(bundle->head->issuer, aRoot_0) == 0) {
                var_v0 = rsa_verify_signature(dataBlocks, 2, pubkey, exponent, 1, &bundle->head->signature);
            } else {
                temp_a2 = (BbRsaCert*)bundle->certChain[0];
                var_v0 = rsa_verify_signature(dataBlocks, 2, temp_a2->publicKey, temp_a2->exponent, 2, &bundle->head->signature);
            }

            if (var_v0 == 0) {
                var_v0 = check_crlbundle_version(bundle);
            }

            return var_v0;
        default:
            return -1;
    }

    return -1;
}
#else
INCLUDE_ASM("asm/non_matchings/9FC02700", verify_crlbundle);
#endif

s32 verify_all_crlbundles(BbCrlBundle* carl, s32 requiredCarlVersion, BbCrlBundle* cprl, s32 requiredCprlVersion, BbCrlBundle* tsrl, s32 requiredTsrlVersion) {
    u32 i;

    if (verify_crlbundle(carl, 2, requiredCarlVersion) != 0) {
        return -3;
    }

    if (carl->head != NULL) {
        for(i = 0; i < carl->head->numberRevoked; i++) {            
            if (strstr(cprl->certChain[0]->name.server, &carl->list[i]) != NULL) {
                return -9;
            }

            if((requiredTsrlVersion >= 0) && (strstr(tsrl->certChain[0]->name.server, carl->list[i]) != NULL) ) {
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
            if (strstr(ticketBundle->ticketChain[1]->name.server, crls->carl.list[i]) != NULL) {
                return -9;
            }

            if (strstr(ticketBundle->cmdChain[1]->name.server, crls->carl.list[i]) != NULL) {
                return -9;
            }

        }
    }

    if(crls->cprl.head != NULL) {
        for (i = 0; i < crls->cprl.head->numberRevoked; i++) {
            if (strstr(ticketBundle->cmdChain[0]->name.server, crls->cprl.list[i]) != NULL) {
                return -9;
            }
        }
    }

    if(crls->tsrl.head != NULL) {
        for (i = 0; i < crls->tsrl.head->numberRevoked; i++) {
            if (strstr(ticketBundle->ticketChain[0]->name.server, crls->tsrl.list[i]) != NULL) {
                return -9;
            }
        }
    }

    return 0;
}

s32 check_certs_against_revocation_list(BbContentMetaDataHead* cmdHead, BbCertBase** chain, BbCrlBundle *arg2) {
    s32 ret;
    u32 i;

    if (arg2[1].head != NULL) {
        if (check_unknown_range(arg2[1].head, sizeof(BbCrlHead), 4) == 0) {
            return -1;
        }
        if (check_unknown_range(arg2[1].list, arg2[1].head->numberRevoked * sizeof(BbServerSuffix), 4) == 0) {
            return -1;
        }
    }

    if (arg2[2].head != NULL) {
        if (check_unknown_range(arg2[2].head, sizeof(BbCrlHead), 4) == 0) {
            return -1;
        }

        if (check_unknown_range(arg2[2].list, arg2[2].head->numberRevoked * sizeof(BbServerSuffix), 4) == 0) {
            return -1;
        }

        if (check_unknown_range(arg2[2].certChain, 4, 4) == 0) {
            return -1;
        }

        if (check_unknown_range(arg2[2].certChain[0], sizeof(BbRsaCert), 4) == 0) {
            return -1;
        }
    }

    ret = verify_all_crlbundles(&arg2[1], cmdHead->caCrlVersion, &arg2[2], cmdHead->cpCrlVersion, &arg2[0], -1);
    if (ret != 0) {
        return ret;
    }

    if (arg2[1].head != NULL) {
        for (i = 0; i < arg2[1].head->numberRevoked; i++) {
            if (strstr(chain[1]->name.server, arg2[1].list[i]) != 0) {
                return -9;
            }
        }
    }

    if (arg2[2].head != NULL) {
        for (i = 0; i < arg2[2].head->numberRevoked; i++) {
            if (strstr(chain[0]->name.server, arg2[2].list[i]) != 0) {
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
            if (check_untrusted_ptr_range(bundle->head, sizeof(BbCrlHead), 4) == 0) {
                return 0;
            }

            if(check_untrusted_ptr_range(bundle->list, bundle->head->numberRevoked * sizeof(BbServerSuffix), 4) == 0) {
                return 0;
            }

            if(bundle->head->type != 2) {
                if (check_cert_ranges(bundle->certChain) == 0) {
                    return 0;
                }                
            }
        }
    }

    return 1;
}