## skVerifyHash
## check_ticket_bundle_revocations
## check_certs_against_revocation_list
/* 002CB4 9FC02CB4 27BDFFD0 */  addiu       $sp, $sp, -0x30
/* 002CB8 9FC02CB8 AFB20018 */  sw          $s2, 0x18($sp)
/* 002CBC 9FC02CBC 00809021 */  addu        $s2, $a0, $zero
/* 002CC0 9FC02CC0 00A01021 */  addu        $v0, $a1, $zero
/* 002CC4 9FC02CC4 AFB50024 */  sw          $s5, 0x24($sp)
/* 002CC8 9FC02CC8 8FB50040 */  lw          $s5, 0x40($sp)
/* 002CCC 9FC02CCC 24050002 */  addiu       $a1, $zero, 2
/* 002CD0 9FC02CD0 AFB40020 */  sw          $s4, 0x20($sp)
/* 002CD4 9FC02CD4 00C0A021 */  addu        $s4, $a2, $zero
/* 002CD8 9FC02CD8 AFB3001C */  sw          $s3, 0x1c($sp)
/* 002CDC 9FC02CDC 8FB30044 */  lw          $s3, 0x44($sp)
/* 002CE0 9FC02CE0 00403021 */  addu        $a2, $v0, $zero
/* 002CE4 9FC02CE4 AFB60028 */  sw          $s6, 0x28($sp)
/* 002CE8 9FC02CE8 00E0B021 */  addu        $s6, $a3, $zero
/* 002CEC 9FC02CEC AFBF002C */  sw          $ra, 0x2c($sp)
/* 002CF0 9FC02CF0 AFB10014 */  sw          $s1, 0x14($sp)
/* 002CF4 9FC02CF4 0FF00ACE */  jal         verify_crlbundle
/* 002CF8 9FC02CF8 AFB00010 */   sw         $s0, 0x10($sp)
/* 002CFC 9FC02CFC 1440002C */  bnez        $v0, .L9FC02DB0
/* 002D00 9FC02D00 2402FFFD */   addiu      $v0, $zero, -3
/* 002D04 9FC02D04 8E420000 */  lw          $v0, ($s2)
/* 002D08 9FC02D08 1040001C */  beqz        $v0, .L9FC02D7C
/* 002D0C 9FC02D0C 02802021 */   addu       $a0, $s4, $zero
/* 002D10 9FC02D10 8C420254 */  lw          $v0, 0x254($v0)
/* 002D14 9FC02D14 10400019 */  beqz        $v0, .L9FC02D7C
/* 002D18 9FC02D18 00008821 */   addu       $s1, $zero, $zero
/* 002D1C 9FC02D1C 00118180 */  sll         $s0, $s1, 6
.L9FC02D20:
/* 002D20 9FC02D20 8E840008 */  lw          $a0, 8($s4)
/* 002D24 9FC02D24 8E450004 */  lw          $a1, 4($s2)
/* 002D28 9FC02D28 2484004C */  addiu       $a0, $a0, 0x4c
/* 002D2C 9FC02D2C 0FF00E7B */  jal         strstr
/* 002D30 9FC02D30 00B02821 */   addu       $a1, $a1, $s0
/* 002D34 9FC02D34 1440001E */  bnez        $v0, .L9FC02DB0
/* 002D38 9FC02D38 2402FFF7 */   addiu      $v0, $zero, -9
/* 002D3C 9FC02D3C 06620009 */  bltzl       $s3, .L9FC02D64
/* 002D40 9FC02D40 8E420000 */   lw         $v0, ($s2)
/* 002D44 9FC02D44 8EA40008 */  lw          $a0, 8($s5)
/* 002D48 9FC02D48 8E450004 */  lw          $a1, 4($s2)
/* 002D4C 9FC02D4C 2484004C */  addiu       $a0, $a0, 0x4c
/* 002D50 9FC02D50 0FF00E7B */  jal         strstr
/* 002D54 9FC02D54 00B02821 */   addu       $a1, $a1, $s0
/* 002D58 9FC02D58 14400015 */  bnez        $v0, .L9FC02DB0
/* 002D5C 9FC02D5C 2402FFF7 */   addiu      $v0, $zero, -9
/* 002D60 9FC02D60 8E420000 */  lw          $v0, ($s2)
.L9FC02D64:
/* 002D64 9FC02D64 8C420254 */  lw          $v0, 0x254($v0)
/* 002D68 9FC02D68 26310001 */  addiu       $s1, $s1, 1
/* 002D6C 9FC02D6C 0222102B */  sltu        $v0, $s1, $v0
/* 002D70 9FC02D70 5440FFEB */  bnel        $v0, $zero, .L9FC02D20
/* 002D74 9FC02D74 00118180 */   sll        $s0, $s1, 6
/* 002D78 9FC02D78 02802021 */  addu        $a0, $s4, $zero
.L9FC02D7C:
/* 002D7C 9FC02D7C 24050001 */  addiu       $a1, $zero, 1
/* 002D80 9FC02D80 0FF00ACE */  jal         verify_crlbundle
/* 002D84 9FC02D84 02C03021 */   addu       $a2, $s6, $zero
/* 002D88 9FC02D88 14400009 */  bnez        $v0, .L9FC02DB0
/* 002D8C 9FC02D8C 2402FFFC */   addiu      $v0, $zero, -4
/* 002D90 9FC02D90 06600006 */  bltz        $s3, .L9FC02DAC
/* 002D94 9FC02D94 02A02021 */   addu       $a0, $s5, $zero
/* 002D98 9FC02D98 00002821 */  addu        $a1, $zero, $zero
/* 002D9C 9FC02D9C 0FF00ACE */  jal         verify_crlbundle
/* 002DA0 9FC02DA0 02603021 */   addu       $a2, $s3, $zero
/* 002DA4 9FC02DA4 14400002 */  bnez        $v0, .L9FC02DB0
/* 002DA8 9FC02DA8 2402FFFE */   addiu      $v0, $zero, -2
.L9FC02DAC:
/* 002DAC 9FC02DAC 00001021 */  addu        $v0, $zero, $zero
.L9FC02DB0:
/* 002DB0 9FC02DB0 8FBF002C */  lw          $ra, 0x2c($sp)
/* 002DB4 9FC02DB4 8FB60028 */  lw          $s6, 0x28($sp)
/* 002DB8 9FC02DB8 8FB50024 */  lw          $s5, 0x24($sp)
/* 002DBC 9FC02DBC 8FB40020 */  lw          $s4, 0x20($sp)
/* 002DC0 9FC02DC0 8FB3001C */  lw          $s3, 0x1c($sp)
/* 002DC4 9FC02DC4 8FB20018 */  lw          $s2, 0x18($sp)
/* 002DC8 9FC02DC8 8FB10014 */  lw          $s1, 0x14($sp)
/* 002DCC 9FC02DCC 8FB00010 */  lw          $s0, 0x10($sp)
/* 002DD0 9FC02DD0 03E00008 */  jr          $ra
/* 002DD4 9FC02DD4 27BD0030 */   addiu      $sp, $sp, 0x30
