## skRecryptBegin
## skRecryptEnd
/* 004640 9FC04640 27BDFFC0 */  addiu       $sp, $sp, -0x40
/* 004644 9FC04644 AFB00030 */  sw          $s0, 0x30($sp)
/* 004648 9FC04648 00808021 */  addu        $s0, $a0, $zero
/* 00464C 9FC0464C AFB10034 */  sw          $s1, 0x34($sp)
/* 004650 9FC04650 00A08821 */  addu        $s1, $a1, $zero
/* 004654 9FC04654 AFB20038 */  sw          $s2, 0x38($sp)
/* 004658 9FC04658 AFBF003C */  sw          $ra, 0x3c($sp)
/* 00465C 9FC0465C 0FF01182 */  jal         recrypt_list_verify_size_and_sig
/* 004660 9FC04660 00C09021 */   addu       $s2, $a2, $zero
/* 004664 9FC04664 1440000E */  bnez        $v0, .L9FC046A0
/* 004668 9FC04668 2402FFFF */   addiu      $v0, $zero, -1
/* 00466C 9FC0466C 02002021 */  addu        $a0, $s0, $zero
/* 004670 9FC04670 02202821 */  addu        $a1, $s1, $zero
/* 004674 9FC04674 0FF01161 */  jal         recrypt_list_get_entry_for_cid
/* 004678 9FC04678 27A60010 */   addiu      $a2, $sp, 0x10
/* 00467C 9FC0467C 04400008 */  bltz        $v0, .L9FC046A0
/* 004680 9FC04680 02002821 */   addu       $a1, $s0, $zero
/* 004684 9FC04684 AFB20024 */  sw          $s2, 0x24($sp)
/* 004688 9FC04688 27A40010 */  addiu       $a0, $sp, 0x10
/* 00468C 9FC0468C 0FF0113A */  jal         recrypt_list_add_entry
/* 004690 9FC04690 00403021 */   addu       $a2, $v0, $zero
/* 004694 9FC04694 0FF01106 */  jal         recrypt_list_sign
/* 004698 9FC04698 02002021 */   addu       $a0, $s0, $zero
/* 00469C 9FC0469C 00001021 */  addu        $v0, $zero, $zero
.L9FC046A0:
/* 0046A0 9FC046A0 8FBF003C */  lw          $ra, 0x3c($sp)
/* 0046A4 9FC046A4 8FB20038 */  lw          $s2, 0x38($sp)
/* 0046A8 9FC046A8 8FB10034 */  lw          $s1, 0x34($sp)
/* 0046AC 9FC046AC 8FB00030 */  lw          $s0, 0x30($sp)
/* 0046B0 9FC046B0 03E00008 */  jr          $ra
/* 0046B4 9FC046B4 27BD0040 */   addiu      $sp, $sp, 0x40
