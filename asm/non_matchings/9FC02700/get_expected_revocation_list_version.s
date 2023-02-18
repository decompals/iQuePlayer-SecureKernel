## verify_crlbundle
/* 002980 9FC02980 24020001 */  addiu       $v0, $zero, 1
/* 002984 9FC02984 1082000C */  beq         $a0, $v0, .L9FC029B8
/* 002988 9FC02988 00000000 */   nop
/* 00298C 9FC0298C 10800005 */  beqz        $a0, .L9FC029A4
/* 002990 9FC02990 24020002 */   addiu      $v0, $zero, 2
/* 002994 9FC02994 1082000C */  beq         $a0, $v0, .L9FC029C8
/* 002998 9FC02998 2402FFFF */   addiu      $v0, $zero, -1
/* 00299C 9FC0299C 0BF00A76 */  j           .L9FC029D8
/* 0029A0 9FC029A0 00000000 */   nop
.L9FC029A4:
/* 0029A4 9FC029A4 3C039FC1 */  lui         $v1, %hi(D_9FC0F308)
/* 0029A8 9FC029A8 9063F308 */  lbu         $v1, %lo(D_9FC0F308)($v1)
/* 0029AC 9FC029AC 00001021 */  addu        $v0, $zero, $zero
.L9FC029B0:
/* 0029B0 9FC029B0 03E00008 */  jr          $ra
/* 0029B4 9FC029B4 ACA30000 */   sw         $v1, ($a1)
.L9FC029B8:
/* 0029B8 9FC029B8 3C039FC1 */  lui         $v1, %hi(D_9FC0F30A)
/* 0029BC 9FC029BC 9063F30A */  lbu         $v1, %lo(D_9FC0F30A)($v1)
/* 0029C0 9FC029C0 0BF00A6C */  j           .L9FC029B0
/* 0029C4 9FC029C4 00001021 */   addu       $v0, $zero, $zero
.L9FC029C8:
/* 0029C8 9FC029C8 3C039FC1 */  lui         $v1, %hi(D_9FC0F309)
/* 0029CC 9FC029CC 9063F309 */  lbu         $v1, %lo(D_9FC0F309)($v1)
/* 0029D0 9FC029D0 0BF00A6C */  j           .L9FC029B0
/* 0029D4 9FC029D4 00001021 */   addu       $v0, $zero, $zero
.L9FC029D8:
/* 0029D8 9FC029D8 03E00008 */  jr          $ra
/* 0029DC 9FC029DC 00000000 */   nop
