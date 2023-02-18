## func_9FC035EC
/* 003410 9FC03410 27BDF390 */  addiu       $sp, $sp, -0xc70
/* 003414 9FC03414 AFB50C64 */  sw          $s5, 0xc64($sp)
/* 003418 9FC03418 0080A821 */  addu        $s5, $a0, $zero
/* 00341C 9FC0341C AFB40C60 */  sw          $s4, 0xc60($sp)
/* 003420 9FC03420 00A0A021 */  addu        $s4, $a1, $zero
/* 003424 9FC03424 2A820009 */  slti        $v0, $s4, 9
/* 003428 9FC03428 AFBF0C68 */  sw          $ra, 0xc68($sp)
/* 00342C 9FC0342C AFB30C5C */  sw          $s3, 0xc5c($sp)
/* 003430 9FC03430 AFB20C58 */  sw          $s2, 0xc58($sp)
/* 003434 9FC03434 AFB10C54 */  sw          $s1, 0xc54($sp)
/* 003438 9FC03438 14400003 */  bnez        $v0, .L9FC03448
/* 00343C 9FC0343C AFB00C50 */   sw         $s0, 0xc50($sp)
/* 003440 9FC03440 0BF00D72 */  j           .L9FC035C8
/* 003444 9FC03444 2402FFFF */   addiu      $v0, $zero, -1
.L9FC03448:
/* 003448 9FC03448 00009021 */  addu        $s2, $zero, $zero
.L9FC0344C:
/* 00344C 9FC0344C 00008821 */  addu        $s1, $zero, $zero
.L9FC03450:
/* 003450 9FC03450 00002821 */  addu        $a1, $zero, $zero
/* 003454 9FC03454 00002021 */  addu        $a0, $zero, $zero
.L9FC03458:
/* 003458 9FC03458 00001821 */  addu        $v1, $zero, $zero
/* 00345C 9FC0345C 3C02A430 */  lui         $v0, (0xA430002C >> 16)
.L9FC03460:
/* 003460 9FC03460 3442002C */  ori         $v0, $v0, (0xA430002C & 0xFFFF)
/* 003464 9FC03464 8C420000 */  lw          $v0, ($v0)
/* 003468 9FC03468 30420001 */  andi        $v0, $v0, 1
/* 00346C 9FC0346C 00621004 */  sllv        $v0, $v0, $v1
/* 003470 9FC03470 00821021 */  addu        $v0, $a0, $v0
/* 003474 9FC03474 304400FF */  andi        $a0, $v0, 0xff
/* 003478 9FC03478 24630001 */  addiu       $v1, $v1, 1
/* 00347C 9FC0347C 28620008 */  slti        $v0, $v1, 8
/* 003480 9FC03480 1440FFF7 */  bnez        $v0, .L9FC03460
/* 003484 9FC03484 3C02A430 */   lui        $v0, (0xA430002C >> 16)
/* 003488 9FC03488 27B00070 */  addiu       $s0, $sp, 0x70
/* 00348C 9FC0348C 02051021 */  addu        $v0, $s0, $a1
/* 003490 9FC03490 A0440000 */  sb          $a0, ($v0)
/* 003494 9FC03494 24A50001 */  addiu       $a1, $a1, 1
/* 003498 9FC03498 28A20200 */  slti        $v0, $a1, 0x200
/* 00349C 9FC0349C 1440FFEE */  bnez        $v0, .L9FC03458
/* 0034A0 9FC034A0 00002021 */   addu       $a0, $zero, $zero
/* 0034A4 9FC034A4 0FF019FF */  jal         SHA1Reset
/* 0034A8 9FC034A8 27A40010 */   addiu      $a0, $sp, 0x10
/* 0034AC 9FC034AC 27A40010 */  addiu       $a0, $sp, 0x10
/* 0034B0 9FC034B0 02002821 */  addu        $a1, $s0, $zero
/* 0034B4 9FC034B4 0FF01A12 */  jal         SHA1Input
/* 0034B8 9FC034B8 24060200 */   addiu      $a2, $zero, 0x200
/* 0034BC 9FC034BC 27A40010 */  addiu       $a0, $sp, 0x10
/* 0034C0 9FC034C0 27B00C38 */  addiu       $s0, $sp, 0xc38
/* 0034C4 9FC034C4 0FF01A54 */  jal         SHA1Result
/* 0034C8 9FC034C8 02002821 */   addu       $a1, $s0, $zero
/* 0034CC 9FC034CC 27B30270 */  addiu       $s3, $sp, 0x270
/* 0034D0 9FC034D0 02712021 */  addu        $a0, $s3, $s1
/* 0034D4 9FC034D4 02002821 */  addu        $a1, $s0, $zero
/* 0034D8 9FC034D8 0FF00EA1 */  jal         memcpy
/* 0034DC 9FC034DC 24060014 */   addiu      $a2, $zero, 0x14
/* 0034E0 9FC034E0 26520001 */  addiu       $s2, $s2, 1
/* 0034E4 9FC034E4 2A42007D */  slti        $v0, $s2, 0x7d
/* 0034E8 9FC034E8 1440FFD9 */  bnez        $v0, .L9FC03450
/* 0034EC 9FC034EC 26310014 */   addiu      $s1, $s1, 0x14
/* 0034F0 9FC034F0 02602021 */  addu        $a0, $s3, $zero
/* 0034F4 9FC034F4 0FF011F3 */  jal         func_9FC047CC
/* 0034F8 9FC034F8 240509C4 */   addiu      $a1, $zero, 0x9c4
/* 0034FC 9FC034FC 2403FFFF */  addiu       $v1, $zero, -1
/* 003500 9FC03500 1043FFD2 */  beq         $v0, $v1, .L9FC0344C
/* 003504 9FC03504 00009021 */   addu       $s2, $zero, $zero
/* 003508 9FC03508 0FF019FF */  jal         SHA1Reset
/* 00350C 9FC0350C 27A40010 */   addiu      $a0, $sp, 0x10
/* 003510 9FC03510 27A40010 */  addiu       $a0, $sp, 0x10
/* 003514 9FC03514 93A60270 */  lbu         $a2, 0x270($sp)
/* 003518 9FC03518 02602821 */  addu        $a1, $s3, $zero
/* 00351C 9FC0351C 0FF01A12 */  jal         SHA1Input
/* 003520 9FC03520 24C60001 */   addiu      $a2, $a2, 1
/* 003524 9FC03524 27A40010 */  addiu       $a0, $sp, 0x10
/* 003528 9FC03528 3C059FC1 */  lui         $a1, %hi(virage2_offset)
/* 00352C 9FC0352C 8CA5EBC0 */  lw          $a1, %lo(virage2_offset)($a1)
/* 003530 9FC03530 24060010 */  addiu       $a2, $zero, 0x10
/* 003534 9FC03534 0FF01A12 */  jal         SHA1Input
/* 003538 9FC03538 24A500D8 */   addiu      $a1, $a1, 0xd8
/* 00353C 9FC0353C 27A40010 */  addiu       $a0, $sp, 0x10
/* 003540 9FC03540 3C059FC1 */  lui         $a1, %hi(virage2_offset)
/* 003544 9FC03544 8CA5EBC0 */  lw          $a1, %lo(virage2_offset)($a1)
/* 003548 9FC03548 24060010 */  addiu       $a2, $zero, 0x10
/* 00354C 9FC0354C 0FF01A12 */  jal         SHA1Input
/* 003550 9FC03550 24A500E8 */   addiu      $a1, $a1, 0xe8
/* 003554 9FC03554 27A40010 */  addiu       $a0, $sp, 0x10
/* 003558 9FC03558 02008821 */  addu        $s1, $s0, $zero
/* 00355C 9FC0355C 0FF01A54 */  jal         SHA1Result
/* 003560 9FC03560 02202821 */   addu       $a1, $s1, $zero
/* 003564 9FC03564 2A820005 */  slti        $v0, $s4, 5
/* 003568 9FC03568 14400012 */  bnez        $v0, .L9FC035B4
/* 00356C 9FC0356C 02A02021 */   addu       $a0, $s5, $zero
/* 003570 9FC03570 02202821 */  addu        $a1, $s1, $zero
/* 003574 9FC03574 0FF00EAB */  jal         wordcopy
/* 003578 9FC03578 24060004 */   addiu      $a2, $zero, 4
/* 00357C 9FC0357C 0FF019FF */  jal         SHA1Reset
/* 003580 9FC03580 27A40010 */   addiu      $a0, $sp, 0x10
/* 003584 9FC03584 27A40010 */  addiu       $a0, $sp, 0x10
/* 003588 9FC03588 93A60271 */  lbu         $a2, 0x271($sp)
/* 00358C 9FC0358C 02602821 */  addu        $a1, $s3, $zero
/* 003590 9FC03590 0FF01A12 */  jal         SHA1Input
/* 003594 9FC03594 24C60001 */   addiu      $a2, $a2, 1
/* 003598 9FC03598 27A40010 */  addiu       $a0, $sp, 0x10
/* 00359C 9FC0359C 0FF01A54 */  jal         SHA1Result
/* 0035A0 9FC035A0 02202821 */   addu       $a1, $s1, $zero
/* 0035A4 9FC035A4 26A40010 */  addiu       $a0, $s5, 0x10
/* 0035A8 9FC035A8 02202821 */  addu        $a1, $s1, $zero
/* 0035AC 9FC035AC 0BF00D6F */  j           .L9FC035BC
/* 0035B0 9FC035B0 2686FFFC */   addiu      $a2, $s4, -4
.L9FC035B4:
/* 0035B4 9FC035B4 02002821 */  addu        $a1, $s0, $zero
/* 0035B8 9FC035B8 02803021 */  addu        $a2, $s4, $zero
.L9FC035BC:
/* 0035BC 9FC035BC 0FF00EAB */  jal         wordcopy
/* 0035C0 9FC035C0 00000000 */   nop
/* 0035C4 9FC035C4 00001021 */  addu        $v0, $zero, $zero
.L9FC035C8:
/* 0035C8 9FC035C8 8FBF0C68 */  lw          $ra, 0xc68($sp)
/* 0035CC 9FC035CC 8FB50C64 */  lw          $s5, 0xc64($sp)
/* 0035D0 9FC035D0 8FB40C60 */  lw          $s4, 0xc60($sp)
/* 0035D4 9FC035D4 8FB30C5C */  lw          $s3, 0xc5c($sp)
/* 0035D8 9FC035D8 8FB20C58 */  lw          $s2, 0xc58($sp)
/* 0035DC 9FC035DC 8FB10C54 */  lw          $s1, 0xc54($sp)
/* 0035E0 9FC035E0 8FB00C50 */  lw          $s0, 0xc50($sp)
/* 0035E4 9FC035E4 03E00008 */  jr          $ra
/* 0035E8 9FC035E8 27BD0C70 */   addiu      $sp, $sp, 0xc70
