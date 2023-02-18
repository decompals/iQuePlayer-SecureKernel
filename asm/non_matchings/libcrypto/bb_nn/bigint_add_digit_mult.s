## bigint_mult
/* 006AB8 9FC06AB8 27BDFFC8 */  addiu       $sp, $sp, -0x38
/* 006ABC 9FC06ABC AFB5002C */  sw          $s5, 0x2c($sp)
/* 006AC0 9FC06AC0 8FB50048 */  lw          $s5, 0x48($sp)
/* 006AC4 9FC06AC4 AFB60030 */  sw          $s6, 0x30($sp)
/* 006AC8 9FC06AC8 00C0B021 */  addu        $s6, $a2, $zero
/* 006ACC 9FC06ACC AFBF0034 */  sw          $ra, 0x34($sp)
/* 006AD0 9FC06AD0 AFB40028 */  sw          $s4, 0x28($sp)
/* 006AD4 9FC06AD4 AFB30024 */  sw          $s3, 0x24($sp)
/* 006AD8 9FC06AD8 AFB20020 */  sw          $s2, 0x20($sp)
/* 006ADC 9FC06ADC AFB1001C */  sw          $s1, 0x1c($sp)
/* 006AE0 9FC06AE0 16C00003 */  bnez        $s6, .L9FC06AF0
/* 006AE4 9FC06AE4 AFB00018 */   sw         $s0, 0x18($sp)
/* 006AE8 9FC06AE8 0BF01ADD */  j           .L9FC06B74
/* 006AEC 9FC06AEC 00001021 */   addu       $v0, $zero, $zero
.L9FC06AF0:
/* 006AF0 9FC06AF0 0000A021 */  addu        $s4, $zero, $zero
/* 006AF4 9FC06AF4 1AA0001E */  blez        $s5, .L9FC06B70
/* 006AF8 9FC06AF8 00008021 */   addu       $s0, $zero, $zero
/* 006AFC 9FC06AFC 00808821 */  addu        $s1, $a0, $zero
/* 006B00 9FC06B00 00A09821 */  addu        $s3, $a1, $zero
/* 006B04 9FC06B04 00E09021 */  addu        $s2, $a3, $zero
.L9FC06B08:
/* 006B08 9FC06B08 27A40010 */  addiu       $a0, $sp, 0x10
/* 006B0C 9FC06B0C 8E460000 */  lw          $a2, ($s2)
/* 006B10 9FC06B10 0FF01A88 */  jal         bigint_digit_mult
/* 006B14 9FC06B14 02C02821 */   addu       $a1, $s6, $zero
/* 006B18 9FC06B18 8E620000 */  lw          $v0, ($s3)
/* 006B1C 9FC06B1C 00501021 */  addu        $v0, $v0, $s0
/* 006B20 9FC06B20 AE220000 */  sw          $v0, ($s1)
/* 006B24 9FC06B24 0050102B */  sltu        $v0, $v0, $s0
/* 006B28 9FC06B28 14400002 */  bnez        $v0, .L9FC06B34
/* 006B2C 9FC06B2C 24100001 */   addiu      $s0, $zero, 1
/* 006B30 9FC06B30 00008021 */  addu        $s0, $zero, $zero
.L9FC06B34:
/* 006B34 9FC06B34 8E220000 */  lw          $v0, ($s1)
/* 006B38 9FC06B38 8FA30010 */  lw          $v1, 0x10($sp)
/* 006B3C 9FC06B3C 00431021 */  addu        $v0, $v0, $v1
/* 006B40 9FC06B40 AE220000 */  sw          $v0, ($s1)
/* 006B44 9FC06B44 0043102B */  sltu        $v0, $v0, $v1
/* 006B48 9FC06B48 54400001 */  bnel        $v0, $zero, .L9FC06B50
/* 006B4C 9FC06B4C 26100001 */   addiu      $s0, $s0, 1
.L9FC06B50:
/* 006B50 9FC06B50 26310004 */  addiu       $s1, $s1, 4
/* 006B54 9FC06B54 26730004 */  addiu       $s3, $s3, 4
/* 006B58 9FC06B58 8FA20014 */  lw          $v0, 0x14($sp)
/* 006B5C 9FC06B5C 26940001 */  addiu       $s4, $s4, 1
/* 006B60 9FC06B60 02028021 */  addu        $s0, $s0, $v0
/* 006B64 9FC06B64 0295102A */  slt         $v0, $s4, $s5
/* 006B68 9FC06B68 1440FFE7 */  bnez        $v0, .L9FC06B08
/* 006B6C 9FC06B6C 26520004 */   addiu      $s2, $s2, 4
.L9FC06B70:
/* 006B70 9FC06B70 02001021 */  addu        $v0, $s0, $zero
.L9FC06B74:
/* 006B74 9FC06B74 8FBF0034 */  lw          $ra, 0x34($sp)
/* 006B78 9FC06B78 8FB60030 */  lw          $s6, 0x30($sp)
/* 006B7C 9FC06B7C 8FB5002C */  lw          $s5, 0x2c($sp)
/* 006B80 9FC06B80 8FB40028 */  lw          $s4, 0x28($sp)
/* 006B84 9FC06B84 8FB30024 */  lw          $s3, 0x24($sp)
/* 006B88 9FC06B88 8FB20020 */  lw          $s2, 0x20($sp)
/* 006B8C 9FC06B8C 8FB1001C */  lw          $s1, 0x1c($sp)
/* 006B90 9FC06B90 8FB00018 */  lw          $s0, 0x18($sp)
/* 006B94 9FC06B94 03E00008 */  jr          $ra
/* 006B98 9FC06B98 27BD0038 */   addiu      $sp, $sp, 0x38
