## func_9FC0079C
/* 002650 9FC02650 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 002654 9FC02654 3C049FC1 */  lui         $a0, %hi(g_trial_time_elapsed)
/* 002658 9FC02658 8C84F300 */  lw          $a0, %lo(g_trial_time_elapsed)($a0)
/* 00265C 9FC0265C 3C038888 */  lui         $v1, (0x88888889 >> 16)
/* 002660 9FC02660 34638889 */  ori         $v1, $v1, (0x88888889 & 0xFFFF)
/* 002664 9FC02664 AFB00010 */  sw          $s0, 0x10($sp)
/* 002668 9FC02668 24840001 */  addiu       $a0, $a0, 1
/* 00266C 9FC0266C 00048100 */  sll         $s0, $a0, 4
/* 002670 9FC02670 2602001E */  addiu       $v0, $s0, 0x1e
/* 002674 9FC02674 00430019 */  multu       $v0, $v1
/* 002678 9FC02678 3C039FC1 */  lui         $v1, %hi(g_cur_proc_trial_type)
/* 00267C 9FC0267C 9463EBB4 */  lhu         $v1, %lo(g_cur_proc_trial_type)($v1)
/* 002680 9FC02680 AFBF0014 */  sw          $ra, 0x14($sp)
/* 002684 9FC02684 3C019FC1 */  lui         $at, %hi(g_trial_time_elapsed)
/* 002688 9FC02688 AC24F300 */  sw          $a0, %lo(g_trial_time_elapsed)($at)
/* 00268C 9FC0268C 00001010 */  mfhi        $v0
/* 002690 9FC02690 00021142 */  srl         $v0, $v0, 5
/* 002694 9FC02694 3C019FC1 */  lui         $at, %hi(D_9FC0EBB2)
/* 002698 9FC02698 A422EBB2 */  sh          $v0, %lo(D_9FC0EBB2)($at)
/* 00269C 9FC0269C 14600003 */  bnez        $v1, .L9FC026AC
/* 0026A0 9FC026A0 00000000 */   nop
/* 0026A4 9FC026A4 0FF00013 */  jal         startup
/* 0026A8 9FC026A8 00000000 */   nop
.L9FC026AC:
/* 0026AC 9FC026AC 3C039FC1 */  lui         $v1, %hi(D_9FC0F304)
/* 0026B0 9FC026B0 8C63F304 */  lw          $v1, %lo(D_9FC0F304)($v1)
/* 0026B4 9FC026B4 00031100 */  sll         $v0, $v1, 4
/* 0026B8 9FC026B8 00431023 */  subu        $v0, $v0, $v1
/* 0026BC 9FC026BC 00021080 */  sll         $v0, $v0, 2
/* 0026C0 9FC026C0 0202102B */  sltu        $v0, $s0, $v0
/* 0026C4 9FC026C4 14400004 */  bnez        $v0, .L9FC026D8
/* 0026C8 9FC026C8 3C03A430 */   lui        $v1, (0xA4300018 >> 16)
/* 0026CC 9FC026CC 0FF00013 */  jal         startup
/* 0026D0 9FC026D0 00000000 */   nop
/* 0026D4 9FC026D4 3C03A430 */  lui         $v1, (0xA4300018 >> 16)
.L9FC026D8:
/* 0026D8 9FC026D8 34630018 */  ori         $v1, $v1, (0xA4300018 & 0xFFFF)
/* 0026DC 9FC026DC 3C027530 */  lui         $v0, (0x7530C800 >> 16)
/* 0026E0 9FC026E0 8FBF0014 */  lw          $ra, 0x14($sp)
/* 0026E4 9FC026E4 8FB00010 */  lw          $s0, 0x10($sp)
/* 0026E8 9FC026E8 3442C800 */  ori         $v0, $v0, (0x7530C800 & 0xFFFF)
/* 0026EC 9FC026EC AC620000 */  sw          $v0, ($v1)
/* 0026F0 9FC026F0 00001021 */  addu        $v0, $zero, $zero
/* 0026F4 9FC026F4 03E00008 */  jr          $ra
/* 0026F8 9FC026F8 27BD0018 */   addiu      $sp, $sp, 0x18
