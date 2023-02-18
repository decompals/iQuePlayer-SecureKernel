/* 000F58 9FC00F58 27BDFFC0 */  addiu       $sp, $sp, -0x40
/* 000F5C 9FC00F5C AFB30034 */  sw          $s3, 0x34($sp)
/* 000F60 9FC00F60 00809821 */  addu        $s3, $a0, $zero
/* 000F64 9FC00F64 00002821 */  addu        $a1, $zero, $zero
/* 000F68 9FC00F68 24060004 */  addiu       $a2, $zero, 4
/* 000F6C 9FC00F6C AFBF0038 */  sw          $ra, 0x38($sp)
/* 000F70 9FC00F70 AFB20030 */  sw          $s2, 0x30($sp)
/* 000F74 9FC00F74 AFB1002C */  sw          $s1, 0x2c($sp)
/* 000F78 9FC00F78 0FF00F65 */  jal         check_untrusted_ptr_range
/* 000F7C 9FC00F7C AFB00028 */   sw         $s0, 0x28($sp)
/* 000F80 9FC00F80 1040008E */  beqz        $v0, .L9FC011BC
/* 000F84 9FC00F84 2402FFFF */   addiu      $v0, $zero, -1
/* 000F88 9FC00F88 3C129FC1 */  lui         $s2, %hi(D_9FC0ED7C)
/* 000F8C 9FC00F8C 2652ED7C */  addiu       $s2, $s2, %lo(D_9FC0ED7C)
/* 000F90 9FC00F90 8E420000 */  lw          $v0, ($s2)
/* 000F94 9FC00F94 30420002 */  andi        $v0, $v0, 2
/* 000F98 9FC00F98 14400019 */  bnez        $v0, .L9FC01000
/* 000F9C 9FC00F9C 00000000 */   nop
/* 000FA0 9FC00FA0 2671F000 */  addiu       $s1, $s3, -0x1000
/* 000FA4 9FC00FA4 02202021 */  addu        $a0, $s1, $zero
/* 000FA8 9FC00FA8 8E45FFC4 */  lw          $a1, -0x3c($s2)
/* 000FAC 9FC00FAC 0FF00F65 */  jal         check_untrusted_ptr_range
/* 000FB0 9FC00FB0 24060004 */   addiu      $a2, $zero, 4
/* 000FB4 9FC00FB4 10400081 */  beqz        $v0, .L9FC011BC
/* 000FB8 9FC00FB8 2402FFFF */   addiu      $v0, $zero, -1
/* 000FBC 9FC00FBC 3C109FC1 */  lui         $s0, %hi(sha1_ctx)
/* 000FC0 9FC00FC0 2610F080 */  addiu       $s0, $s0, %lo(sha1_ctx)
/* 000FC4 9FC00FC4 0FF019FF */  jal         SHA1Reset
/* 000FC8 9FC00FC8 02002021 */   addu       $a0, $s0, $zero
/* 000FCC 9FC00FCC 02002021 */  addu        $a0, $s0, $zero
/* 000FD0 9FC00FD0 8E46FFC4 */  lw          $a2, -0x3c($s2)
/* 000FD4 9FC00FD4 0FF01A12 */  jal         SHA1Input
/* 000FD8 9FC00FD8 02202821 */   addu       $a1, $s1, $zero
/* 000FDC 9FC00FDC 02002021 */  addu        $a0, $s0, $zero
/* 000FE0 9FC00FE0 0FF01A54 */  jal         SHA1Result
/* 000FE4 9FC00FE4 27A50010 */   addiu      $a1, $sp, 0x10
/* 000FE8 9FC00FE8 27A40010 */  addiu       $a0, $sp, 0x10
/* 000FEC 9FC00FEC 2645FFDC */  addiu       $a1, $s2, -0x24
/* 000FF0 9FC00FF0 0FF00EC7 */  jal         memcmp
/* 000FF4 9FC00FF4 24060014 */   addiu      $a2, $zero, 0x14
/* 000FF8 9FC00FF8 14400070 */  bnez        $v0, .L9FC011BC
/* 000FFC 9FC00FFC 2402FFFF */   addiu      $v0, $zero, -1
.L9FC01000:
/* 001000 9FC01000 3C109FC1 */  lui         $s0, %hi(D_9FC0EEE8)
/* 001004 9FC01004 2610EEE8 */  addiu       $s0, $s0, %lo(D_9FC0EEE8)
/* 001008 9FC01008 96040000 */  lhu         $a0, ($s0)
/* 00100C 9FC0100C 8603FFFC */  lh          $v1, -4($s0)
/* 001010 9FC01010 3402FFFF */  ori         $v0, $zero, 0xffff
/* 001014 9FC01014 3C019FC1 */  lui         $at, %hi(g_cur_proc_trial_type)
/* 001018 9FC01018 A422EBB4 */  sh          $v0, %lo(g_cur_proc_trial_type)($at)
/* 00101C 9FC0101C 3C019FC1 */  lui         $at, %hi(D_9FC0F304)
/* 001020 9FC01020 AC24F304 */  sw          $a0, %lo(D_9FC0F304)($at)
/* 001024 9FC01024 0461003A */  bgez        $v1, .L9FC01110
/* 001028 9FC01028 00000000 */   nop
/* 00102C 9FC0102C 0FF00F53 */  jal         getTrialConsumptionByCid
/* 001030 9FC01030 9604FFFC */   lhu        $a0, -4($s0)
/* 001034 9FC01034 00402021 */  addu        $a0, $v0, $zero
/* 001038 9FC01038 10800060 */  beqz        $a0, .L9FC011BC
/* 00103C 9FC0103C 2402FFFF */   addiu      $v0, $zero, -1
/* 001040 9FC01040 94820000 */  lhu         $v0, ($a0)
/* 001044 9FC01044 96030000 */  lhu         $v1, ($s0)
/* 001048 9FC01048 0043102B */  sltu        $v0, $v0, $v1
/* 00104C 9FC0104C 1040005B */  beqz        $v0, .L9FC011BC
/* 001050 9FC01050 2402FFFF */   addiu      $v0, $zero, -1
/* 001054 9FC01054 9602FFFE */  lhu         $v0, -2($s0)
/* 001058 9FC01058 3043FFFF */  andi        $v1, $v0, 0xffff
/* 00105C 9FC0105C 3C019FC1 */  lui         $at, %hi(g_cur_proc_trial_type)
/* 001060 9FC01060 A422EBB4 */  sh          $v0, %lo(g_cur_proc_trial_type)($at)
/* 001064 9FC01064 24020002 */  addiu       $v0, $zero, 2
/* 001068 9FC01068 50620004 */  beql        $v1, $v0, .L9FC0107C
/* 00106C 9FC0106C 94830000 */   lhu        $v1, ($a0)
/* 001070 9FC01070 5460001F */  bnel        $v1, $zero, .L9FC010F0
/* 001074 9FC01074 94820000 */   lhu        $v0, ($a0)
/* 001078 9FC01078 94830000 */  lhu         $v1, ($a0)
.L9FC0107C:
/* 00107C 9FC0107C 3C029FC1 */  lui         $v0, %hi(D_9FC0F304)
/* 001080 9FC01080 8C42F304 */  lw          $v0, %lo(D_9FC0F304)($v0)
/* 001084 9FC01084 00431023 */  subu        $v0, $v0, $v1
/* 001088 9FC01088 24450003 */  addiu       $a1, $v0, 3
/* 00108C 9FC0108C 04A20001 */  bltzl       $a1, .L9FC01094
/* 001090 9FC01090 24450006 */   addiu      $a1, $v0, 6
.L9FC01094:
/* 001094 9FC01094 00031100 */  sll         $v0, $v1, 4
/* 001098 9FC01098 00431023 */  subu        $v0, $v0, $v1
/* 00109C 9FC0109C 00021083 */  sra         $v0, $v0, 2
/* 0010A0 9FC010A0 3C019FC1 */  lui         $at, %hi(g_trial_time_elapsed)
/* 0010A4 9FC010A4 AC22F300 */  sw          $v0, %lo(g_trial_time_elapsed)($at)
/* 0010A8 9FC010A8 94820000 */  lhu         $v0, ($a0)
/* 0010AC 9FC010AC 00051883 */  sra         $v1, $a1, 2
/* 0010B0 9FC010B0 3C019FC1 */  lui         $at, %hi(D_9FC0EBB2)
/* 0010B4 9FC010B4 A422EBB2 */  sh          $v0, %lo(D_9FC0EBB2)($at)
/* 0010B8 9FC010B8 18600004 */  blez        $v1, .L9FC010CC
/* 0010BC 9FC010BC 00000000 */   nop
/* 0010C0 9FC010C0 94820000 */  lhu         $v0, ($a0)
/* 0010C4 9FC010C4 0BF00435 */  j           .L9FC010D4
/* 0010C8 9FC010C8 00431021 */   addu       $v0, $v0, $v1
.L9FC010CC:
/* 0010CC 9FC010CC 3C029FC1 */  lui         $v0, %hi(D_9FC0F304 + 2)
/* 0010D0 9FC010D0 9442F306 */  lhu         $v0, %lo(D_9FC0F304 + 2)($v0)
.L9FC010D4:
/* 0010D4 9FC010D4 A4820000 */  sh          $v0, ($a0)
/* 0010D8 9FC010D8 3C029FC1 */  lui         $v0, %hi(D_9FC0EEE4)
/* 0010DC 9FC010DC 9442EEE4 */  lhu         $v0, %lo(D_9FC0EEE4)($v0)
/* 0010E0 9FC010E0 3C019FC1 */  lui         $at, %hi(D_9FC0EBB0)
/* 0010E4 9FC010E4 A422EBB0 */  sh          $v0, %lo(D_9FC0EBB0)($at)
/* 0010E8 9FC010E8 0BF0043E */  j           .L9FC010F8
/* 0010EC 9FC010EC 00000000 */   nop
.L9FC010F0:
/* 0010F0 9FC010F0 24420001 */  addiu       $v0, $v0, 1
/* 0010F4 9FC010F4 A4820000 */  sh          $v0, ($a0)
.L9FC010F8:
/* 0010F8 9FC010F8 3C049FC1 */  lui         $a0, %hi(D_9FC0F308)
/* 0010FC 9FC010FC 2484F308 */  addiu       $a0, $a0, %lo(D_9FC0F308)
/* 001100 9FC01100 0FF00EF3 */  jal         write_virage01_data
/* 001104 9FC01104 00000000 */   nop
/* 001108 9FC01108 0BF00449 */  j           .L9FC01124
/* 00110C 9FC0110C 00000000 */   nop
.L9FC01110:
/* 001110 9FC01110 10800004 */  beqz        $a0, .L9FC01124
/* 001114 9FC01114 00000000 */   nop
/* 001118 9FC01118 9602FFFE */  lhu         $v0, -2($s0)
/* 00111C 9FC0111C 3C019FC1 */  lui         $at, %hi(g_cur_proc_trial_type)
/* 001120 9FC01120 A422EBB4 */  sh          $v0, %lo(g_cur_proc_trial_type)($at)
.L9FC01124:
/* 001124 9FC01124 3C049FC1 */  lui         $a0, %hi(contentMetaDataHead)
/* 001128 9FC01128 2484ED34 */  addiu       $a0, $a0, %lo(contentMetaDataHead)
/* 00112C 9FC0112C 0FF00C94 */  jal         set_proc_permissions
/* 001130 9FC01130 00000000 */   nop
/* 001134 9FC01134 3C02A460 */  lui         $v0, (0xA4600060 >> 16)
/* 001138 9FC01138 34420060 */  ori         $v0, $v0, (0xA4600060 & 0xFFFF)
/* 00113C 9FC0113C 8C420000 */  lw          $v0, ($v0)
/* 001140 9FC01140 3C03C000 */  lui         $v1, 0xc000
/* 001144 9FC01144 00431024 */  and         $v0, $v0, $v1
/* 001148 9FC01148 1040000B */  beqz        $v0, .L9FC01178
/* 00114C 9FC0114C 3C03A430 */   lui        $v1, (0xA430003C >> 16)
/* 001150 9FC01150 3463003C */  ori         $v1, $v1, (0xA430003C & 0xFFFF)
/* 001154 9FC01154 3C04A430 */  lui         $a0, (0xA4300014 >> 16)
/* 001158 9FC01158 34840014 */  ori         $a0, $a0, (0xA4300014 & 0xFFFF)
/* 00115C 9FC0115C 3C020100 */  lui         $v0, 0x100
/* 001160 9FC01160 3C050200 */  lui         $a1, 0x200
/* 001164 9FC01164 AC620000 */  sw          $v0, ($v1)
/* 001168 9FC01168 AC650000 */  sw          $a1, ($v1)
/* 00116C 9FC0116C 8C820000 */  lw          $v0, ($a0)
/* 001170 9FC01170 00451025 */  or          $v0, $v0, $a1
/* 001174 9FC01174 AC820000 */  sw          $v0, ($a0)
.L9FC01178:
/* 001178 9FC01178 3C039FC1 */  lui         $v1, %hi(g_cur_proc_trial_type)
/* 00117C 9FC0117C 9463EBB4 */  lhu         $v1, %lo(g_cur_proc_trial_type)($v1)
/* 001180 9FC01180 24020002 */  addiu       $v0, $zero, 2
/* 001184 9FC01184 50620003 */  beql        $v1, $v0, .L9FC01194
/* 001188 9FC01188 3C03A430 */   lui        $v1, (0xA4300018 >> 16)
/* 00118C 9FC0118C 14600005 */  bnez        $v1, .L9FC011A4
/* 001190 9FC01190 3C03A430 */   lui        $v1, (0xA4300018 >> 16)
.L9FC01194:
/* 001194 9FC01194 34630018 */  ori         $v1, $v1, (0xA4300018 & 0xFFFF)
/* 001198 9FC01198 3C027530 */  lui         $v0, (0x7530C800 >> 16)
/* 00119C 9FC0119C 3442C800 */  ori         $v0, $v0, (0x7530C800 & 0xFFFF)
/* 0011A0 9FC011A0 AC620000 */  sw          $v0, ($v1)
.L9FC011A4:
/* 0011A4 9FC011A4 02601021 */  addu        $v0, $s3, $zero
/* 0011A8 9FC011A8 3C089FC0 */  lui         $t0, %hi(launch_app_trampoline)
/* 0011AC 9FC011AC 250803C0 */  addiu       $t0, $t0, %lo(launch_app_trampoline)
/* 0011B0 9FC011B0 01000008 */  jr          $t0
/* 0011B4 9FC011B4 00000000 */   nop
/* 0011B8 9FC011B8 2402FFFF */  addiu       $v0, $zero, -1
.L9FC011BC:
/* 0011BC 9FC011BC 8FBF0038 */  lw          $ra, 0x38($sp)
/* 0011C0 9FC011C0 8FB30034 */  lw          $s3, 0x34($sp)
/* 0011C4 9FC011C4 8FB20030 */  lw          $s2, 0x30($sp)
/* 0011C8 9FC011C8 8FB1002C */  lw          $s1, 0x2c($sp)
/* 0011CC 9FC011CC 8FB00028 */  lw          $s0, 0x28($sp)
/* 0011D0 9FC011D0 03E00008 */  jr          $ra
/* 0011D4 9FC011D4 27BD0040 */   addiu      $sp, $sp, 0x40
