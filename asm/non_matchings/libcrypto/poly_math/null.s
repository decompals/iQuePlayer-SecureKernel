## bigint_to_field
## poly_inv
## poly_key_gen_primitive
## hash_to_integer
## Init_233_bit_ECDSA
## poly_elliptic_sum
## poly_elliptic_double
## poly_elliptic_sub
## poly_elliptic_mul_slow
## poly_elliptic_mul_four
## do_precompute_two
## poly_elliptic_mul
/* 007B80 9FC07B80 3C050001 */  lui         $a1, 1
.L9FC07B84:
/* 007B84 9FC07B84 AC800000 */  sw          $zero, ($a0)
/* 007B88 9FC07B88 24840004 */  addiu       $a0, $a0, 4
/* 007B8C 9FC07B8C 00A01821 */  addu        $v1, $a1, $zero
/* 007B90 9FC07B90 3C020001 */  lui         $v0, 1
/* 007B94 9FC07B94 00031C02 */  srl         $v1, $v1, 0x10
/* 007B98 9FC07B98 2C630008 */  sltiu       $v1, $v1, 8
/* 007B9C 9FC07B9C 1460FFF9 */  bnez        $v1, .L9FC07B84
/* 007BA0 9FC07BA0 00A22821 */   addu       $a1, $a1, $v0
/* 007BA4 9FC07BA4 03E00008 */  jr          $ra
/* 007BA8 9FC07BA8 00000000 */   nop
