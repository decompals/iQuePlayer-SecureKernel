## func_9FC020C4
/* 001FBC 9FC01FBC 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 001FC0 9FC01FC0 AFB40020 */  sw          $s4, 0x20($sp)
/* 001FC4 9FC01FC4 8FB40038 */  lw          $s4, 0x38($sp)
/* 001FC8 9FC01FC8 AFB10014 */  sw          $s1, 0x14($sp)
/* 001FCC 9FC01FCC 00A08821 */  addu        $s1, $a1, $zero
/* 001FD0 9FC01FD0 AFB3001C */  sw          $s3, 0x1c($sp)
/* 001FD4 9FC01FD4 8FB30040 */  lw          $s3, 0x40($sp)
/* 001FD8 9FC01FD8 AFB00010 */  sw          $s0, 0x10($sp)
/* 001FDC 9FC01FDC 00C08021 */  addu        $s0, $a2, $zero
/* 001FE0 9FC01FE0 AFB20018 */  sw          $s2, 0x18($sp)
/* 001FE4 9FC01FE4 AFBF0024 */  sw          $ra, 0x24($sp)
/* 001FE8 9FC01FE8 0FF00E21 */  jal         card_read_block
/* 001FEC 9FC01FEC 00E09021 */   addu       $s2, $a3, $zero
/* 001FF0 9FC01FF0 0440002C */  bltz        $v0, .L9FC020A4
/* 001FF4 9FC01FF4 02202021 */   addu       $a0, $s1, $zero
/* 001FF8 9FC01FF8 0FF00E13 */  jal         func_9FC0384C
/* 001FFC 9FC01FFC 02002821 */   addu       $a1, $s0, $zero
/* 002000 9FC02000 3C02A460 */  lui         $v0, (0xA4600050 >> 16)
.L9FC02004:
/* 002004 9FC02004 34420050 */  ori         $v0, $v0, (0xA4600050 & 0xFFFF)
/* 002008 9FC02008 8C420000 */  lw          $v0, ($v0)
/* 00200C 9FC0200C 0442FFFD */  bltzl       $v0, .L9FC02004
/* 002010 9FC02010 3C02A460 */   lui        $v0, (0xA4600050 >> 16)
/* 002014 9FC02014 12600013 */  beqz        $s3, .L9FC02064
/* 002018 9FC02018 24050200 */   addiu      $a1, $zero, 0x200
/* 00201C 9FC0201C 12200003 */  beqz        $s1, .L9FC0202C
/* 002020 9FC02020 3C10A461 */   lui        $s0, (0xA4610008 >> 16)
/* 002024 9FC02024 0BF0080C */  j           .L9FC02030
/* 002028 9FC02028 36100208 */   ori        $s0, $s0, (0xA4610208 & 0xFFFF)
.L9FC0202C:
/* 00202C 9FC0202C 36100008 */  ori         $s0, $s0, (0xA4610008 & 0xFFFF)
.L9FC02030:
/* 002030 9FC02030 8E040000 */  lw          $a0, ($s0)
/* 002034 9FC02034 00002821 */  addu        $a1, $zero, $zero
/* 002038 9FC02038 0FF00F65 */  jal         check_untrusted_ptr_range
/* 00203C 9FC0203C 24060004 */   addiu      $a2, $zero, 4
/* 002040 9FC02040 14400003 */  bnez        $v0, .L9FC02050
/* 002044 9FC02044 3C021FFF */   lui        $v0, (0x1FFFFFFF >> 16)
/* 002048 9FC02048 0BF00829 */  j           .L9FC020A4
/* 00204C 9FC0204C 2402FFFF */   addiu      $v0, $zero, -1
.L9FC02050:
/* 002050 9FC02050 8E030000 */  lw          $v1, ($s0)
/* 002054 9FC02054 3442FFFF */  ori         $v0, $v0, (0x1FFFFFFF & 0xFFFF)
/* 002058 9FC02058 00621824 */  and         $v1, $v1, $v0
/* 00205C 9FC0205C AE430000 */  sw          $v1, ($s2)
/* 002060 9FC02060 24050200 */  addiu       $a1, $zero, 0x200
.L9FC02064:
/* 002064 9FC02064 8E440000 */  lw          $a0, ($s2)
/* 002068 9FC02068 3C108000 */  lui         $s0, 0x8000
/* 00206C 9FC0206C 0FF002A4 */  jal         osInvalDCache
/* 002070 9FC02070 00902025 */   or         $a0, $a0, $s0
/* 002074 9FC02074 02202021 */  addu        $a0, $s1, $zero
/* 002078 9FC02078 02803021 */  addu        $a2, $s4, $zero
/* 00207C 9FC0207C 8E450000 */  lw          $a1, ($s2)
/* 002080 9FC02080 0FF00DEA */  jal         dma_from_cart
/* 002084 9FC02084 00003821 */   addu       $a3, $zero, $zero
/* 002088 9FC02088 04400006 */  bltz        $v0, .L9FC020A4
/* 00208C 9FC0208C 02803021 */   addu       $a2, $s4, $zero
/* 002090 9FC02090 8E450000 */  lw          $a1, ($s2)
/* 002094 9FC02094 8FA4003C */  lw          $a0, 0x3c($sp)
/* 002098 9FC02098 0FF01A12 */  jal         SHA1Input
/* 00209C 9FC0209C 00B02825 */   or         $a1, $a1, $s0
/* 0020A0 9FC020A0 00001021 */  addu        $v0, $zero, $zero
.L9FC020A4:
/* 0020A4 9FC020A4 8FBF0024 */  lw          $ra, 0x24($sp)
/* 0020A8 9FC020A8 8FB40020 */  lw          $s4, 0x20($sp)
/* 0020AC 9FC020AC 8FB3001C */  lw          $s3, 0x1c($sp)
/* 0020B0 9FC020B0 8FB20018 */  lw          $s2, 0x18($sp)
/* 0020B4 9FC020B4 8FB10014 */  lw          $s1, 0x14($sp)
/* 0020B8 9FC020B8 8FB00010 */  lw          $s0, 0x10($sp)
/* 0020BC 9FC020BC 03E00008 */  jr          $ra
/* 0020C0 9FC020C0 27BD0028 */   addiu      $sp, $sp, 0x28
