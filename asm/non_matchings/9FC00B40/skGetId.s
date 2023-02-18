/* 000D84 9FC00D84 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 000D88 9FC00D88 AFB00010 */  sw          $s0, 0x10($sp)
/* 000D8C 9FC00D8C 00808021 */  addu        $s0, $a0, $zero
/* 000D90 9FC00D90 24050004 */  addiu       $a1, $zero, 4
/* 000D94 9FC00D94 AFBF0014 */  sw          $ra, 0x14($sp)
/* 000D98 9FC00D98 0FF00F65 */  jal         check_untrusted_ptr_range
/* 000D9C 9FC00D9C 24060004 */   addiu      $a2, $zero, 4
/* 000DA0 9FC00DA0 10400006 */  beqz        $v0, .L9FC00DBC
/* 000DA4 9FC00DA4 2402FFFF */   addiu      $v0, $zero, -1
/* 000DA8 9FC00DA8 3C029FC1 */  lui         $v0, %hi(virage2_offset)
/* 000DAC 9FC00DAC 8C42EBC0 */  lw          $v0, %lo(virage2_offset)($v0)
/* 000DB0 9FC00DB0 8C430094 */  lw          $v1, 0x94($v0)
/* 000DB4 9FC00DB4 00001021 */  addu        $v0, $zero, $zero
/* 000DB8 9FC00DB8 AE030000 */  sw          $v1, ($s0)
.L9FC00DBC:
/* 000DBC 9FC00DBC 8FBF0014 */  lw          $ra, 0x14($sp)
/* 000DC0 9FC00DC0 8FB00010 */  lw          $s0, 0x10($sp)
/* 000DC4 9FC00DC4 03E00008 */  jr          $ra
/* 000DC8 9FC00DC8 27BD0018 */   addiu      $sp, $sp, 0x18
