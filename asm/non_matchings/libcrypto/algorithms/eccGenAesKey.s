## func_9FC00BAC
/* 008EB0 9FC08EB0 27BDFF58 */  addiu       $sp, $sp, -0xa8
/* 008EB4 9FC08EB4 AFB200A0 */  sw          $s2, 0xa0($sp)
/* 008EB8 9FC08EB8 00809021 */  addu        $s2, $a0, $zero
/* 008EBC 9FC08EBC AFB00098 */  sw          $s0, 0x98($sp)
/* 008EC0 9FC08EC0 00A08021 */  addu        $s0, $a1, $zero
/* 008EC4 9FC08EC4 AFB1009C */  sw          $s1, 0x9c($sp)
/* 008EC8 9FC08EC8 AFBF00A4 */  sw          $ra, 0xa4($sp)
/* 008ECC 9FC08ECC 0FF02768 */  jal         Init_233_bit
/* 008ED0 9FC08ED0 00C08821 */   addu       $s1, $a2, $zero
/* 008ED4 9FC08ED4 00002821 */  addu        $a1, $zero, $zero
.L9FC08ED8:
/* 008ED8 9FC08ED8 8E030000 */  lw          $v1, ($s0)
/* 008EDC 9FC08EDC 00051080 */  sll         $v0, $a1, 2
/* 008EE0 9FC08EE0 24A50001 */  addiu       $a1, $a1, 1
/* 008EE4 9FC08EE4 03A21021 */  addu        $v0, $sp, $v0
/* 008EE8 9FC08EE8 AC430018 */  sw          $v1, 0x18($v0)
/* 008EEC 9FC08EEC 2CA20008 */  sltiu       $v0, $a1, 8
/* 008EF0 9FC08EF0 1440FFF9 */  bnez        $v0, .L9FC08ED8
/* 008EF4 9FC08EF4 26100004 */   addiu      $s0, $s0, 4
/* 008EF8 9FC08EF8 00002821 */  addu        $a1, $zero, $zero
/* 008EFC 9FC08EFC 8FA20018 */  lw          $v0, 0x18($sp)
/* 008F00 9FC08F00 02402021 */  addu        $a0, $s2, $zero
/* 008F04 9FC08F04 304201FF */  andi        $v0, $v0, 0x1ff
/* 008F08 9FC08F08 AFA20018 */  sw          $v0, 0x18($sp)
.L9FC08F0C:
/* 008F0C 9FC08F0C 8C830000 */  lw          $v1, ($a0)
/* 008F10 9FC08F10 00051080 */  sll         $v0, $a1, 2
/* 008F14 9FC08F14 24A50001 */  addiu       $a1, $a1, 1
/* 008F18 9FC08F18 27A60058 */  addiu       $a2, $sp, 0x58
/* 008F1C 9FC08F1C 00C21021 */  addu        $v0, $a2, $v0
/* 008F20 9FC08F20 AC430000 */  sw          $v1, ($v0)
/* 008F24 9FC08F24 2CA20008 */  sltiu       $v0, $a1, 8
/* 008F28 9FC08F28 1440FFF8 */  bnez        $v0, .L9FC08F0C
/* 008F2C 9FC08F2C 24840004 */   addiu      $a0, $a0, 4
/* 008F30 9FC08F30 00002821 */  addu        $a1, $zero, $zero
/* 008F34 9FC08F34 26440020 */  addiu       $a0, $s2, 0x20
.L9FC08F38:
/* 008F38 9FC08F38 8C830000 */  lw          $v1, ($a0)
/* 008F3C 9FC08F3C 00051080 */  sll         $v0, $a1, 2
/* 008F40 9FC08F40 24A50001 */  addiu       $a1, $a1, 1
/* 008F44 9FC08F44 03A21021 */  addu        $v0, $sp, $v0
/* 008F48 9FC08F48 AC430078 */  sw          $v1, 0x78($v0)
/* 008F4C 9FC08F4C 2CA20008 */  sltiu       $v0, $a1, 8
/* 008F50 9FC08F50 1440FFF9 */  bnez        $v0, .L9FC08F38
/* 008F54 9FC08F54 24840004 */   addiu      $a0, $a0, 4
/* 008F58 9FC08F58 27A20038 */  addiu       $v0, $sp, 0x38
/* 008F5C 9FC08F5C 3C049FC1 */  lui         $a0, %hi(named_point)
/* 008F60 9FC08F60 2484F790 */  addiu       $a0, $a0, %lo(named_point)
/* 008F64 9FC08F64 3C059FC1 */  lui         $a1, %hi(named_curve)
/* 008F68 9FC08F68 24A5F34C */  addiu       $a1, $a1, %lo(named_curve)
/* 008F6C 9FC08F6C 27A70018 */  addiu       $a3, $sp, 0x18
/* 008F70 9FC08F70 0FF02499 */  jal         generate_shared_key
/* 008F74 9FC08F74 AFA20010 */   sw         $v0, 0x10($sp)
/* 008F78 9FC08F78 8FA3003C */  lw          $v1, 0x3c($sp)
/* 008F7C 9FC08F7C 8FA40040 */  lw          $a0, 0x40($sp)
/* 008F80 9FC08F80 8FA50044 */  lw          $a1, 0x44($sp)
/* 008F84 9FC08F84 8FA60048 */  lw          $a2, 0x48($sp)
/* 008F88 9FC08F88 8FBF00A4 */  lw          $ra, 0xa4($sp)
/* 008F8C 9FC08F8C 8FB200A0 */  lw          $s2, 0xa0($sp)
/* 008F90 9FC08F90 8FB00098 */  lw          $s0, 0x98($sp)
/* 008F94 9FC08F94 AE230000 */  sw          $v1, ($s1)
/* 008F98 9FC08F98 AE240004 */  sw          $a0, 4($s1)
/* 008F9C 9FC08F9C AE250008 */  sw          $a1, 8($s1)
/* 008FA0 9FC08FA0 AE26000C */  sw          $a2, 0xc($s1)
/* 008FA4 9FC08FA4 8FB1009C */  lw          $s1, 0x9c($sp)
/* 008FA8 9FC08FA8 00001021 */  addu        $v0, $zero, $zero
/* 008FAC 9FC08FAC 03E00008 */  jr          $ra
/* 008FB0 9FC08FB0 27BD00A8 */   addiu      $sp, $sp, 0xa8
