## set_virage01_selector
## write_virage_data
/* 00425C 9FC0425C 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 004260 9FC04260 AFB20018 */  sw          $s2, 0x18($sp)
/* 004264 9FC04264 00809021 */  addu        $s2, $a0, $zero
/* 004268 9FC04268 AFB10014 */  sw          $s1, 0x14($sp)
/* 00426C 9FC0426C 36512000 */  ori         $s1, $s2, 0x2000
/* 004270 9FC04270 AFBF0020 */  sw          $ra, 0x20($sp)
/* 004274 9FC04274 AFB3001C */  sw          $s3, 0x1c($sp)
/* 004278 9FC04278 0FF01088 */  jal         func_9FC04220
/* 00427C 9FC0427C AFB00010 */   sw         $s0, 0x10($sp)
/* 004280 9FC04280 3410ABF2 */  ori         $s0, $zero, 0xabf2
/* 004284 9FC04284 14400002 */  bnez        $v0, .L9FC04290
/* 004288 9FC04288 0202001A */   div        $zero, $s0, $v0
/* 00428C 9FC0428C 0007000D */  break       7
.L9FC04290:
/* 004290 9FC04290 2401FFFF */  addiu       $at, $zero, -1
/* 004294 9FC04294 14410004 */  bne         $v0, $at, .L9FC042A8
/* 004298 9FC04298 3C018000 */   lui        $at, 0x8000
/* 00429C 9FC0429C 16010002 */  bne         $s0, $at, .L9FC042A8
/* 0042A0 9FC042A0 00000000 */   nop
/* 0042A4 9FC042A4 0006000D */  break       6
.L9FC042A8:
/* 0042A8 9FC042A8 00008012 */  mflo        $s0
/* 0042AC 9FC042AC 3C13A000 */  lui         $s3, 0xa000
/* 0042B0 9FC042B0 02338825 */  or          $s1, $s1, $s3
/* 0042B4 9FC042B4 3C020300 */  lui         $v0, 0x300
/* 0042B8 9FC042B8 AE220000 */  sw          $v0, ($s1)
/* 0042BC 9FC042BC 0FF00FC4 */  jal         delay
/* 0042C0 9FC042C0 26040064 */   addiu      $a0, $s0, 0x64
/* 0042C4 9FC042C4 0FF00FC4 */  jal         delay
/* 0042C8 9FC042C8 26040190 */   addiu      $a0, $s0, 0x190
/* 0042CC 9FC042CC 02539025 */  or          $s2, $s2, $s3
/* 0042D0 9FC042D0 8E420000 */  lw          $v0, ($s2)
/* 0042D4 9FC042D4 3C034000 */  lui         $v1, 0x4000
/* 0042D8 9FC042D8 00431024 */  and         $v0, $v0, $v1
/* 0042DC 9FC042DC 14400002 */  bnez        $v0, .L9FC042E8
/* 0042E0 9FC042E0 00001021 */   addu       $v0, $zero, $zero
/* 0042E4 9FC042E4 2402FFFF */  addiu       $v0, $zero, -1
.L9FC042E8:
/* 0042E8 9FC042E8 8FBF0020 */  lw          $ra, 0x20($sp)
/* 0042EC 9FC042EC 8FB3001C */  lw          $s3, 0x1c($sp)
/* 0042F0 9FC042F0 8FB20018 */  lw          $s2, 0x18($sp)
/* 0042F4 9FC042F4 8FB10014 */  lw          $s1, 0x14($sp)
/* 0042F8 9FC042F8 8FB00010 */  lw          $s0, 0x10($sp)
/* 0042FC 9FC042FC 03E00008 */  jr          $ra
/* 004300 9FC04300 27BD0028 */   addiu      $sp, $sp, 0x28
