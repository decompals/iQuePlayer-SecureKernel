## bigint_div
/* 0071B0 9FC071B0 28C20020 */  slti        $v0, $a2, 0x20
/* 0071B4 9FC071B4 14400003 */  bnez        $v0, .L9FC071C4
/* 0071B8 9FC071B8 00004021 */   addu       $t0, $zero, $zero
/* 0071BC 9FC071BC 03E00008 */  jr          $ra
/* 0071C0 9FC071C0 00001021 */   addu       $v0, $zero, $zero
.L9FC071C4:
/* 0071C4 9FC071C4 24E7FFFF */  addiu       $a3, $a3, -1
/* 0071C8 9FC071C8 24020020 */  addiu       $v0, $zero, 0x20
/* 0071CC 9FC071CC 04E00010 */  bltz        $a3, .L9FC07210
/* 0071D0 9FC071D0 00464823 */   subu       $t1, $v0, $a2
/* 0071D4 9FC071D4 00071080 */  sll         $v0, $a3, 2
/* 0071D8 9FC071D8 00442021 */  addu        $a0, $v0, $a0
/* 0071DC 9FC071DC 00452821 */  addu        $a1, $v0, $a1
.L9FC071E0:
/* 0071E0 9FC071E0 8CA30000 */  lw          $v1, ($a1)
/* 0071E4 9FC071E4 00C31006 */  srlv        $v0, $v1, $a2
/* 0071E8 9FC071E8 00481025 */  or          $v0, $v0, $t0
/* 0071EC 9FC071EC 10C00003 */  beqz        $a2, .L9FC071FC
/* 0071F0 9FC071F0 AC820000 */   sw         $v0, ($a0)
/* 0071F4 9FC071F4 0BF01C80 */  j           .L9FC07200
/* 0071F8 9FC071F8 01234004 */   sllv       $t0, $v1, $t1
.L9FC071FC:
/* 0071FC 9FC071FC 00004021 */  addu        $t0, $zero, $zero
.L9FC07200:
/* 007200 9FC07200 2484FFFC */  addiu       $a0, $a0, -4
/* 007204 9FC07204 24E7FFFF */  addiu       $a3, $a3, -1
/* 007208 9FC07208 04E1FFF5 */  bgez        $a3, .L9FC071E0
/* 00720C 9FC0720C 24A5FFFC */   addiu      $a1, $a1, -4
.L9FC07210:
/* 007210 9FC07210 03E00008 */  jr          $ra
/* 007214 9FC07214 01001021 */   addu       $v0, $t0, $zero
