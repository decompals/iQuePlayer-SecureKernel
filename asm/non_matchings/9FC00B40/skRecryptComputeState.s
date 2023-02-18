/* 001560 9FC01560 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 001564 9FC01564 AFB20018 */  sw          $s2, 0x18($sp)
/* 001568 9FC01568 00809021 */  addu        $s2, $a0, $zero
/* 00156C 9FC0156C AFB10014 */  sw          $s1, 0x14($sp)
/* 001570 9FC01570 00A08821 */  addu        $s1, $a1, $zero
/* 001574 9FC01574 24060001 */  addiu       $a2, $zero, 1
/* 001578 9FC01578 02511021 */  addu        $v0, $s2, $s1
/* 00157C 9FC0157C AFB00010 */  sw          $s0, 0x10($sp)
/* 001580 9FC01580 AFBF001C */  sw          $ra, 0x1c($sp)
/* 001584 9FC01584 0FF00F65 */  jal         check_untrusted_ptr_range
/* 001588 9FC01588 2450FFF0 */   addiu      $s0, $v0, -0x10
/* 00158C 9FC0158C 1040000B */  beqz        $v0, .L9FC015BC
/* 001590 9FC01590 02002821 */   addu       $a1, $s0, $zero
/* 001594 9FC01594 3C049FC1 */  lui         $a0, %hi(D_9FC0F2E4)
/* 001598 9FC01598 2484F2E4 */  addiu       $a0, $a0, %lo(D_9FC0F2E4)
/* 00159C 9FC0159C 0FF00EA1 */  jal         memcpy
/* 0015A0 9FC015A0 24060010 */   addiu      $a2, $zero, 0x10
/* 0015A4 9FC015A4 02402021 */  addu        $a0, $s2, $zero
/* 0015A8 9FC015A8 02202821 */  addu        $a1, $s1, $zero
/* 0015AC 9FC015AC 0FF004D3 */  jal         func_9FC0134C
/* 0015B0 9FC015B0 00003021 */   addu       $a2, $zero, $zero
/* 0015B4 9FC015B4 0BF00570 */  j           .L9FC015C0
/* 0015B8 9FC015B8 00001021 */   addu       $v0, $zero, $zero
.L9FC015BC:
/* 0015BC 9FC015BC 2402FFFF */  addiu       $v0, $zero, -1
.L9FC015C0:
/* 0015C0 9FC015C0 8FBF001C */  lw          $ra, 0x1c($sp)
/* 0015C4 9FC015C4 8FB20018 */  lw          $s2, 0x18($sp)
/* 0015C8 9FC015C8 8FB10014 */  lw          $s1, 0x14($sp)
/* 0015CC 9FC015CC 8FB00010 */  lw          $s0, 0x10($sp)
/* 0015D0 9FC015D0 03E00008 */  jr          $ra
/* 0015D4 9FC015D4 27BD0020 */   addiu      $sp, $sp, 0x20
