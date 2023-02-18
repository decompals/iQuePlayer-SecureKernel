## generate_public_key
## poly_elliptic_sum
## poly_elliptic_double
/* 0083E4 9FC083E4 27BDFF58 */  addiu       $sp, $sp, -0xa8
/* 0083E8 9FC083E8 AFB20098 */  sw          $s2, 0x98($sp)
/* 0083EC 9FC083EC 00809021 */  addu        $s2, $a0, $zero
/* 0083F0 9FC083F0 AFB00090 */  sw          $s0, 0x90($sp)
/* 0083F4 9FC083F4 27B00050 */  addiu       $s0, $sp, 0x50
/* 0083F8 9FC083F8 02002021 */  addu        $a0, $s0, $zero
/* 0083FC 9FC083FC AFB10094 */  sw          $s1, 0x94($sp)
/* 008400 9FC08400 00A08821 */  addu        $s1, $a1, $zero
/* 008404 9FC08404 AFB3009C */  sw          $s3, 0x9c($sp)
/* 008408 9FC08408 AFBF00A0 */  sw          $ra, 0xa0($sp)
/* 00840C 9FC0840C 0FF01EEB */  jal         double_null
/* 008410 9FC08410 00C09821 */   addu       $s3, $a2, $zero
/* 008414 9FC08414 3C02000F */  lui         $v0, (0x000FFFFF >> 16)
/* 008418 9FC08418 3442FFFF */  ori         $v0, $v0, (0x000FFFFF & 0xFFFF)
/* 00841C 9FC0841C 02402021 */  addu        $a0, $s2, $zero
/* 008420 9FC08420 02202821 */  addu        $a1, $s1, $zero
/* 008424 9FC08424 AFA20050 */  sw          $v0, 0x50($sp)
/* 008428 9FC08428 2402FFFF */  addiu       $v0, $zero, -1
/* 00842C 9FC0842C AFA20054 */  sw          $v0, 0x54($sp)
/* 008430 9FC08430 AFA20058 */  sw          $v0, 0x58($sp)
/* 008434 9FC08434 AFA2005C */  sw          $v0, 0x5c($sp)
/* 008438 9FC08438 AFA20060 */  sw          $v0, 0x60($sp)
/* 00843C 9FC0843C 3C02FFE0 */  lui         $v0, 0xffe0
/* 008440 9FC08440 27A60010 */  addiu       $a2, $sp, 0x10
/* 008444 9FC08444 0FF01F5C */  jal         poly_mul_partial
/* 008448 9FC08448 AFA20064 */   sw         $v0, 0x64($sp)
/* 00844C 9FC0844C 27A40010 */  addiu       $a0, $sp, 0x10
/* 008450 9FC08450 0FF020D8 */  jal         shift_and_add
/* 008454 9FC08454 02002821 */   addu       $a1, $s0, $zero
/* 008458 9FC08458 02002021 */  addu        $a0, $s0, $zero
/* 00845C 9FC0845C 0FF02079 */  jal         divide_shift_n
/* 008460 9FC08460 2405009F */   addiu      $a1, $zero, 0x9f
/* 008464 9FC08464 27A40010 */  addiu       $a0, $sp, 0x10
/* 008468 9FC08468 02002821 */  addu        $a1, $s0, $zero
/* 00846C 9FC0846C 2402FE00 */  addiu       $v0, $zero, -0x200
/* 008470 9FC08470 AFA2006C */  sw          $v0, 0x6c($sp)
/* 008474 9FC08474 AFA00070 */  sw          $zero, 0x70($sp)
/* 008478 9FC08478 AFA00074 */  sw          $zero, 0x74($sp)
/* 00847C 9FC0847C AFA00078 */  sw          $zero, 0x78($sp)
/* 008480 9FC08480 AFA0007C */  sw          $zero, 0x7c($sp)
/* 008484 9FC08484 AFA00080 */  sw          $zero, 0x80($sp)
/* 008488 9FC08488 AFA00084 */  sw          $zero, 0x84($sp)
/* 00848C 9FC0848C 0FF020D8 */  jal         shift_and_add
/* 008490 9FC08490 AFA00088 */   sw         $zero, 0x88($sp)
/* 008494 9FC08494 27A40010 */  addiu       $a0, $sp, 0x10
/* 008498 9FC08498 0FF01F3D */  jal         double_to_single
/* 00849C 9FC0849C 02602821 */   addu       $a1, $s3, $zero
/* 0084A0 9FC084A0 8FBF00A0 */  lw          $ra, 0xa0($sp)
/* 0084A4 9FC084A4 8FB3009C */  lw          $s3, 0x9c($sp)
/* 0084A8 9FC084A8 8FB20098 */  lw          $s2, 0x98($sp)
/* 0084AC 9FC084AC 8FB10094 */  lw          $s1, 0x94($sp)
/* 0084B0 9FC084B0 8FB00090 */  lw          $s0, 0x90($sp)
/* 0084B4 9FC084B4 03E00008 */  jr          $ra
/* 0084B8 9FC084B8 27BD00A8 */   addiu      $sp, $sp, 0xa8
