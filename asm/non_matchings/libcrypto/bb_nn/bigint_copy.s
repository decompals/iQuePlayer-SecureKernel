## bigint_mult
## bigint_mod_exp
## bigint_mod_inv
/* 006F14 9FC06F14 18C00008 */  blez        $a2, .L9FC06F38
/* 006F18 9FC06F18 00001821 */   addu       $v1, $zero, $zero
.L9FC06F1C:
/* 006F1C 9FC06F1C 8CA20000 */  lw          $v0, ($a1)
/* 006F20 9FC06F20 24A50004 */  addiu       $a1, $a1, 4
/* 006F24 9FC06F24 24630001 */  addiu       $v1, $v1, 1
/* 006F28 9FC06F28 AC820000 */  sw          $v0, ($a0)
/* 006F2C 9FC06F2C 0066102A */  slt         $v0, $v1, $a2
/* 006F30 9FC06F30 1440FFFA */  bnez        $v0, .L9FC06F1C
/* 006F34 9FC06F34 24840004 */   addiu      $a0, $a0, 4
.L9FC06F38:
/* 006F38 9FC06F38 03E00008 */  jr          $ra
/* 006F3C 9FC06F3C 00000000 */   nop
