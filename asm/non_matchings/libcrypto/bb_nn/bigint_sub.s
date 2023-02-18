## bigint_div
## bigint_mod_inv
## poly_DSA_verify
/* 006FC4 9FC06FC4 00004821 */  addu        $t1, $zero, $zero
/* 006FC8 9FC06FC8 18E00016 */  blez        $a3, .L9FC07024
/* 006FCC 9FC06FCC 00004021 */   addu       $t0, $zero, $zero
.L9FC06FD0:
/* 006FD0 9FC06FD0 8CA20000 */  lw          $v0, ($a1)
/* 006FD4 9FC06FD4 00481823 */  subu        $v1, $v0, $t0
/* 006FD8 9FC06FD8 00081027 */  nor         $v0, $zero, $t0
/* 006FDC 9FC06FDC 0043102B */  sltu        $v0, $v0, $v1
/* 006FE0 9FC06FE0 10400003 */  beqz        $v0, .L9FC06FF0
/* 006FE4 9FC06FE4 8CC20000 */   lw         $v0, ($a2)
/* 006FE8 9FC06FE8 0BF01C02 */  j           .L9FC07008
/* 006FEC 9FC06FEC 00021827 */   nor        $v1, $zero, $v0
.L9FC06FF0:
/* 006FF0 9FC06FF0 00621823 */  subu        $v1, $v1, $v0
/* 006FF4 9FC06FF4 00021027 */  nor         $v0, $zero, $v0
/* 006FF8 9FC06FF8 0043102B */  sltu        $v0, $v0, $v1
/* 006FFC 9FC06FFC 14400002 */  bnez        $v0, .L9FC07008
/* 007000 9FC07000 24080001 */   addiu      $t0, $zero, 1
/* 007004 9FC07004 00004021 */  addu        $t0, $zero, $zero
.L9FC07008:
/* 007008 9FC07008 AC830000 */  sw          $v1, ($a0)
/* 00700C 9FC0700C 24840004 */  addiu       $a0, $a0, 4
/* 007010 9FC07010 24C60004 */  addiu       $a2, $a2, 4
/* 007014 9FC07014 25290001 */  addiu       $t1, $t1, 1
/* 007018 9FC07018 0127102A */  slt         $v0, $t1, $a3
/* 00701C 9FC0701C 1440FFEC */  bnez        $v0, .L9FC06FD0
/* 007020 9FC07020 24A50004 */   addiu      $a1, $a1, 4
.L9FC07024:
/* 007024 9FC07024 03E00008 */  jr          $ra
/* 007028 9FC07028 01001021 */   addu       $v0, $t0, $zero
