## recrypt_list_get_key_for_cid
/* 00445C 9FC0445C 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 004460 9FC04460 AFBF0010 */  sw          $ra, 0x10($sp)
/* 004464 9FC04464 0FF01106 */  jal         recrypt_list_sign
/* 004468 9FC04468 AC800040 */   sw         $zero, 0x40($a0)
/* 00446C 9FC0446C 8FBF0010 */  lw          $ra, 0x10($sp)
/* 004470 9FC04470 00001021 */  addu        $v0, $zero, $zero
/* 004474 9FC04474 03E00008 */  jr          $ra
/* 004478 9FC04478 27BD0018 */   addiu      $sp, $sp, 0x18
