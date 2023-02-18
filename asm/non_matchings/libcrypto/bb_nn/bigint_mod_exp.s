## bsl_rsa_verify
/* 00752C 9FC0752C 27BDF798 */  addiu       $sp, $sp, -0x868
/* 007530 9FC07530 AFB7085C */  sw          $s7, 0x85c($sp)
/* 007534 9FC07534 8FB70878 */  lw          $s7, 0x878($sp)
/* 007538 9FC07538 AFB60858 */  sw          $s6, 0x858($sp)
/* 00753C 9FC0753C 8FB6087C */  lw          $s6, 0x87c($sp)
/* 007540 9FC07540 AFB00840 */  sw          $s0, 0x840($sp)
/* 007544 9FC07544 00A08021 */  addu        $s0, $a1, $zero
/* 007548 9FC07548 AFB3084C */  sw          $s3, 0x84c($sp)
/* 00754C 9FC0754C 00E09821 */  addu        $s3, $a3, $zero
/* 007550 9FC07550 AFB20848 */  sw          $s2, 0x848($sp)
/* 007554 9FC07554 00009021 */  addu        $s2, $zero, $zero
/* 007558 9FC07558 AFB10844 */  sw          $s1, 0x844($sp)
/* 00755C 9FC0755C 00C08821 */  addu        $s1, $a2, $zero
/* 007560 9FC07560 AFBF0864 */  sw          $ra, 0x864($sp)
/* 007564 9FC07564 AFBE0860 */  sw          $fp, 0x860($sp)
/* 007568 9FC07568 AFB50854 */  sw          $s5, 0x854($sp)
/* 00756C 9FC0756C AFB40850 */  sw          $s4, 0x850($sp)
/* 007570 9FC07570 AFA40868 */  sw          $a0, 0x868($sp)
/* 007574 9FC07574 8E240000 */  lw          $a0, ($s1)
/* 007578 9FC07578 24020001 */  addiu       $v0, $zero, 1
/* 00757C 9FC0757C AFA20830 */  sw          $v0, 0x830($sp)
/* 007580 9FC07580 AFA20834 */  sw          $v0, 0x834($sp)
/* 007584 9FC07584 AFA00838 */  sw          $zero, 0x838($sp)
/* 007588 9FC07588 AFA0083C */  sw          $zero, 0x83c($sp)
.L9FC0758C:
/* 00758C 9FC0758C 30820003 */  andi        $v0, $a0, 3
/* 007590 9FC07590 00021080 */  sll         $v0, $v0, 2
/* 007594 9FC07594 27A30830 */  addiu       $v1, $sp, 0x830
/* 007598 9FC07598 00621821 */  addu        $v1, $v1, $v0
/* 00759C 9FC0759C 8C620000 */  lw          $v0, ($v1)
/* 0075A0 9FC075A0 26520001 */  addiu       $s2, $s2, 1
/* 0075A4 9FC075A4 24420001 */  addiu       $v0, $v0, 1
/* 0075A8 9FC075A8 AC620000 */  sw          $v0, ($v1)
/* 0075AC 9FC075AC 2A420010 */  slti        $v0, $s2, 0x10
/* 0075B0 9FC075B0 1440FFF6 */  bnez        $v0, .L9FC0758C
/* 0075B4 9FC075B4 00042082 */   srl        $a0, $a0, 2
/* 0075B8 9FC075B8 8FA2083C */  lw          $v0, 0x83c($sp)
/* 0075BC 9FC075BC 10400002 */  beqz        $v0, .L9FC075C8
/* 0075C0 9FC075C0 24020001 */   addiu      $v0, $zero, 1
/* 0075C4 9FC075C4 AFA20838 */  sw          $v0, 0x838($sp)
.L9FC075C8:
/* 0075C8 9FC075C8 27A40018 */  addiu       $a0, $sp, 0x18
/* 0075CC 9FC075CC 02002821 */  addu        $a1, $s0, $zero
/* 0075D0 9FC075D0 0FF01BC5 */  jal         bigint_copy
/* 0075D4 9FC075D4 02C03021 */   addu       $a2, $s6, $zero
/* 0075D8 9FC075D8 8FA20838 */  lw          $v0, 0x838($sp)
/* 0075DC 9FC075DC 10400006 */  beqz        $v0, .L9FC075F8
/* 0075E0 9FC075E0 27A4021C */   addiu      $a0, $sp, 0x21c
/* 0075E4 9FC075E4 AFB60010 */  sw          $s6, 0x10($sp)
/* 0075E8 9FC075E8 27A50018 */  addiu       $a1, $sp, 0x18
/* 0075EC 9FC075EC 02003021 */  addu        $a2, $s0, $zero
/* 0075F0 9FC075F0 0FF01D34 */  jal         bigint_mod_mult
/* 0075F4 9FC075F4 02E03821 */   addu       $a3, $s7, $zero
.L9FC075F8:
/* 0075F8 9FC075F8 8FA2083C */  lw          $v0, 0x83c($sp)
/* 0075FC 9FC075FC 10400006 */  beqz        $v0, .L9FC07618
/* 007600 9FC07600 27A40420 */   addiu      $a0, $sp, 0x420
/* 007604 9FC07604 AFB60010 */  sw          $s6, 0x10($sp)
/* 007608 9FC07608 27A5021C */  addiu       $a1, $sp, 0x21c
/* 00760C 9FC0760C 02003021 */  addu        $a2, $s0, $zero
/* 007610 9FC07610 0FF01D34 */  jal         bigint_mod_mult
/* 007614 9FC07614 02E03821 */   addu       $a3, $s7, $zero
.L9FC07618:
/* 007618 9FC07618 27A40628 */  addiu       $a0, $sp, 0x628
/* 00761C 9FC0761C 0FF01BD0 */  jal         bigint_zero
/* 007620 9FC07620 02C02821 */   addu       $a1, $s6, $zero
/* 007624 9FC07624 24020001 */  addiu       $v0, $zero, 1
/* 007628 9FC07628 AFA20628 */  sw          $v0, 0x628($sp)
/* 00762C 9FC0762C 02202021 */  addu        $a0, $s1, $zero
/* 007630 9FC07630 0FF01C0B */  jal         bigint_digits
/* 007634 9FC07634 02602821 */   addu       $a1, $s3, $zero
/* 007638 9FC07638 2452FFFF */  addiu       $s2, $v0, -1
/* 00763C 9FC0763C 06400030 */  bltz        $s2, .L9FC07700
/* 007640 9FC07640 0240F021 */   addu       $fp, $s2, $zero
/* 007644 9FC07644 00121080 */  sll         $v0, $s2, 2
/* 007648 9FC07648 0051A821 */  addu        $s5, $v0, $s1
.L9FC0764C:
/* 00764C 9FC0764C 8EB10000 */  lw          $s1, ($s5)
/* 007650 9FC07650 165E0008 */  bne         $s2, $fp, .L9FC07674
/* 007654 9FC07654 24140020 */   addiu      $s4, $zero, 0x20
/* 007658 9FC07658 00111782 */  srl         $v0, $s1, 0x1e
/* 00765C 9FC0765C 14400005 */  bnez        $v0, .L9FC07674
/* 007660 9FC07660 00000000 */   nop
.L9FC07664:
/* 007664 9FC07664 00118880 */  sll         $s1, $s1, 2
/* 007668 9FC07668 00111782 */  srl         $v0, $s1, 0x1e
/* 00766C 9FC0766C 1040FFFD */  beqz        $v0, .L9FC07664
/* 007670 9FC07670 2694FFFE */   addiu      $s4, $s4, -2
.L9FC07674:
/* 007674 9FC07674 1280001F */  beqz        $s4, .L9FC076F4
/* 007678 9FC07678 00009821 */   addu       $s3, $zero, $zero
.L9FC0767C:
/* 00767C 9FC0767C 27B00628 */  addiu       $s0, $sp, 0x628
/* 007680 9FC07680 02002021 */  addu        $a0, $s0, $zero
/* 007684 9FC07684 02002821 */  addu        $a1, $s0, $zero
/* 007688 9FC07688 02003021 */  addu        $a2, $s0, $zero
/* 00768C 9FC0768C 02E03821 */  addu        $a3, $s7, $zero
/* 007690 9FC07690 0FF01D34 */  jal         bigint_mod_mult
/* 007694 9FC07694 AFB60010 */   sw         $s6, 0x10($sp)
/* 007698 9FC07698 02002021 */  addu        $a0, $s0, $zero
/* 00769C 9FC0769C 02002821 */  addu        $a1, $s0, $zero
/* 0076A0 9FC076A0 02003021 */  addu        $a2, $s0, $zero
/* 0076A4 9FC076A4 02E03821 */  addu        $a3, $s7, $zero
/* 0076A8 9FC076A8 0FF01D34 */  jal         bigint_mod_mult
/* 0076AC 9FC076AC AFB60010 */   sw         $s6, 0x10($sp)
/* 0076B0 9FC076B0 00111782 */  srl         $v0, $s1, 0x1e
/* 0076B4 9FC076B4 5040000C */  beql        $v0, $zero, .L9FC076E8
/* 0076B8 9FC076B8 26730002 */   addiu      $s3, $s3, 2
/* 0076BC 9FC076BC AFB60010 */  sw          $s6, 0x10($sp)
/* 0076C0 9FC076C0 02002021 */  addu        $a0, $s0, $zero
/* 0076C4 9FC076C4 00802821 */  addu        $a1, $a0, $zero
/* 0076C8 9FC076C8 000231C0 */  sll         $a2, $v0, 7
/* 0076CC 9FC076CC 00C23021 */  addu        $a2, $a2, $v0
/* 0076D0 9FC076D0 00063080 */  sll         $a2, $a2, 2
/* 0076D4 9FC076D4 00DD3021 */  addu        $a2, $a2, $sp
/* 0076D8 9FC076D8 24C6FE14 */  addiu       $a2, $a2, -0x1ec
/* 0076DC 9FC076DC 0FF01D34 */  jal         bigint_mod_mult
/* 0076E0 9FC076E0 02E03821 */   addu       $a3, $s7, $zero
/* 0076E4 9FC076E4 26730002 */  addiu       $s3, $s3, 2
.L9FC076E8:
/* 0076E8 9FC076E8 0274102B */  sltu        $v0, $s3, $s4
/* 0076EC 9FC076EC 1440FFE3 */  bnez        $v0, .L9FC0767C
/* 0076F0 9FC076F0 00118880 */   sll        $s1, $s1, 2
.L9FC076F4:
/* 0076F4 9FC076F4 2652FFFF */  addiu       $s2, $s2, -1
/* 0076F8 9FC076F8 0641FFD4 */  bgez        $s2, .L9FC0764C
/* 0076FC 9FC076FC 26B5FFFC */   addiu      $s5, $s5, -4
.L9FC07700:
/* 007700 9FC07700 27A50628 */  addiu       $a1, $sp, 0x628
/* 007704 9FC07704 8FA40868 */  lw          $a0, 0x868($sp)
/* 007708 9FC07708 0FF01BC5 */  jal         bigint_copy
/* 00770C 9FC0770C 02C03021 */   addu       $a2, $s6, $zero
/* 007710 9FC07710 8FBF0864 */  lw          $ra, 0x864($sp)
/* 007714 9FC07714 8FBE0860 */  lw          $fp, 0x860($sp)
/* 007718 9FC07718 8FB7085C */  lw          $s7, 0x85c($sp)
/* 00771C 9FC0771C 8FB60858 */  lw          $s6, 0x858($sp)
/* 007720 9FC07720 8FB50854 */  lw          $s5, 0x854($sp)
/* 007724 9FC07724 8FB40850 */  lw          $s4, 0x850($sp)
/* 007728 9FC07728 8FB3084C */  lw          $s3, 0x84c($sp)
/* 00772C 9FC0772C 8FB20848 */  lw          $s2, 0x848($sp)
/* 007730 9FC07730 8FB10844 */  lw          $s1, 0x844($sp)
/* 007734 9FC07734 8FB00840 */  lw          $s0, 0x840($sp)
/* 007738 9FC07738 03E00008 */  jr          $ra
/* 00773C 9FC0773C 27BD0868 */   addiu      $sp, $sp, 0x868
