## bigint_mod_mult
/* 007494 9FC07494 27BDFBD8 */  addiu       $sp, $sp, -0x428
/* 007498 9FC07498 00A01821 */  addu        $v1, $a1, $zero
/* 00749C 9FC0749C AFA70010 */  sw          $a3, 0x10($sp)
/* 0074A0 9FC074A0 00C03821 */  addu        $a3, $a2, $zero
/* 0074A4 9FC074A4 8FA20438 */  lw          $v0, 0x438($sp)
/* 0074A8 9FC074A8 00603021 */  addu        $a2, $v1, $zero
/* 0074AC 9FC074AC AFBF0420 */  sw          $ra, 0x420($sp)
/* 0074B0 9FC074B0 AFA20014 */  sw          $v0, 0x14($sp)
/* 0074B4 9FC074B4 00801021 */  addu        $v0, $a0, $zero
/* 0074B8 9FC074B8 27A40018 */  addiu       $a0, $sp, 0x18
/* 0074BC 9FC074BC 0FF01C9B */  jal         bigint_div
/* 0074C0 9FC074C0 00402821 */   addu       $a1, $v0, $zero
/* 0074C4 9FC074C4 8FBF0420 */  lw          $ra, 0x420($sp)
/* 0074C8 9FC074C8 03E00008 */  jr          $ra
/* 0074CC 9FC074CC 27BD0428 */   addiu      $sp, $sp, 0x428
