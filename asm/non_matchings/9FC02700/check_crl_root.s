## verify_crlbundle
/* 0029E0 9FC029E0 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 0029E4 9FC029E4 AFBF0010 */  sw          $ra, 0x10($sp)
/* 0029E8 9FC029E8 8C830200 */  lw          $v1, 0x200($a0)
/* 0029EC 9FC029EC 1465001C */  bne         $v1, $a1, .L9FC02A60
/* 0029F0 9FC029F0 2402FFFF */   addiu      $v0, $zero, -1
/* 0029F4 9FC029F4 24020001 */  addiu       $v0, $zero, 1
/* 0029F8 9FC029F8 5062000C */  beql        $v1, $v0, .L9FC02A2C
/* 0029FC 9FC029FC 24840214 */   addiu      $a0, $a0, 0x214
/* 002A00 9FC02A00 10600005 */  beqz        $v1, .L9FC02A18
/* 002A04 9FC02A04 24020002 */   addiu      $v0, $zero, 2
/* 002A08 9FC02A08 1062000C */  beq         $v1, $v0, .L9FC02A3C
/* 002A0C 9FC02A0C 2402FFFF */   addiu      $v0, $zero, -1
/* 002A10 9FC02A10 0BF00A99 */  j           .L9FC02A64
/* 002A14 9FC02A14 8FBF0010 */   lw         $ra, 0x10($sp)
.L9FC02A18:
/* 002A18 9FC02A18 24840214 */  addiu       $a0, $a0, 0x214
/* 002A1C 9FC02A1C 3C059FC1 */  lui         $a1, %hi(aRootXsca)
/* 002A20 9FC02A20 24A5BE00 */  addiu       $a1, $a1, %lo(aRootXsca)
/* 002A24 9FC02A24 0BF00A93 */  j           .L9FC02A4C
/* 002A28 9FC02A28 24060009 */   addiu      $a2, $zero, 9
.L9FC02A2C:
/* 002A2C 9FC02A2C 3C059FC1 */  lui         $a1, %hi(aRootCpca)
/* 002A30 9FC02A30 24A5BE0C */  addiu       $a1, $a1, %lo(aRootCpca)
/* 002A34 9FC02A34 0BF00A93 */  j           .L9FC02A4C
/* 002A38 9FC02A38 24060009 */   addiu      $a2, $zero, 9
.L9FC02A3C:
/* 002A3C 9FC02A3C 24840214 */  addiu       $a0, $a0, 0x214
/* 002A40 9FC02A40 3C059FC1 */  lui         $a1, %hi(aRoot_0)
/* 002A44 9FC02A44 24A5BE18 */  addiu       $a1, $a1, %lo(aRoot_0)
/* 002A48 9FC02A48 24060005 */  addiu       $a2, $zero, 5
.L9FC02A4C:
/* 002A4C 9FC02A4C 0FF00E6B */  jal         strncmp
/* 002A50 9FC02A50 00000000 */   nop
/* 002A54 9FC02A54 14400002 */  bnez        $v0, .L9FC02A60
/* 002A58 9FC02A58 2402FFFF */   addiu      $v0, $zero, -1
/* 002A5C 9FC02A5C 00001021 */  addu        $v0, $zero, $zero
.L9FC02A60:
/* 002A60 9FC02A60 8FBF0010 */  lw          $ra, 0x10($sp)
.L9FC02A64:
/* 002A64 9FC02A64 03E00008 */  jr          $ra
/* 002A68 9FC02A68 27BD0018 */   addiu      $sp, $sp, 0x18
