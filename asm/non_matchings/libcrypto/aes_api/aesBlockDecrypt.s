## aes_SwDecrypt
/* 004EC0 9FC04EC0 27BDFFC0 */  addiu       $sp, $sp, -0x40
/* 004EC4 9FC04EC4 AFB3002C */  sw          $s3, 0x2c($sp)
/* 004EC8 9FC04EC8 8FB30050 */  lw          $s3, 0x50($sp)
/* 004ECC 9FC04ECC AFB10024 */  sw          $s1, 0x24($sp)
/* 004ED0 9FC04ED0 00C08821 */  addu        $s1, $a2, $zero
/* 004ED4 9FC04ED4 AFB40030 */  sw          $s4, 0x30($sp)
/* 004ED8 9FC04ED8 00A0A021 */  addu        $s4, $a1, $zero
/* 004EDC 9FC04EDC AFBF0038 */  sw          $ra, 0x38($sp)
/* 004EE0 9FC04EE0 AFB50034 */  sw          $s5, 0x34($sp)
/* 004EE4 9FC04EE4 AFB20028 */  sw          $s2, 0x28($sp)
/* 004EE8 9FC04EE8 1080004E */  beqz        $a0, .L9FC05024
/* 004EEC 9FC04EEC AFB00020 */   sw         $s0, 0x20($sp)
/* 004EF0 9FC04EF0 1280004C */  beqz        $s4, .L9FC05024
/* 004EF4 9FC04EF4 24020001 */   addiu      $v0, $zero, 1
/* 004EF8 9FC04EF8 8C830000 */  lw          $v1, ($a0)
/* 004EFC 9FC04EFC 14620004 */  bne         $v1, $v0, .L9FC04F10
/* 004F00 9FC04F00 24020002 */   addiu      $v0, $zero, 2
/* 004F04 9FC04F04 92820000 */  lbu         $v0, ($s4)
/* 004F08 9FC04F08 10400046 */  beqz        $v0, .L9FC05024
/* 004F0C 9FC04F0C 24020002 */   addiu      $v0, $zero, 2
.L9FC04F10:
/* 004F10 9FC04F10 14620004 */  bne         $v1, $v0, .L9FC04F24
/* 004F14 9FC04F14 00000000 */   nop
/* 004F18 9FC04F18 92820000 */  lbu         $v0, ($s4)
/* 004F1C 9FC04F1C 10400044 */  beqz        $v0, .L9FC05030
/* 004F20 9FC04F20 2402FFFB */   addiu      $v0, $zero, -5
.L9FC04F24:
/* 004F24 9FC04F24 12200042 */  beqz        $s1, .L9FC05030
/* 004F28 9FC04F28 00001021 */   addu       $v0, $zero, $zero
/* 004F2C 9FC04F2C 1CE00003 */  bgtz        $a3, .L9FC04F3C
/* 004F30 9FC04F30 24020001 */   addiu      $v0, $zero, 1
/* 004F34 9FC04F34 0BF0140C */  j           .L9FC05030
/* 004F38 9FC04F38 00001021 */   addu       $v0, $zero, $zero
.L9FC04F3C:
/* 004F3C 9FC04F3C 10620006 */  beq         $v1, $v0, .L9FC04F58
/* 004F40 9FC04F40 0007A9C3 */   sra        $s5, $a3, 7
/* 004F44 9FC04F44 24020002 */  addiu       $v0, $zero, 2
/* 004F48 9FC04F48 10620010 */  beq         $v1, $v0, .L9FC04F8C
/* 004F4C 9FC04F4C 2402FFFB */   addiu      $v0, $zero, -5
/* 004F50 9FC04F50 0BF0140D */  j           .L9FC05034
/* 004F54 9FC04F54 8FBF0038 */   lw         $ra, 0x38($sp)
.L9FC04F58:
/* 004F58 9FC04F58 1AA00034 */  blez        $s5, .L9FC0502C
/* 004F5C 9FC04F5C 02A09021 */   addu       $s2, $s5, $zero
.L9FC04F60:
/* 004F60 9FC04F60 26840008 */  addiu       $a0, $s4, 8
/* 004F64 9FC04F64 8E850004 */  lw          $a1, 4($s4)
/* 004F68 9FC04F68 02203021 */  addu        $a2, $s1, $zero
/* 004F6C 9FC04F6C 02603821 */  addu        $a3, $s3, $zero
/* 004F70 9FC04F70 0FF017C8 */  jal         rijndaelDecrypt
/* 004F74 9FC04F74 2652FFFF */   addiu      $s2, $s2, -1
/* 004F78 9FC04F78 26310010 */  addiu       $s1, $s1, 0x10
/* 004F7C 9FC04F7C 1E40FFF8 */  bgtz        $s2, .L9FC04F60
/* 004F80 9FC04F80 26730010 */   addiu      $s3, $s3, 0x10
/* 004F84 9FC04F84 0BF0140C */  j           .L9FC05030
/* 004F88 9FC04F88 001511C0 */   sll        $v0, $s5, 7
.L9FC04F8C:
/* 004F8C 9FC04F8C 02A09021 */  addu        $s2, $s5, $zero
/* 004F90 9FC04F90 1AA00026 */  blez        $s5, .L9FC0502C
/* 004F94 9FC04F94 24900004 */   addiu      $s0, $a0, 4
.L9FC04F98:
/* 004F98 9FC04F98 26840008 */  addiu       $a0, $s4, 8
/* 004F9C 9FC04F9C 02203021 */  addu        $a2, $s1, $zero
/* 004FA0 9FC04FA0 27A70010 */  addiu       $a3, $sp, 0x10
/* 004FA4 9FC04FA4 8E850004 */  lw          $a1, 4($s4)
/* 004FA8 9FC04FA8 0FF017C8 */  jal         rijndaelDecrypt
/* 004FAC 9FC04FAC 2652FFFF */   addiu      $s2, $s2, -1
/* 004FB0 9FC04FB0 02002021 */  addu        $a0, $s0, $zero
/* 004FB4 9FC04FB4 02202821 */  addu        $a1, $s1, $zero
/* 004FB8 9FC04FB8 24060010 */  addiu       $a2, $zero, 0x10
/* 004FBC 9FC04FBC 8FA20010 */  lw          $v0, 0x10($sp)
/* 004FC0 9FC04FC0 8E070000 */  lw          $a3, ($s0)
/* 004FC4 9FC04FC4 8FA30014 */  lw          $v1, 0x14($sp)
/* 004FC8 9FC04FC8 8E080004 */  lw          $t0, 4($s0)
/* 004FCC 9FC04FCC 00471026 */  xor         $v0, $v0, $a3
/* 004FD0 9FC04FD0 AFA20010 */  sw          $v0, 0x10($sp)
/* 004FD4 9FC04FD4 8FA20018 */  lw          $v0, 0x18($sp)
/* 004FD8 9FC04FD8 00681826 */  xor         $v1, $v1, $t0
/* 004FDC 9FC04FDC AFA30014 */  sw          $v1, 0x14($sp)
/* 004FE0 9FC04FE0 8E070008 */  lw          $a3, 8($s0)
/* 004FE4 9FC04FE4 8FA3001C */  lw          $v1, 0x1c($sp)
/* 004FE8 9FC04FE8 8E08000C */  lw          $t0, 0xc($s0)
/* 004FEC 9FC04FEC 00471026 */  xor         $v0, $v0, $a3
/* 004FF0 9FC04FF0 00681826 */  xor         $v1, $v1, $t0
/* 004FF4 9FC04FF4 AFA20018 */  sw          $v0, 0x18($sp)
/* 004FF8 9FC04FF8 0FF00EA1 */  jal         memcpy
/* 004FFC 9FC04FFC AFA3001C */   sw         $v1, 0x1c($sp)
/* 005000 9FC05000 02602021 */  addu        $a0, $s3, $zero
/* 005004 9FC05004 27A50010 */  addiu       $a1, $sp, 0x10
/* 005008 9FC05008 0FF00EA1 */  jal         memcpy
/* 00500C 9FC0500C 24060010 */   addiu      $a2, $zero, 0x10
/* 005010 9FC05010 26310010 */  addiu       $s1, $s1, 0x10
/* 005014 9FC05014 1E40FFE0 */  bgtz        $s2, .L9FC04F98
/* 005018 9FC05018 26730010 */   addiu      $s3, $s3, 0x10
/* 00501C 9FC0501C 0BF0140C */  j           .L9FC05030
/* 005020 9FC05020 001511C0 */   sll        $v0, $s5, 7
.L9FC05024:
/* 005024 9FC05024 0BF0140C */  j           .L9FC05030
/* 005028 9FC05028 2402FFFB */   addiu      $v0, $zero, -5
.L9FC0502C:
/* 00502C 9FC0502C 001511C0 */  sll         $v0, $s5, 7
.L9FC05030:
/* 005030 9FC05030 8FBF0038 */  lw          $ra, 0x38($sp)
.L9FC05034:
/* 005034 9FC05034 8FB50034 */  lw          $s5, 0x34($sp)
/* 005038 9FC05038 8FB40030 */  lw          $s4, 0x30($sp)
/* 00503C 9FC0503C 8FB3002C */  lw          $s3, 0x2c($sp)
/* 005040 9FC05040 8FB20028 */  lw          $s2, 0x28($sp)
/* 005044 9FC05044 8FB10024 */  lw          $s1, 0x24($sp)
/* 005048 9FC05048 8FB00020 */  lw          $s0, 0x20($sp)
/* 00504C 9FC0504C 03E00008 */  jr          $ra
/* 005050 9FC05050 27BD0040 */   addiu      $sp, $sp, 0x40
