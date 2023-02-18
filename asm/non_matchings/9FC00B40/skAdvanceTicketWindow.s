/* 001994 9FC01994 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 001998 9FC01998 AFBF0010 */  sw          $ra, 0x10($sp)
/* 00199C 9FC0199C 00002821 */  addu        $a1, $zero, $zero
/* 0019A0 9FC019A0 00051840 */  sll         $v1, $a1, 1
.L9FC019A4:
/* 0019A4 9FC019A4 24A20001 */  addiu       $v0, $a1, 1
/* 0019A8 9FC019A8 00402821 */  addu        $a1, $v0, $zero
/* 0019AC 9FC019AC 3C049FC1 */  lui         $a0, %hi(D_9FC0F310)
/* 0019B0 9FC019B0 2484F310 */  addiu       $a0, $a0, %lo(D_9FC0F310)
/* 0019B4 9FC019B4 00021040 */  sll         $v0, $v0, 1
/* 0019B8 9FC019B8 00443021 */  addu        $a2, $v0, $a0
/* 0019BC 9FC019BC 94C20000 */  lhu         $v0, ($a2)
/* 0019C0 9FC019C0 00641821 */  addu        $v1, $v1, $a0
/* 0019C4 9FC019C4 A4620000 */  sh          $v0, ($v1)
/* 0019C8 9FC019C8 28A20019 */  slti        $v0, $a1, 0x19
/* 0019CC 9FC019CC 1440FFF5 */  bnez        $v0, .L9FC019A4
/* 0019D0 9FC019D0 00051840 */   sll        $v1, $a1, 1
/* 0019D4 9FC019D4 A4C00000 */  sh          $zero, ($a2)
/* 0019D8 9FC019D8 9482FFFE */  lhu         $v0, -2($a0)
/* 0019DC 9FC019DC 24420001 */  addiu       $v0, $v0, 1
/* 0019E0 9FC019E0 A482FFFE */  sh          $v0, -2($a0)
/* 0019E4 9FC019E4 0FF00EF3 */  jal         write_virage01_data
/* 0019E8 9FC019E8 2484FFF8 */   addiu      $a0, $a0, -8
/* 0019EC 9FC019EC 8FBF0010 */  lw          $ra, 0x10($sp)
/* 0019F0 9FC019F0 03E00008 */  jr          $ra
/* 0019F4 9FC019F4 27BD0018 */   addiu      $sp, $sp, 0x18
