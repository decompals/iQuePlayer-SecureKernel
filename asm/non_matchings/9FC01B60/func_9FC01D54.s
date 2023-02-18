## func_9FC020C4
/* 001D54 9FC01D54 27BDFFA8 */  addiu       $sp, $sp, -0x58
/* 001D58 9FC01D58 AFB10044 */  sw          $s1, 0x44($sp)
/* 001D5C 9FC01D5C 3C119FC4 */  lui         $s1, 0x9fc4
/* 001D60 9FC01D60 AFB20048 */  sw          $s2, 0x48($sp)
/* 001D64 9FC01D64 00809021 */  addu        $s2, $a0, $zero
/* 001D68 9FC01D68 AFBF0050 */  sw          $ra, 0x50($sp)
/* 001D6C 9FC01D6C AFB3004C */  sw          $s3, 0x4c($sp)
/* 001D70 9FC01D70 AFB00040 */  sw          $s0, 0x40($sp)
/* 001D74 9FC01D74 8E440000 */  lw          $a0, ($s2)
/* 001D78 9FC01D78 0FF00709 */  jal         func_9FC01C24
/* 001D7C 9FC01D7C 24050004 */   addiu      $a1, $zero, 4
/* 001D80 9FC01D80 04400087 */  bltz        $v0, .L9FC01FA0
/* 001D84 9FC01D84 00409821 */   addu       $s3, $v0, $zero
/* 001D88 9FC01D88 00008021 */  addu        $s0, $zero, $zero
/* 001D8C 9FC01D8C 00132140 */  sll         $a0, $s3, 5
.L9FC01D90:
/* 001D90 9FC01D90 00902021 */  addu        $a0, $a0, $s0
/* 001D94 9FC01D94 0FF00E21 */  jal         card_read_block
/* 001D98 9FC01D98 00002821 */   addu       $a1, $zero, $zero
/* 001D9C 9FC01D9C 04400081 */  bltz        $v0, .L9FC01FA4
/* 001DA0 9FC01DA0 8FBF0050 */   lw         $ra, 0x50($sp)
/* 001DA4 9FC01DA4 16000008 */  bnez        $s0, .L9FC01DC8
/* 001DA8 9FC01DA8 00002021 */   addu       $a0, $zero, $zero
/* 001DAC 9FC01DAC 3C02A461 */  lui         $v0, (0xA4610400 >> 16)
/* 001DB0 9FC01DB0 34420400 */  ori         $v0, $v0, (0xA4610400 & 0xFFFF)
/* 001DB4 9FC01DB4 8C440000 */  lw          $a0, ($v0)
/* 001DB8 9FC01DB8 0FF006D8 */  jal         func_9FC01B60
/* 001DBC 9FC01DBC 00000000 */   nop
/* 001DC0 9FC01DC0 AE420000 */  sw          $v0, ($s2)
/* 001DC4 9FC01DC4 00002021 */  addu        $a0, $zero, $zero
.L9FC01DC8:
/* 001DC8 9FC01DC8 3C020461 */  lui         $v0, 0x461
/* 001DCC 9FC01DCC 00821021 */  addu        $v0, $a0, $v0
/* 001DD0 9FC01DD0 3C03A000 */  lui         $v1, 0xa000
/* 001DD4 9FC01DD4 00431025 */  or          $v0, $v0, $v1
/* 001DD8 9FC01DD8 8C420000 */  lw          $v0, ($v0)
/* 001DDC 9FC01DDC 24840004 */  addiu       $a0, $a0, 4
/* 001DE0 9FC01DE0 AE220000 */  sw          $v0, ($s1)
/* 001DE4 9FC01DE4 28820200 */  slti        $v0, $a0, 0x200
/* 001DE8 9FC01DE8 1440FFF7 */  bnez        $v0, .L9FC01DC8
/* 001DEC 9FC01DEC 26310004 */   addiu      $s1, $s1, 4
/* 001DF0 9FC01DF0 26100001 */  addiu       $s0, $s0, 1
/* 001DF4 9FC01DF4 2A020020 */  slti        $v0, $s0, 0x20
/* 001DF8 9FC01DF8 5440FFE5 */  bnel        $v0, $zero, .L9FC01D90
/* 001DFC 9FC01DFC 00132140 */   sll        $a0, $s3, 5
/* 001E00 9FC01E00 3C039FC4 */  lui         $v1, (0x9FC401AC >> 16)
/* 001E04 9FC01E04 346301AC */  ori         $v1, $v1, (0x9FC401AC & 0xFFFF)
/* 001E08 9FC01E08 3C029FC4 */  lui         $v0, (0x9FC4053C >> 16)
/* 001E0C 9FC01E0C 3442053C */  ori         $v0, $v0, (0x9FC4053C & 0xFFFF)
/* 001E10 9FC01E10 AFA30028 */  sw          $v1, 0x28($sp)
/* 001E14 9FC01E14 AFA2002C */  sw          $v0, 0x2c($sp)
/* 001E18 9FC01E18 AFA00030 */  sw          $zero, 0x30($sp)
/* 001E1C 9FC01E1C 3C039FC4 */  lui         $v1, %hi(D_9FC408E8)
/* 001E20 9FC01E20 8C6308E8 */  lw          $v1, %lo(D_9FC408E8)($v1)
/* 001E24 9FC01E24 10600004 */  beqz        $v1, .L9FC01E38
/* 001E28 9FC01E28 3C029FC4 */   lui        $v0, 0x9fc4
/* 001E2C 9FC01E2C 00621021 */  addu        $v0, $v1, $v0
/* 001E30 9FC01E30 3C019FC4 */  lui         $at, %hi(D_9FC408E8)
/* 001E34 9FC01E34 AC2208E8 */  sw          $v0, %lo(D_9FC408E8)($at)
.L9FC01E38:
/* 001E38 9FC01E38 3C079FC4 */  lui         $a3, 0x9fc4
/* 001E3C 9FC01E3C 3C029FC4 */  lui         $v0, %hi(D_9FC408EC)
/* 001E40 9FC01E40 8C4208EC */  lw          $v0, %lo(D_9FC408EC)($v0)
/* 001E44 9FC01E44 3C039FC4 */  lui         $v1, %hi(D_9FC408F0)
/* 001E48 9FC01E48 8C6308F0 */  lw          $v1, %lo(D_9FC408F0)($v1)
/* 001E4C 9FC01E4C 00471021 */  addu        $v0, $v0, $a3
/* 001E50 9FC01E50 3C019FC4 */  lui         $at, %hi(D_9FC408EC)
/* 001E54 9FC01E54 AC2208EC */  sw          $v0, %lo(D_9FC408EC)($at)
/* 001E58 9FC01E58 3C029FC4 */  lui         $v0, %hi(D_9FC408F4)
/* 001E5C 9FC01E5C 8C4208F4 */  lw          $v0, %lo(D_9FC408F4)($v0)
/* 001E60 9FC01E60 00671821 */  addu        $v1, $v1, $a3
/* 001E64 9FC01E64 3C019FC4 */  lui         $at, %hi(D_9FC408F0)
/* 001E68 9FC01E68 AC2308F0 */  sw          $v1, %lo(D_9FC408F0)($at)
/* 001E6C 9FC01E6C 3C039FC4 */  lui         $v1, %hi(D_9FC40904)
/* 001E70 9FC01E70 8C630904 */  lw          $v1, %lo(D_9FC40904)($v1)
/* 001E74 9FC01E74 00471021 */  addu        $v0, $v0, $a3
/* 001E78 9FC01E78 3C019FC4 */  lui         $at, %hi(D_9FC408F4)
/* 001E7C 9FC01E7C AC2208F4 */  sw          $v0, %lo(D_9FC408F4)($at)
/* 001E80 9FC01E80 10600003 */  beqz        $v1, .L9FC01E90
/* 001E84 9FC01E84 00671021 */   addu       $v0, $v1, $a3
/* 001E88 9FC01E88 3C019FC4 */  lui         $at, %hi(D_9FC40904)
/* 001E8C 9FC01E8C AC220904 */  sw          $v0, %lo(D_9FC40904)($at)
.L9FC01E90:
/* 001E90 9FC01E90 3C049FC4 */  lui         $a0, 0x9fc4
/* 001E94 9FC01E94 27B00028 */  addiu       $s0, $sp, 0x28
/* 001E98 9FC01E98 02002821 */  addu        $a1, $s0, $zero
/* 001E9C 9FC01E9C 3C069FC4 */  lui         $a2, (0x9FC408CC >> 16)
/* 001EA0 9FC01EA0 3C029FC4 */  lui         $v0, %hi(D_9FC40908)
/* 001EA4 9FC01EA4 8C420908 */  lw          $v0, %lo(D_9FC40908)($v0)
/* 001EA8 9FC01EA8 3C039FC4 */  lui         $v1, %hi(D_9FC40910)
/* 001EAC 9FC01EAC 8C630910 */  lw          $v1, %lo(D_9FC40910)($v1)
/* 001EB0 9FC01EB0 00471021 */  addu        $v0, $v0, $a3
/* 001EB4 9FC01EB4 3C019FC4 */  lui         $at, %hi(D_9FC40908)
/* 001EB8 9FC01EB8 AC220908 */  sw          $v0, %lo(D_9FC40908)($at)
/* 001EBC 9FC01EBC 3C029FC4 */  lui         $v0, %hi(D_9FC4090C)
/* 001EC0 9FC01EC0 8C42090C */  lw          $v0, %lo(D_9FC4090C)($v0)
/* 001EC4 9FC01EC4 00671821 */  addu        $v1, $v1, $a3
/* 001EC8 9FC01EC8 3C019FC4 */  lui         $at, %hi(D_9FC40910)
/* 001ECC 9FC01ECC AC230910 */  sw          $v1, %lo(D_9FC40910)($at)
/* 001ED0 9FC01ED0 00471021 */  addu        $v0, $v0, $a3
/* 001ED4 9FC01ED4 3C019FC4 */  lui         $at, %hi(D_9FC4090C)
/* 001ED8 9FC01ED8 AC22090C */  sw          $v0, %lo(D_9FC4090C)($at)
/* 001EDC 9FC01EDC 0FF00BDA */  jal         check_certs_against_revocation_list
/* 001EE0 9FC01EE0 34C608CC */   ori        $a2, $a2, (0x9FC408CC & 0xFFFF)
/* 001EE4 9FC01EE4 0440002D */  bltz        $v0, .L9FC01F9C
/* 001EE8 9FC01EE8 02002021 */   addu       $a0, $s0, $zero
/* 001EEC 9FC01EEC 0FF00A2F */  jal         verify_cert_chain
/* 001EF0 9FC01EF0 24050002 */   addiu      $a1, $zero, 2
/* 001EF4 9FC01EF4 04400029 */  bltz        $v0, .L9FC01F9C
/* 001EF8 9FC01EF8 3C039FC4 */   lui        $v1, (0x9FC400AC >> 16)
/* 001EFC 9FC01EFC 346300AC */  ori         $v1, $v1, (0x9FC400AC & 0xFFFF)
/* 001F00 9FC01F00 27A40038 */  addiu       $a0, $sp, 0x38
/* 001F04 9FC01F04 24050001 */  addiu       $a1, $zero, 1
/* 001F08 9FC01F08 8FA60028 */  lw          $a2, 0x28($sp)
/* 001F0C 9FC01F0C 3C029FC4 */  lui         $v0, 0x9fc4
/* 001F10 9FC01F10 AFA20038 */  sw          $v0, 0x38($sp)
/* 001F14 9FC01F14 240200AC */  addiu       $v0, $zero, 0xac
/* 001F18 9FC01F18 AFA2003C */  sw          $v0, 0x3c($sp)
/* 001F1C 9FC01F1C AFA00010 */  sw          $zero, 0x10($sp)
/* 001F20 9FC01F20 AFA30014 */  sw          $v1, 0x14($sp)
/* 001F24 9FC01F24 8CC7018C */  lw          $a3, 0x18c($a2)
/* 001F28 9FC01F28 0FF00CB3 */  jal         rsa_verify_signature
/* 001F2C 9FC01F2C 24C6008C */   addiu      $a2, $a2, 0x8c
/* 001F30 9FC01F30 0440001A */  bltz        $v0, .L9FC01F9C
/* 001F34 9FC01F34 3C059FC4 */   lui        $a1, (0x9FC40014 >> 16)
/* 001F38 9FC01F38 34A50014 */  ori         $a1, $a1, (0x9FC40014 & 0xFFFF)
/* 001F3C 9FC01F3C 3C069FC4 */  lui         $a2, (0x9FC4009C >> 16)
/* 001F40 9FC01F40 34C6009C */  ori         $a2, $a2, (0x9FC4009C & 0xFFFF)
/* 001F44 9FC01F44 24070010 */  addiu       $a3, $zero, 0x10
/* 001F48 9FC01F48 3C049FC1 */  lui         $a0, %hi(virage2_offset)
/* 001F4C 9FC01F4C 8C84EBC0 */  lw          $a0, %lo(virage2_offset)($a0)
/* 001F50 9FC01F50 27B00018 */  addiu       $s0, $sp, 0x18
/* 001F54 9FC01F54 AFB00010 */  sw          $s0, 0x10($sp)
/* 001F58 9FC01F58 0FF012D7 */  jal         aes_SwDecrypt
/* 001F5C 9FC01F5C 248400B8 */   addiu      $a0, $a0, 0xb8
/* 001F60 9FC01F60 0440000E */  bltz        $v0, .L9FC01F9C
/* 001F64 9FC01F64 3C049FC4 */   lui        $a0, (0x9FC4009C >> 16)
/* 001F68 9FC01F68 3484009C */  ori         $a0, $a0, (0x9FC4009C & 0xFFFF)
/* 001F6C 9FC01F6C 02002821 */  addu        $a1, $s0, $zero
/* 001F70 9FC01F70 0FF00EA1 */  jal         memcpy
/* 001F74 9FC01F74 24060010 */   addiu      $a2, $zero, 0x10
/* 001F78 9FC01F78 3C039FC4 */  lui         $v1, %hi(D_9FC40054)
/* 001F7C 9FC01F7C 8C630054 */  lw          $v1, %lo(D_9FC40054)($v1)
/* 001F80 9FC01F80 10600007 */  beqz        $v1, .L9FC01FA0
/* 001F84 9FC01F84 00001021 */   addu       $v0, $zero, $zero
/* 001F88 9FC01F88 3C029FC1 */  lui         $v0, %hi(virage2_offset)
/* 001F8C 9FC01F8C 8C42EBC0 */  lw          $v0, %lo(virage2_offset)($v0)
/* 001F90 9FC01F90 8C420094 */  lw          $v0, 0x94($v0)
/* 001F94 9FC01F94 10620002 */  beq         $v1, $v0, .L9FC01FA0
/* 001F98 9FC01F98 00001021 */   addu       $v0, $zero, $zero
.L9FC01F9C:
/* 001F9C 9FC01F9C 2402FFFF */  addiu       $v0, $zero, -1
.L9FC01FA0:
/* 001FA0 9FC01FA0 8FBF0050 */  lw          $ra, 0x50($sp)
.L9FC01FA4:
/* 001FA4 9FC01FA4 8FB3004C */  lw          $s3, 0x4c($sp)
/* 001FA8 9FC01FA8 8FB20048 */  lw          $s2, 0x48($sp)
/* 001FAC 9FC01FAC 8FB10044 */  lw          $s1, 0x44($sp)
/* 001FB0 9FC01FB0 8FB00040 */  lw          $s0, 0x40($sp)
/* 001FB4 9FC01FB4 03E00008 */  jr          $ra
/* 001FB8 9FC01FB8 27BD0058 */   addiu      $sp, $sp, 0x58
