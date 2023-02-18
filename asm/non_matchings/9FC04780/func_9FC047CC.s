## func_9FC03410
/* 0047CC 9FC047CC 27BDFF50 */  addiu       $sp, $sp, -0xb0
/* 0047D0 9FC047D0 AFB400A0 */  sw          $s4, 0xa0($sp)
/* 0047D4 9FC047D4 0080A021 */  addu        $s4, $a0, $zero
/* 0047D8 9FC047D8 AFB20098 */  sw          $s2, 0x98($sp)
/* 0047DC 9FC047DC 02809021 */  addu        $s2, $s4, $zero
/* 0047E0 9FC047E0 AFB3009C */  sw          $s3, 0x9c($sp)
/* 0047E4 9FC047E4 00009821 */  addu        $s3, $zero, $zero
/* 0047E8 9FC047E8 AFB500A4 */  sw          $s5, 0xa4($sp)
/* 0047EC 9FC047EC 00A0A821 */  addu        $s5, $a1, $zero
/* 0047F0 9FC047F0 02551021 */  addu        $v0, $s2, $s5
/* 0047F4 9FC047F4 0242102B */  sltu        $v0, $s2, $v0
/* 0047F8 9FC047F8 AFBF00A8 */  sw          $ra, 0xa8($sp)
/* 0047FC 9FC047FC AFB10094 */  sw          $s1, 0x94($sp)
/* 004800 9FC04800 AFB00090 */  sw          $s0, 0x90($sp)
/* 004804 9FC04804 1040000B */  beqz        $v0, .L9FC04834
/* 004808 9FC04808 AFA00088 */   sw         $zero, 0x88($sp)
/* 00480C 9FC0480C 92420000 */  lbu         $v0, ($s2)
.L9FC04810:
/* 004810 9FC04810 3C019FC1 */  lui         $at, %hi(D_9FC0BE50)
/* 004814 9FC04814 00220821 */  addu        $at, $at, $v0
/* 004818 9FC04818 9022BE50 */  lbu         $v0, %lo(D_9FC0BE50)($at)
/* 00481C 9FC0481C 26520001 */  addiu       $s2, $s2, 1
/* 004820 9FC04820 02629821 */  addu        $s3, $s3, $v0
/* 004824 9FC04824 02951021 */  addu        $v0, $s4, $s5
/* 004828 9FC04828 0242102B */  sltu        $v0, $s2, $v0
/* 00482C 9FC0482C 5440FFF8 */  bnel        $v0, $zero, .L9FC04810
/* 004830 9FC04830 92420000 */   lbu        $v0, ($s2)
.L9FC04834:
/* 004834 9FC04834 2662DA02 */  addiu       $v0, $s3, -0x25fe
/* 004838 9FC04838 2C420225 */  sltiu       $v0, $v0, 0x225
/* 00483C 9FC0483C 14400004 */  bnez        $v0, .L9FC04850
/* 004840 9FC04840 27A40010 */   addiu      $a0, $sp, 0x10
/* 004844 9FC04844 8FA20088 */  lw          $v0, 0x88($sp)
/* 004848 9FC04848 24420001 */  addiu       $v0, $v0, 1
/* 00484C 9FC0484C AFA20088 */  sw          $v0, 0x88($sp)
.L9FC04850:
/* 004850 9FC04850 00002821 */  addu        $a1, $zero, $zero
/* 004854 9FC04854 0FF00EB5 */  jal         memset
/* 004858 9FC04858 24060040 */   addiu      $a2, $zero, 0x40
/* 00485C 9FC0485C 02809021 */  addu        $s2, $s4, $zero
/* 004860 9FC04860 02551021 */  addu        $v0, $s2, $s5
/* 004864 9FC04864 0242102B */  sltu        $v0, $s2, $v0
/* 004868 9FC04868 10400016 */  beqz        $v0, .L9FC048C4
/* 00486C 9FC0486C 00001821 */   addu       $v1, $zero, $zero
/* 004870 9FC04870 92430000 */  lbu         $v1, ($s2)
.L9FC04874:
/* 004874 9FC04874 27A40010 */  addiu       $a0, $sp, 0x10
/* 004878 9FC04878 3063000F */  andi        $v1, $v1, 0xf
/* 00487C 9FC0487C 00031880 */  sll         $v1, $v1, 2
/* 004880 9FC04880 00831821 */  addu        $v1, $a0, $v1
/* 004884 9FC04884 8C620000 */  lw          $v0, ($v1)
/* 004888 9FC04888 24420001 */  addiu       $v0, $v0, 1
/* 00488C 9FC0488C AC620000 */  sw          $v0, ($v1)
/* 004890 9FC04890 92420000 */  lbu         $v0, ($s2)
/* 004894 9FC04894 00021102 */  srl         $v0, $v0, 4
/* 004898 9FC04898 00021080 */  sll         $v0, $v0, 2
/* 00489C 9FC0489C 00822021 */  addu        $a0, $a0, $v0
/* 0048A0 9FC048A0 8C820000 */  lw          $v0, ($a0)
/* 0048A4 9FC048A4 26520001 */  addiu       $s2, $s2, 1
/* 0048A8 9FC048A8 24420001 */  addiu       $v0, $v0, 1
/* 0048AC 9FC048AC AC820000 */  sw          $v0, ($a0)
/* 0048B0 9FC048B0 02951021 */  addu        $v0, $s4, $s5
/* 0048B4 9FC048B4 0242102B */  sltu        $v0, $s2, $v0
/* 0048B8 9FC048B8 5440FFEE */  bnel        $v0, $zero, .L9FC04874
/* 0048BC 9FC048BC 92430000 */   lbu        $v1, ($s2)
/* 0048C0 9FC048C0 00001821 */  addu        $v1, $zero, $zero
.L9FC048C4:
/* 0048C4 9FC048C4 00008021 */  addu        $s0, $zero, $zero
/* 0048C8 9FC048C8 00101080 */  sll         $v0, $s0, 2
.L9FC048CC:
/* 0048CC 9FC048CC 03A21021 */  addu        $v0, $sp, $v0
/* 0048D0 9FC048D0 8C420010 */  lw          $v0, 0x10($v0)
/* 0048D4 9FC048D4 00420018 */  mult        $v0, $v0
/* 0048D8 9FC048D8 26100001 */  addiu       $s0, $s0, 1
/* 0048DC 9FC048DC 00001012 */  mflo        $v0
/* 0048E0 9FC048E0 00621821 */  addu        $v1, $v1, $v0
/* 0048E4 9FC048E4 2A020010 */  slti        $v0, $s0, 0x10
/* 0048E8 9FC048E8 1440FFF8 */  bnez        $v0, .L9FC048CC
/* 0048EC 9FC048EC 00101080 */   sll        $v0, $s0, 2
/* 0048F0 9FC048F0 00031100 */  sll         $v0, $v1, 4
/* 0048F4 9FC048F4 3C03D1B7 */  lui         $v1, (0xD1B71759 >> 16)
/* 0048F8 9FC048F8 34631759 */  ori         $v1, $v1, (0xD1B71759 & 0xFFFF)
/* 0048FC 9FC048FC 00430019 */  multu       $v0, $v1
/* 004900 9FC04900 00001010 */  mfhi        $v0
/* 004904 9FC04904 00021302 */  srl         $v0, $v0, 0xc
/* 004908 9FC04908 2442EC75 */  addiu       $v0, $v0, -0x138b
/* 00490C 9FC0490C 2C42002B */  sltiu       $v0, $v0, 0x2b
/* 004910 9FC04910 14400004 */  bnez        $v0, .L9FC04924
/* 004914 9FC04914 27A40050 */   addiu      $a0, $sp, 0x50
/* 004918 9FC04918 8FA20088 */  lw          $v0, 0x88($sp)
/* 00491C 9FC0491C 24420001 */  addiu       $v0, $v0, 1
/* 004920 9FC04920 AFA20088 */  sw          $v0, 0x88($sp)
.L9FC04924:
/* 004924 9FC04924 00002821 */  addu        $a1, $zero, $zero
/* 004928 9FC04928 0FF00EB5 */  jal         memset
/* 00492C 9FC0492C 24060038 */   addiu      $a2, $zero, 0x38
/* 004930 9FC04930 92820000 */  lbu         $v0, ($s4)
/* 004934 9FC04934 02809021 */  addu        $s2, $s4, $zero
/* 004938 9FC04938 000221C2 */  srl         $a0, $v0, 7
/* 00493C 9FC0493C 02551021 */  addu        $v0, $s2, $s5
/* 004940 9FC04940 0242102B */  sltu        $v0, $s2, $v0
/* 004944 9FC04944 10400013 */  beqz        $v0, .L9FC04994
/* 004948 9FC04948 00002821 */   addu       $a1, $zero, $zero
/* 00494C 9FC0494C 92530000 */  lbu         $s3, ($s2)
.L9FC04950:
/* 004950 9FC04950 24100007 */  addiu       $s0, $zero, 7
.L9FC04954:
/* 004954 9FC04954 02131006 */  srlv        $v0, $s3, $s0
/* 004958 9FC04958 30510001 */  andi        $s1, $v0, 1
/* 00495C 9FC0495C 12240005 */  beq         $s1, $a0, .L9FC04974
/* 004960 9FC04960 27A60050 */   addiu      $a2, $sp, 0x50
/* 004964 9FC04964 0FF011E0 */  jal         func_9FC04780
/* 004968 9FC04968 27A70088 */   addiu      $a3, $sp, 0x88
/* 00496C 9FC0496C 00002821 */  addu        $a1, $zero, $zero
/* 004970 9FC04970 02202021 */  addu        $a0, $s1, $zero
.L9FC04974:
/* 004974 9FC04974 2610FFFF */  addiu       $s0, $s0, -1
/* 004978 9FC04978 0601FFF6 */  bgez        $s0, .L9FC04954
/* 00497C 9FC0497C 24A50001 */   addiu      $a1, $a1, 1
/* 004980 9FC04980 26520001 */  addiu       $s2, $s2, 1
/* 004984 9FC04984 02951021 */  addu        $v0, $s4, $s5
/* 004988 9FC04988 0242102B */  sltu        $v0, $s2, $v0
/* 00498C 9FC0498C 5440FFF0 */  bnel        $v0, $zero, .L9FC04950
/* 004990 9FC04990 92530000 */   lbu        $s3, ($s2)
.L9FC04994:
/* 004994 9FC04994 27A60050 */  addiu       $a2, $sp, 0x50
/* 004998 9FC04998 0FF011E0 */  jal         func_9FC04780
/* 00499C 9FC0499C 27A70088 */   addiu      $a3, $sp, 0x88
/* 0049A0 9FC049A0 24050001 */  addiu       $a1, $zero, 1
/* 0049A4 9FC049A4 00002021 */  addu        $a0, $zero, $zero
.L9FC049A8:
/* 0049A8 9FC049A8 00003821 */  addu        $a3, $zero, $zero
.L9FC049AC:
/* 0049AC 9FC049AC 00051080 */  sll         $v0, $a1, 2
/* 0049B0 9FC049B0 00471021 */  addu        $v0, $v0, $a3
/* 0049B4 9FC049B4 03A21821 */  addu        $v1, $sp, $v0
/* 0049B8 9FC049B8 00053040 */  sll         $a2, $a1, 1
/* 0049BC 9FC049BC 3C029FC1 */  lui         $v0, %hi(D_9FC0BE30)
/* 0049C0 9FC049C0 00461021 */  addu        $v0, $v0, $a2
/* 0049C4 9FC049C4 8442BE30 */  lh          $v0, %lo(D_9FC0BE30)($v0)
/* 0049C8 9FC049C8 8C630050 */  lw          $v1, 0x50($v1)
/* 0049CC 9FC049CC 0043102B */  sltu        $v0, $v0, $v1
/* 0049D0 9FC049D0 10400008 */  beqz        $v0, .L9FC049F4
/* 0049D4 9FC049D4 8FA20088 */   lw         $v0, 0x88($sp)
/* 0049D8 9FC049D8 3C029FC1 */  lui         $v0, %hi(D_9FC0BE40)
/* 0049DC 9FC049DC 00461021 */  addu        $v0, $v0, $a2
/* 0049E0 9FC049E0 8442BE40 */  lh          $v0, %lo(D_9FC0BE40)($v0)
/* 0049E4 9FC049E4 0062102B */  sltu        $v0, $v1, $v0
/* 0049E8 9FC049E8 54400005 */  bnel        $v0, $zero, .L9FC04A00
/* 0049EC 9FC049EC 24840001 */   addiu      $a0, $a0, 1
/* 0049F0 9FC049F0 8FA20088 */  lw          $v0, 0x88($sp)
.L9FC049F4:
/* 0049F4 9FC049F4 24420001 */  addiu       $v0, $v0, 1
/* 0049F8 9FC049F8 AFA20088 */  sw          $v0, 0x88($sp)
/* 0049FC 9FC049FC 24840001 */  addiu       $a0, $a0, 1
.L9FC04A00:
/* 004A00 9FC04A00 2C820002 */  sltiu       $v0, $a0, 2
/* 004A04 9FC04A04 1440FFE9 */  bnez        $v0, .L9FC049AC
/* 004A08 9FC04A08 24E7001C */   addiu      $a3, $a3, 0x1c
/* 004A0C 9FC04A0C 24A50001 */  addiu       $a1, $a1, 1
/* 004A10 9FC04A10 2CA20007 */  sltiu       $v0, $a1, 7
/* 004A14 9FC04A14 5440FFE4 */  bnel        $v0, $zero, .L9FC049A8
/* 004A18 9FC04A18 00002021 */   addu       $a0, $zero, $zero
/* 004A1C 9FC04A1C 8FA20088 */  lw          $v0, 0x88($sp)
/* 004A20 9FC04A20 14400002 */  bnez        $v0, .L9FC04A2C
/* 004A24 9FC04A24 2402FFFF */   addiu      $v0, $zero, -1
/* 004A28 9FC04A28 00001021 */  addu        $v0, $zero, $zero
.L9FC04A2C:
/* 004A2C 9FC04A2C 8FBF00A8 */  lw          $ra, 0xa8($sp)
/* 004A30 9FC04A30 8FB500A4 */  lw          $s5, 0xa4($sp)
/* 004A34 9FC04A34 8FB400A0 */  lw          $s4, 0xa0($sp)
/* 004A38 9FC04A38 8FB3009C */  lw          $s3, 0x9c($sp)
/* 004A3C 9FC04A3C 8FB20098 */  lw          $s2, 0x98($sp)
/* 004A40 9FC04A40 8FB10094 */  lw          $s1, 0x94($sp)
/* 004A44 9FC04A44 8FB00090 */  lw          $s0, 0x90($sp)
/* 004A48 9FC04A48 03E00008 */  jr          $ra
/* 004A4C 9FC04A4C 27BD00B0 */   addiu      $sp, $sp, 0xb0
