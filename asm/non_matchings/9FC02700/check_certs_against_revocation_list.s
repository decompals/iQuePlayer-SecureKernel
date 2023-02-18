## func_9FC01D54
/* 002F68 9FC02F68 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 002F6C 9FC02F6C AFB00018 */  sw          $s0, 0x18($sp)
/* 002F70 9FC02F70 00808021 */  addu        $s0, $a0, $zero
/* 002F74 9FC02F74 AFB1001C */  sw          $s1, 0x1c($sp)
/* 002F78 9FC02F78 00C08821 */  addu        $s1, $a2, $zero
/* 002F7C 9FC02F7C AFBF0024 */  sw          $ra, 0x24($sp)
/* 002F80 9FC02F80 AFB20020 */  sw          $s2, 0x20($sp)
/* 002F84 9FC02F84 8E24001C */  lw          $a0, 0x1c($s1)
/* 002F88 9FC02F88 1080000D */  beqz        $a0, .L9FC02FC0
/* 002F8C 9FC02F8C 00A09021 */   addu       $s2, $a1, $zero
/* 002F90 9FC02F90 24050258 */  addiu       $a1, $zero, 0x258
/* 002F94 9FC02F94 0FF00F74 */  jal         check_unknown_range
/* 002F98 9FC02F98 24060004 */   addiu      $a2, $zero, 4
/* 002F9C 9FC02F9C 1040000F */  beqz        $v0, .L9FC02FDC
/* 002FA0 9FC02FA0 24060004 */   addiu      $a2, $zero, 4
/* 002FA4 9FC02FA4 8E22001C */  lw          $v0, 0x1c($s1)
/* 002FA8 9FC02FA8 8C450254 */  lw          $a1, 0x254($v0)
/* 002FAC 9FC02FAC 8E240020 */  lw          $a0, 0x20($s1)
/* 002FB0 9FC02FB0 0FF00F74 */  jal         check_unknown_range
/* 002FB4 9FC02FB4 00052980 */   sll        $a1, $a1, 6
/* 002FB8 9FC02FB8 10400050 */  beqz        $v0, .L9FC030FC
/* 002FBC 9FC02FBC 2402FFFF */   addiu      $v0, $zero, -1
.L9FC02FC0:
/* 002FC0 9FC02FC0 8E240038 */  lw          $a0, 0x38($s1)
/* 002FC4 9FC02FC4 10800018 */  beqz        $a0, .L9FC03028
/* 002FC8 9FC02FC8 24050258 */   addiu      $a1, $zero, 0x258
/* 002FCC 9FC02FCC 0FF00F74 */  jal         check_unknown_range
/* 002FD0 9FC02FD0 24060004 */   addiu      $a2, $zero, 4
/* 002FD4 9FC02FD4 54400003 */  bnel        $v0, $zero, .L9FC02FE4
/* 002FD8 9FC02FD8 8E220038 */   lw         $v0, 0x38($s1)
.L9FC02FDC:
/* 002FDC 9FC02FDC 0BF00C3F */  j           .L9FC030FC
/* 002FE0 9FC02FE0 2402FFFF */   addiu      $v0, $zero, -1
.L9FC02FE4:
/* 002FE4 9FC02FE4 24060004 */  addiu       $a2, $zero, 4
/* 002FE8 9FC02FE8 8C450254 */  lw          $a1, 0x254($v0)
/* 002FEC 9FC02FEC 8E24003C */  lw          $a0, 0x3c($s1)
/* 002FF0 9FC02FF0 0FF00F74 */  jal         check_unknown_range
/* 002FF4 9FC02FF4 00052980 */   sll        $a1, $a1, 6
/* 002FF8 9FC02FF8 1040FFF8 */  beqz        $v0, .L9FC02FDC
/* 002FFC 9FC02FFC 26240040 */   addiu      $a0, $s1, 0x40
/* 003000 9FC03000 24050004 */  addiu       $a1, $zero, 4
/* 003004 9FC03004 0FF00F74 */  jal         check_unknown_range
/* 003008 9FC03008 24060004 */   addiu      $a2, $zero, 4
/* 00300C 9FC0300C 1040FFF3 */  beqz        $v0, .L9FC02FDC
/* 003010 9FC03010 24050390 */   addiu      $a1, $zero, 0x390
/* 003014 9FC03014 8E240040 */  lw          $a0, 0x40($s1)
/* 003018 9FC03018 0FF00F74 */  jal         check_unknown_range
/* 00301C 9FC0301C 24060004 */   addiu      $a2, $zero, 4
/* 003020 9FC03020 10400036 */  beqz        $v0, .L9FC030FC
/* 003024 9FC03024 2402FFFF */   addiu      $v0, $zero, -1
.L9FC03028:
/* 003028 9FC03028 2624001C */  addiu       $a0, $s1, 0x1c
/* 00302C 9FC0302C 8E050004 */  lw          $a1, 4($s0)
/* 003030 9FC03030 26260038 */  addiu       $a2, $s1, 0x38
/* 003034 9FC03034 AFB10010 */  sw          $s1, 0x10($sp)
/* 003038 9FC03038 8E070008 */  lw          $a3, 8($s0)
/* 00303C 9FC0303C 2402FFFF */  addiu       $v0, $zero, -1
/* 003040 9FC03040 0FF00B2D */  jal         verify_all_crlbundles
/* 003044 9FC03044 AFA20014 */   sw         $v0, 0x14($sp)
/* 003048 9FC03048 10400005 */  beqz        $v0, .L9FC03060
/* 00304C 9FC0304C 8FBF0024 */   lw         $ra, 0x24($sp)
/* 003050 9FC03050 0BF00C41 */  j           .L9FC03104
/* 003054 9FC03054 8FB20020 */   lw         $s2, 0x20($sp)
.L9FC03058:
/* 003058 9FC03058 0BF00C3F */  j           .L9FC030FC
/* 00305C 9FC0305C 2402FFF7 */   addiu      $v0, $zero, -9
.L9FC03060:
/* 003060 9FC03060 8E22001C */  lw          $v0, 0x1c($s1)
/* 003064 9FC03064 50400012 */  beql        $v0, $zero, .L9FC030B0
/* 003068 9FC03068 8E220038 */   lw         $v0, 0x38($s1)
/* 00306C 9FC0306C 8C420254 */  lw          $v0, 0x254($v0)
/* 003070 9FC03070 1040000E */  beqz        $v0, .L9FC030AC
/* 003074 9FC03074 00008021 */   addu       $s0, $zero, $zero
/* 003078 9FC03078 00102980 */  sll         $a1, $s0, 6
.L9FC0307C:
/* 00307C 9FC0307C 8E440004 */  lw          $a0, 4($s2)
/* 003080 9FC03080 8E220020 */  lw          $v0, 0x20($s1)
/* 003084 9FC03084 2484004C */  addiu       $a0, $a0, 0x4c
/* 003088 9FC03088 0FF00E7B */  jal         strstr
/* 00308C 9FC0308C 00452821 */   addu       $a1, $v0, $a1
/* 003090 9FC03090 1440FFF1 */  bnez        $v0, .L9FC03058
/* 003094 9FC03094 26100001 */   addiu      $s0, $s0, 1
/* 003098 9FC03098 8E22001C */  lw          $v0, 0x1c($s1)
/* 00309C 9FC0309C 8C420254 */  lw          $v0, 0x254($v0)
/* 0030A0 9FC030A0 0202102B */  sltu        $v0, $s0, $v0
/* 0030A4 9FC030A4 5440FFF5 */  bnel        $v0, $zero, .L9FC0307C
/* 0030A8 9FC030A8 00102980 */   sll        $a1, $s0, 6
.L9FC030AC:
/* 0030AC 9FC030AC 8E220038 */  lw          $v0, 0x38($s1)
.L9FC030B0:
/* 0030B0 9FC030B0 50400012 */  beql        $v0, $zero, .L9FC030FC
/* 0030B4 9FC030B4 00001021 */   addu       $v0, $zero, $zero
/* 0030B8 9FC030B8 8C420254 */  lw          $v0, 0x254($v0)
/* 0030BC 9FC030BC 1040000E */  beqz        $v0, .L9FC030F8
/* 0030C0 9FC030C0 00008021 */   addu       $s0, $zero, $zero
/* 0030C4 9FC030C4 00102980 */  sll         $a1, $s0, 6
.L9FC030C8:
/* 0030C8 9FC030C8 8E440000 */  lw          $a0, ($s2)
/* 0030CC 9FC030CC 8E22003C */  lw          $v0, 0x3c($s1)
/* 0030D0 9FC030D0 2484004C */  addiu       $a0, $a0, 0x4c
/* 0030D4 9FC030D4 0FF00E7B */  jal         strstr
/* 0030D8 9FC030D8 00452821 */   addu       $a1, $v0, $a1
/* 0030DC 9FC030DC 1440FFDE */  bnez        $v0, .L9FC03058
/* 0030E0 9FC030E0 26100001 */   addiu      $s0, $s0, 1
/* 0030E4 9FC030E4 8E220038 */  lw          $v0, 0x38($s1)
/* 0030E8 9FC030E8 8C420254 */  lw          $v0, 0x254($v0)
/* 0030EC 9FC030EC 0202102B */  sltu        $v0, $s0, $v0
/* 0030F0 9FC030F0 5440FFF5 */  bnel        $v0, $zero, .L9FC030C8
/* 0030F4 9FC030F4 00102980 */   sll        $a1, $s0, 6
.L9FC030F8:
/* 0030F8 9FC030F8 00001021 */  addu        $v0, $zero, $zero
.L9FC030FC:
/* 0030FC 9FC030FC 8FBF0024 */  lw          $ra, 0x24($sp)
/* 003100 9FC03100 8FB20020 */  lw          $s2, 0x20($sp)
.L9FC03104:
/* 003104 9FC03104 8FB1001C */  lw          $s1, 0x1c($sp)
/* 003108 9FC03108 8FB00018 */  lw          $s0, 0x18($sp)
/* 00310C 9FC0310C 03E00008 */  jr          $ra
/* 003110 9FC03110 27BD0028 */   addiu      $sp, $sp, 0x28
