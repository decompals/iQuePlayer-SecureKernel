## startup
/* 0022A8 9FC022A8 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 0022AC 9FC022AC 3C04A460 */  lui         $a0, (0xA4600060 >> 16)
/* 0022B0 9FC022B0 34840060 */  ori         $a0, $a0, (0xA4600060 & 0xFFFF)
/* 0022B4 9FC022B4 3C0FA430 */  lui         $t7, (0xA430003C >> 16)
/* 0022B8 9FC022B8 35EF003C */  ori         $t7, $t7, (0xA430003C & 0xFFFF)
/* 0022BC 9FC022BC AFB00018 */  sw          $s0, 0x18($sp)
/* 0022C0 9FC022C0 3C10A430 */  lui         $s0, (0xA4300014 >> 16)
/* 0022C4 9FC022C4 36100014 */  ori         $s0, $s0, (0xA4300014 & 0xFFFF)
/* 0022C8 9FC022C8 3C0CFDFF */  lui         $t4, (0xFDFFFFFF >> 16)
/* 0022CC 9FC022CC 358CFFFF */  ori         $t4, $t4, (0xFDFFFFFF & 0xFFFF)
/* 0022D0 9FC022D0 3C0DA430 */  lui         $t5, (0xA4300018 >> 16)
/* 0022D4 9FC022D4 35AD0018 */  ori         $t5, $t5, (0xA4300018 & 0xFFFF)
/* 0022D8 9FC022D8 3C0EA460 */  lui         $t6, (0xA4600010 >> 16)
/* 0022DC 9FC022DC 35CE0010 */  ori         $t6, $t6, (0xA4600010 & 0xFFFF)
/* 0022E0 9FC022E0 3C0AA460 */  lui         $t2, (0xA4600048 >> 16)
/* 0022E4 9FC022E4 354A0048 */  ori         $t2, $t2, (0xA4600048 & 0xFFFF)
/* 0022E8 9FC022E8 3C08A460 */  lui         $t0, (0xA4600050 >> 16)
/* 0022EC 9FC022EC 35080050 */  ori         $t0, $t0, (0xA4600050 & 0xFFFF)
/* 0022F0 9FC022F0 3C05A440 */  lui         $a1, (0xA4400010 >> 16)
/* 0022F4 9FC022F4 34A50010 */  ori         $a1, $a1, (0xA4400010 & 0xFFFF)
/* 0022F8 9FC022F8 3C06A404 */  lui         $a2, (0xA4040010 >> 16)
/* 0022FC 9FC022FC 34C60010 */  ori         $a2, $a2, (0xA4040010 & 0xFFFF)
/* 002300 9FC02300 3C07A450 */  lui         $a3, (0xA450000C >> 16)
/* 002304 9FC02304 34E7000C */  ori         $a3, $a3, (0xA450000C & 0xFFFF)
/* 002308 9FC02308 3C03A480 */  lui         $v1, (0xA4800018 >> 16)
/* 00230C 9FC0230C 34630018 */  ori         $v1, $v1, (0xA4800018 & 0xFFFF)
/* 002310 9FC02310 3C0BA430 */  lui         $t3, (0xA430000C >> 16)
/* 002314 9FC02314 356B000C */  ori         $t3, $t3, (0xA430000C & 0xFFFF)
/* 002318 9FC02318 3C090555 */  lui         $t1, (0x05555000 >> 16)
/* 00231C 9FC0231C 35295000 */  ori         $t1, $t1, (0x05555000 & 0xFFFF)
/* 002320 9FC02320 24020031 */  addiu       $v0, $zero, 0x31
/* 002324 9FC02324 AFBF0020 */  sw          $ra, 0x20($sp)
/* 002328 9FC02328 AFB1001C */  sw          $s1, 0x1c($sp)
/* 00232C 9FC0232C AC820000 */  sw          $v0, ($a0)
/* 002330 9FC02330 3C020100 */  lui         $v0, 0x100
/* 002334 9FC02334 3C119FC1 */  lui         $s1, %hi(D_9FC0F308)
/* 002338 9FC02338 2631F308 */  addiu       $s1, $s1, %lo(D_9FC0F308)
/* 00233C 9FC0233C ADE20000 */  sw          $v0, ($t7)
/* 002340 9FC02340 8E020000 */  lw          $v0, ($s0)
/* 002344 9FC02344 02202021 */  addu        $a0, $s1, $zero
/* 002348 9FC02348 004C1024 */  and         $v0, $v0, $t4
/* 00234C 9FC0234C AE020000 */  sw          $v0, ($s0)
/* 002350 9FC02350 24020003 */  addiu       $v0, $zero, 3
/* 002354 9FC02354 ADA00000 */  sw          $zero, ($t5)
/* 002358 9FC02358 ADC20000 */  sw          $v0, ($t6)
/* 00235C 9FC0235C 34028008 */  ori         $v0, $zero, 0x8008
/* 002360 9FC02360 AD400000 */  sw          $zero, ($t2)
/* 002364 9FC02364 AD000000 */  sw          $zero, ($t0)
/* 002368 9FC02368 ACA00000 */  sw          $zero, ($a1)
/* 00236C 9FC0236C ACC20000 */  sw          $v0, ($a2)
/* 002370 9FC02370 24020001 */  addiu       $v0, $zero, 1
/* 002374 9FC02374 ACE20000 */  sw          $v0, ($a3)
/* 002378 9FC02378 AC600000 */  sw          $zero, ($v1)
/* 00237C 9FC0237C 3C03A430 */  lui         $v1, (0xA4300000 >> 16)
/* 002380 9FC02380 24020800 */  addiu       $v0, $zero, 0x800
/* 002384 9FC02384 AC620000 */  sw          $v0, (0xA4300000 & 0xFFFF)($v1)
/* 002388 9FC02388 24020555 */  addiu       $v0, $zero, 0x555
/* 00238C 9FC0238C AD620000 */  sw          $v0, ($t3)
/* 002390 9FC02390 ADE90000 */  sw          $t1, ($t7)
/* 002394 9FC02394 0FF00F17 */  jal         set_virage01_selector
/* 002398 9FC02398 00000000 */   nop
/* 00239C 9FC0239C 8E020000 */  lw          $v0, ($s0)
/* 0023A0 9FC023A0 304200FC */  andi        $v0, $v0, 0xfc
/* 0023A4 9FC023A4 14400005 */  bnez        $v0, .L9FC023BC
/* 0023A8 9FC023A8 00000000 */   nop
/* 0023AC 9FC023AC 3C029FC1 */  lui         $v0, %hi(g_cur_proc_trial_type)
/* 0023B0 9FC023B0 9442EBB4 */  lhu         $v0, %lo(g_cur_proc_trial_type)($v0)
/* 0023B4 9FC023B4 14400015 */  bnez        $v0, .L9FC0240C
/* 0023B8 9FC023B8 00000000 */   nop
.L9FC023BC:
/* 0023BC 9FC023BC 3C029FC1 */  lui         $v0, %hi(D_9FC0EBB0)
/* 0023C0 9FC023C0 9442EBB0 */  lhu         $v0, %lo(D_9FC0EBB0)($v0)
/* 0023C4 9FC023C4 3410FFFF */  ori         $s0, $zero, 0xffff
/* 0023C8 9FC023C8 10500012 */  beq         $v0, $s0, .L9FC02414
/* 0023CC 9FC023CC 00000000 */   nop
/* 0023D0 9FC023D0 0FF00F53 */  jal         getTrialConsumptionByCid
/* 0023D4 9FC023D4 00402021 */   addu       $a0, $v0, $zero
/* 0023D8 9FC023D8 00401821 */  addu        $v1, $v0, $zero
/* 0023DC 9FC023DC 10600005 */  beqz        $v1, .L9FC023F4
/* 0023E0 9FC023E0 02202021 */   addu       $a0, $s1, $zero
/* 0023E4 9FC023E4 3C029FC1 */  lui         $v0, %hi(D_9FC0EBB2)
/* 0023E8 9FC023E8 9442EBB2 */  lhu         $v0, %lo(D_9FC0EBB2)($v0)
/* 0023EC 9FC023EC 0FF00EF3 */  jal         write_virage01_data
/* 0023F0 9FC023F0 A4620000 */   sh         $v0, ($v1)
.L9FC023F4:
/* 0023F4 9FC023F4 3C019FC1 */  lui         $at, %hi(g_cur_proc_trial_type)
/* 0023F8 9FC023F8 A430EBB4 */  sh          $s0, %lo(g_cur_proc_trial_type)($at)
/* 0023FC 9FC023FC 3C019FC1 */  lui         $at, %hi(D_9FC0EBB0)
/* 002400 9FC02400 A430EBB0 */  sh          $s0, %lo(D_9FC0EBB0)($at)
/* 002404 9FC02404 0BF00905 */  j           .L9FC02414
/* 002408 9FC02408 00000000 */   nop
.L9FC0240C:
/* 00240C 9FC0240C 0FF0071E */  jal         dram_init
/* 002410 9FC02410 00000000 */   nop
.L9FC02414:
/* 002414 9FC02414 0FF00962 */  jal         write_virage2
/* 002418 9FC02418 00000000 */   nop
/* 00241C 9FC0241C 10400005 */  beqz        $v0, .L9FC02434
/* 002420 9FC02420 00000000 */   nop
/* 002424 9FC02424 3C01BFC0 */  lui         $at, (0xBFC00380 >> 16)
/* 002428 9FC02428 34210380 */  ori         $at, $at, (0xBFC00380 & 0xFFFF)
/* 00242C 9FC0242C 0020F809 */  jal         $at
/* 002430 9FC02430 00000000 */   nop
.L9FC02434:
/* 002434 9FC02434 0FF00831 */  jal         func_9FC020C4
/* 002438 9FC02438 27A40010 */   addiu      $a0, $sp, 0x10
/* 00243C 9FC0243C 10400006 */  beqz        $v0, .L9FC02458
/* 002440 9FC02440 3C02A460 */   lui        $v0, (0xA4600060 >> 16)
/* 002444 9FC02444 3C01BFC0 */  lui         $at, (0xBFC00380 >> 16)
/* 002448 9FC02448 34210380 */  ori         $at, $at, (0xBFC00380 & 0xFFFF)
/* 00244C 9FC0244C 0020F809 */  jalr        $at
/* 002450 9FC02450 00000000 */   nop
/* 002454 9FC02454 3C02A460 */  lui         $v0, (0xA4600060 >> 16)
.L9FC02458:
/* 002458 9FC02458 34420060 */  ori         $v0, $v0, (0xA4600060 & 0xFFFF)
/* 00245C 9FC0245C 24030033 */  addiu       $v1, $zero, 0x33
/* 002460 9FC02460 AC430000 */  sw          $v1, ($v0)
/* 002464 9FC02464 8FA20010 */  lw          $v0, 0x10($sp)
/* 002468 9FC02468 8FBF0020 */  lw          $ra, 0x20($sp)
/* 00246C 9FC0246C 8FB1001C */  lw          $s1, 0x1c($sp)
/* 002470 9FC02470 8FB00018 */  lw          $s0, 0x18($sp)
/* 002474 9FC02474 3403FFFF */  ori         $v1, $zero, 0xffff
/* 002478 9FC02478 3C019FC1 */  lui         $at, %hi(g_cur_proc_trial_type)
/* 00247C 9FC0247C A423EBB4 */  sh          $v1, %lo(g_cur_proc_trial_type)($at)
/* 002480 9FC02480 03E00008 */  jr          $ra
/* 002484 9FC02484 27BD0028 */   addiu      $sp, $sp, 0x28
