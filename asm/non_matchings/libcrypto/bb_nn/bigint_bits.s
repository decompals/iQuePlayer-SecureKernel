/* 007770 9FC07770 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 007774 9FC07774 AFB10014 */  sw          $s1, 0x14($sp)
/* 007778 9FC07778 00808821 */  addu        $s1, $a0, $zero
/* 00777C 9FC0777C AFBF0018 */  sw          $ra, 0x18($sp)
/* 007780 9FC07780 0FF01C0B */  jal         bigint_digits
/* 007784 9FC07784 AFB00010 */   sw         $s0, 0x10($sp)
/* 007788 9FC07788 00408021 */  addu        $s0, $v0, $zero
/* 00778C 9FC0778C 12000008 */  beqz        $s0, .L9FC077B0
/* 007790 9FC07790 00101080 */   sll        $v0, $s0, 2
/* 007794 9FC07794 00511021 */  addu        $v0, $v0, $s1
/* 007798 9FC07798 0FF01B23 */  jal         bigint_digit_bits
/* 00779C 9FC0779C 8C44FFFC */   lw         $a0, -4($v0)
/* 0077A0 9FC077A0 2603FFFF */  addiu       $v1, $s0, -1
/* 0077A4 9FC077A4 00031940 */  sll         $v1, $v1, 5
/* 0077A8 9FC077A8 0BF01DED */  j           .L9FC077B4
/* 0077AC 9FC077AC 00621021 */   addu       $v0, $v1, $v0
.L9FC077B0:
/* 0077B0 9FC077B0 00001021 */  addu        $v0, $zero, $zero
.L9FC077B4:
/* 0077B4 9FC077B4 8FBF0018 */  lw          $ra, 0x18($sp)
/* 0077B8 9FC077B8 8FB10014 */  lw          $s1, 0x14($sp)
/* 0077BC 9FC077BC 8FB00010 */  lw          $s0, 0x10($sp)
/* 0077C0 9FC077C0 03E00008 */  jr          $ra
/* 0077C4 9FC077C4 27BD0020 */   addiu      $sp, $sp, 0x20
