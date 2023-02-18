/* 0014A4 9FC014A4 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 0014A8 9FC014A8 AFB10014 */  sw          $s1, 0x14($sp)
/* 0014AC 9FC014AC 00808821 */  addu        $s1, $a0, $zero
/* 0014B0 9FC014B0 AFB00010 */  sw          $s0, 0x10($sp)
/* 0014B4 9FC014B4 00A08021 */  addu        $s0, $a1, $zero
/* 0014B8 9FC014B8 12200005 */  beqz        $s1, .L9FC014D0
/* 0014BC 9FC014BC AFBF0018 */   sw         $ra, 0x18($sp)
/* 0014C0 9FC014C0 0FF00F65 */  jal         check_untrusted_ptr_range
/* 0014C4 9FC014C4 24060001 */   addiu      $a2, $zero, 1
/* 0014C8 9FC014C8 10400020 */  beqz        $v0, .L9FC0154C
/* 0014CC 9FC014CC 2402FFFF */   addiu      $v0, $zero, -1
.L9FC014D0:
/* 0014D0 9FC014D0 3C039FC1 */  lui         $v1, %hi(D_9FC0F2DC)
/* 0014D4 9FC014D4 8C63F2DC */  lw          $v1, %lo(D_9FC0F2DC)($v1)
/* 0014D8 9FC014D8 24020001 */  addiu       $v0, $zero, 1
/* 0014DC 9FC014DC 14620017 */  bne         $v1, $v0, .L9FC0153C
/* 0014E0 9FC014E0 02202021 */   addu       $a0, $s1, $zero
/* 0014E4 9FC014E4 3C069FC1 */  lui         $a2, %hi(D_9FC0F2E4)
/* 0014E8 9FC014E8 24C6F2E4 */  addiu       $a2, $a2, %lo(D_9FC0F2E4)
/* 0014EC 9FC014EC 02301021 */  addu        $v0, $s1, $s0
/* 0014F0 9FC014F0 16200004 */  bnez        $s1, .L9FC01504
/* 0014F4 9FC014F4 2450FFF0 */   addiu      $s0, $v0, -0x10
/* 0014F8 9FC014F8 3C109FC1 */  lui         $s0, %hi(D_9FC0ED6C)
/* 0014FC 9FC014FC 2610ED6C */  addiu       $s0, $s0, %lo(D_9FC0ED6C)
/* 001500 9FC01500 02003021 */  addu        $a2, $s0, $zero
.L9FC01504:
/* 001504 9FC01504 3C049FC1 */  lui         $a0, %hi(D_9FC0F2C8)
/* 001508 9FC01508 2484F2C8 */  addiu       $a0, $a0, %lo(D_9FC0F2C8)
/* 00150C 9FC0150C 0FF01336 */  jal         aesCipherInit
/* 001510 9FC01510 24050002 */   addiu      $a1, $zero, 2
/* 001514 9FC01514 3C049FC1 */  lui         $a0, %hi(D_9FC0EDD0)
/* 001518 9FC01518 2484EDD0 */  addiu       $a0, $a0, %lo(D_9FC0EDD0)
/* 00151C 9FC0151C 0FF00DFF */  jal         aes_cbc_set_key_iv
/* 001520 9FC01520 02002821 */   addu       $a1, $s0, $zero
/* 001524 9FC01524 3C019FC1 */  lui         $at, %hi(D_9FC0F2E0)
/* 001528 9FC01528 AC20F2E0 */  sw          $zero, %lo(D_9FC0F2E0)($at)
/* 00152C 9FC0152C 3C019FC1 */  lui         $at, %hi(D_9FC0F2DC)
/* 001530 9FC01530 AC20F2DC */  sw          $zero, %lo(D_9FC0F2DC)($at)
/* 001534 9FC01534 0BF00553 */  j           .L9FC0154C
/* 001538 9FC01538 00001021 */   addu       $v0, $zero, $zero
.L9FC0153C:
/* 00153C 9FC0153C 02002821 */  addu        $a1, $s0, $zero
/* 001540 9FC01540 0FF004D3 */  jal         func_9FC0134C
/* 001544 9FC01544 24060001 */   addiu      $a2, $zero, 1
/* 001548 9FC01548 00001021 */  addu        $v0, $zero, $zero
.L9FC0154C:
/* 00154C 9FC0154C 8FBF0018 */  lw          $ra, 0x18($sp)
/* 001550 9FC01550 8FB10014 */  lw          $s1, 0x14($sp)
/* 001554 9FC01554 8FB00010 */  lw          $s0, 0x10($sp)
/* 001558 9FC01558 03E00008 */  jr          $ra
/* 00155C 9FC0155C 27BD0020 */   addiu      $sp, $sp, 0x20
