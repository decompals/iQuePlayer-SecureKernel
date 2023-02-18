## eccGenAesKey
/* 009264 9FC09264 27BDFFA8 */  addiu       $sp, $sp, -0x58
/* 009268 9FC09268 00E02021 */  addu        $a0, $a3, $zero
/* 00926C 9FC0926C 00A03821 */  addu        $a3, $a1, $zero
/* 009270 9FC09270 00C02821 */  addu        $a1, $a2, $zero
/* 009274 9FC09274 AFB00050 */  sw          $s0, 0x50($sp)
/* 009278 9FC09278 8FB00068 */  lw          $s0, 0x68($sp)
/* 00927C 9FC0927C AFBF0054 */  sw          $ra, 0x54($sp)
/* 009280 9FC09280 0FF02D9F */  jal         poly_elliptic_mul_slow
/* 009284 9FC09284 27A60010 */   addiu      $a2, $sp, 0x10
/* 009288 9FC09288 27A40010 */  addiu       $a0, $sp, 0x10
/* 00928C 9FC0928C 0FF01F08 */  jal         copy
/* 009290 9FC09290 02002821 */   addu       $a1, $s0, $zero
/* 009294 9FC09294 8FBF0054 */  lw          $ra, 0x54($sp)
/* 009298 9FC09298 8FB00050 */  lw          $s0, 0x50($sp)
/* 00929C 9FC0929C 00001021 */  addu        $v0, $zero, $zero
/* 0092A0 9FC092A0 03E00008 */  jr          $ra
/* 0092A4 9FC092A4 27BD0058 */   addiu      $sp, $sp, 0x58
