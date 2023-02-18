## bigint_div
## bigint_bits
/* 006C8C 9FC06C8C 00001821 */  addu        $v1, $zero, $zero
.L9FC06C90:
/* 006C90 9FC06C90 10800005 */  beqz        $a0, .L9FC06CA8
/* 006C94 9FC06C94 00000000 */   nop
/* 006C98 9FC06C98 24630001 */  addiu       $v1, $v1, 1
/* 006C9C 9FC06C9C 28620020 */  slti        $v0, $v1, 0x20
/* 006CA0 9FC06CA0 1440FFFB */  bnez        $v0, .L9FC06C90
/* 006CA4 9FC06CA4 00042042 */   srl        $a0, $a0, 1
.L9FC06CA8:
/* 006CA8 9FC06CA8 03E00008 */  jr          $ra
/* 006CAC 9FC06CAC 00601021 */   addu       $v0, $v1, $zero
