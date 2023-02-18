## aes_cbc_set_key_iv
/* 004A50 9FC04A50 27BDFE00 */  addiu       $sp, $sp, -0x200
/* 004A54 9FC04A54 00803821 */  addu        $a3, $a0, $zero
/* 004A58 9FC04A58 27A40010 */  addiu       $a0, $sp, 0x10
/* 004A5C 9FC04A5C AFB001F8 */  sw          $s0, 0x1f8($sp)
/* 004A60 9FC04A60 00A08021 */  addu        $s0, $a1, $zero
/* 004A64 9FC04A64 24050001 */  addiu       $a1, $zero, 1
/* 004A68 9FC04A68 AFBF01FC */  sw          $ra, 0x1fc($sp)
/* 004A6C 9FC04A6C 0FF01308 */  jal         aesMakeKey
/* 004A70 9FC04A70 24060080 */   addiu      $a2, $zero, 0x80
/* 004A74 9FC04A74 24030001 */  addiu       $v1, $zero, 1
/* 004A78 9FC04A78 14430006 */  bne         $v0, $v1, .L9FC04A94
/* 004A7C 9FC04A7C 2402FFFF */   addiu      $v0, $zero, -1
/* 004A80 9FC04A80 02002021 */  addu        $a0, $s0, $zero
/* 004A84 9FC04A84 27A50018 */  addiu       $a1, $sp, 0x18
/* 004A88 9FC04A88 0FF00EA1 */  jal         memcpy
/* 004A8C 9FC04A8C 240600B0 */   addiu      $a2, $zero, 0xb0
/* 004A90 9FC04A90 00001021 */  addu        $v0, $zero, $zero
.L9FC04A94:
/* 004A94 9FC04A94 8FBF01FC */  lw          $ra, 0x1fc($sp)
/* 004A98 9FC04A98 8FB001F8 */  lw          $s0, 0x1f8($sp)
/* 004A9C 9FC04A9C 03E00008 */  jr          $ra
/* 004AA0 9FC04AA0 27BD0200 */   addiu      $sp, $sp, 0x200
