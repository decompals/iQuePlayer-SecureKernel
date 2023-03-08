/* 0016E0 9FC016E0 27BDFF90 */  addiu       $sp, $sp, -0x70
/* 0016E4 9FC016E4 AFB30064 */  sw          $s3, 0x64($sp)
/* 0016E8 9FC016E8 00809821 */  addu        $s3, $a0, $zero
/* 0016EC 9FC016EC AFB40068 */  sw          $s4, 0x68($sp)
/* 0016F0 9FC016F0 00A0A021 */  addu        $s4, $a1, $zero
/* 0016F4 9FC016F4 24050014 */  addiu       $a1, $zero, 0x14
/* 0016F8 9FC016F8 AFB20060 */  sw          $s2, 0x60($sp)
/* 0016FC 9FC016FC 00C09021 */  addu        $s2, $a2, $zero
/* 001700 9FC01700 24060004 */  addiu       $a2, $zero, 4
/* 001704 9FC01704 AFB1005C */  sw          $s1, 0x5c($sp)
/* 001708 9FC01708 00E08821 */  addu        $s1, $a3, $zero
/* 00170C 9FC0170C AFBF006C */  sw          $ra, 0x6c($sp)
/* 001710 9FC01710 0FF00F65 */  jal         check_untrusted_ptr_range
/* 001714 9FC01714 AFB00058 */   sw         $s0, 0x58($sp)
/* 001718 9FC01718 10400077 */  beqz        $v0, .L9FC018F8
/* 00171C 9FC0171C 2402FFFF */   addiu      $v0, $zero, -1
/* 001720 9FC01720 12400065 */  beqz        $s2, .L9FC018B8
/* 001724 9FC01724 00000000 */   nop
/* 001728 9FC01728 0FF00F80 */  jal         check_cert_ranges
/* 00172C 9FC0172C 02402021 */   addu       $a0, $s2, $zero
/* 001730 9FC01730 10400009 */  beqz        $v0, .L9FC01758
/* 001734 9FC01734 02402021 */   addu       $a0, $s2, $zero
/* 001738 9FC01738 0FF00A2F */  jal         verify_cert_chain
/* 00173C 9FC0173C 00002821 */   addu       $a1, $zero, $zero
/* 001740 9FC01740 0440006D */  bltz        $v0, .L9FC018F8
/* 001744 9FC01744 2402FFFF */   addiu      $v0, $zero, -1
/* 001748 9FC01748 0FF00C45 */  jal         check_crlbundle_ranges
/* 00174C 9FC0174C 02202021 */   addu       $a0, $s1, $zero
/* 001750 9FC01750 14400003 */  bnez        $v0, .L9FC01760
/* 001754 9FC01754 2624001C */   addiu      $a0, $s1, 0x1c
.L9FC01758:
/* 001758 9FC01758 0BF0063E */  j           .L9FC018F8
/* 00175C 9FC0175C 2402FFFF */   addiu      $v0, $zero, -1
.L9FC01760:
/* 001760 9FC01760 3C029FC1 */  lui         $v0, %hi(D_9FC0F308 + 1)
/* 001764 9FC01764 2442F309 */  addiu       $v0, $v0, %lo(D_9FC0F308 + 1)
/* 001768 9FC01768 90450000 */  lbu         $a1, ($v0)
/* 00176C 9FC0176C AFB10010 */  sw          $s1, 0x10($sp)
/* 001770 9FC01770 90470001 */  lbu         $a3, 1($v0)
/* 001774 9FC01774 9042FFFF */  lbu         $v0, -1($v0)
/* 001778 9FC01778 26260038 */  addiu       $a2, $s1, 0x38
/* 00177C 9FC0177C 0FF00B2D */  jal         verify_all_crlbundles
/* 001780 9FC01780 AFA20014 */   sw         $v0, 0x14($sp)
/* 001784 9FC01784 1440005C */  bnez        $v0, .L9FC018F8
/* 001788 9FC01788 2402FFFF */   addiu      $v0, $zero, -1
/* 00178C 9FC0178C 8E22001C */  lw          $v0, 0x1c($s1)
/* 001790 9FC01790 50400012 */  beql        $v0, $zero, .L9FC017DC
/* 001794 9FC01794 8E460000 */   lw         $a2, ($s2)
/* 001798 9FC01798 8C420254 */  lw          $v0, 0x254($v0)
/* 00179C 9FC0179C 1040000E */  beqz        $v0, .L9FC017D8
/* 0017A0 9FC017A0 00008021 */   addu       $s0, $zero, $zero
/* 0017A4 9FC017A4 00102980 */  sll         $a1, $s0, 6
.L9FC017A8:
/* 0017A8 9FC017A8 8E440004 */  lw          $a0, 4($s2)
/* 0017AC 9FC017AC 8E220020 */  lw          $v0, 0x20($s1)
/* 0017B0 9FC017B0 2484004C */  addiu       $a0, $a0, 0x4c
/* 0017B4 9FC017B4 0FF00E7B */  jal         strstr
/* 0017B8 9FC017B8 00452821 */   addu       $a1, $v0, $a1
/* 0017BC 9FC017BC 1440004B */  bnez        $v0, .L9FC018EC
/* 0017C0 9FC017C0 26100001 */   addiu      $s0, $s0, 1
/* 0017C4 9FC017C4 8E22001C */  lw          $v0, 0x1c($s1)
/* 0017C8 9FC017C8 8C420254 */  lw          $v0, 0x254($v0)
/* 0017CC 9FC017CC 0202102B */  sltu        $v0, $s0, $v0
/* 0017D0 9FC017D0 5440FFF5 */  bnel        $v0, $zero, .L9FC017A8
/* 0017D4 9FC017D4 00102980 */   sll        $a1, $s0, 6
.L9FC017D8:
/* 0017D8 9FC017D8 8E460000 */  lw          $a2, ($s2)
.L9FC017DC:
/* 0017DC 9FC017DC 8CC20000 */  lw          $v0, ($a2)
/* 0017E0 9FC017E0 24030001 */  addiu       $v1, $zero, 1
/* 0017E4 9FC017E4 54430030 */  bnel        $v0, $v1, .L9FC018A8
/* 0017E8 9FC017E8 AFA30010 */   sw         $v1, 0x10($sp)
/* 0017EC 9FC017EC 8E220038 */  lw          $v0, 0x38($s1)
/* 0017F0 9FC017F0 50400012 */  beql        $v0, $zero, .L9FC0183C
/* 0017F4 9FC017F4 8E220000 */   lw         $v0, ($s1)
/* 0017F8 9FC017F8 8C420254 */  lw          $v0, 0x254($v0)
/* 0017FC 9FC017FC 1040000E */  beqz        $v0, .L9FC01838
/* 001800 9FC01800 00008021 */   addu       $s0, $zero, $zero
/* 001804 9FC01804 00102980 */  sll         $a1, $s0, 6
.L9FC01808:
/* 001808 9FC01808 8E440000 */  lw          $a0, ($s2)
/* 00180C 9FC0180C 8E22003C */  lw          $v0, 0x3c($s1)
/* 001810 9FC01810 2484004C */  addiu       $a0, $a0, 0x4c
/* 001814 9FC01814 0FF00E7B */  jal         strstr
/* 001818 9FC01818 00452821 */   addu       $a1, $v0, $a1
/* 00181C 9FC0181C 14400033 */  bnez        $v0, .L9FC018EC
/* 001820 9FC01820 26100001 */   addiu      $s0, $s0, 1
/* 001824 9FC01824 8E220038 */  lw          $v0, 0x38($s1)
/* 001828 9FC01828 8C420254 */  lw          $v0, 0x254($v0)
/* 00182C 9FC0182C 0202102B */  sltu        $v0, $s0, $v0
/* 001830 9FC01830 5440FFF5 */  bnel        $v0, $zero, .L9FC01808
/* 001834 9FC01834 00102980 */   sll        $a1, $s0, 6
.L9FC01838:
/* 001838 9FC01838 8E220000 */  lw          $v0, ($s1)
.L9FC0183C:
/* 00183C 9FC0183C 10400012 */  beqz        $v0, .L9FC01888
/* 001840 9FC01840 02602021 */   addu       $a0, $s3, $zero
/* 001844 9FC01844 8C420254 */  lw          $v0, 0x254($v0)
/* 001848 9FC01848 1040000F */  beqz        $v0, .L9FC01888
/* 00184C 9FC0184C 00008021 */   addu       $s0, $zero, $zero
/* 001850 9FC01850 00102980 */  sll         $a1, $s0, 6
.L9FC01854:
/* 001854 9FC01854 8E440000 */  lw          $a0, ($s2)
/* 001858 9FC01858 8E220004 */  lw          $v0, 4($s1)
/* 00185C 9FC0185C 2484004C */  addiu       $a0, $a0, 0x4c
/* 001860 9FC01860 0FF00E7B */  jal         strstr
/* 001864 9FC01864 00452821 */   addu       $a1, $v0, $a1
/* 001868 9FC01868 14400020 */  bnez        $v0, .L9FC018EC
/* 00186C 9FC0186C 26100001 */   addiu      $s0, $s0, 1
/* 001870 9FC01870 8E220000 */  lw          $v0, ($s1)
/* 001874 9FC01874 8C420254 */  lw          $v0, 0x254($v0)
/* 001878 9FC01878 0202102B */  sltu        $v0, $s0, $v0
/* 00187C 9FC0187C 1440FFF5 */  bnez        $v0, .L9FC01854
/* 001880 9FC01880 00102980 */   sll        $a1, $s0, 6
/* 001884 9FC01884 02602021 */  addu        $a0, $s3, $zero
.L9FC01888:
/* 001888 9FC01888 8E450000 */  lw          $a1, ($s2)
/* 00188C 9FC0188C 00003821 */  addu        $a3, $zero, $zero
/* 001890 9FC01890 AFB40010 */  sw          $s4, 0x10($sp)
/* 001894 9FC01894 8CA6018C */  lw          $a2, 0x18c($a1)
/* 001898 9FC01898 0FF00CE2 */  jal         rsa_check_signature
/* 00189C 9FC0189C 24A5008C */   addiu      $a1, $a1, 0x8c
/* 0018A0 9FC018A0 0BF0063F */  j           .L9FC018FC
/* 0018A4 9FC018A4 8FBF006C */   lw         $ra, 0x6c($sp)
.L9FC018A8:
/* 0018A8 9FC018A8 02602021 */  addu        $a0, $s3, $zero
/* 0018AC 9FC018AC 24050014 */  addiu       $a1, $zero, 0x14
/* 0018B0 9FC018B0 0BF00635 */  j           .L9FC018D4
/* 0018B4 9FC018B4 24C6008C */   addiu      $a2, $a2, 0x8c
.L9FC018B8:
/* 0018B8 9FC018B8 0FF00C74 */  jal         virage2_gen_public_key
/* 0018BC 9FC018BC 27A40018 */   addiu      $a0, $sp, 0x18
/* 0018C0 9FC018C0 24020001 */  addiu       $v0, $zero, 1
/* 0018C4 9FC018C4 AFA20010 */  sw          $v0, 0x10($sp)
/* 0018C8 9FC018C8 02602021 */  addu        $a0, $s3, $zero
/* 0018CC 9FC018CC 24050014 */  addiu       $a1, $zero, 0x14
/* 0018D0 9FC018D0 27A60018 */  addiu       $a2, $sp, 0x18
.L9FC018D4:
/* 0018D4 9FC018D4 0FF00DC5 */  jal         verify_ecc_signature
/* 0018D8 9FC018D8 02803821 */   addu       $a3, $s4, $zero
/* 0018DC 9FC018DC 10400005 */  beqz        $v0, .L9FC018F4
/* 0018E0 9FC018E0 2402FFFF */   addiu      $v0, $zero, -1
/* 0018E4 9FC018E4 0BF0063F */  j           .L9FC018FC
/* 0018E8 9FC018E8 8FBF006C */   lw         $ra, 0x6c($sp)
.L9FC018EC:
/* 0018EC 9FC018EC 0BF0063E */  j           .L9FC018F8
/* 0018F0 9FC018F0 2402FFF7 */   addiu      $v0, $zero, -9
.L9FC018F4:
/* 0018F4 9FC018F4 00001021 */  addu        $v0, $zero, $zero
.L9FC018F8:
/* 0018F8 9FC018F8 8FBF006C */  lw          $ra, 0x6c($sp)
.L9FC018FC:
/* 0018FC 9FC018FC 8FB40068 */  lw          $s4, 0x68($sp)
/* 001900 9FC01900 8FB30064 */  lw          $s3, 0x64($sp)
/* 001904 9FC01904 8FB20060 */  lw          $s2, 0x60($sp)
/* 001908 9FC01908 8FB1005C */  lw          $s1, 0x5c($sp)
/* 00190C 9FC0190C 8FB00058 */  lw          $s0, 0x58($sp)
/* 001910 9FC01910 03E00008 */  jr          $ra
/* 001914 9FC01914 27BD0070 */   addiu      $sp, $sp, 0x70
