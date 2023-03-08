/* 000E90 9FC00E90 27BDFFD0 */  addiu       $sp, $sp, -0x30
/* 000E94 9FC00E94 AFB20028 */  sw          $s2, 0x28($sp)
/* 000E98 9FC00E98 00809021 */  addu        $s2, $a0, $zero
/* 000E9C 9FC00E9C AFB10024 */  sw          $s1, 0x24($sp)
/* 000EA0 9FC00EA0 00C08821 */  addu        $s1, $a2, $zero
/* 000EA4 9FC00EA4 00003821 */  addu        $a3, $zero, $zero
/* 000EA8 9FC00EA8 AFBF002C */  sw          $ra, 0x2c($sp)
/* 000EAC 9FC00EAC 0FF00373 */  jal         func_9FC00DCC
/* 000EB0 9FC00EB0 AFB00020 */   sw         $s0, 0x20($sp)
/* 000EB4 9FC00EB4 00401821 */  addu        $v1, $v0, $zero
/* 000EB8 9FC00EB8 14600022 */  bnez        $v1, .L9FC00F44
/* 000EBC 9FC00EBC 8FBF002C */   lw         $ra, 0x2c($sp)
/* 000EC0 9FC00EC0 3C109FC1 */  lui         $s0, %hi(contentMetaDataHead + 0x48)
/* 000EC4 9FC00EC4 2610ED7C */  addiu       $s0, $s0, %lo(contentMetaDataHead + 0x48)
/* 000EC8 9FC00EC8 8E430000 */  lw          $v1, ($s2)
/* 000ECC 9FC00ECC 8E020000 */  lw          $v0, ($s0)
/* 000ED0 9FC00ED0 30420002 */  andi        $v0, $v0, 2
/* 000ED4 9FC00ED4 1040000E */  beqz        $v0, .L9FC00F10
/* 000ED8 9FC00ED8 247229AC */   addiu      $s2, $v1, 0x29ac
/* 000EDC 9FC00EDC 16200003 */  bnez        $s1, .L9FC00EEC
/* 000EE0 9FC00EE0 02202021 */   addu       $a0, $s1, $zero
/* 000EE4 9FC00EE4 0BF003D1 */  j           .L9FC00F44
/* 000EE8 9FC00EE8 2402FFFF */   addiu      $v0, $zero, -1
.L9FC00EEC:
/* 000EEC 9FC00EEC 8E060050 */  lw          $a2, 0x50($s0)
/* 000EF0 9FC00EF0 0FF011AE */  jal         recrypt_list_get_key_for_cid
/* 000EF4 9FC00EF4 27A50010 */   addiu      $a1, $sp, 0x10
/* 000EF8 9FC00EF8 00401821 */  addu        $v1, $v0, $zero
/* 000EFC 9FC00EFC 24020002 */  addiu       $v0, $zero, 2
/* 000F00 9FC00F00 1462000F */  bne         $v1, $v0, .L9FC00F40
/* 000F04 9FC00F04 00601021 */   addu       $v0, $v1, $zero
/* 000F08 9FC00F08 0BF003C5 */  j           .L9FC00F14
/* 000F0C 9FC00F0C 27A40010 */   addiu      $a0, $sp, 0x10
.L9FC00F10:
/* 000F10 9FC00F10 26040054 */  addiu       $a0, $s0, 0x54
.L9FC00F14:
/* 000F14 9FC00F14 0FF00DFF */  jal         aes_cbc_set_key_iv
/* 000F18 9FC00F18 2605FFF0 */   addiu      $a1, $s0, -0x10
/* 000F1C 9FC00F1C 3C049FC1 */  lui         $a0, %hi(ticketHead)
/* 000F20 9FC00F20 2484EEE0 */  addiu       $a0, $a0, %lo(ticketHead)
/* 000F24 9FC00F24 02402821 */  addu        $a1, $s2, $zero
/* 000F28 9FC00F28 0FF00EA1 */  jal         memcpy
/* 000F2C 9FC00F2C 240601A0 */   addiu      $a2, $zero, 0x1a0
/* 000F30 9FC00F30 3C02A460 */  lui         $v0, (0xA4600050 >> 16)
/* 000F34 9FC00F34 34420050 */  ori         $v0, $v0, (0xA4600050 & 0xFFFF)
/* 000F38 9FC00F38 AC400000 */  sw          $zero, ($v0)
/* 000F3C 9FC00F3C 00001021 */  addu        $v0, $zero, $zero
.L9FC00F40:
/* 000F40 9FC00F40 8FBF002C */  lw          $ra, 0x2c($sp)
.L9FC00F44:
/* 000F44 9FC00F44 8FB20028 */  lw          $s2, 0x28($sp)
/* 000F48 9FC00F48 8FB10024 */  lw          $s1, 0x24($sp)
/* 000F4C 9FC00F4C 8FB00020 */  lw          $s0, 0x20($sp)
/* 000F50 9FC00F50 03E00008 */  jr          $ra
/* 000F54 9FC00F54 27BD0030 */   addiu      $sp, $sp, 0x30
