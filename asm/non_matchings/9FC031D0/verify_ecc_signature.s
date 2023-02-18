## skVerifyHash
## recrypt_list_verify_ecc_sig
/* 003714 9FC03714 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 003718 9FC03718 8FA20038 */  lw          $v0, 0x38($sp)
/* 00371C 9FC0371C 27A30018 */  addiu       $v1, $sp, 0x18
/* 003720 9FC03720 AFBF0020 */  sw          $ra, 0x20($sp)
/* 003724 9FC03724 AFA30010 */  sw          $v1, 0x10($sp)
/* 003728 9FC03728 0FF0273B */  jal         bsl_verify_ecc_sig
/* 00372C 9FC0372C AFA20014 */   sw         $v0, 0x14($sp)
/* 003730 9FC03730 8FA20018 */  lw          $v0, 0x18($sp)
/* 003734 9FC03734 14400002 */  bnez        $v0, .L9FC03740
/* 003738 9FC03738 2402FFFF */   addiu      $v0, $zero, -1
/* 00373C 9FC0373C 00001021 */  addu        $v0, $zero, $zero
.L9FC03740:
/* 003740 9FC03740 8FBF0020 */  lw          $ra, 0x20($sp)
/* 003744 9FC03744 03E00008 */  jr          $ra
/* 003748 9FC03748 27BD0028 */   addiu      $sp, $sp, 0x28
