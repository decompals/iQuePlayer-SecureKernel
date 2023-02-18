## poly_DSA_verify
/* 00BB24 9FC0BB24 27BDFC70 */  addiu       $sp, $sp, -0x390
/* 00BB28 9FC0BB28 AFB50384 */  sw          $s5, 0x384($sp)
/* 00BB2C 9FC0BB2C 0080A821 */  addu        $s5, $a0, $zero
/* 00BB30 9FC0BB30 AFB20378 */  sw          $s2, 0x378($sp)
/* 00BB34 9FC0BB34 00A09021 */  addu        $s2, $a1, $zero
/* 00BB38 9FC0BB38 27A50350 */  addiu       $a1, $sp, 0x350
/* 00BB3C 9FC0BB3C AFB3037C */  sw          $s3, 0x37c($sp)
/* 00BB40 9FC0BB40 00C09821 */  addu        $s3, $a2, $zero
/* 00BB44 9FC0BB44 AFB40380 */  sw          $s4, 0x380($sp)
/* 00BB48 9FC0BB48 00E0A021 */  addu        $s4, $a3, $zero
/* 00BB4C 9FC0BB4C AFBF0388 */  sw          $ra, 0x388($sp)
/* 00BB50 9FC0BB50 AFB10374 */  sw          $s1, 0x374($sp)
/* 00BB54 9FC0BB54 0FF01F08 */  jal         copy
/* 00BB58 9FC0BB58 AFB00370 */   sw         $s0, 0x370($sp)
/* 00BB5C 9FC0BB5C 00001821 */  addu        $v1, $zero, $zero
/* 00BB60 9FC0BB60 00008821 */  addu        $s1, $zero, $zero
/* 00BB64 9FC0BB64 00111080 */  sll         $v0, $s1, 2
.L9FC0BB68:
/* 00BB68 9FC0BB68 03A21021 */  addu        $v0, $sp, $v0
/* 00BB6C 9FC0BB6C 8C420350 */  lw          $v0, 0x350($v0)
/* 00BB70 9FC0BB70 26310001 */  addiu       $s1, $s1, 1
/* 00BB74 9FC0BB74 00621825 */  or          $v1, $v1, $v0
/* 00BB78 9FC0BB78 2E220008 */  sltiu       $v0, $s1, 8
/* 00BB7C 9FC0BB7C 1440FFFA */  bnez        $v0, .L9FC0BB68
/* 00BB80 9FC0BB80 00111080 */   sll        $v0, $s1, 2
/* 00BB84 9FC0BB84 14600009 */  bnez        $v1, .L9FC0BBAC
/* 00BB88 9FC0BB88 00003021 */   addu       $a2, $zero, $zero
/* 00BB8C 9FC0BB8C 0FF01EE0 */  jal         null
/* 00BB90 9FC0BB90 02602021 */   addu       $a0, $s3, $zero
/* 00BB94 9FC0BB94 0FF01EE0 */  jal         null
/* 00BB98 9FC0BB98 26640020 */   addiu      $a0, $s3, 0x20
/* 00BB9C 9FC0BB9C 0BF02F64 */  j           .L9FC0BD90
/* 00BBA0 9FC0BBA0 8FBF0388 */   lw         $ra, 0x388($sp)
.L9FC0BBA4:
/* 00BBA4 9FC0BBA4 0BF02EFE */  j           .L9FC0BBF8
/* 00BBA8 9FC0BBA8 24060001 */   addiu      $a2, $zero, 1
.L9FC0BBAC:
/* 00BBAC 9FC0BBAC 00008821 */  addu        $s1, $zero, $zero
/* 00BBB0 9FC0BBB0 02402821 */  addu        $a1, $s2, $zero
.L9FC0BBB4:
/* 00BBB4 9FC0BBB4 00112080 */  sll         $a0, $s1, 2
/* 00BBB8 9FC0BBB8 8CA30000 */  lw          $v1, ($a1)
/* 00BBBC 9FC0BBBC 3C029FC1 */  lui         $v0, %hi(precomputed_signer)
/* 00BBC0 9FC0BBC0 00441021 */  addu        $v0, $v0, $a0
/* 00BBC4 9FC0BBC4 8C42EBF0 */  lw          $v0, %lo(precomputed_signer)($v0)
/* 00BBC8 9FC0BBC8 3C109FC1 */  lui         $s0, %hi(precomputed_signer)
/* 00BBCC 9FC0BBCC 2610EBF0 */  addiu       $s0, $s0, %lo(precomputed_signer)
/* 00BBD0 9FC0BBD0 1462FFF4 */  bne         $v1, $v0, .L9FC0BBA4
/* 00BBD4 9FC0BBD4 02441021 */   addu       $v0, $s2, $a0
/* 00BBD8 9FC0BBD8 02041821 */  addu        $v1, $s0, $a0
/* 00BBDC 9FC0BBDC 8C440020 */  lw          $a0, 0x20($v0)
/* 00BBE0 9FC0BBE0 8C620020 */  lw          $v0, 0x20($v1)
/* 00BBE4 9FC0BBE4 1482FFEF */  bne         $a0, $v0, .L9FC0BBA4
/* 00BBE8 9FC0BBE8 26310001 */   addiu      $s1, $s1, 1
/* 00BBEC 9FC0BBEC 2E220008 */  sltiu       $v0, $s1, 8
/* 00BBF0 9FC0BBF0 1440FFF0 */  bnez        $v0, .L9FC0BBB4
/* 00BBF4 9FC0BBF4 24A50004 */   addiu      $a1, $a1, 4
.L9FC0BBF8:
/* 00BBF8 9FC0BBF8 24020001 */  addiu       $v0, $zero, 1
/* 00BBFC 9FC0BBFC 14C20016 */  bne         $a2, $v0, .L9FC0BC58
/* 00BC00 9FC0BC00 00008821 */   addu       $s1, $zero, $zero
/* 00BC04 9FC0BC04 02402021 */  addu        $a0, $s2, $zero
/* 00BC08 9FC0BC08 27A50010 */  addiu       $a1, $sp, 0x10
/* 00BC0C 9FC0BC0C 0FF02EA8 */  jal         do_precompute_two
/* 00BC10 9FC0BC10 02803021 */   addu       $a2, $s4, $zero
/* 00BC14 9FC0BC14 02402021 */  addu        $a0, $s2, $zero
/* 00BC18 9FC0BC18 0FF02C0C */  jal         copy_point
/* 00BC1C 9FC0BC1C 02002821 */   addu       $a1, $s0, $zero
/* 00BC20 9FC0BC20 00008821 */  addu        $s1, $zero, $zero
/* 00BC24 9FC0BC24 00111180 */  sll         $v0, $s1, 6
.L9FC0BC28:
/* 00BC28 9FC0BC28 27A40010 */  addiu       $a0, $sp, 0x10
/* 00BC2C 9FC0BC2C 00822021 */  addu        $a0, $a0, $v0
/* 00BC30 9FC0BC30 3C059FC1 */  lui         $a1, %hi(precomputed_pk)
/* 00BC34 9FC0BC34 24A5EC30 */  addiu       $a1, $a1, %lo(precomputed_pk)
/* 00BC38 9FC0BC38 0FF02C0C */  jal         copy_point
/* 00BC3C 9FC0BC3C 00452821 */   addu       $a1, $v0, $a1
/* 00BC40 9FC0BC40 26310001 */  addiu       $s1, $s1, 1
/* 00BC44 9FC0BC44 2A220004 */  slti        $v0, $s1, 4
/* 00BC48 9FC0BC48 1440FFF7 */  bnez        $v0, .L9FC0BC28
/* 00BC4C 9FC0BC4C 00111180 */   sll        $v0, $s1, 6
/* 00BC50 9FC0BC50 0BF02F22 */  j           .L9FC0BC88
/* 00BC54 9FC0BC54 00004821 */   addu       $t1, $zero, $zero
.L9FC0BC58:
/* 00BC58 9FC0BC58 00111180 */  sll         $v0, $s1, 6
.L9FC0BC5C:
/* 00BC5C 9FC0BC5C 3C049FC1 */  lui         $a0, %hi(precomputed_pk)
/* 00BC60 9FC0BC60 2484EC30 */  addiu       $a0, $a0, %lo(precomputed_pk)
/* 00BC64 9FC0BC64 00442021 */  addu        $a0, $v0, $a0
/* 00BC68 9FC0BC68 27A50010 */  addiu       $a1, $sp, 0x10
/* 00BC6C 9FC0BC6C 0FF02C0C */  jal         copy_point
/* 00BC70 9FC0BC70 00A22821 */   addu       $a1, $a1, $v0
/* 00BC74 9FC0BC74 26310001 */  addiu       $s1, $s1, 1
/* 00BC78 9FC0BC78 2A220004 */  slti        $v0, $s1, 4
/* 00BC7C 9FC0BC7C 1440FFF7 */  bnez        $v0, .L9FC0BC5C
/* 00BC80 9FC0BC80 00111180 */   sll        $v0, $s1, 6
/* 00BC84 9FC0BC84 00004821 */  addu        $t1, $zero, $zero
.L9FC0BC88:
/* 00BC88 9FC0BC88 240D0020 */  addiu       $t5, $zero, 0x20
/* 00BC8C 9FC0BC8C 00007021 */  addu        $t6, $zero, $zero
.L9FC0BC90:
/* 00BC90 9FC0BC90 00098940 */  sll         $s1, $t1, 5
/* 00BC94 9FC0BC94 022D102A */  slt         $v0, $s1, $t5
/* 00BC98 9FC0BC98 1040001F */  beqz        $v0, .L9FC0BD18
/* 00BC9C 9FC0BC9C 3C0C8000 */   lui        $t4, 0x8000
.L9FC0BCA0:
/* 00BCA0 9FC0BCA0 00115880 */  sll         $t3, $s1, 2
/* 00BCA4 9FC0BCA4 27AA0110 */  addiu       $t2, $sp, 0x110
/* 00BCA8 9FC0BCA8 014B1021 */  addu        $v0, $t2, $t3
/* 00BCAC 9FC0BCAC AC400000 */  sw          $zero, ($v0)
/* 00BCB0 9FC0BCB0 24080001 */  addiu       $t0, $zero, 1
/* 00BCB4 9FC0BCB4 29220008 */  slti        $v0, $t1, 8
/* 00BCB8 9FC0BCB8 10400013 */  beqz        $v0, .L9FC0BD08
/* 00BCBC 9FC0BCBC 01203821 */   addu       $a3, $t1, $zero
/* 00BCC0 9FC0BCC0 00091080 */  sll         $v0, $t1, 2
/* 00BCC4 9FC0BCC4 00553021 */  addu        $a2, $v0, $s5
.L9FC0BCC8:
/* 00BCC8 9FC0BCC8 8CC30000 */  lw          $v1, ($a2)
/* 00BCCC 9FC0BCCC 24C60010 */  addiu       $a2, $a2, 0x10
/* 00BCD0 9FC0BCD0 24E70004 */  addiu       $a3, $a3, 4
/* 00BCD4 9FC0BCD4 014B2821 */  addu        $a1, $t2, $t3
/* 00BCD8 9FC0BCD8 022E2023 */  subu        $a0, $s1, $t6
/* 00BCDC 9FC0BCDC 2402001F */  addiu       $v0, $zero, 0x1f
/* 00BCE0 9FC0BCE0 00441023 */  subu        $v0, $v0, $a0
/* 00BCE4 9FC0BCE4 006C1824 */  and         $v1, $v1, $t4
/* 00BCE8 9FC0BCE8 00431806 */  srlv        $v1, $v1, $v0
/* 00BCEC 9FC0BCEC 01031804 */  sllv        $v1, $v1, $t0
/* 00BCF0 9FC0BCF0 8CA20000 */  lw          $v0, ($a1)
/* 00BCF4 9FC0BCF4 00431025 */  or          $v0, $v0, $v1
/* 00BCF8 9FC0BCF8 ACA20000 */  sw          $v0, ($a1)
/* 00BCFC 9FC0BCFC 28E20008 */  slti        $v0, $a3, 8
/* 00BD00 9FC0BD00 1440FFF1 */  bnez        $v0, .L9FC0BCC8
/* 00BD04 9FC0BD04 2508FFFF */   addiu      $t0, $t0, -1
.L9FC0BD08:
/* 00BD08 9FC0BD08 26310001 */  addiu       $s1, $s1, 1
/* 00BD0C 9FC0BD0C 022D102A */  slt         $v0, $s1, $t5
/* 00BD10 9FC0BD10 1440FFE3 */  bnez        $v0, .L9FC0BCA0
/* 00BD14 9FC0BD14 000C6042 */   srl        $t4, $t4, 1
.L9FC0BD18:
/* 00BD18 9FC0BD18 25AD0020 */  addiu       $t5, $t5, 0x20
/* 00BD1C 9FC0BD1C 25290001 */  addiu       $t1, $t1, 1
/* 00BD20 9FC0BD20 29220004 */  slti        $v0, $t1, 4
/* 00BD24 9FC0BD24 1440FFDA */  bnez        $v0, .L9FC0BC90
/* 00BD28 9FC0BD28 25CE0020 */   addiu      $t6, $t6, 0x20
/* 00BD2C 9FC0BD2C 0FF01EE0 */  jal         null
/* 00BD30 9FC0BD30 02602021 */   addu       $a0, $s3, $zero
/* 00BD34 9FC0BD34 0FF01EE0 */  jal         null
/* 00BD38 9FC0BD38 26640020 */   addiu      $a0, $s3, 0x20
/* 00BD3C 9FC0BD3C 00008821 */  addu        $s1, $zero, $zero
/* 00BD40 9FC0BD40 02602021 */  addu        $a0, $s3, $zero
.L9FC0BD44:
/* 00BD44 9FC0BD44 27B00310 */  addiu       $s0, $sp, 0x310
/* 00BD48 9FC0BD48 02002821 */  addu        $a1, $s0, $zero
/* 00BD4C 9FC0BD4C 0FF02D00 */  jal         poly_elliptic_double
/* 00BD50 9FC0BD50 02803021 */   addu       $a2, $s4, $zero
/* 00BD54 9FC0BD54 02002021 */  addu        $a0, $s0, $zero
/* 00BD58 9FC0BD58 02603021 */  addu        $a2, $s3, $zero
/* 00BD5C 9FC0BD5C 00111080 */  sll         $v0, $s1, 2
/* 00BD60 9FC0BD60 03A21021 */  addu        $v0, $sp, $v0
/* 00BD64 9FC0BD64 8C450110 */  lw          $a1, 0x110($v0)
/* 00BD68 9FC0BD68 26310001 */  addiu       $s1, $s1, 1
/* 00BD6C 9FC0BD6C 27A20010 */  addiu       $v0, $sp, 0x10
/* 00BD70 9FC0BD70 02803821 */  addu        $a3, $s4, $zero
/* 00BD74 9FC0BD74 00052980 */  sll         $a1, $a1, 6
/* 00BD78 9FC0BD78 0FF02C1B */  jal         poly_elliptic_sum
/* 00BD7C 9FC0BD7C 00452821 */   addu       $a1, $v0, $a1
/* 00BD80 9FC0BD80 2A220080 */  slti        $v0, $s1, 0x80
/* 00BD84 9FC0BD84 1440FFEF */  bnez        $v0, .L9FC0BD44
/* 00BD88 9FC0BD88 02602021 */   addu       $a0, $s3, $zero
/* 00BD8C 9FC0BD8C 8FBF0388 */  lw          $ra, 0x388($sp)
.L9FC0BD90:
/* 00BD90 9FC0BD90 8FB50384 */  lw          $s5, 0x384($sp)
/* 00BD94 9FC0BD94 8FB40380 */  lw          $s4, 0x380($sp)
/* 00BD98 9FC0BD98 8FB3037C */  lw          $s3, 0x37c($sp)
/* 00BD9C 9FC0BD9C 8FB20378 */  lw          $s2, 0x378($sp)
/* 00BDA0 9FC0BDA0 8FB10374 */  lw          $s1, 0x374($sp)
/* 00BDA4 9FC0BDA4 8FB00370 */  lw          $s0, 0x370($sp)
/* 00BDA8 9FC0BDA8 03E00008 */  jr          $ra
/* 00BDAC 9FC0BDAC 27BD0390 */   addiu      $sp, $sp, 0x390
