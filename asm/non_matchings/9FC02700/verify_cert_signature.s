## verify_cert_chain
/* 0027AC 9FC027AC 27BDFFB8 */  addiu       $sp, $sp, -0x48
/* 0027B0 9FC027B0 AFB20030 */  sw          $s2, 0x30($sp)
/* 0027B4 9FC027B4 00809021 */  addu        $s2, $a0, $zero
/* 0027B8 9FC027B8 AFB5003C */  sw          $s5, 0x3c($sp)
/* 0027BC 9FC027BC 00A0A821 */  addu        $s5, $a1, $zero
/* 0027C0 9FC027C0 AFBF0040 */  sw          $ra, 0x40($sp)
/* 0027C4 9FC027C4 AFB40038 */  sw          $s4, 0x38($sp)
/* 0027C8 9FC027C8 AFB30034 */  sw          $s3, 0x34($sp)
/* 0027CC 9FC027CC AFB1002C */  sw          $s1, 0x2c($sp)
/* 0027D0 9FC027D0 12400028 */  beqz        $s2, .L9FC02874
/* 0027D4 9FC027D4 AFB00028 */   sw         $s0, 0x28($sp)
/* 0027D8 9FC027D8 0FF009C0 */  jal         func_9FC02700
/* 0027DC 9FC027DC 02402021 */   addu       $a0, $s2, $zero
/* 0027E0 9FC027E0 02402021 */  addu        $a0, $s2, $zero
/* 0027E4 9FC027E4 0FF009CD */  jal         func_9FC02734
/* 0027E8 9FC027E8 00408021 */   addu       $s0, $v0, $zero
/* 0027EC 9FC027EC 02402021 */  addu        $a0, $s2, $zero
/* 0027F0 9FC027F0 27A50020 */  addiu       $a1, $sp, 0x20
/* 0027F4 9FC027F4 0FF009DB */  jal         get_cert_body
/* 0027F8 9FC027F8 00408821 */   addu       $s1, $v0, $zero
/* 0027FC 9FC027FC 2653000C */  addiu       $s3, $s2, 0xc
/* 002800 9FC02800 02602021 */  addu        $a0, $s3, $zero
/* 002804 9FC02804 3C149FC1 */  lui         $s4, %hi(aRoot)
/* 002808 9FC02808 2694BDF0 */  addiu       $s4, $s4, %lo(aRoot)
/* 00280C 9FC0280C 02802821 */  addu        $a1, $s4, $zero
/* 002810 9FC02810 02118023 */  subu        $s0, $s0, $s1
/* 002814 9FC02814 AFB20018 */  sw          $s2, 0x18($sp)
/* 002818 9FC02818 0FF00E5C */  jal         strcmp
/* 00281C 9FC0281C AFB0001C */   sw         $s0, 0x1c($sp)
/* 002820 9FC02820 10400003 */  beqz        $v0, .L9FC02830
/* 002824 9FC02824 02602021 */   addu       $a0, $s3, $zero
/* 002828 9FC02828 12A0001B */  beqz        $s5, .L9FC02898
/* 00282C 9FC0282C 2402FFFF */   addiu      $v0, $zero, -1
.L9FC02830:
/* 002830 9FC02830 0FF00E5C */  jal         strcmp
/* 002834 9FC02834 02802821 */   addu       $a1, $s4, $zero
/* 002838 9FC02838 5440000B */  bnel        $v0, $zero, .L9FC02868
/* 00283C 9FC0283C 8E430004 */   lw         $v1, 4($s2)
/* 002840 9FC02840 27A40018 */  addiu       $a0, $sp, 0x18
/* 002844 9FC02844 24050001 */  addiu       $a1, $zero, 1
/* 002848 9FC02848 3C079FC1 */  lui         $a3, %hi(exponent)
/* 00284C 9FC0284C 8CE7C150 */  lw          $a3, %lo(exponent)($a3)
/* 002850 9FC02850 24020001 */  addiu       $v0, $zero, 1
/* 002854 9FC02854 AFA20010 */  sw          $v0, 0x10($sp)
/* 002858 9FC02858 3C069FC1 */  lui         $a2, %hi(pubkey)
/* 00285C 9FC0285C 24C6BF50 */  addiu       $a2, $a2, %lo(pubkey)
/* 002860 9FC02860 0BF00A24 */  j           .L9FC02890
/* 002864 9FC02864 8FA20020 */   lw         $v0, 0x20($sp)
.L9FC02868:
/* 002868 9FC02868 2C620002 */  sltiu       $v0, $v1, 2
/* 00286C 9FC0286C 14400003 */  bnez        $v0, .L9FC0287C
/* 002870 9FC02870 27A40018 */   addiu      $a0, $sp, 0x18
.L9FC02874:
/* 002874 9FC02874 0BF00A26 */  j           .L9FC02898
/* 002878 9FC02878 2402FFFF */   addiu      $v0, $zero, -1
.L9FC0287C:
/* 00287C 9FC0287C 24050001 */  addiu       $a1, $zero, 1
/* 002880 9FC02880 8EA7018C */  lw          $a3, 0x18c($s5)
/* 002884 9FC02884 8FA20020 */  lw          $v0, 0x20($sp)
/* 002888 9FC02888 26A6008C */  addiu       $a2, $s5, 0x8c
/* 00288C 9FC0288C AFA30010 */  sw          $v1, 0x10($sp)
.L9FC02890:
/* 002890 9FC02890 0FF00CB3 */  jal         rsa_verify_signature
/* 002894 9FC02894 AFA20014 */   sw         $v0, 0x14($sp)
.L9FC02898:
/* 002898 9FC02898 8FBF0040 */  lw          $ra, 0x40($sp)
/* 00289C 9FC0289C 8FB5003C */  lw          $s5, 0x3c($sp)
/* 0028A0 9FC028A0 8FB40038 */  lw          $s4, 0x38($sp)
/* 0028A4 9FC028A4 8FB30034 */  lw          $s3, 0x34($sp)
/* 0028A8 9FC028A8 8FB20030 */  lw          $s2, 0x30($sp)
/* 0028AC 9FC028AC 8FB1002C */  lw          $s1, 0x2c($sp)
/* 0028B0 9FC028B0 8FB00028 */  lw          $s0, 0x28($sp)
/* 0028B4 9FC028B4 03E00008 */  jr          $ra
/* 0028B8 9FC028B8 27BD0048 */   addiu      $sp, $sp, 0x48
