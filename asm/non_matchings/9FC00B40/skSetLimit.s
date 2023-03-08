/* 0019F8 9FC019F8 3084FFFF */  andi        $a0, $a0, 0xffff
/* 0019FC 9FC019FC 3C039FC1 */  lui         $v1, %hi(ticketHead + 0x60)
/* 001A00 9FC01A00 2463EF40 */  addiu       $v1, $v1, %lo(ticketHead + 0x60)
/* 001A04 9FC01A04 90620000 */  lbu         $v0, ($v1)
/* 001A08 9FC01A08 14400003 */  bnez        $v0, .L9FC01A18
/* 001A0C 9FC01A0C 30A5FFFF */   andi       $a1, $a1, 0xffff
/* 001A10 9FC01A10 03E00008 */  jr          $ra
/* 001A14 9FC01A14 2402FFFF */   addiu      $v0, $zero, -1
.L9FC01A18:
/* 001A18 9FC01A18 8462FFA4 */  lh          $v0, -0x5c($v1)
/* 001A1C 9FC01A1C 0443000B */  bgezl       $v0, .L9FC01A4C
/* 001A20 9FC01A20 A465FFA6 */   sh         $a1, -0x5a($v1)
/* 001A24 9FC01A24 9462FFA6 */  lhu         $v0, -0x5a($v1)
/* 001A28 9FC01A28 2C420003 */  sltiu       $v0, $v0, 3
/* 001A2C 9FC01A2C 50400007 */  beql        $v0, $zero, .L9FC01A4C
/* 001A30 9FC01A30 A465FFA6 */   sh         $a1, -0x5a($v1)
/* 001A34 9FC01A34 9462FFA8 */  lhu         $v0, -0x58($v1)
/* 001A38 9FC01A38 0082102B */  sltu        $v0, $a0, $v0
/* 001A3C 9FC01A3C 10400004 */  beqz        $v0, .L9FC01A50
/* 001A40 9FC01A40 00000000 */   nop
/* 001A44 9FC01A44 0BF00694 */  j           .L9FC01A50
/* 001A48 9FC01A48 A464FFA8 */   sh         $a0, -0x58($v1)
.L9FC01A4C:
/* 001A4C 9FC01A4C A464FFA8 */  sh          $a0, -0x58($v1)
.L9FC01A50:
/* 001A50 9FC01A50 03E00008 */  jr          $ra
/* 001A54 9FC01A54 00001021 */   addu       $v0, $zero, $zero
