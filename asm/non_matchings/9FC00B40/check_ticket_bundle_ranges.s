## func_9FC00DCC
/* 000B40 9FC00B40 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 000B44 9FC00B44 AFB00010 */  sw          $s0, 0x10($sp)
/* 000B48 9FC00B48 00808021 */  addu        $s0, $a0, $zero
/* 000B4C 9FC00B4C 2405002C */  addiu       $a1, $zero, 0x2c
/* 000B50 9FC00B50 AFBF0014 */  sw          $ra, 0x14($sp)
/* 000B54 9FC00B54 0FF00F65 */  jal         check_untrusted_ptr_range
/* 000B58 9FC00B58 24060004 */   addiu      $a2, $zero, 4
/* 000B5C 9FC00B5C 1040000E */  beqz        $v0, .L9FC00B98
/* 000B60 9FC00B60 24052B4C */   addiu      $a1, $zero, 0x2b4c
/* 000B64 9FC00B64 8E040000 */  lw          $a0, ($s0)
/* 000B68 9FC00B68 0FF00F65 */  jal         check_untrusted_ptr_range
/* 000B6C 9FC00B6C 24060004 */   addiu      $a2, $zero, 4
/* 000B70 9FC00B70 1040000A */  beqz        $v0, .L9FC00B9C
/* 000B74 9FC00B74 00001021 */   addu       $v0, $zero, $zero
/* 000B78 9FC00B78 0FF00F80 */  jal         check_cert_ranges
/* 000B7C 9FC00B7C 26040004 */   addiu      $a0, $s0, 4
/* 000B80 9FC00B80 10400006 */  beqz        $v0, .L9FC00B9C
/* 000B84 9FC00B84 00001021 */   addu       $v0, $zero, $zero
/* 000B88 9FC00B88 0FF00F80 */  jal         check_cert_ranges
/* 000B8C 9FC00B8C 26040018 */   addiu      $a0, $s0, 0x18
/* 000B90 9FC00B90 14400002 */  bnez        $v0, .L9FC00B9C
/* 000B94 9FC00B94 24020001 */   addiu      $v0, $zero, 1
.L9FC00B98:
/* 000B98 9FC00B98 00001021 */  addu        $v0, $zero, $zero
.L9FC00B9C:
/* 000B9C 9FC00B9C 8FBF0014 */  lw          $ra, 0x14($sp)
/* 000BA0 9FC00BA0 8FB00010 */  lw          $s0, 0x10($sp)
/* 000BA4 9FC00BA4 03E00008 */  jr          $ra
/* 000BA8 9FC00BA8 27BD0018 */   addiu      $sp, $sp, 0x18
