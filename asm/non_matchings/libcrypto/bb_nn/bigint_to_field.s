## poly_key_gen_primitive
## Init_233_bit_ECDSA
## poly_ECDSA_signature
## poly_DSA_verify
/* 007968 9FC07968 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 00796C 9FC0796C AFB20018 */  sw          $s2, 0x18($sp)
/* 007970 9FC07970 00809021 */  addu        $s2, $a0, $zero
/* 007974 9FC07974 AFB10014 */  sw          $s1, 0x14($sp)
/* 007978 9FC07978 00A08821 */  addu        $s1, $a1, $zero
/* 00797C 9FC0797C AFB00010 */  sw          $s0, 0x10($sp)
/* 007980 9FC07980 00C08021 */  addu        $s0, $a2, $zero
/* 007984 9FC07984 AFBF001C */  sw          $ra, 0x1c($sp)
/* 007988 9FC07988 0FF01EE0 */  jal         null
/* 00798C 9FC0798C 02202021 */   addu       $a0, $s1, $zero
/* 007990 9FC07990 1A00000E */  blez        $s0, .L9FC079CC
/* 007994 9FC07994 00001821 */   addu       $v1, $zero, $zero
/* 007998 9FC07998 00032080 */  sll         $a0, $v1, 2
.L9FC0799C:
/* 00799C 9FC0799C 24620001 */  addiu       $v0, $v1, 1
/* 0079A0 9FC079A0 00021C00 */  sll         $v1, $v0, 0x10
/* 0079A4 9FC079A4 00031C03 */  sra         $v1, $v1, 0x10
/* 0079A8 9FC079A8 02021023 */  subu        $v0, $s0, $v0
/* 0079AC 9FC079AC 00021080 */  sll         $v0, $v0, 2
/* 0079B0 9FC079B0 00521021 */  addu        $v0, $v0, $s2
/* 0079B4 9FC079B4 8C420000 */  lw          $v0, ($v0)
/* 0079B8 9FC079B8 02242021 */  addu        $a0, $s1, $a0
/* 0079BC 9FC079BC AC820000 */  sw          $v0, ($a0)
/* 0079C0 9FC079C0 0070102A */  slt         $v0, $v1, $s0
/* 0079C4 9FC079C4 1440FFF5 */  bnez        $v0, .L9FC0799C
/* 0079C8 9FC079C8 00032080 */   sll        $a0, $v1, 2
.L9FC079CC:
/* 0079CC 9FC079CC 8FBF001C */  lw          $ra, 0x1c($sp)
/* 0079D0 9FC079D0 8FB20018 */  lw          $s2, 0x18($sp)
/* 0079D4 9FC079D4 8FB10014 */  lw          $s1, 0x14($sp)
/* 0079D8 9FC079D8 8FB00010 */  lw          $s0, 0x10($sp)
/* 0079DC 9FC079DC 03E00008 */  jr          $ra
/* 0079E0 9FC079E0 27BD0020 */   addiu      $sp, $sp, 0x20
