## poly_elliptic_mul_slow
/* 00B5C8 9FC0B5C8 27BDFF98 */  addiu       $sp, $sp, -0x68
/* 00B5CC 9FC0B5CC AFB3005C */  sw          $s3, 0x5c($sp)
/* 00B5D0 9FC0B5D0 00809821 */  addu        $s3, $a0, $zero
/* 00B5D4 9FC0B5D4 AFB00050 */  sw          $s0, 0x50($sp)
/* 00B5D8 9FC0B5D8 00A08021 */  addu        $s0, $a1, $zero
/* 00B5DC 9FC0B5DC 02002021 */  addu        $a0, $s0, $zero
/* 00B5E0 9FC0B5E0 27A50010 */  addiu       $a1, $sp, 0x10
/* 00B5E4 9FC0B5E4 AFB10054 */  sw          $s1, 0x54($sp)
/* 00B5E8 9FC0B5E8 00C08821 */  addu        $s1, $a2, $zero
/* 00B5EC 9FC0B5EC AFB20058 */  sw          $s2, 0x58($sp)
/* 00B5F0 9FC0B5F0 AFBF0060 */  sw          $ra, 0x60($sp)
/* 00B5F4 9FC0B5F4 0FF01F08 */  jal         copy
/* 00B5F8 9FC0B5F8 00E09021 */   addu       $s2, $a3, $zero
/* 00B5FC 9FC0B5FC 0FF01EE0 */  jal         null
/* 00B600 9FC0B600 27A40030 */   addiu      $a0, $sp, 0x30
/* 00B604 9FC0B604 00004021 */  addu        $t0, $zero, $zero
/* 00B608 9FC0B608 3C070001 */  lui         $a3, 1
/* 00B60C 9FC0B60C 02003021 */  addu        $a2, $s0, $zero
.L9FC0B610:
/* 00B610 9FC0B610 00E02821 */  addu        $a1, $a3, $zero
/* 00B614 9FC0B614 3C020001 */  lui         $v0, 1
/* 00B618 9FC0B618 00E23821 */  addu        $a3, $a3, $v0
/* 00B61C 9FC0B61C 8CC40000 */  lw          $a0, ($a2)
/* 00B620 9FC0B620 24C60004 */  addiu       $a2, $a2, 4
/* 00B624 9FC0B624 00081880 */  sll         $v1, $t0, 2
/* 00B628 9FC0B628 00054403 */  sra         $t0, $a1, 0x10
/* 00B62C 9FC0B62C 02031021 */  addu        $v0, $s0, $v1
/* 00B630 9FC0B630 8C420020 */  lw          $v0, 0x20($v0)
/* 00B634 9FC0B634 03A31821 */  addu        $v1, $sp, $v1
/* 00B638 9FC0B638 00822026 */  xor         $a0, $a0, $v0
/* 00B63C 9FC0B63C 3102FFFF */  andi        $v0, $t0, 0xffff
/* 00B640 9FC0B640 2C420008 */  sltiu       $v0, $v0, 8
/* 00B644 9FC0B644 1440FFF2 */  bnez        $v0, .L9FC0B610
/* 00B648 9FC0B648 AC640030 */   sw         $a0, 0x30($v1)
/* 00B64C 9FC0B64C 02602021 */  addu        $a0, $s3, $zero
/* 00B650 9FC0B650 27A50010 */  addiu       $a1, $sp, 0x10
/* 00B654 9FC0B654 02203021 */  addu        $a2, $s1, $zero
/* 00B658 9FC0B658 0FF02C1B */  jal         poly_elliptic_sum
/* 00B65C 9FC0B65C 02403821 */   addu       $a3, $s2, $zero
/* 00B660 9FC0B660 8FBF0060 */  lw          $ra, 0x60($sp)
/* 00B664 9FC0B664 8FB3005C */  lw          $s3, 0x5c($sp)
/* 00B668 9FC0B668 8FB20058 */  lw          $s2, 0x58($sp)
/* 00B66C 9FC0B66C 8FB10054 */  lw          $s1, 0x54($sp)
/* 00B670 9FC0B670 8FB00050 */  lw          $s0, 0x50($sp)
/* 00B674 9FC0B674 03E00008 */  jr          $ra
/* 00B678 9FC0B678 27BD0068 */   addiu      $sp, $sp, 0x68
