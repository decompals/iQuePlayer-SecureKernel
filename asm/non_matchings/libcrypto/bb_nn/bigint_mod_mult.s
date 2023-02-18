## bigint_mod_exp
/* 0074D0 9FC074D0 27BDFBD0 */  addiu       $sp, $sp, -0x430
/* 0074D4 9FC074D4 AFB00420 */  sw          $s0, 0x420($sp)
/* 0074D8 9FC074D8 00808021 */  addu        $s0, $a0, $zero
/* 0074DC 9FC074DC AFB10424 */  sw          $s1, 0x424($sp)
/* 0074E0 9FC074E0 8FB10440 */  lw          $s1, 0x440($sp)
/* 0074E4 9FC074E4 27A40018 */  addiu       $a0, $sp, 0x18
/* 0074E8 9FC074E8 AFB20428 */  sw          $s2, 0x428($sp)
/* 0074EC 9FC074EC 00E09021 */  addu        $s2, $a3, $zero
/* 0074F0 9FC074F0 AFBF042C */  sw          $ra, 0x42c($sp)
/* 0074F4 9FC074F4 0FF01C17 */  jal         bigint_mult
/* 0074F8 9FC074F8 02203821 */   addu       $a3, $s1, $zero
/* 0074FC 9FC074FC 02002021 */  addu        $a0, $s0, $zero
/* 007500 9FC07500 27A50018 */  addiu       $a1, $sp, 0x18
/* 007504 9FC07504 00113040 */  sll         $a2, $s1, 1
/* 007508 9FC07508 02403821 */  addu        $a3, $s2, $zero
/* 00750C 9FC0750C 0FF01D25 */  jal         bigint_mod
/* 007510 9FC07510 AFB10010 */   sw         $s1, 0x10($sp)
/* 007514 9FC07514 8FBF042C */  lw          $ra, 0x42c($sp)
/* 007518 9FC07518 8FB20428 */  lw          $s2, 0x428($sp)
/* 00751C 9FC0751C 8FB10424 */  lw          $s1, 0x424($sp)
/* 007520 9FC07520 8FB00420 */  lw          $s0, 0x420($sp)
/* 007524 9FC07524 03E00008 */  jr          $ra
/* 007528 9FC07528 27BD0430 */   addiu      $sp, $sp, 0x430
