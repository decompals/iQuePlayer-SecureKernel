## write_virage2
## write_virage01_data
/* 003FE8 9FC03FE8 27BDFFD0 */  addiu       $sp, $sp, -0x30
/* 003FEC 9FC03FEC AFB50024 */  sw          $s5, 0x24($sp)
/* 003FF0 9FC03FF0 0080A821 */  addu        $s5, $a0, $zero
/* 003FF4 9FC03FF4 AFB60028 */  sw          $s6, 0x28($sp)
/* 003FF8 9FC03FF8 00A0B021 */  addu        $s6, $a1, $zero
/* 003FFC 9FC03FFC AFB3001C */  sw          $s3, 0x1c($sp)
/* 004000 9FC04000 00C09821 */  addu        $s3, $a2, $zero
/* 004004 9FC04004 3C02FFFF */  lui         $v0, 0xffff
/* 004008 9FC04008 AFB40020 */  sw          $s4, 0x20($sp)
/* 00400C 9FC0400C 02A2A024 */  and         $s4, $s5, $v0
/* 004010 9FC04010 AFBF002C */  sw          $ra, 0x2c($sp)
/* 004014 9FC04014 AFB20018 */  sw          $s2, 0x18($sp)
/* 004018 9FC04018 AFB10014 */  sw          $s1, 0x14($sp)
/* 00401C 9FC0401C 0FF01088 */  jal         func_9FC04220
/* 004020 9FC04020 AFB00010 */   sw         $s0, 0x10($sp)
/* 004024 9FC04024 00408821 */  addu        $s1, $v0, $zero
/* 004028 9FC04028 240503E8 */  addiu       $a1, $zero, 0x3e8
/* 00402C 9FC0402C 16200002 */  bnez        $s1, .L9FC04038
/* 004030 9FC04030 00B1001A */   div        $zero, $a1, $s1
/* 004034 9FC04034 0007000D */  break       7
.L9FC04038:
/* 004038 9FC04038 2401FFFF */  addiu       $at, $zero, -1
/* 00403C 9FC0403C 16210004 */  bne         $s1, $at, .L9FC04050
/* 004040 9FC04040 3C018000 */   lui        $at, 0x8000
/* 004044 9FC04044 14A10002 */  bne         $a1, $at, .L9FC04050
/* 004048 9FC04048 00000000 */   nop
/* 00404C 9FC0404C 0006000D */  break       6
.L9FC04050:
/* 004050 9FC04050 00002812 */  mflo        $a1
/* 004054 9FC04054 3C040009 */  lui         $a0, (0x0009C400 >> 16)
/* 004058 9FC04058 3484C400 */  ori         $a0, $a0, (0x0009C400 & 0xFFFF)
/* 00405C 9FC0405C 16200002 */  bnez        $s1, .L9FC04068
/* 004060 9FC04060 0091001A */   div        $zero, $a0, $s1
/* 004064 9FC04064 0007000D */  break       7
.L9FC04068:
/* 004068 9FC04068 2401FFFF */  addiu       $at, $zero, -1
/* 00406C 9FC0406C 16210004 */  bne         $s1, $at, .L9FC04080
/* 004070 9FC04070 3C018000 */   lui        $at, 0x8000
/* 004074 9FC04074 14810002 */  bne         $a0, $at, .L9FC04080
/* 004078 9FC04078 00000000 */   nop
/* 00407C 9FC0407C 0006000D */  break       6
.L9FC04080:
/* 004080 9FC04080 00002012 */  mflo        $a0
/* 004084 9FC04084 3C03A430 */  lui         $v1, (0xA430001C >> 16)
/* 004088 9FC04088 3463001C */  ori         $v1, $v1, (0xA430001C & 0xFFFF)
/* 00408C 9FC0408C 3C02A000 */  lui         $v0, 0xa000
/* 004090 9FC04090 02A29025 */  or          $s2, $s5, $v0
/* 004094 9FC04094 AE400000 */  sw          $zero, ($s2)
/* 004098 9FC04098 24A50001 */  addiu       $a1, $a1, 1
/* 00409C 9FC0409C AC650000 */  sw          $a1, ($v1)
/* 0040A0 9FC040A0 0FF00FC4 */  jal         delay
/* 0040A4 9FC040A4 00000000 */   nop
/* 0040A8 9FC040A8 8E430000 */  lw          $v1, ($s2)
/* 0040AC 9FC040AC 30620001 */  andi        $v0, $v1, 1
/* 0040B0 9FC040B0 10400015 */  beqz        $v0, .L9FC04108
/* 0040B4 9FC040B4 3C02A000 */   lui        $v0, 0xa000
/* 0040B8 9FC040B8 24104E20 */  addiu       $s0, $zero, 0x4e20
/* 0040BC 9FC040BC 16200002 */  bnez        $s1, .L9FC040C8
/* 0040C0 9FC040C0 0211001A */   div        $zero, $s0, $s1
/* 0040C4 9FC040C4 0007000D */  break       7
.L9FC040C8:
/* 0040C8 9FC040C8 2401FFFF */  addiu       $at, $zero, -1
/* 0040CC 9FC040CC 16210004 */  bne         $s1, $at, .L9FC040E0
/* 0040D0 9FC040D0 3C018000 */   lui        $at, 0x8000
/* 0040D4 9FC040D4 16010002 */  bne         $s0, $at, .L9FC040E0
/* 0040D8 9FC040D8 00000000 */   nop
/* 0040DC 9FC040DC 0006000D */  break       6
.L9FC040E0:
/* 0040E0 9FC040E0 00008012 */  mflo        $s0
/* 0040E4 9FC040E4 0FF00FC4 */  jal         delay
/* 0040E8 9FC040E8 02002021 */   addu       $a0, $s0, $zero
/* 0040EC 9FC040EC 0FF00FC4 */  jal         delay
/* 0040F0 9FC040F0 02002021 */   addu       $a0, $s0, $zero
/* 0040F4 9FC040F4 8E430000 */  lw          $v1, ($s2)
/* 0040F8 9FC040F8 30620001 */  andi        $v0, $v1, 1
/* 0040FC 9FC040FC 1440003E */  bnez        $v0, .L9FC041F8
/* 004100 9FC04100 2402FFFF */   addiu      $v0, $zero, -1
/* 004104 9FC04104 3C02A000 */  lui         $v0, 0xa000
.L9FC04108:
/* 004108 9FC04108 02A21025 */  or          $v0, $s5, $v0
/* 00410C 9FC0410C 8C430000 */  lw          $v1, ($v0)
/* 004110 9FC04110 3C024000 */  lui         $v0, 0x4000
/* 004114 9FC04114 00621024 */  and         $v0, $v1, $v0
/* 004118 9FC04118 10400037 */  beqz        $v0, .L9FC041F8
/* 00411C 9FC0411C 2402FFFF */   addiu      $v0, $zero, -1
/* 004120 9FC04120 1A60000F */  blez        $s3, .L9FC04160
/* 004124 9FC04124 00002021 */   addu       $a0, $zero, $zero
/* 004128 9FC04128 02C02821 */  addu        $a1, $s6, $zero
/* 00412C 9FC0412C 02803021 */  addu        $a2, $s4, $zero
.L9FC04130:
/* 004130 9FC04130 3C02A000 */  lui         $v0, 0xa000
/* 004134 9FC04134 8CA30000 */  lw          $v1, ($a1)
/* 004138 9FC04138 00C21025 */  or          $v0, $a2, $v0
/* 00413C 9FC0413C AC430000 */  sw          $v1, ($v0)
/* 004140 9FC04140 8C430000 */  lw          $v1, ($v0)
/* 004144 9FC04144 8CA20000 */  lw          $v0, ($a1)
/* 004148 9FC04148 1462001A */  bne         $v1, $v0, .L9FC041B4
/* 00414C 9FC0414C 24A50004 */   addiu      $a1, $a1, 4
/* 004150 9FC04150 24840001 */  addiu       $a0, $a0, 1
/* 004154 9FC04154 0093102A */  slt         $v0, $a0, $s3
/* 004158 9FC04158 1440FFF5 */  bnez        $v0, .L9FC04130
/* 00415C 9FC0415C 24C60004 */   addiu      $a2, $a2, 4
.L9FC04160:
/* 004160 9FC04160 0FF010C1 */  jal         func_9FC04304
/* 004164 9FC04164 02A02021 */   addu       $a0, $s5, $zero
/* 004168 9FC04168 14400023 */  bnez        $v0, .L9FC041F8
/* 00416C 9FC0416C 2402FFFF */   addiu      $v0, $zero, -1
/* 004170 9FC04170 1A60000C */  blez        $s3, .L9FC041A4
/* 004174 9FC04174 00002021 */   addu       $a0, $zero, $zero
/* 004178 9FC04178 02802821 */  addu        $a1, $s4, $zero
.L9FC0417C:
/* 00417C 9FC0417C 3C02A000 */  lui         $v0, 0xa000
/* 004180 9FC04180 00A21025 */  or          $v0, $a1, $v0
/* 004184 9FC04184 AC400000 */  sw          $zero, ($v0)
/* 004188 9FC04188 8C430000 */  lw          $v1, ($v0)
/* 00418C 9FC0418C 1460001A */  bnez        $v1, .L9FC041F8
/* 004190 9FC04190 2402FFFF */   addiu      $v0, $zero, -1
/* 004194 9FC04194 24840001 */  addiu       $a0, $a0, 1
/* 004198 9FC04198 0093102A */  slt         $v0, $a0, $s3
/* 00419C 9FC0419C 1440FFF7 */  bnez        $v0, .L9FC0417C
/* 0041A0 9FC041A0 24A50004 */   addiu      $a1, $a1, 4
.L9FC041A4:
/* 0041A4 9FC041A4 0FF01097 */  jal         func_9FC0425C
/* 0041A8 9FC041A8 02A02021 */   addu       $a0, $s5, $zero
/* 0041AC 9FC041AC 10400003 */  beqz        $v0, .L9FC041BC
/* 0041B0 9FC041B0 00000000 */   nop
.L9FC041B4:
/* 0041B4 9FC041B4 0BF0107E */  j           .L9FC041F8
/* 0041B8 9FC041B8 2402FFFF */   addiu      $v0, $zero, -1
.L9FC041BC:
/* 0041BC 9FC041BC 1A60000D */  blez        $s3, .L9FC041F4
/* 0041C0 9FC041C0 00002021 */   addu       $a0, $zero, $zero
/* 0041C4 9FC041C4 02C02821 */  addu        $a1, $s6, $zero
/* 0041C8 9FC041C8 02803021 */  addu        $a2, $s4, $zero
.L9FC041CC:
/* 0041CC 9FC041CC 3C02A000 */  lui         $v0, 0xa000
/* 0041D0 9FC041D0 00C21025 */  or          $v0, $a2, $v0
/* 0041D4 9FC041D4 8C430000 */  lw          $v1, ($v0)
/* 0041D8 9FC041D8 8CA20000 */  lw          $v0, ($a1)
/* 0041DC 9FC041DC 1462FFF5 */  bne         $v1, $v0, .L9FC041B4
/* 0041E0 9FC041E0 24A50004 */   addiu      $a1, $a1, 4
/* 0041E4 9FC041E4 24840001 */  addiu       $a0, $a0, 1
/* 0041E8 9FC041E8 0093102A */  slt         $v0, $a0, $s3
/* 0041EC 9FC041EC 1440FFF7 */  bnez        $v0, .L9FC041CC
/* 0041F0 9FC041F0 24C60004 */   addiu      $a2, $a2, 4
.L9FC041F4:
/* 0041F4 9FC041F4 00001021 */  addu        $v0, $zero, $zero
.L9FC041F8:
/* 0041F8 9FC041F8 8FBF002C */  lw          $ra, 0x2c($sp)
/* 0041FC 9FC041FC 8FB60028 */  lw          $s6, 0x28($sp)
/* 004200 9FC04200 8FB50024 */  lw          $s5, 0x24($sp)
/* 004204 9FC04204 8FB40020 */  lw          $s4, 0x20($sp)
/* 004208 9FC04208 8FB3001C */  lw          $s3, 0x1c($sp)
/* 00420C 9FC0420C 8FB20018 */  lw          $s2, 0x18($sp)
/* 004210 9FC04210 8FB10014 */  lw          $s1, 0x14($sp)
/* 004214 9FC04214 8FB00010 */  lw          $s0, 0x10($sp)
/* 004218 9FC04218 03E00008 */  jr          $ra
/* 00421C 9FC0421C 27BD0030 */   addiu      $sp, $sp, 0x30
