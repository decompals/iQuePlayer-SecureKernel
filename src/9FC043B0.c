#include "include_asm.h"
#include "macros.h"
#include "bbtypes.h"
#include "libcrypto/aes.h"

extern BbVirage2* virage2_offset;

void virage2_gen_public_key(u32* pubkeyOut);

s32 recrypt_list_verify_ecc_sig(RecryptList* list) {
    BbEccPublicKey publicKey;
    s32 size;

    size = list->numEntries * sizeof(RecryptListEntry) + 4;
    virage2_gen_public_key(publicKey);
    if (verify_ecc_signature(&list->numEntries, size, publicKey, list->signature, 0x06091968) != 0) {
        return -1;
    }

    return 0;
}

void recrypt_list_sign(RecryptList* list) {
    func_9FC03694(&list->numEntries, list->numEntries * sizeof(RecryptListEntry) + 4, virage2_offset->privateKey, list->signature, 0x06091968);
}

s32 recrypt_list_clear(RecryptList* list) {
    list->numEntries = 0;
    recrypt_list_sign(list);

    return 0;
}

void recrypt_list_decrypt_entry(RecryptListEntry* entry, RecryptList* list, u32 index) {
    BbAesIv recryptListEntryIv;
    u32 i;

    for(i = 0; i < ARRAY_COUNT(recryptListEntryIv); i++) {
        recryptListEntryIv[i] = virage2_offset->bbId + i;
    }
    aes_SwDecrypt(virage2_offset->recryptListKey, recryptListEntryIv, &list->entries[index], sizeof(RecryptListEntry), entry);
}

void recrypt_list_add_entry(RecryptListEntry* entry, RecryptList* list, u32 entryIndex) {
    u32 encryptedRecryptListEntry[8];
    BbAesIv recryptListEntryIv;
    u32 i;

    for(i = 0; i < ARRAY_COUNT(recryptListEntryIv); i++) {
        recryptListEntryIv[i] = virage2_offset->bbId + i;
    }
    aes_SwEncrypt(virage2_offset->recryptListKey, recryptListEntryIv, entry, sizeof(RecryptListEntry), encryptedRecryptListEntry);
    memcpy(&list->entries[entryIndex], encryptedRecryptListEntry, sizeof(RecryptListEntry));
}

s32 recrypt_list_get_entry_for_cid(RecryptList* list, s32 contentId, RecryptListEntry* entry) {
    u32 i;

    for(i = 0; i < list->numEntries; i++) {
        recrypt_list_decrypt_entry(entry, list, i);
        if(entry->contentId == contentId) {
        	return i;
        }
    }

    return -1;
}

s32 recrypt_list_verify_size_and_sig(RecryptList* list) {
    if ((s32)(list->numEntries * sizeof(RecryptListEntry) + 0x44) < 0x4000) { // TODO: offsetof?
    	return recrypt_list_verify_ecc_sig(list);
    }

    return -1;
}

s32 recrypt_list_add_new_entry(RecryptList* list, s32 contentId, s32 arg2) {
    RecryptListEntry entry;
    s32 index;

    if (recrypt_list_verify_size_and_sig(list) != 0) {
        return -1;
    }
    
    index = recrypt_list_get_entry_for_cid(list, contentId, &entry);
    if (index < 0) {
        return index;
    }

    entry.unk14 = arg2;
    recrypt_list_add_entry(&entry, list, index);
    recrypt_list_sign(list);

    return 0;
}

s32 recrypt_list_get_key_for_cid(RecryptList* list, u32* key, s32 contentId) {
    RecryptListEntry entry;
    s32 var_s1;

    if (recrypt_list_verify_size_and_sig(list) != 0) {
        recrypt_list_clear(list);
    }

    if (recrypt_list_get_entry_for_cid(list, contentId, &entry) < 0) {
        entry.contentId = contentId;
        func_9FC035EC(entry.contentKey, 4);
        entry.unk14 = 3;
        recrypt_list_add_entry(&entry, list, list->numEntries);
        list->numEntries++;
        recrypt_list_sign(list);
        var_s1 = 4;
    } else {
        var_s1 = entry.unk14;
    }

    memcpy(key, entry.contentKey, sizeof(BbAesKey));
    return var_s1;
}
