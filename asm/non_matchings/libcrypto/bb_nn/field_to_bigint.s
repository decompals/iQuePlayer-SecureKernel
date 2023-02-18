## poly_key_gen_primitive
## hash_to_integer
## poly_ECDSA_signature
## poly_DSA_verify
/* 007920 9FC07920 00003821 */  addu        $a3, $zero, $zero
/* 007924 9FC07924 18C0000E */  blez        $a2, .L9FC07960
/* 007928 9FC07928 00804021 */   addu       $t0, $a0, $zero
/* 00792C 9FC0792C 24E20001 */  addiu       $v0, $a3, 1
.L9FC07930:
/* 007930 9FC07930 00072080 */  sll         $a0, $a3, 2
/* 007934 9FC07934 00021C00 */  sll         $v1, $v0, 0x10
/* 007938 9FC07938 00033C03 */  sra         $a3, $v1, 0x10
/* 00793C 9FC0793C 00C21023 */  subu        $v0, $a2, $v0
/* 007940 9FC07940 00021080 */  sll         $v0, $v0, 2
/* 007944 9FC07944 01042021 */  addu        $a0, $t0, $a0
/* 007948 9FC07948 8C830000 */  lw          $v1, ($a0)
/* 00794C 9FC0794C 00451021 */  addu        $v0, $v0, $a1
/* 007950 9FC07950 AC430000 */  sw          $v1, ($v0)
/* 007954 9FC07954 00E6102A */  slt         $v0, $a3, $a2
/* 007958 9FC07958 1440FFF5 */  bnez        $v0, .L9FC07930
/* 00795C 9FC0795C 24E20001 */   addiu      $v0, $a3, 1
.L9FC07960:
/* 007960 9FC07960 03E00008 */  jr          $ra
/* 007964 9FC07964 00000000 */   nop
