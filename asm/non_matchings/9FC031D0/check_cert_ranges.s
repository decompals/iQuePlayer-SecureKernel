## check_ticket_bundle_ranges
## skVerifyHash
## check_crlbundle_ranges
/* 003E00 9FC03E00 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 003E04 9FC03E04 AFB00010 */  sw          $s0, 0x10($sp)
/* 003E08 9FC03E08 00808021 */  addu        $s0, $a0, $zero
/* 003E0C 9FC03E0C 24050004 */  addiu       $a1, $zero, 4
/* 003E10 9FC03E10 AFBF0014 */  sw          $ra, 0x14($sp)
/* 003E14 9FC03E14 0FF00F65 */  jal         check_untrusted_ptr_range
/* 003E18 9FC03E18 24060004 */   addiu      $a2, $zero, 4
/* 003E1C 9FC03E1C 10400027 */  beqz        $v0, .L9FC03EBC
/* 003E20 9FC03E20 2405008C */   addiu      $a1, $zero, 0x8c
/* 003E24 9FC03E24 8E040000 */  lw          $a0, ($s0)
/* 003E28 9FC03E28 0FF00F65 */  jal         check_untrusted_ptr_range
/* 003E2C 9FC03E2C 24060004 */   addiu      $a2, $zero, 4
/* 003E30 9FC03E30 10400022 */  beqz        $v0, .L9FC03EBC
/* 003E34 9FC03E34 24020001 */   addiu      $v0, $zero, 1
/* 003E38 9FC03E38 8E040000 */  lw          $a0, ($s0)
/* 003E3C 9FC03E3C 8C830000 */  lw          $v1, ($a0)
/* 003E40 9FC03E40 1462000F */  bne         $v1, $v0, .L9FC03E80
/* 003E44 9FC03E44 240502CC */   addiu      $a1, $zero, 0x2cc
/* 003E48 9FC03E48 24050390 */  addiu       $a1, $zero, 0x390
/* 003E4C 9FC03E4C 0FF00F65 */  jal         check_untrusted_ptr_range
/* 003E50 9FC03E50 24060004 */   addiu      $a2, $zero, 4
/* 003E54 9FC03E54 1040001A */  beqz        $v0, .L9FC03EC0
/* 003E58 9FC03E58 00001021 */   addu       $v0, $zero, $zero
/* 003E5C 9FC03E5C 8E040000 */  lw          $a0, ($s0)
/* 003E60 9FC03E60 3C059FC1 */  lui         $a1, %hi(aRoot_1)
/* 003E64 9FC03E64 24A5BE20 */  addiu       $a1, $a1, %lo(aRoot_1)
/* 003E68 9FC03E68 0FF00E5C */  jal         strcmp
/* 003E6C 9FC03E6C 2484000C */   addiu      $a0, $a0, 0xc
/* 003E70 9FC03E70 10400013 */  beqz        $v0, .L9FC03EC0
/* 003E74 9FC03E74 24020001 */   addiu      $v0, $zero, 1
/* 003E78 9FC03E78 0BF00FAA */  j           .L9FC03EA8
/* 003E7C 9FC03E7C 8E040004 */   lw         $a0, 4($s0)
.L9FC03E80:
/* 003E80 9FC03E80 0FF00F65 */  jal         check_untrusted_ptr_range
/* 003E84 9FC03E84 24060004 */   addiu      $a2, $zero, 4
/* 003E88 9FC03E88 1040000C */  beqz        $v0, .L9FC03EBC
/* 003E8C 9FC03E8C 24050390 */   addiu      $a1, $zero, 0x390
/* 003E90 9FC03E90 8E040004 */  lw          $a0, 4($s0)
/* 003E94 9FC03E94 0FF00F65 */  jal         check_untrusted_ptr_range
/* 003E98 9FC03E98 24060004 */   addiu      $a2, $zero, 4
/* 003E9C 9FC03E9C 10400008 */  beqz        $v0, .L9FC03EC0
/* 003EA0 9FC03EA0 00001021 */   addu       $v0, $zero, $zero
/* 003EA4 9FC03EA4 8E040008 */  lw          $a0, 8($s0)
.L9FC03EA8:
/* 003EA8 9FC03EA8 24050390 */  addiu       $a1, $zero, 0x390
/* 003EAC 9FC03EAC 0FF00F65 */  jal         check_untrusted_ptr_range
/* 003EB0 9FC03EB0 24060004 */   addiu      $a2, $zero, 4
/* 003EB4 9FC03EB4 14400002 */  bnez        $v0, .L9FC03EC0
/* 003EB8 9FC03EB8 24020001 */   addiu      $v0, $zero, 1
.L9FC03EBC:
/* 003EBC 9FC03EBC 00001021 */  addu        $v0, $zero, $zero
.L9FC03EC0:
/* 003EC0 9FC03EC0 8FBF0014 */  lw          $ra, 0x14($sp)
/* 003EC4 9FC03EC4 8FB00010 */  lw          $s0, 0x10($sp)
/* 003EC8 9FC03EC8 03E00008 */  jr          $ra
/* 003ECC 9FC03ECC 27BD0018 */   addiu      $sp, $sp, 0x18
