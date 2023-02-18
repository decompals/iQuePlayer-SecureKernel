## poly_inv
## generate_shared_key
## Init_233_bit_ECDSA
## bsl_compute_ecc_sig
## bsl_verify_ecc_sig
## copy_point
## poly_elliptic_sub
## poly_elliptic_mul_slow
## poly_elliptic_mul_four
## poly_elliptic_mul
/* 007C20 9FC07C20 00803821 */  addu        $a3, $a0, $zero
/* 007C24 9FC07C24 3C060001 */  lui         $a2, 1
.L9FC07C28:
/* 007C28 9FC07C28 8CE40000 */  lw          $a0, ($a3)
/* 007C2C 9FC07C2C 24E70004 */  addiu       $a3, $a3, 4
/* 007C30 9FC07C30 00C01821 */  addu        $v1, $a2, $zero
/* 007C34 9FC07C34 3C020001 */  lui         $v0, 1
/* 007C38 9FC07C38 00C23021 */  addu        $a2, $a2, $v0
/* 007C3C 9FC07C3C 00031C02 */  srl         $v1, $v1, 0x10
/* 007C40 9FC07C40 2C630008 */  sltiu       $v1, $v1, 8
/* 007C44 9FC07C44 ACA40000 */  sw          $a0, ($a1)
/* 007C48 9FC07C48 1460FFF7 */  bnez        $v1, .L9FC07C28
/* 007C4C 9FC07C4C 24A50004 */   addiu      $a1, $a1, 4
/* 007C50 9FC07C50 03E00008 */  jr          $ra
/* 007C54 9FC07C54 00000000 */   nop
