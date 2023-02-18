## bsl_compute_ecc_sig
## bsl_verify_ecc_sig
/* 0094E4 9FC094E4 27BDFFC0 */  addiu       $sp, $sp, -0x40
/* 0094E8 9FC094E8 AFB10034 */  sw          $s1, 0x34($sp)
/* 0094EC 9FC094EC 00808821 */  addu        $s1, $a0, $zero
/* 0094F0 9FC094F0 27A40010 */  addiu       $a0, $sp, 0x10
/* 0094F4 9FC094F4 AFB20038 */  sw          $s2, 0x38($sp)
/* 0094F8 9FC094F8 00059142 */  srl         $s2, $a1, 5
/* 0094FC 9FC094FC 24050008 */  addiu       $a1, $zero, 8
/* 009500 9FC09500 AFBF003C */  sw          $ra, 0x3c($sp)
/* 009504 9FC09504 0FF01BD0 */  jal         bigint_zero
/* 009508 9FC09508 AFB00030 */   sw         $s0, 0x30($sp)
/* 00950C 9FC0950C 0FF02768 */  jal         Init_233_bit
/* 009510 9FC09510 263000A4 */   addiu      $s0, $s1, 0xa4
/* 009514 9FC09514 3C080013 */  lui         $t0, (0x0013E974 >> 16)
/* 009518 9FC09518 3508E974 */  ori         $t0, $t0, (0x0013E974 & 0xFFFF)
/* 00951C 9FC0951C 3C07E72F */  lui         $a3, (0xE72F8A69 >> 16)
/* 009520 9FC09520 34E78A69 */  ori         $a3, $a3, (0xE72F8A69 & 0xFFFF)
/* 009524 9FC09524 3C062203 */  lui         $a2, (0x22031D26 >> 16)
/* 009528 9FC09528 34C61D26 */  ori         $a2, $a2, (0x22031D26 & 0xFFFF)
/* 00952C 9FC0952C 3C0303CF */  lui         $v1, (0x03CFE0D7 >> 16)
/* 009530 9FC09530 3463E0D7 */  ori         $v1, $v1, (0x03CFE0D7 & 0xFFFF)
/* 009534 9FC09534 27A40010 */  addiu       $a0, $sp, 0x10
/* 009538 9FC09538 26250084 */  addiu       $a1, $s1, 0x84
/* 00953C 9FC0953C 24020100 */  addiu       $v0, $zero, 0x100
/* 009540 9FC09540 AFA60014 */  sw          $a2, 0x14($sp)
/* 009544 9FC09544 24060008 */  addiu       $a2, $zero, 8
/* 009548 9FC09548 AFA2002C */  sw          $v0, 0x2c($sp)
/* 00954C 9FC0954C AFA00028 */  sw          $zero, 0x28($sp)
/* 009550 9FC09550 AFA00024 */  sw          $zero, 0x24($sp)
/* 009554 9FC09554 AFA00020 */  sw          $zero, 0x20($sp)
/* 009558 9FC09558 AFA8001C */  sw          $t0, 0x1c($sp)
/* 00955C 9FC0955C AFA70018 */  sw          $a3, 0x18($sp)
/* 009560 9FC09560 0FF01E5A */  jal         bigint_to_field
/* 009564 9FC09564 AFA30010 */   sw         $v1, 0x10($sp)
/* 009568 9FC09568 0FF01EE0 */  jal         null
/* 00956C 9FC0956C 02002021 */   addu       $a0, $s0, $zero
/* 009570 9FC09570 3C049FC1 */  lui         $a0, %hi(named_point)
/* 009574 9FC09574 2484F790 */  addiu       $a0, $a0, %lo(named_point)
/* 009578 9FC09578 26250044 */  addiu       $a1, $s1, 0x44
/* 00957C 9FC0957C 00129080 */  sll         $s2, $s2, 2
/* 009580 9FC09580 02128021 */  addu        $s0, $s0, $s2
/* 009584 9FC09584 24020002 */  addiu       $v0, $zero, 2
/* 009588 9FC09588 0FF02C0C */  jal         copy_point
/* 00958C 9FC0958C AE020000 */   sw         $v0, ($s0)
/* 009590 9FC09590 3C109FC1 */  lui         $s0, %hi(named_curve + 4)
/* 009594 9FC09594 2610F350 */  addiu       $s0, $s0, %lo(named_curve + 4)
/* 009598 9FC09598 02002021 */  addu        $a0, $s0, $zero
/* 00959C 9FC0959C 0FF01F08 */  jal         copy
/* 0095A0 9FC095A0 26250004 */   addiu      $a1, $s1, 4
/* 0095A4 9FC095A4 26040020 */  addiu       $a0, $s0, 0x20
/* 0095A8 9FC095A8 0FF01F08 */  jal         copy
/* 0095AC 9FC095AC 26250024 */   addiu      $a1, $s1, 0x24
/* 0095B0 9FC095B0 9602FFFC */  lhu         $v0, -4($s0)
/* 0095B4 9FC095B4 8FBF003C */  lw          $ra, 0x3c($sp)
/* 0095B8 9FC095B8 8FB20038 */  lw          $s2, 0x38($sp)
/* 0095BC 9FC095BC 8FB00030 */  lw          $s0, 0x30($sp)
/* 0095C0 9FC095C0 A6220000 */  sh          $v0, ($s1)
/* 0095C4 9FC095C4 8FB10034 */  lw          $s1, 0x34($sp)
/* 0095C8 9FC095C8 03E00008 */  jr          $ra
/* 0095CC 9FC095CC 27BD0040 */   addiu      $sp, $sp, 0x40
