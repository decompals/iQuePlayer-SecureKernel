## Init_233_bit_ECDSA
## poly_elliptic_sum
## poly_elliptic_mul_slow
## poly_elliptic_mul
/* 00B030 9FC0B030 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 00B034 9FC0B034 AFB10014 */  sw          $s1, 0x14($sp)
/* 00B038 9FC0B038 00808821 */  addu        $s1, $a0, $zero
/* 00B03C 9FC0B03C AFB00010 */  sw          $s0, 0x10($sp)
/* 00B040 9FC0B040 AFBF0018 */  sw          $ra, 0x18($sp)
/* 00B044 9FC0B044 0FF01F08 */  jal         copy
/* 00B048 9FC0B048 00A08021 */   addu       $s0, $a1, $zero
/* 00B04C 9FC0B04C 26240020 */  addiu       $a0, $s1, 0x20
/* 00B050 9FC0B050 0FF01F08 */  jal         copy
/* 00B054 9FC0B054 26050020 */   addiu      $a1, $s0, 0x20
/* 00B058 9FC0B058 8FBF0018 */  lw          $ra, 0x18($sp)
/* 00B05C 9FC0B05C 8FB10014 */  lw          $s1, 0x14($sp)
/* 00B060 9FC0B060 8FB00010 */  lw          $s0, 0x10($sp)
/* 00B064 9FC0B064 03E00008 */  jr          $ra
/* 00B068 9FC0B068 27BD0020 */   addiu      $sp, $sp, 0x20
