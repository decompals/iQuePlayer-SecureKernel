## skVerifyHash
## verify_all_crlbundles
## check_ticket_bundle_revocations
## check_certs_against_revocation_list
/* 0039EC 9FC039EC 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 0039F0 9FC039F0 AFB10014 */  sw          $s1, 0x14($sp)
/* 0039F4 9FC039F4 00808821 */  addu        $s1, $a0, $zero
/* 0039F8 9FC039F8 AFB3001C */  sw          $s3, 0x1c($sp)
/* 0039FC 9FC039FC 00A09821 */  addu        $s3, $a1, $zero
/* 003A00 9FC03A00 02602021 */  addu        $a0, $s3, $zero
/* 003A04 9FC03A04 AFBF0020 */  sw          $ra, 0x20($sp)
/* 003A08 9FC03A08 AFB20018 */  sw          $s2, 0x18($sp)
/* 003A0C 9FC03A0C 0FF00E53 */  jal         strlen
/* 003A10 9FC03A10 AFB00010 */   sw         $s0, 0x10($sp)
/* 003A14 9FC03A14 00409021 */  addu        $s2, $v0, $zero
/* 003A18 9FC03A18 16400003 */  bnez        $s2, .L9FC03A28
/* 003A1C 9FC03A1C 00000000 */   nop
.L9FC03A20:
/* 003A20 9FC03A20 0BF00E9A */  j           .L9FC03A68
/* 003A24 9FC03A24 02201021 */   addu       $v0, $s1, $zero
.L9FC03A28:
/* 003A28 9FC03A28 0FF00E53 */  jal         strlen
/* 003A2C 9FC03A2C 02202021 */   addu       $a0, $s1, $zero
/* 003A30 9FC03A30 00408021 */  addu        $s0, $v0, $zero
/* 003A34 9FC03A34 0212102A */  slt         $v0, $s0, $s2
/* 003A38 9FC03A38 1440000B */  bnez        $v0, .L9FC03A68
/* 003A3C 9FC03A3C 00001021 */   addu       $v0, $zero, $zero
.L9FC03A40:
/* 003A40 9FC03A40 2610FFFF */  addiu       $s0, $s0, -1
/* 003A44 9FC03A44 02202021 */  addu        $a0, $s1, $zero
/* 003A48 9FC03A48 02602821 */  addu        $a1, $s3, $zero
/* 003A4C 9FC03A4C 0FF00EC7 */  jal         memcmp
/* 003A50 9FC03A50 02403021 */   addu       $a2, $s2, $zero
/* 003A54 9FC03A54 1040FFF2 */  beqz        $v0, .L9FC03A20
/* 003A58 9FC03A58 0212102A */   slt        $v0, $s0, $s2
/* 003A5C 9FC03A5C 1040FFF8 */  beqz        $v0, .L9FC03A40
/* 003A60 9FC03A60 26310001 */   addiu      $s1, $s1, 1
/* 003A64 9FC03A64 00001021 */  addu        $v0, $zero, $zero
.L9FC03A68:
/* 003A68 9FC03A68 8FBF0020 */  lw          $ra, 0x20($sp)
/* 003A6C 9FC03A6C 8FB3001C */  lw          $s3, 0x1c($sp)
/* 003A70 9FC03A70 8FB20018 */  lw          $s2, 0x18($sp)
/* 003A74 9FC03A74 8FB10014 */  lw          $s1, 0x14($sp)
/* 003A78 9FC03A78 8FB00010 */  lw          $s0, 0x10($sp)
/* 003A7C 9FC03A7C 03E00008 */  jr          $ra
/* 003A80 9FC03A80 27BD0028 */   addiu      $sp, $sp, 0x28
