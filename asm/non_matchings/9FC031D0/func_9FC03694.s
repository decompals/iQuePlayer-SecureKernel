## skSignHash
## recrypt_list_sign
/* 003694 9FC03694 27BDFFB0 */  addiu       $sp, $sp, -0x50
/* 003698 9FC03698 AFB00038 */  sw          $s0, 0x38($sp)
/* 00369C 9FC0369C 8FB00060 */  lw          $s0, 0x60($sp)
/* 0036A0 9FC036A0 AFB40048 */  sw          $s4, 0x48($sp)
/* 0036A4 9FC036A4 0080A021 */  addu        $s4, $a0, $zero
/* 0036A8 9FC036A8 AFB30044 */  sw          $s3, 0x44($sp)
/* 0036AC 9FC036AC 00A09821 */  addu        $s3, $a1, $zero
/* 0036B0 9FC036B0 AFB20040 */  sw          $s2, 0x40($sp)
/* 0036B4 9FC036B4 00C09021 */  addu        $s2, $a2, $zero
/* 0036B8 9FC036B8 AFB1003C */  sw          $s1, 0x3c($sp)
/* 0036BC 9FC036BC 00E08821 */  addu        $s1, $a3, $zero
/* 0036C0 9FC036C0 AFBF004C */  sw          $ra, 0x4c($sp)
/* 0036C4 9FC036C4 27A40018 */  addiu       $a0, $sp, 0x18
.L9FC036C8:
/* 0036C8 9FC036C8 0FF00D7B */  jal         func_9FC035EC
/* 0036CC 9FC036CC 24050008 */   addiu      $a1, $zero, 8
/* 0036D0 9FC036D0 02802021 */  addu        $a0, $s4, $zero
/* 0036D4 9FC036D4 02602821 */  addu        $a1, $s3, $zero
/* 0036D8 9FC036D8 02403021 */  addu        $a2, $s2, $zero
/* 0036DC 9FC036DC 27A70018 */  addiu       $a3, $sp, 0x18
/* 0036E0 9FC036E0 AFB10010 */  sw          $s1, 0x10($sp)
/* 0036E4 9FC036E4 0FF02705 */  jal         bsl_compute_ecc_sig
/* 0036E8 9FC036E8 AFB00014 */   sw         $s0, 0x14($sp)
/* 0036EC 9FC036EC 1440FFF6 */  bnez        $v0, .L9FC036C8
/* 0036F0 9FC036F0 27A40018 */   addiu      $a0, $sp, 0x18
/* 0036F4 9FC036F4 8FBF004C */  lw          $ra, 0x4c($sp)
/* 0036F8 9FC036F8 8FB40048 */  lw          $s4, 0x48($sp)
/* 0036FC 9FC036FC 8FB30044 */  lw          $s3, 0x44($sp)
/* 003700 9FC03700 8FB20040 */  lw          $s2, 0x40($sp)
/* 003704 9FC03704 8FB1003C */  lw          $s1, 0x3c($sp)
/* 003708 9FC03708 8FB00038 */  lw          $s0, 0x38($sp)
/* 00370C 9FC0370C 03E00008 */  jr          $ra
/* 003710 9FC03710 27BD0050 */   addiu      $sp, $sp, 0x50
