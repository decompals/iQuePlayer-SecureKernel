## bsl_rsa_verify
/* 006EAC 9FC06EAC 24A5FFFF */  addiu       $a1, $a1, -1
/* 006EB0 9FC06EB0 10E00010 */  beqz        $a3, .L9FC06EF4
/* 006EB4 9FC06EB4 00005021 */   addu       $t2, $zero, $zero
.L9FC06EB8:
/* 006EB8 9FC06EB8 04A00014 */  bltz        $a1, .L9FC06F0C
/* 006EBC 9FC06EBC 00004021 */   addu       $t0, $zero, $zero
/* 006EC0 9FC06EC0 8CC90000 */  lw          $t1, ($a2)
.L9FC06EC4:
/* 006EC4 9FC06EC4 2D020020 */  sltiu       $v0, $t0, 0x20
/* 006EC8 9FC06EC8 10400006 */  beqz        $v0, .L9FC06EE4
/* 006ECC 9FC06ECC 00851821 */   addu       $v1, $a0, $a1
/* 006ED0 9FC06ED0 01091006 */  srlv        $v0, $t1, $t0
/* 006ED4 9FC06ED4 A0620000 */  sb          $v0, ($v1)
/* 006ED8 9FC06ED8 24A5FFFF */  addiu       $a1, $a1, -1
/* 006EDC 9FC06EDC 04A1FFF9 */  bgez        $a1, .L9FC06EC4
/* 006EE0 9FC06EE0 25080008 */   addiu      $t0, $t0, 8
.L9FC06EE4:
/* 006EE4 9FC06EE4 254A0001 */  addiu       $t2, $t2, 1
/* 006EE8 9FC06EE8 0147102B */  sltu        $v0, $t2, $a3
/* 006EEC 9FC06EEC 1440FFF2 */  bnez        $v0, .L9FC06EB8
/* 006EF0 9FC06EF0 24C60004 */   addiu      $a2, $a2, 4
.L9FC06EF4:
/* 006EF4 9FC06EF4 04A00005 */  bltz        $a1, .L9FC06F0C
/* 006EF8 9FC06EF8 00000000 */   nop
.L9FC06EFC:
/* 006EFC 9FC06EFC 00851021 */  addu        $v0, $a0, $a1
/* 006F00 9FC06F00 24A5FFFF */  addiu       $a1, $a1, -1
/* 006F04 9FC06F04 04A1FFFD */  bgez        $a1, .L9FC06EFC
/* 006F08 9FC06F08 A0400000 */   sb         $zero, ($v0)
.L9FC06F0C:
/* 006F0C 9FC06F0C 03E00008 */  jr          $ra
/* 006F10 9FC06F10 00000000 */   nop
