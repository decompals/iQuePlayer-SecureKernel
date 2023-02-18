## bigint_mult
## bigint_div
## bigint_mod_exp
## bigint_bits
## bsl_rsa_verify
## poly_key_gen_primitive
## poly_ECDSA_signature
## poly_DSA_verify
/* 00702C 9FC0702C 24A5FFFF */  addiu       $a1, $a1, -1
/* 007030 9FC07030 04A00008 */  bltz        $a1, .L9FC07054
/* 007034 9FC07034 00051080 */   sll        $v0, $a1, 2
/* 007038 9FC07038 00442021 */  addu        $a0, $v0, $a0
.L9FC0703C:
/* 00703C 9FC0703C 8C820000 */  lw          $v0, ($a0)
/* 007040 9FC07040 14400004 */  bnez        $v0, .L9FC07054
/* 007044 9FC07044 00000000 */   nop
/* 007048 9FC07048 24A5FFFF */  addiu       $a1, $a1, -1
/* 00704C 9FC0704C 04A1FFFB */  bgez        $a1, .L9FC0703C
/* 007050 9FC07050 2484FFFC */   addiu      $a0, $a0, -4
.L9FC07054:
/* 007054 9FC07054 03E00008 */  jr          $ra
/* 007058 9FC07058 24A20001 */   addiu      $v0, $a1, 1
