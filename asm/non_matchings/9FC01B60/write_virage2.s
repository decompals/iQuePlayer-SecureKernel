## func_9FC022A8
/* 002588 9FC02588 3C029FC1 */  lui         $v0, %hi(virage2_offset)
/* 00258C 9FC0258C 8C42EBC0 */  lw          $v0, %lo(virage2_offset)($v0)
/* 002590 9FC02590 27BDFFD0 */  addiu       $sp, $sp, -0x30
/* 002594 9FC02594 AFB00028 */  sw          $s0, 0x28($sp)
/* 002598 9FC02598 3C100100 */  lui         $s0, (0x01000008 >> 16)
/* 00259C 9FC0259C AFBF002C */  sw          $ra, 0x2c($sp)
/* 0025A0 9FC025A0 8C420014 */  lw          $v0, 0x14($v0)
/* 0025A4 9FC025A4 36100008 */  ori         $s0, $s0, (0x01000008 & 0xFFFF)
/* 0025A8 9FC025A8 10500025 */  beq         $v0, $s0, .L9FC02640
/* 0025AC 9FC025AC 00001021 */   addu       $v0, $zero, $zero
/* 0025B0 9FC025B0 0FF00922 */  jal         func_9FC02488
/* 0025B4 9FC025B4 27A40010 */   addiu      $a0, $sp, 0x10
/* 0025B8 9FC025B8 14400022 */  bnez        $v0, .L9FC02644
/* 0025BC 9FC025BC 8FBF002C */   lw         $ra, 0x2c($sp)
/* 0025C0 9FC025C0 27A50010 */  addiu       $a1, $sp, 0x10
/* 0025C4 9FC025C4 3C049FC1 */  lui         $a0, %hi(virage2_offset)
/* 0025C8 9FC025C8 8C84EBC0 */  lw          $a0, %lo(virage2_offset)($a0)
/* 0025CC 9FC025CC 0FF00EAB */  jal         wordcopy
/* 0025D0 9FC025D0 24060005 */   addiu      $a2, $zero, 5
/* 0025D4 9FC025D4 00002021 */  addu        $a0, $zero, $zero
/* 0025D8 9FC025D8 3C029FC1 */  lui         $v0, %hi(virage2_offset)
/* 0025DC 9FC025DC 8C42EBC0 */  lw          $v0, %lo(virage2_offset)($v0)
/* 0025E0 9FC025E0 00002821 */  addu        $a1, $zero, $zero
/* 0025E4 9FC025E4 AC500014 */  sw          $s0, 0x14($v0)
/* 0025E8 9FC025E8 AC4000F8 */  sw          $zero, 0xf8($v0)
/* 0025EC 9FC025EC 00403021 */  addu        $a2, $v0, $zero
/* 0025F0 9FC025F0 00C01821 */  addu        $v1, $a2, $zero
.L9FC025F4:
/* 0025F4 9FC025F4 8C620000 */  lw          $v0, ($v1)
/* 0025F8 9FC025F8 24840001 */  addiu       $a0, $a0, 1
/* 0025FC 9FC025FC 00A22821 */  addu        $a1, $a1, $v0
/* 002600 9FC02600 2C820040 */  sltiu       $v0, $a0, 0x40
/* 002604 9FC02604 1440FFFB */  bnez        $v0, .L9FC025F4
/* 002608 9FC02608 24630004 */   addiu      $v1, $v1, 4
/* 00260C 9FC0260C 3C0200BB */  lui         $v0, (0x00BBC0DE >> 16)
/* 002610 9FC02610 3442C0DE */  ori         $v0, $v0, (0x00BBC0DE & 0xFFFF)
/* 002614 9FC02614 3C041FCA */  lui         $a0, (0x1FCAC000 >> 16)
/* 002618 9FC02618 3484C000 */  ori         $a0, $a0, (0x1FCAC000 & 0xFFFF)
/* 00261C 9FC0261C 00451023 */  subu        $v0, $v0, $a1
/* 002620 9FC02620 ACC200F8 */  sw          $v0, 0xf8($a2)
/* 002624 9FC02624 3C059FC1 */  lui         $a1, %hi(virage2_offset)
/* 002628 9FC02628 8CA5EBC0 */  lw          $a1, %lo(virage2_offset)($a1)
/* 00262C 9FC0262C 0FF00FFA */  jal         write_virage_data
/* 002630 9FC02630 24060040 */   addiu      $a2, $zero, 0x40
/* 002634 9FC02634 04400003 */  bltz        $v0, .L9FC02644
/* 002638 9FC02638 8FBF002C */   lw         $ra, 0x2c($sp)
/* 00263C 9FC0263C 00001021 */  addu        $v0, $zero, $zero
.L9FC02640:
/* 002640 9FC02640 8FBF002C */  lw          $ra, 0x2c($sp)
.L9FC02644:
/* 002644 9FC02644 8FB00028 */  lw          $s0, 0x28($sp)
/* 002648 9FC02648 03E00008 */  jr          $ra
/* 00264C 9FC0264C 27BD0030 */   addiu      $sp, $sp, 0x30
