## poly_mul
/* 008360 9FC08360 27BDFF60 */  addiu       $sp, $sp, -0xa0
/* 008364 9FC08364 AFB20098 */  sw          $s2, 0x98($sp)
/* 008368 9FC08368 00809021 */  addu        $s2, $a0, $zero
/* 00836C 9FC0836C AFB10094 */  sw          $s1, 0x94($sp)
/* 008370 9FC08370 00A08821 */  addu        $s1, $a1, $zero
/* 008374 9FC08374 AFB00090 */  sw          $s0, 0x90($sp)
/* 008378 9FC08378 27B00050 */  addiu       $s0, $sp, 0x50
/* 00837C 9FC0837C AFBF009C */  sw          $ra, 0x9c($sp)
/* 008380 9FC08380 0FF020B6 */  jal         extract_masked_bits
/* 008384 9FC08384 02003021 */   addu       $a2, $s0, $zero
/* 008388 9FC08388 02402021 */  addu        $a0, $s2, $zero
/* 00838C 9FC0838C 0FF020C7 */  jal         zero_masked_bits
/* 008390 9FC08390 02202821 */   addu       $a1, $s1, $zero
/* 008394 9FC08394 02002021 */  addu        $a0, $s0, $zero
/* 008398 9FC08398 0FF02079 */  jal         divide_shift_n
/* 00839C 9FC0839C 2405009F */   addiu      $a1, $zero, 0x9f
/* 0083A0 9FC083A0 02402021 */  addu        $a0, $s2, $zero
/* 0083A4 9FC083A4 02002821 */  addu        $a1, $s0, $zero
/* 0083A8 9FC083A8 0FF01EF6 */  jal         double_add
/* 0083AC 9FC083AC 27A60010 */   addiu      $a2, $sp, 0x10
/* 0083B0 9FC083B0 02002021 */  addu        $a0, $s0, $zero
/* 0083B4 9FC083B4 0FF02079 */  jal         divide_shift_n
/* 0083B8 9FC083B8 2405004A */   addiu      $a1, $zero, 0x4a
/* 0083BC 9FC083BC 27A40010 */  addiu       $a0, $sp, 0x10
/* 0083C0 9FC083C0 02002821 */  addu        $a1, $s0, $zero
/* 0083C4 9FC083C4 0FF01EF6 */  jal         double_add
/* 0083C8 9FC083C8 02403021 */   addu       $a2, $s2, $zero
/* 0083CC 9FC083CC 8FBF009C */  lw          $ra, 0x9c($sp)
/* 0083D0 9FC083D0 8FB20098 */  lw          $s2, 0x98($sp)
/* 0083D4 9FC083D4 8FB10094 */  lw          $s1, 0x94($sp)
/* 0083D8 9FC083D8 8FB00090 */  lw          $s0, 0x90($sp)
/* 0083DC 9FC083DC 03E00008 */  jr          $ra
/* 0083E0 9FC083E0 27BD00A0 */   addiu      $sp, $sp, 0xa0
