## bigint_mod_inv
## poly_ECDSA_signature
/* 006F64 9FC06F64 00004821 */  addu        $t1, $zero, $zero
/* 006F68 9FC06F68 18E00014 */  blez        $a3, .L9FC06FBC
/* 006F6C 9FC06F6C 00004021 */   addu       $t0, $zero, $zero
.L9FC06F70:
/* 006F70 9FC06F70 8CA20000 */  lw          $v0, ($a1)
/* 006F74 9FC06F74 00481821 */  addu        $v1, $v0, $t0
/* 006F78 9FC06F78 0068102B */  sltu        $v0, $v1, $t0
/* 006F7C 9FC06F7C 50400003 */  beql        $v0, $zero, .L9FC06F8C
/* 006F80 9FC06F80 8CC20000 */   lw         $v0, ($a2)
/* 006F84 9FC06F84 0BF01BE8 */  j           .L9FC06FA0
/* 006F88 9FC06F88 8CC30000 */   lw         $v1, ($a2)
.L9FC06F8C:
/* 006F8C 9FC06F8C 00621821 */  addu        $v1, $v1, $v0
/* 006F90 9FC06F90 0062102B */  sltu        $v0, $v1, $v0
/* 006F94 9FC06F94 14400002 */  bnez        $v0, .L9FC06FA0
/* 006F98 9FC06F98 24080001 */   addiu      $t0, $zero, 1
/* 006F9C 9FC06F9C 00004021 */  addu        $t0, $zero, $zero
.L9FC06FA0:
/* 006FA0 9FC06FA0 AC830000 */  sw          $v1, ($a0)
/* 006FA4 9FC06FA4 24840004 */  addiu       $a0, $a0, 4
/* 006FA8 9FC06FA8 24C60004 */  addiu       $a2, $a2, 4
/* 006FAC 9FC06FAC 25290001 */  addiu       $t1, $t1, 1
/* 006FB0 9FC06FB0 0127102A */  slt         $v0, $t1, $a3
/* 006FB4 9FC06FB4 1440FFEE */  bnez        $v0, .L9FC06F70
/* 006FB8 9FC06FB8 24A50004 */   addiu      $a1, $a1, 4
.L9FC06FBC:
/* 006FBC 9FC06FBC 03E00008 */  jr          $ra
/* 006FC0 9FC06FC0 01001021 */   addu       $v0, $t0, $zero
