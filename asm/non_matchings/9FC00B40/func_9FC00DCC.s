## skLaunchSetup
## skRecryptBegin
/* 000DCC 9FC00DCC 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 000DD0 9FC00DD0 AFB10014 */  sw          $s1, 0x14($sp)
/* 000DD4 9FC00DD4 00808821 */  addu        $s1, $a0, $zero
/* 000DD8 9FC00DD8 AFB20018 */  sw          $s2, 0x18($sp)
/* 000DDC 9FC00DDC 00A09021 */  addu        $s2, $a1, $zero
/* 000DE0 9FC00DE0 AFB3001C */  sw          $s3, 0x1c($sp)
/* 000DE4 9FC00DE4 00C09821 */  addu        $s3, $a2, $zero
/* 000DE8 9FC00DE8 AFB00010 */  sw          $s0, 0x10($sp)
/* 000DEC 9FC00DEC AFBF0020 */  sw          $ra, 0x20($sp)
/* 000DF0 9FC00DF0 0FF002D0 */  jal         check_ticket_bundle_ranges
/* 000DF4 9FC00DF4 00E08021 */   addu       $s0, $a3, $zero
/* 000DF8 9FC00DF8 1040001E */  beqz        $v0, .L9FC00E74
/* 000DFC 9FC00DFC 2402FFFF */   addiu      $v0, $zero, -1
/* 000E00 9FC00E00 12000008 */  beqz        $s0, .L9FC00E24
/* 000E04 9FC00E04 02402021 */   addu       $a0, $s2, $zero
/* 000E08 9FC00E08 8E220000 */  lw          $v0, ($s1)
/* 000E0C 9FC00E0C 8C422848 */  lw          $v0, 0x2848($v0)
/* 000E10 9FC00E10 30420002 */  andi        $v0, $v0, 2
/* 000E14 9FC00E14 14400004 */  bnez        $v0, .L9FC00E28
/* 000E18 9FC00E18 24050054 */   addiu      $a1, $zero, 0x54
/* 000E1C 9FC00E1C 0BF0039D */  j           .L9FC00E74
/* 000E20 9FC00E20 24020001 */   addiu      $v0, $zero, 1
.L9FC00E24:
/* 000E24 9FC00E24 24050054 */  addiu       $a1, $zero, 0x54
.L9FC00E28:
/* 000E28 9FC00E28 0FF00F65 */  jal         check_untrusted_ptr_range
/* 000E2C 9FC00E2C 24060004 */   addiu      $a2, $zero, 4
/* 000E30 9FC00E30 10400006 */  beqz        $v0, .L9FC00E4C
/* 000E34 9FC00E34 24054000 */   addiu      $a1, $zero, 0x4000
/* 000E38 9FC00E38 02602021 */  addu        $a0, $s3, $zero
/* 000E3C 9FC00E3C 0FF00F65 */  jal         check_untrusted_ptr_range
/* 000E40 9FC00E40 24060004 */   addiu      $a2, $zero, 4
/* 000E44 9FC00E44 54400003 */  bnel        $v0, $zero, .L9FC00E54
/* 000E48 9FC00E48 02202021 */   addu       $a0, $s1, $zero
.L9FC00E4C:
/* 000E4C 9FC00E4C 0BF0039D */  j           .L9FC00E74
/* 000E50 9FC00E50 2402FFFF */   addiu      $v0, $zero, -1
.L9FC00E54:
/* 000E54 9FC00E54 0FF00B76 */  jal         check_ticket_bundle_revocations
/* 000E58 9FC00E58 02402821 */   addu       $a1, $s2, $zero
/* 000E5C 9FC00E5C 14400006 */  bnez        $v0, .L9FC00E78
/* 000E60 9FC00E60 8FBF0020 */   lw         $ra, 0x20($sp)
/* 000E64 9FC00E64 0FF002EB */  jal         func_9FC00BAC
/* 000E68 9FC00E68 02202021 */   addu       $a0, $s1, $zero
/* 000E6C 9FC00E6C 50400001 */  beql        $v0, $zero, .L9FC00E74
/* 000E70 9FC00E70 00001021 */   addu       $v0, $zero, $zero
.L9FC00E74:
/* 000E74 9FC00E74 8FBF0020 */  lw          $ra, 0x20($sp)
.L9FC00E78:
/* 000E78 9FC00E78 8FB3001C */  lw          $s3, 0x1c($sp)
/* 000E7C 9FC00E7C 8FB20018 */  lw          $s2, 0x18($sp)
/* 000E80 9FC00E80 8FB10014 */  lw          $s1, 0x14($sp)
/* 000E84 9FC00E84 8FB00010 */  lw          $s0, 0x10($sp)
/* 000E88 9FC00E88 03E00008 */  jr          $ra
/* 000E8C 9FC00E8C 27BD0028 */   addiu      $sp, $sp, 0x28
