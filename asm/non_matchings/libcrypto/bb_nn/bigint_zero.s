## bigint_mult
## bigint_div
## bigint_mod_exp
## bigint_mod_inv
## poly_key_gen_primitive
## Init_233_bit_ECDSA
## poly_ECDSA_signature
## poly_DSA_verify
/* 006F40 9FC06F40 18A00006 */  blez        $a1, .L9FC06F5C
/* 006F44 9FC06F44 00001821 */   addu       $v1, $zero, $zero
.L9FC06F48:
/* 006F48 9FC06F48 AC800000 */  sw          $zero, ($a0)
/* 006F4C 9FC06F4C 24630001 */  addiu       $v1, $v1, 1
/* 006F50 9FC06F50 0065102A */  slt         $v0, $v1, $a1
/* 006F54 9FC06F54 1440FFFC */  bnez        $v0, .L9FC06F48
/* 006F58 9FC06F58 24840004 */   addiu      $a0, $a0, 4
.L9FC06F5C:
/* 006F5C 9FC06F5C 03E00008 */  jr          $ra
/* 006F60 9FC06F60 00000000 */   nop
