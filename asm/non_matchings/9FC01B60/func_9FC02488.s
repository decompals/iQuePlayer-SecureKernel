## write_virage2
/* 002488 9FC02488 27BDFF78 */  addiu       $sp, $sp, -0x88
/* 00248C 9FC0248C AFB3007C */  sw          $s3, 0x7c($sp)
/* 002490 9FC02490 00009821 */  addu        $s3, $zero, $zero
/* 002494 9FC02494 AFB40080 */  sw          $s4, 0x80($sp)
/* 002498 9FC02498 0080A021 */  addu        $s4, $a0, $zero
/* 00249C 9FC0249C 27A40010 */  addiu       $a0, $sp, 0x10
/* 0024A0 9FC024A0 AFBF0084 */  sw          $ra, 0x84($sp)
/* 0024A4 9FC024A4 AFB20078 */  sw          $s2, 0x78($sp)
/* 0024A8 9FC024A8 AFB10074 */  sw          $s1, 0x74($sp)
/* 0024AC 9FC024AC 0FF019FF */  jal         SHA1Reset
/* 0024B0 9FC024B0 AFB00070 */   sw         $s0, 0x70($sp)
/* 0024B4 9FC024B4 00008821 */  addu        $s1, $zero, $zero
/* 0024B8 9FC024B8 24120080 */  addiu       $s2, $zero, 0x80
.L9FC024BC:
/* 0024BC 9FC024BC 0FF006E2 */  jal         func_9FC01B88
/* 0024C0 9FC024C0 02202021 */   addu       $a0, $s1, $zero
/* 0024C4 9FC024C4 00408821 */  addu        $s1, $v0, $zero
/* 0024C8 9FC024C8 06200027 */  bltz        $s1, .L9FC02568
/* 0024CC 9FC024CC 26730001 */   addiu      $s3, $s3, 1
/* 0024D0 9FC024D0 00008021 */  addu        $s0, $zero, $zero
.L9FC024D4:
/* 0024D4 9FC024D4 16000006 */  bnez        $s0, .L9FC024F0
/* 0024D8 9FC024D8 00112140 */   sll        $a0, $s1, 5
/* 0024DC 9FC024DC 24020001 */  addiu       $v0, $zero, 1
/* 0024E0 9FC024E0 16620008 */  bne         $s3, $v0, .L9FC02504
/* 0024E4 9FC024E4 00002021 */   addu       $a0, $zero, $zero
/* 0024E8 9FC024E8 0BF00942 */  j           .L9FC02508
/* 0024EC 9FC024EC 00002821 */   addu       $a1, $zero, $zero
.L9FC024F0:
/* 0024F0 9FC024F0 00902021 */  addu        $a0, $a0, $s0
/* 0024F4 9FC024F4 0FF00E21 */  jal         card_read_block
/* 0024F8 9FC024F8 00002821 */   addu       $a1, $zero, $zero
/* 0024FC 9FC024FC 0440001A */  bltz        $v0, .L9FC02568
/* 002500 9FC02500 00002021 */   addu       $a0, $zero, $zero
.L9FC02504:
/* 002504 9FC02504 24050001 */  addiu       $a1, $zero, 1
.L9FC02508:
/* 002508 9FC02508 0FF00E13 */  jal         func_9FC0384C
/* 00250C 9FC0250C 00000000 */   nop
/* 002510 9FC02510 3C02A460 */  lui         $v0, (0xA4600050 >> 16)
.L9FC02514:
/* 002514 9FC02514 34420050 */  ori         $v0, $v0, (0xA4600050 & 0xFFFF)
/* 002518 9FC02518 8C420000 */  lw          $v0, ($v0)
/* 00251C 9FC0251C 0440FFFD */  bltz        $v0, .L9FC02514
/* 002520 9FC02520 3C02A460 */   lui        $v0, (0xA4600050 >> 16)
/* 002524 9FC02524 27A40010 */  addiu       $a0, $sp, 0x10
/* 002528 9FC02528 3C05A461 */  lui         $a1, 0xa461
/* 00252C 9FC0252C 0FF01A12 */  jal         SHA1Input
/* 002530 9FC02530 24060200 */   addiu      $a2, $zero, 0x200
/* 002534 9FC02534 2652FFFF */  addiu       $s2, $s2, -1
/* 002538 9FC02538 12400005 */  beqz        $s2, .L9FC02550
/* 00253C 9FC0253C 00000000 */   nop
/* 002540 9FC02540 26100001 */  addiu       $s0, $s0, 1
/* 002544 9FC02544 2A020020 */  slti        $v0, $s0, 0x20
/* 002548 9FC02548 1440FFE2 */  bnez        $v0, .L9FC024D4
/* 00254C 9FC0254C 00000000 */   nop
.L9FC02550:
/* 002550 9FC02550 1E40FFDA */  bgtz        $s2, .L9FC024BC
/* 002554 9FC02554 26310001 */   addiu      $s1, $s1, 1
/* 002558 9FC02558 27A40010 */  addiu       $a0, $sp, 0x10
/* 00255C 9FC0255C 0FF01A54 */  jal         SHA1Result
/* 002560 9FC02560 02802821 */   addu       $a1, $s4, $zero
/* 002564 9FC02564 00001021 */  addu        $v0, $zero, $zero
.L9FC02568:
/* 002568 9FC02568 8FBF0084 */  lw          $ra, 0x84($sp)
/* 00256C 9FC0256C 8FB40080 */  lw          $s4, 0x80($sp)
/* 002570 9FC02570 8FB3007C */  lw          $s3, 0x7c($sp)
/* 002574 9FC02574 8FB20078 */  lw          $s2, 0x78($sp)
/* 002578 9FC02578 8FB10074 */  lw          $s1, 0x74($sp)
/* 00257C 9FC0257C 8FB00070 */  lw          $s0, 0x70($sp)
/* 002580 9FC02580 03E00008 */  jr          $ra
/* 002584 9FC02584 27BD0088 */   addiu      $sp, $sp, 0x88
