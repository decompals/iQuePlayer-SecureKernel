## func_9FC01D54
/* 001C24 9FC01C24 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 001C28 9FC01C28 AFB00010 */  sw          $s0, 0x10($sp)
/* 001C2C 9FC01C2C 00008021 */  addu        $s0, $zero, $zero
/* 001C30 9FC01C30 AFB10014 */  sw          $s1, 0x14($sp)
/* 001C34 9FC01C34 00A08821 */  addu        $s1, $a1, $zero
/* 001C38 9FC01C38 06200009 */  bltz        $s1, .L9FC01C60
/* 001C3C 9FC01C3C AFBF0018 */   sw         $ra, 0x18($sp)
.L9FC01C40:
/* 001C40 9FC01C40 0FF006E2 */  jal         func_9FC01B88
/* 001C44 9FC01C44 00000000 */   nop
/* 001C48 9FC01C48 00402021 */  addu        $a0, $v0, $zero
/* 001C4C 9FC01C4C 04800004 */  bltz        $a0, .L9FC01C60
/* 001C50 9FC01C50 26100001 */   addiu      $s0, $s0, 1
/* 001C54 9FC01C54 0230102A */  slt         $v0, $s1, $s0
/* 001C58 9FC01C58 1040FFF9 */  beqz        $v0, .L9FC01C40
/* 001C5C 9FC01C5C 24840001 */   addiu      $a0, $a0, 1
.L9FC01C60:
/* 001C60 9FC01C60 8FBF0018 */  lw          $ra, 0x18($sp)
/* 001C64 9FC01C64 8FB10014 */  lw          $s1, 0x14($sp)
/* 001C68 9FC01C68 8FB00010 */  lw          $s0, 0x10($sp)
/* 001C6C 9FC01C6C 2482FFFF */  addiu       $v0, $a0, -1
/* 001C70 9FC01C70 03E00008 */  jr          $ra
/* 001C74 9FC01C74 27BD0020 */   addiu      $sp, $sp, 0x20
