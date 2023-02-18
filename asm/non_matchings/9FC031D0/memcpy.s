## func_9FC00BAC
## skLaunchSetup
## skRecryptBegin
## skRecryptComputeState
## skGetConsumption
## func_9FC01D54
## func_9FC03410
## recrypt_list_add_entry
## recrypt_list_get_key_for_cid
## aes_HwKeyExpand
## aesCipherInit
## aesBlockEncrypt
## aesBlockDecrypt
## SHA1Input
## SHA1Result
/* 003A84 9FC03A84 10C00007 */  beqz        $a2, .L9FC03AA4
/* 003A88 9FC03A88 00801821 */   addu       $v1, $a0, $zero
.L9FC03A8C:
/* 003A8C 9FC03A8C 90A20000 */  lbu         $v0, ($a1)
/* 003A90 9FC03A90 24A50001 */  addiu       $a1, $a1, 1
/* 003A94 9FC03A94 24C6FFFF */  addiu       $a2, $a2, -1
/* 003A98 9FC03A98 A0620000 */  sb          $v0, ($v1)
/* 003A9C 9FC03A9C 14C0FFFB */  bnez        $a2, .L9FC03A8C
/* 003AA0 9FC03AA0 24630001 */   addiu      $v1, $v1, 1
.L9FC03AA4:
/* 003AA4 9FC03AA4 03E00008 */  jr          $ra
/* 003AA8 9FC03AA8 00801021 */   addu       $v0, $a0, $zero
