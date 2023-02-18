/* 001A78 9FC01A78 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 001A7C 9FC01A7C 3C02A430 */  lui         $v0, (0xA4300018 >> 16)
/* 001A80 9FC01A80 34420018 */  ori         $v0, $v0, (0xA4300018 & 0xFFFF)
/* 001A84 9FC01A84 3405C800 */  ori         $a1, $zero, 0xc800
/* 001A88 9FC01A88 AFBF0010 */  sw          $ra, 0x10($sp)
/* 001A8C 9FC01A8C 8C420000 */  lw          $v0, ($v0)
/* 001A90 9FC01A90 3C039FC1 */  lui         $v1, %hi(g_cur_proc_trial_type)
/* 001A94 9FC01A94 9463EBB4 */  lhu         $v1, %lo(g_cur_proc_trial_type)($v1)
/* 001A98 9FC01A98 00021402 */  srl         $v0, $v0, 0x10
/* 001A9C 9FC01A9C 1460002C */  bnez        $v1, .L9FC01B50
/* 001AA0 9FC01AA0 00A22023 */   subu       $a0, $a1, $v0
/* 001AA4 9FC01AA4 3C029FC1 */  lui         $v0, %hi(D_9FC0ED30)
/* 001AA8 9FC01AA8 8C42ED30 */  lw          $v0, %lo(D_9FC0ED30)($v0)
/* 001AAC 9FC01AAC 00441821 */  addu        $v1, $v0, $a0
/* 001AB0 9FC01AB0 00A3102B */  sltu        $v0, $a1, $v1
/* 001AB4 9FC01AB4 3C019FC1 */  lui         $at, %hi(D_9FC0ED30)
/* 001AB8 9FC01AB8 AC23ED30 */  sw          $v1, %lo(D_9FC0ED30)($at)
/* 001ABC 9FC01ABC 10400008 */  beqz        $v0, .L9FC01AE0
/* 001AC0 9FC01AC0 00651823 */   subu       $v1, $v1, $a1
/* 001AC4 9FC01AC4 3C029FC1 */  lui         $v0, %hi(g_trial_time_elapsed)
/* 001AC8 9FC01AC8 8C42F300 */  lw          $v0, %lo(g_trial_time_elapsed)($v0)
/* 001ACC 9FC01ACC 3C019FC1 */  lui         $at, %hi(D_9FC0ED30)
/* 001AD0 9FC01AD0 AC23ED30 */  sw          $v1, %lo(D_9FC0ED30)($at)
/* 001AD4 9FC01AD4 24420001 */  addiu       $v0, $v0, 1
/* 001AD8 9FC01AD8 3C019FC1 */  lui         $at, %hi(g_trial_time_elapsed)
/* 001ADC 9FC01ADC AC22F300 */  sw          $v0, %lo(g_trial_time_elapsed)($at)
.L9FC01AE0:
/* 001AE0 9FC01AE0 3C049FC1 */  lui         $a0, %hi(g_trial_time_elapsed)
/* 001AE4 9FC01AE4 8C84F300 */  lw          $a0, %lo(g_trial_time_elapsed)($a0)
/* 001AE8 9FC01AE8 3C038888 */  lui         $v1, (0x88888889 >> 16)
/* 001AEC 9FC01AEC 34638889 */  ori         $v1, $v1, (0x88888889 & 0xFFFF)
/* 001AF0 9FC01AF0 00042100 */  sll         $a0, $a0, 4
/* 001AF4 9FC01AF4 2482001E */  addiu       $v0, $a0, 0x1e
/* 001AF8 9FC01AF8 00430019 */  multu       $v0, $v1
/* 001AFC 9FC01AFC 3C039FC1 */  lui         $v1, %hi(D_9FC0F304)
/* 001B00 9FC01B00 8C63F304 */  lw          $v1, %lo(D_9FC0F304)($v1)
/* 001B04 9FC01B04 00001010 */  mfhi        $v0
/* 001B08 9FC01B08 00021142 */  srl         $v0, $v0, 5
/* 001B0C 9FC01B0C 3C019FC1 */  lui         $at, %hi(D_9FC0EBB2)
/* 001B10 9FC01B10 A422EBB2 */  sh          $v0, %lo(D_9FC0EBB2)($at)
/* 001B14 9FC01B14 00031100 */  sll         $v0, $v1, 4
/* 001B18 9FC01B18 00431023 */  subu        $v0, $v0, $v1
/* 001B1C 9FC01B1C 00021080 */  sll         $v0, $v0, 2
/* 001B20 9FC01B20 0082202B */  sltu        $a0, $a0, $v0
/* 001B24 9FC01B24 14800007 */  bnez        $a0, .L9FC01B44
/* 001B28 9FC01B28 3C027530 */   lui        $v0, (0x7530C800 >> 16)
/* 001B2C 9FC01B2C 24020008 */  addiu       $v0, $zero, 8
/* 001B30 9FC01B30 3C019FC1 */  lui         $at, %hi(D_9FC0EBB8)
/* 001B34 9FC01B34 AC22EBB8 */  sw          $v0, %lo(D_9FC0EBB8)($at)
/* 001B38 9FC01B38 0FF00013 */  jal         startup
/* 001B3C 9FC01B3C 00000000 */   nop
/* 001B40 9FC01B40 3C027530 */  lui         $v0, (0x7530C800 >> 16)
.L9FC01B44:
/* 001B44 9FC01B44 3442C800 */  ori         $v0, $v0, (0x7530C800 & 0xFFFF)
/* 001B48 9FC01B48 3C01A430 */  lui         $at, (0xA4300018 >> 16)
/* 001B4C 9FC01B4C AC220018 */  sw          $v0, (0xA4300018 & 0xFFFF)($at)
.L9FC01B50:
/* 001B50 9FC01B50 00001021 */  addu        $v0, $zero, $zero
/* 001B54 9FC01B54 8FBF0010 */  lw          $ra, 0x10($sp)
/* 001B58 9FC01B58 03E00008 */  jr          $ra
/* 001B5C 9FC01B5C 27BD0018 */   addiu      $sp, $sp, 0x18
