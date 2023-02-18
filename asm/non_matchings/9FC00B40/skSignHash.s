/* 001660 9FC01660 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 001664 9FC01664 AFB00018 */  sw          $s0, 0x18($sp)
/* 001668 9FC01668 00808021 */  addu        $s0, $a0, $zero
/* 00166C 9FC0166C AFB1001C */  sw          $s1, 0x1c($sp)
/* 001670 9FC01670 00A08821 */  addu        $s1, $a1, $zero
/* 001674 9FC01674 24050014 */  addiu       $a1, $zero, 0x14
/* 001678 9FC01678 AFBF0020 */  sw          $ra, 0x20($sp)
/* 00167C 9FC0167C 0FF00F65 */  jal         check_untrusted_ptr_range
/* 001680 9FC01680 24060004 */   addiu      $a2, $zero, 4
/* 001684 9FC01684 10400010 */  beqz        $v0, .L9FC016C8
/* 001688 9FC01688 02202021 */   addu       $a0, $s1, $zero
/* 00168C 9FC0168C 24050040 */  addiu       $a1, $zero, 0x40
/* 001690 9FC01690 0FF00F65 */  jal         check_untrusted_ptr_range
/* 001694 9FC01694 24060004 */   addiu      $a2, $zero, 4
/* 001698 9FC01698 1040000B */  beqz        $v0, .L9FC016C8
/* 00169C 9FC0169C 02002021 */   addu       $a0, $s0, $zero
/* 0016A0 9FC016A0 24050014 */  addiu       $a1, $zero, 0x14
/* 0016A4 9FC016A4 24020001 */  addiu       $v0, $zero, 1
/* 0016A8 9FC016A8 3C069FC1 */  lui         $a2, %hi(virage2_offset)
/* 0016AC 9FC016AC 8CC6EBC0 */  lw          $a2, %lo(virage2_offset)($a2)
/* 0016B0 9FC016B0 02203821 */  addu        $a3, $s1, $zero
/* 0016B4 9FC016B4 AFA20010 */  sw          $v0, 0x10($sp)
/* 0016B8 9FC016B8 0FF00DA5 */  jal         func_9FC03694
/* 0016BC 9FC016BC 24C60098 */   addiu      $a2, $a2, 0x98
/* 0016C0 9FC016C0 0BF005B3 */  j           .L9FC016CC
/* 0016C4 9FC016C4 00001021 */   addu       $v0, $zero, $zero
.L9FC016C8:
/* 0016C8 9FC016C8 2402FFFF */  addiu       $v0, $zero, -1
.L9FC016CC:
/* 0016CC 9FC016CC 8FBF0020 */  lw          $ra, 0x20($sp)
/* 0016D0 9FC016D0 8FB1001C */  lw          $s1, 0x1c($sp)
/* 0016D4 9FC016D4 8FB00018 */  lw          $s0, 0x18($sp)
/* 0016D8 9FC016D8 03E00008 */  jr          $ra
/* 0016DC 9FC016DC 27BD0028 */   addiu      $sp, $sp, 0x28
