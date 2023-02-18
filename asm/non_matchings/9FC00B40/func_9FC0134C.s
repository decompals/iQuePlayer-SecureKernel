## skRecryptData
## skRecryptComputeState
/* 00134C 9FC0134C 27BDFFC8 */  addiu       $sp, $sp, -0x38
/* 001350 9FC01350 AFB1001C */  sw          $s1, 0x1c($sp)
/* 001354 9FC01354 00808821 */  addu        $s1, $a0, $zero
/* 001358 9FC01358 AFB20020 */  sw          $s2, 0x20($sp)
/* 00135C 9FC0135C 00009021 */  addu        $s2, $zero, $zero
/* 001360 9FC01360 AFB30024 */  sw          $s3, 0x24($sp)
/* 001364 9FC01364 00A09821 */  addu        $s3, $a1, $zero
/* 001368 9FC01368 AFB5002C */  sw          $s5, 0x2c($sp)
/* 00136C 9FC0136C 00C0A821 */  addu        $s5, $a2, $zero
/* 001370 9FC01370 AFB40028 */  sw          $s4, 0x28($sp)
/* 001374 9FC01374 24140200 */  addiu       $s4, $zero, 0x200
/* 001378 9FC01378 AFBF0030 */  sw          $ra, 0x30($sp)
/* 00137C 9FC0137C 1260003F */  beqz        $s3, .L9FC0147C
/* 001380 9FC01380 AFB00018 */   sw         $s0, 0x18($sp)
.L9FC01384:
/* 001384 9FC01384 3C051FFF */  lui         $a1, (0x1FFFFFFF >> 16)
/* 001388 9FC01388 34A5FFFF */  ori         $a1, $a1, (0x1FFFFFFF & 0xFFFF)
/* 00138C 9FC0138C 00002021 */  addu        $a0, $zero, $zero
/* 001390 9FC01390 02252824 */  and         $a1, $s1, $a1
/* 001394 9FC01394 24060200 */  addiu       $a2, $zero, 0x200
/* 001398 9FC01398 0FF00DEA */  jal         dma_from_cart
/* 00139C 9FC0139C 24070001 */   addiu      $a3, $zero, 1
/* 0013A0 9FC013A0 04400037 */  bltz        $v0, .L9FC01480
/* 0013A4 9FC013A4 2402FFFF */   addiu      $v0, $zero, -1
/* 0013A8 9FC013A8 3C059FC1 */  lui         $a1, %hi(D_9FC0F2E0)
/* 0013AC 9FC013AC 8CA5F2E0 */  lw          $a1, %lo(D_9FC0F2E0)($a1)
/* 0013B0 9FC013B0 0FF00E13 */  jal         func_9FC0384C
/* 0013B4 9FC013B4 00002021 */   addu       $a0, $zero, $zero
/* 0013B8 9FC013B8 3C02A460 */  lui         $v0, (0xA4600050 >> 16)
/* 0013BC 9FC013BC 34420050 */  ori         $v0, $v0, (0xA4600050 & 0xFFFF)
/* 0013C0 9FC013C0 8C430000 */  lw          $v1, ($v0)
/* 0013C4 9FC013C4 24020001 */  addiu       $v0, $zero, 1
/* 0013C8 9FC013C8 3C019FC1 */  lui         $at, %hi(D_9FC0F2E0)
/* 0013CC 9FC013CC AC22F2E0 */  sw          $v0, %lo(D_9FC0F2E0)($at)
/* 0013D0 9FC013D0 04610005 */  bgez        $v1, .L9FC013E8
/* 0013D4 9FC013D4 3C02A460 */   lui        $v0, (0xA4600050 >> 16)
.L9FC013D8:
/* 0013D8 9FC013D8 34420050 */  ori         $v0, $v0, (0xA4600050 & 0xFFFF)
/* 0013DC 9FC013DC 8C420000 */  lw          $v0, ($v0)
/* 0013E0 9FC013E0 0440FFFD */  bltz        $v0, .L9FC013D8
/* 0013E4 9FC013E4 3C02A460 */   lui        $v0, (0xA4600050 >> 16)
.L9FC013E8:
/* 0013E8 9FC013E8 3C109FC1 */  lui         $s0, %hi(D_9FC0ED40)
/* 0013EC 9FC013EC 2610ED40 */  addiu       $s0, $s0, %lo(D_9FC0ED40)
/* 0013F0 9FC013F0 8E020000 */  lw          $v0, ($s0)
/* 0013F4 9FC013F4 3C039FC1 */  lui         $v1, %hi(D_9FC0F0DC)
/* 0013F8 9FC013F8 8C63F0DC */  lw          $v1, %lo(D_9FC0F0DC)($v1)
/* 0013FC 9FC013FC 00433023 */  subu        $a2, $v0, $v1
/* 001400 9FC01400 2CC20200 */  sltiu       $v0, $a2, 0x200
/* 001404 9FC01404 14400009 */  bnez        $v0, .L9FC0142C
/* 001408 9FC01408 3C05A461 */   lui        $a1, 0xa461
/* 00140C 9FC0140C 3C049FC1 */  lui         $a0, %hi(sha1_ctx)
/* 001410 9FC01410 2484F080 */  addiu       $a0, $a0, %lo(sha1_ctx)
/* 001414 9FC01414 0FF01A12 */  jal         SHA1Input
/* 001418 9FC01418 24060200 */   addiu      $a2, $zero, 0x200
/* 00141C 9FC0141C 3C029FC1 */  lui         $v0, %hi(D_9FC0F0DC)
/* 001420 9FC01420 8C42F0DC */  lw          $v0, %lo(D_9FC0F0DC)($v0)
/* 001424 9FC01424 0BF00510 */  j           .L9FC01440
/* 001428 9FC01428 24420200 */   addiu      $v0, $v0, 0x200
.L9FC0142C:
/* 00142C 9FC0142C 3C049FC1 */  lui         $a0, %hi(sha1_ctx)
/* 001430 9FC01430 2484F080 */  addiu       $a0, $a0, %lo(sha1_ctx)
/* 001434 9FC01434 0FF01A12 */  jal         SHA1Input
/* 001438 9FC01438 3C05A461 */   lui        $a1, 0xa461
/* 00143C 9FC0143C 8E020000 */  lw          $v0, ($s0)
.L9FC01440:
/* 001440 9FC01440 3C019FC1 */  lui         $at, %hi(D_9FC0F0DC)
/* 001444 9FC01444 AC22F0DC */  sw          $v0, %lo(D_9FC0F0DC)($at)
/* 001448 9FC01448 12A00008 */  beqz        $s5, .L9FC0146C
/* 00144C 9FC0144C 3C06A461 */   lui        $a2, 0xa461
/* 001450 9FC01450 AFB10010 */  sw          $s1, 0x10($sp)
/* 001454 9FC01454 3C049FC1 */  lui         $a0, %hi(D_9FC0F2C8)
/* 001458 9FC01458 2484F2C8 */  addiu       $a0, $a0, %lo(D_9FC0F2C8)
/* 00145C 9FC0145C 3C059FC1 */  lui         $a1, %hi(D_9FC0F0E0)
/* 001460 9FC01460 24A5F0E0 */  addiu       $a1, $a1, %lo(D_9FC0F0E0)
/* 001464 9FC01464 0FF0134D */  jal         aesBlockEncrypt
/* 001468 9FC01468 001438C0 */   sll        $a3, $s4, 3
.L9FC0146C:
/* 00146C 9FC0146C 26520200 */  addiu       $s2, $s2, 0x200
/* 001470 9FC01470 0253102B */  sltu        $v0, $s2, $s3
/* 001474 9FC01474 1440FFC3 */  bnez        $v0, .L9FC01384
/* 001478 9FC01478 26310200 */   addiu      $s1, $s1, 0x200
.L9FC0147C:
/* 00147C 9FC0147C 00001021 */  addu        $v0, $zero, $zero
.L9FC01480:
/* 001480 9FC01480 8FBF0030 */  lw          $ra, 0x30($sp)
/* 001484 9FC01484 8FB5002C */  lw          $s5, 0x2c($sp)
/* 001488 9FC01488 8FB40028 */  lw          $s4, 0x28($sp)
/* 00148C 9FC0148C 8FB30024 */  lw          $s3, 0x24($sp)
/* 001490 9FC01490 8FB20020 */  lw          $s2, 0x20($sp)
/* 001494 9FC01494 8FB1001C */  lw          $s1, 0x1c($sp)
/* 001498 9FC01498 8FB00018 */  lw          $s0, 0x18($sp)
/* 00149C 9FC0149C 03E00008 */  jr          $ra
/* 0014A0 9FC014A0 27BD0038 */   addiu      $sp, $sp, 0x38
