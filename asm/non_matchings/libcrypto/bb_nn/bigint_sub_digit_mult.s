## bigint_div
/* 006B9C 9FC06B9C 27BDFFC8 */  addiu       $sp, $sp, -0x38
/* 006BA0 9FC06BA0 AFB5002C */  sw          $s5, 0x2c($sp)
/* 006BA4 9FC06BA4 8FB50048 */  lw          $s5, 0x48($sp)
/* 006BA8 9FC06BA8 AFB60030 */  sw          $s6, 0x30($sp)
/* 006BAC 9FC06BAC 00C0B021 */  addu        $s6, $a2, $zero
/* 006BB0 9FC06BB0 AFBF0034 */  sw          $ra, 0x34($sp)
/* 006BB4 9FC06BB4 AFB40028 */  sw          $s4, 0x28($sp)
/* 006BB8 9FC06BB8 AFB30024 */  sw          $s3, 0x24($sp)
/* 006BBC 9FC06BBC AFB20020 */  sw          $s2, 0x20($sp)
/* 006BC0 9FC06BC0 AFB1001C */  sw          $s1, 0x1c($sp)
/* 006BC4 9FC06BC4 16C00003 */  bnez        $s6, .L9FC06BD4
/* 006BC8 9FC06BC8 AFB00018 */   sw         $s0, 0x18($sp)
/* 006BCC 9FC06BCC 0BF01B19 */  j           .L9FC06C64
/* 006BD0 9FC06BD0 00001021 */   addu       $v0, $zero, $zero
.L9FC06BD4:
/* 006BD4 9FC06BD4 0000A021 */  addu        $s4, $zero, $zero
/* 006BD8 9FC06BD8 1AA00021 */  blez        $s5, .L9FC06C60
/* 006BDC 9FC06BDC 00008021 */   addu       $s0, $zero, $zero
/* 006BE0 9FC06BE0 00808821 */  addu        $s1, $a0, $zero
/* 006BE4 9FC06BE4 00A09821 */  addu        $s3, $a1, $zero
/* 006BE8 9FC06BE8 00E09021 */  addu        $s2, $a3, $zero
.L9FC06BEC:
/* 006BEC 9FC06BEC 27A40010 */  addiu       $a0, $sp, 0x10
/* 006BF0 9FC06BF0 8E460000 */  lw          $a2, ($s2)
/* 006BF4 9FC06BF4 0FF01A88 */  jal         bigint_digit_mult
/* 006BF8 9FC06BF8 02C02821 */   addu       $a1, $s6, $zero
/* 006BFC 9FC06BFC 8E630000 */  lw          $v1, ($s3)
/* 006C00 9FC06C00 00101027 */  nor         $v0, $zero, $s0
/* 006C04 9FC06C04 00701823 */  subu        $v1, $v1, $s0
/* 006C08 9FC06C08 0043102B */  sltu        $v0, $v0, $v1
/* 006C0C 9FC06C0C 10400003 */  beqz        $v0, .L9FC06C1C
/* 006C10 9FC06C10 AE230000 */   sw         $v1, ($s1)
/* 006C14 9FC06C14 0BF01B08 */  j           .L9FC06C20
/* 006C18 9FC06C18 24100001 */   addiu      $s0, $zero, 1
.L9FC06C1C:
/* 006C1C 9FC06C1C 00008021 */  addu        $s0, $zero, $zero
.L9FC06C20:
/* 006C20 9FC06C20 8E230000 */  lw          $v1, ($s1)
/* 006C24 9FC06C24 8FA20010 */  lw          $v0, 0x10($sp)
/* 006C28 9FC06C28 00621823 */  subu        $v1, $v1, $v0
/* 006C2C 9FC06C2C 00021027 */  nor         $v0, $zero, $v0
/* 006C30 9FC06C30 0043102B */  sltu        $v0, $v0, $v1
/* 006C34 9FC06C34 10400002 */  beqz        $v0, .L9FC06C40
/* 006C38 9FC06C38 AE230000 */   sw         $v1, ($s1)
/* 006C3C 9FC06C3C 26100001 */  addiu       $s0, $s0, 1
.L9FC06C40:
/* 006C40 9FC06C40 26310004 */  addiu       $s1, $s1, 4
/* 006C44 9FC06C44 26730004 */  addiu       $s3, $s3, 4
/* 006C48 9FC06C48 8FA20014 */  lw          $v0, 0x14($sp)
/* 006C4C 9FC06C4C 26940001 */  addiu       $s4, $s4, 1
/* 006C50 9FC06C50 02028021 */  addu        $s0, $s0, $v0
/* 006C54 9FC06C54 0295102A */  slt         $v0, $s4, $s5
/* 006C58 9FC06C58 1440FFE4 */  bnez        $v0, .L9FC06BEC
/* 006C5C 9FC06C5C 26520004 */   addiu      $s2, $s2, 4
.L9FC06C60:
/* 006C60 9FC06C60 02001021 */  addu        $v0, $s0, $zero
.L9FC06C64:
/* 006C64 9FC06C64 8FBF0034 */  lw          $ra, 0x34($sp)
/* 006C68 9FC06C68 8FB60030 */  lw          $s6, 0x30($sp)
/* 006C6C 9FC06C6C 8FB5002C */  lw          $s5, 0x2c($sp)
/* 006C70 9FC06C70 8FB40028 */  lw          $s4, 0x28($sp)
/* 006C74 9FC06C74 8FB30024 */  lw          $s3, 0x24($sp)
/* 006C78 9FC06C78 8FB20020 */  lw          $s2, 0x20($sp)
/* 006C7C 9FC06C7C 8FB1001C */  lw          $s1, 0x1c($sp)
/* 006C80 9FC06C80 8FB00018 */  lw          $s0, 0x18($sp)
/* 006C84 9FC06C84 03E00008 */  jr          $ra
/* 006C88 9FC06C88 27BD0038 */   addiu      $sp, $sp, 0x38
