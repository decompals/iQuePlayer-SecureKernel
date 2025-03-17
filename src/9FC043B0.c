#include "bbtypes.h"
#include "string.h"
#include "libcrypto/aes.h"
#include "macros.h"

/**
 * Verifies the ECC signature over this recrypt list to ensure it has not been tampered with.
 *
 * @param list The recrypt list to verify the signature of.
 *
 * @return
 *     -1 If the signature failed to verify over the data.
 *      0 If the signature was successfully verified.
 */
s32 recrypt_list_verify_ecc_sig(RecryptList* list) {
    BbEccPublicKey publicKey;
    u32 size = sizeof(list->numEntries) + list->numEntries * sizeof(RecryptListEntry);

    virage2_gen_public_key(publicKey);
    if (verify_ecc_signature((u8*)&list->numEntries, size, publicKey, list->signature, RECRYPT_LIST_IDENTITY) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Signs the recrypt list with an ecc signature using the console's ECC private key.
 *
 * @param list The recrypt list to sign.
 */
void recrypt_list_sign(RecryptList* list) {
    ecc_sign_data((u8*)&list->numEntries, sizeof(list->numEntries) + list->numEntries * sizeof(RecryptListEntry),
                  virage2_offset->privateKey, &list->signature, RECRYPT_LIST_IDENTITY);
}

/**
 * Resets the provided recrypt list.
 *
 * @param list Recrypt list to reset.
 */
s32 recrypt_list_clear(RecryptList* list) {
    list->numEntries = 0;
    recrypt_list_sign(list);
    return 0;
}

/**
 * Fetches a decrypted entry from the recrypt list by index
 *
 * @param entry The decrypted entry.
 * @param list  The recrypt list to read from.
 * @param index The index of the entry to fetch.
 */
void recrypt_list_decrypt_entry(RecryptListEntry* entry, RecryptList* list, u32 index) {
    BbAesIv recryptListEntryIV;
    u32 i;

    // Prepare IV, derived from BBID: [ BBID + 0, BBID + 1, BBID + 2, BBID + 3 ]
    for (i = 0; i < ARRAY_COUNT(recryptListEntryIV); i++) {
        recryptListEntryIV[i] = virage2_offset->bbId + i;
    }
    // Decrypt the entry with the recrypt list key
    aes_SwDecrypt((u8*)virage2_offset->recryptListKey, (u8*)recryptListEntryIV, (u8*)&list->entries[index],
                  sizeof(RecryptListEntry), (u8*)entry);
}

/**
 * Adds a new entry to this recrypt list at the specified index, assumes the recrypt list has already been
 * resized to fit it.
 *
 * @param entry The new entry to add. The entry is encrypted in this function with the recrypt list key and an
 *              initialization vector derived from the console's unique BBID.
 * @param list  The recrypt list to add the entry to.
 * @param index The index to replace with the new entry.
 */
void recrypt_list_add_entry(RecryptListEntry* entry, RecryptList* list, u32 index) {
    u8 encryptedRecryptListEntry[sizeof(RecryptListEntry)];
    BbAesIv recryptListEntryIV;
    u32 i;

    // Prepare IV, derived from BBID: [ BBID + 0, BBID + 1, BBID + 2, BBID + 3 ]
    for (i = 0; i < ARRAY_COUNT(recryptListEntryIV); i++) {
        recryptListEntryIV[i] = virage2_offset->bbId + i;
    }
    // Encrypt the entry with the recrypt list key
    aes_SwEncrypt((u8*)virage2_offset->recryptListKey, (u8*)recryptListEntryIV, (u8*)entry, sizeof(RecryptListEntry),
                  encryptedRecryptListEntry);
    memcpy(&list->entries[index], encryptedRecryptListEntry, sizeof(RecryptListEntry));
}

/**
 * Fetches the recrypt list entry for the provided CID, if it exists.
 *
 * @param list      The recrypt list to read from.
 * @param contentId The CID to find an entry for.
 * @param entry     The corresponding entry, if it was found.
 *
 * @return
 *     -1 If no entry was found for the provided CID.
 *   >= 0 The index of the entry that was found.
 */
s32 recrypt_list_get_entry_for_cid(RecryptList* list, BbContentId contentId, RecryptListEntry* entry) {
    u32 i;

    for (i = 0; i < list->numEntries; i++) {
        recrypt_list_decrypt_entry(entry, list, i);
        if (entry->contentId == contentId) {
        	return i;
        }
    }
    return -1;
}

/**
 * Verifies that the provided recrypt list is not too large and that its ECC signature is valid for its contents.
 *
 * @param list The recrypt list to verify.
 *
 * @return
 *     -1 If the recrypt list is too big or the signature failed to verify.
 *      0 If the recrypt list is valid.
 */
s32 recrypt_list_verify_size_and_sig(RecryptList* list) {
    if ((s32)(offsetof(RecryptList, entries) + list->numEntries * sizeof(RecryptListEntry)) < RECRYPT_LIST_MAX_SIZE) {
    	return recrypt_list_verify_ecc_sig(list);
    }
    return -1;
}

/**
 * A
 *
 * @param list          The recrypt list to add the entry to.
 * @param contentId     A
 * @param recryptStatus A
 */
s32 recrypt_list_add_new_entry(RecryptList* list, BbContentId contentId, RecryptStatus recryptStatus) {
    RecryptListEntry entry;
    s32 index;

    if (recrypt_list_verify_size_and_sig(list) != 0) {
        return -1;
    }

    index = recrypt_list_get_entry_for_cid(list, contentId, &entry);
    if (index < 0) {
        return index;
    }

    entry.recryptStatus = recryptStatus;
    recrypt_list_add_entry(&entry, list, index);
    recrypt_list_sign(list);

    return 0;
}

/**
 * A
 *
 * @param list      A
 * @param key       A
 * @param contentId A
 *
 * @return A
 */
RecryptStatus recrypt_list_get_key_for_cid(RecryptList* list, BbAesKey* key, BbContentId contentId) {
    RecryptListEntry entry;
    RecryptStatus recryptStatus;

    if (recrypt_list_verify_size_and_sig(list) != 0) {
        recrypt_list_clear(list);
    }

    if (recrypt_list_get_entry_for_cid(list, contentId, &entry) < 0) {
        // No entry, create one
        entry.contentId = contentId;
        gen_random_key_material(entry.contentKey, 4);
        entry.recryptStatus = RECRYPT_STATUS_PARTIAL;
        recrypt_list_add_entry(&entry, list, list->numEntries);
        list->numEntries++;
        recrypt_list_sign(list);
        recryptStatus = RECRYPT_STATUS_BEGINNING;
    } else {
        // Entry exists
        recryptStatus = entry.recryptStatus;
    }

    memcpy(key, entry.contentKey, sizeof(BbAesKey));
    return recryptStatus;
}
