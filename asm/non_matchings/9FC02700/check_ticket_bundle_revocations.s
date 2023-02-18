## func_9FC00DCC
/* 002DD8 9FC02DD8 27BDFFD0 */  addiu       $sp, $sp, -0x30
/* 002DDC 9FC02DDC AFB30024 */  sw          $s3, 0x24($sp)
/* 002DE0 9FC02DE0 00809821 */  addu        $s3, $a0, $zero
/* 002DE4 9FC02DE4 AFB20020 */  sw          $s2, 0x20($sp)
/* 002DE8 9FC02DE8 00A09021 */  addu        $s2, $a1, $zero
/* 002DEC 9FC02DEC 02402021 */  addu        $a0, $s2, $zero
/* 002DF0 9FC02DF0 AFBF0028 */  sw          $ra, 0x28($sp)
/* 002DF4 9FC02DF4 AFB1001C */  sw          $s1, 0x1c($sp)
/* 002DF8 9FC02DF8 0FF00C45 */  jal         check_crlbundle_ranges
/* 002DFC 9FC02DFC AFB00018 */   sw         $s0, 0x18($sp)
/* 002E00 9FC02E00 54400003 */  bnel        $v0, $zero, .L9FC02E10
/* 002E04 9FC02E04 8E620000 */   lw         $v0, ($s3)
/* 002E08 9FC02E08 0BF00BD3 */  j           .L9FC02F4C
/* 002E0C 9FC02E0C 2402FFFF */   addiu      $v0, $zero, -1
.L9FC02E10:
/* 002E10 9FC02E10 AFB20010 */  sw          $s2, 0x10($sp)
/* 002E14 9FC02E14 8C4329B8 */  lw          $v1, 0x29b8($v0)
/* 002E18 9FC02E18 2644001C */  addiu       $a0, $s2, 0x1c
/* 002E1C 9FC02E1C AFA30014 */  sw          $v1, 0x14($sp)
/* 002E20 9FC02E20 8C452804 */  lw          $a1, 0x2804($v0)
/* 002E24 9FC02E24 8C472808 */  lw          $a3, 0x2808($v0)
/* 002E28 9FC02E28 0FF00B2D */  jal         verify_all_crlbundles
/* 002E2C 9FC02E2C 26460038 */   addiu      $a2, $s2, 0x38
/* 002E30 9FC02E30 10400005 */  beqz        $v0, .L9FC02E48
/* 002E34 9FC02E34 8FBF0028 */   lw         $ra, 0x28($sp)
/* 002E38 9FC02E38 0BF00BD5 */  j           .L9FC02F54
/* 002E3C 9FC02E3C 8FB30024 */   lw         $s3, 0x24($sp)
.L9FC02E40:
/* 002E40 9FC02E40 0BF00BD3 */  j           .L9FC02F4C
/* 002E44 9FC02E44 2402FFF7 */   addiu      $v0, $zero, -9
.L9FC02E48:
/* 002E48 9FC02E48 8E42001C */  lw          $v0, 0x1c($s2)
/* 002E4C 9FC02E4C 50400019 */  beql        $v0, $zero, .L9FC02EB4
/* 002E50 9FC02E50 8E420038 */   lw         $v0, 0x38($s2)
/* 002E54 9FC02E54 8C420254 */  lw          $v0, 0x254($v0)
/* 002E58 9FC02E58 10400015 */  beqz        $v0, .L9FC02EB0
/* 002E5C 9FC02E5C 00008021 */   addu       $s0, $zero, $zero
/* 002E60 9FC02E60 00108980 */  sll         $s1, $s0, 6
.L9FC02E64:
/* 002E64 9FC02E64 8E640008 */  lw          $a0, 8($s3)
/* 002E68 9FC02E68 8E450020 */  lw          $a1, 0x20($s2)
/* 002E6C 9FC02E6C 2484004C */  addiu       $a0, $a0, 0x4c
/* 002E70 9FC02E70 0FF00E7B */  jal         strstr
/* 002E74 9FC02E74 00B12821 */   addu       $a1, $a1, $s1
/* 002E78 9FC02E78 14400034 */  bnez        $v0, .L9FC02F4C
/* 002E7C 9FC02E7C 2402FFF7 */   addiu      $v0, $zero, -9
/* 002E80 9FC02E80 8E64001C */  lw          $a0, 0x1c($s3)
/* 002E84 9FC02E84 8E450020 */  lw          $a1, 0x20($s2)
/* 002E88 9FC02E88 2484004C */  addiu       $a0, $a0, 0x4c
/* 002E8C 9FC02E8C 0FF00E7B */  jal         strstr
/* 002E90 9FC02E90 00B12821 */   addu       $a1, $a1, $s1
/* 002E94 9FC02E94 1440FFEA */  bnez        $v0, .L9FC02E40
/* 002E98 9FC02E98 26100001 */   addiu      $s0, $s0, 1
/* 002E9C 9FC02E9C 8E42001C */  lw          $v0, 0x1c($s2)
/* 002EA0 9FC02EA0 8C420254 */  lw          $v0, 0x254($v0)
/* 002EA4 9FC02EA4 0202102B */  sltu        $v0, $s0, $v0
/* 002EA8 9FC02EA8 5440FFEE */  bnel        $v0, $zero, .L9FC02E64
/* 002EAC 9FC02EAC 00108980 */   sll        $s1, $s0, 6
.L9FC02EB0:
/* 002EB0 9FC02EB0 8E420038 */  lw          $v0, 0x38($s2)
.L9FC02EB4:
/* 002EB4 9FC02EB4 50400012 */  beql        $v0, $zero, .L9FC02F00
/* 002EB8 9FC02EB8 8E420000 */   lw         $v0, ($s2)
/* 002EBC 9FC02EBC 8C420254 */  lw          $v0, 0x254($v0)
/* 002EC0 9FC02EC0 1040000E */  beqz        $v0, .L9FC02EFC
/* 002EC4 9FC02EC4 00008021 */   addu       $s0, $zero, $zero
/* 002EC8 9FC02EC8 00102980 */  sll         $a1, $s0, 6
.L9FC02ECC:
/* 002ECC 9FC02ECC 8E640018 */  lw          $a0, 0x18($s3)
/* 002ED0 9FC02ED0 8E42003C */  lw          $v0, 0x3c($s2)
/* 002ED4 9FC02ED4 2484004C */  addiu       $a0, $a0, 0x4c
/* 002ED8 9FC02ED8 0FF00E7B */  jal         strstr
/* 002EDC 9FC02EDC 00452821 */   addu       $a1, $v0, $a1
/* 002EE0 9FC02EE0 1440FFD7 */  bnez        $v0, .L9FC02E40
/* 002EE4 9FC02EE4 26100001 */   addiu      $s0, $s0, 1
/* 002EE8 9FC02EE8 8E420038 */  lw          $v0, 0x38($s2)
/* 002EEC 9FC02EEC 8C420254 */  lw          $v0, 0x254($v0)
/* 002EF0 9FC02EF0 0202102B */  sltu        $v0, $s0, $v0
/* 002EF4 9FC02EF4 5440FFF5 */  bnel        $v0, $zero, .L9FC02ECC
/* 002EF8 9FC02EF8 00102980 */   sll        $a1, $s0, 6
.L9FC02EFC:
/* 002EFC 9FC02EFC 8E420000 */  lw          $v0, ($s2)
.L9FC02F00:
/* 002F00 9FC02F00 50400012 */  beql        $v0, $zero, .L9FC02F4C
/* 002F04 9FC02F04 00001021 */   addu       $v0, $zero, $zero
/* 002F08 9FC02F08 8C420254 */  lw          $v0, 0x254($v0)
/* 002F0C 9FC02F0C 1040000E */  beqz        $v0, .L9FC02F48
/* 002F10 9FC02F10 00008021 */   addu       $s0, $zero, $zero
/* 002F14 9FC02F14 00102980 */  sll         $a1, $s0, 6
.L9FC02F18:
/* 002F18 9FC02F18 8E640004 */  lw          $a0, 4($s3)
/* 002F1C 9FC02F1C 8E420004 */  lw          $v0, 4($s2)
/* 002F20 9FC02F20 2484004C */  addiu       $a0, $a0, 0x4c
/* 002F24 9FC02F24 0FF00E7B */  jal         strstr
/* 002F28 9FC02F28 00452821 */   addu       $a1, $v0, $a1
/* 002F2C 9FC02F2C 1440FFC4 */  bnez        $v0, .L9FC02E40
/* 002F30 9FC02F30 26100001 */   addiu      $s0, $s0, 1
/* 002F34 9FC02F34 8E420000 */  lw          $v0, ($s2)
/* 002F38 9FC02F38 8C420254 */  lw          $v0, 0x254($v0)
/* 002F3C 9FC02F3C 0202102B */  sltu        $v0, $s0, $v0
/* 002F40 9FC02F40 5440FFF5 */  bnel        $v0, $zero, .L9FC02F18
/* 002F44 9FC02F44 00102980 */   sll        $a1, $s0, 6
.L9FC02F48:
/* 002F48 9FC02F48 00001021 */  addu        $v0, $zero, $zero
.L9FC02F4C:
/* 002F4C 9FC02F4C 8FBF0028 */  lw          $ra, 0x28($sp)
/* 002F50 9FC02F50 8FB30024 */  lw          $s3, 0x24($sp)
.L9FC02F54:
/* 002F54 9FC02F54 8FB20020 */  lw          $s2, 0x20($sp)
/* 002F58 9FC02F58 8FB1001C */  lw          $s1, 0x1c($sp)
/* 002F5C 9FC02F5C 8FB00018 */  lw          $s0, 0x18($sp)
/* 002F60 9FC02F60 03E00008 */  jr          $ra
/* 002F64 9FC02F64 27BD0030 */   addiu      $sp, $sp, 0x30
