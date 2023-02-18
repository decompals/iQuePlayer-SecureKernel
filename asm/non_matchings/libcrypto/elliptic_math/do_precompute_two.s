## poly_elliptic_mul
/* 00BAA0 9FC0BAA0 27BDFFB8 */  addiu       $sp, $sp, -0x48
/* 00BAA4 9FC0BAA4 AFB3003C */  sw          $s3, 0x3c($sp)
/* 00BAA8 9FC0BAA8 00809821 */  addu        $s3, $a0, $zero
/* 00BAAC 9FC0BAAC AFB20038 */  sw          $s2, 0x38($sp)
/* 00BAB0 9FC0BAB0 00C09021 */  addu        $s2, $a2, $zero
/* 00BAB4 9FC0BAB4 AFB00030 */  sw          $s0, 0x30($sp)
/* 00BAB8 9FC0BAB8 00008021 */  addu        $s0, $zero, $zero
/* 00BABC 9FC0BABC AFB10034 */  sw          $s1, 0x34($sp)
/* 00BAC0 9FC0BAC0 00A08821 */  addu        $s1, $a1, $zero
/* 00BAC4 9FC0BAC4 AFBF0040 */  sw          $ra, 0x40($sp)
.L9FC0BAC8:
/* 00BAC8 9FC0BAC8 0FF01EE0 */  jal         null
/* 00BACC 9FC0BACC 27A40010 */   addiu      $a0, $sp, 0x10
/* 00BAD0 9FC0BAD0 27A40010 */  addiu       $a0, $sp, 0x10
/* 00BAD4 9FC0BAD4 32020002 */  andi        $v0, $s0, 2
/* 00BAD8 9FC0BAD8 00021043 */  sra         $v0, $v0, 1
/* 00BADC 9FC0BADC AFA2001C */  sw          $v0, 0x1c($sp)
/* 00BAE0 9FC0BAE0 32020001 */  andi        $v0, $s0, 1
/* 00BAE4 9FC0BAE4 02602821 */  addu        $a1, $s3, $zero
/* 00BAE8 9FC0BAE8 02203021 */  addu        $a2, $s1, $zero
/* 00BAEC 9FC0BAEC 02403821 */  addu        $a3, $s2, $zero
/* 00BAF0 9FC0BAF0 0FF02D9F */  jal         poly_elliptic_mul_slow
/* 00BAF4 9FC0BAF4 AFA2002C */   sw         $v0, 0x2c($sp)
/* 00BAF8 9FC0BAF8 26100001 */  addiu       $s0, $s0, 1
/* 00BAFC 9FC0BAFC 2A020004 */  slti        $v0, $s0, 4
/* 00BB00 9FC0BB00 1440FFF1 */  bnez        $v0, .L9FC0BAC8
/* 00BB04 9FC0BB04 26310040 */   addiu      $s1, $s1, 0x40
/* 00BB08 9FC0BB08 8FBF0040 */  lw          $ra, 0x40($sp)
/* 00BB0C 9FC0BB0C 8FB3003C */  lw          $s3, 0x3c($sp)
/* 00BB10 9FC0BB10 8FB20038 */  lw          $s2, 0x38($sp)
/* 00BB14 9FC0BB14 8FB10034 */  lw          $s1, 0x34($sp)
/* 00BB18 9FC0BB18 8FB00030 */  lw          $s0, 0x30($sp)
/* 00BB1C 9FC0BB1C 03E00008 */  jr          $ra
/* 00BB20 9FC0BB20 27BD0048 */   addiu      $sp, $sp, 0x48
