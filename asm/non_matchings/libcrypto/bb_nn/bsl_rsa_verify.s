## rsa_check_signature
/* 0077C8 9FC077C8 27BDF7B0 */  addiu       $sp, $sp, -0x850
/* 0077CC 9FC077CC AFB20840 */  sw          $s2, 0x840($sp)
/* 0077D0 9FC077D0 8FB20860 */  lw          $s2, 0x860($sp)
/* 0077D4 9FC077D4 AFB30844 */  sw          $s3, 0x844($sp)
/* 0077D8 9FC077D8 00809821 */  addu        $s3, $a0, $zero
/* 0077DC 9FC077DC AFBF0848 */  sw          $ra, 0x848($sp)
/* 0077E0 9FC077E0 AFB1083C */  sw          $s1, 0x83c($sp)
/* 0077E4 9FC077E4 AFB00838 */  sw          $s0, 0x838($sp)
/* 0077E8 9FC077E8 06410002 */  bgez        $s2, .L9FC077F4
/* 0077EC 9FC077EC 02401021 */   addu       $v0, $s2, $zero
/* 0077F0 9FC077F0 2642001F */  addiu       $v0, $s2, 0x1f
.L9FC077F4:
/* 0077F4 9FC077F4 00024143 */  sra         $t0, $v0, 5
/* 0077F8 9FC077F8 00002021 */  addu        $a0, $zero, $zero
.L9FC077FC:
/* 0077FC 9FC077FC 00041880 */  sll         $v1, $a0, 2
/* 007800 9FC07800 24840001 */  addiu       $a0, $a0, 1
/* 007804 9FC07804 27A90018 */  addiu       $t1, $sp, 0x18
/* 007808 9FC07808 01231021 */  addu        $v0, $t1, $v1
/* 00780C 9FC0780C 27AA0220 */  addiu       $t2, $sp, 0x220
/* 007810 9FC07810 AC400000 */  sw          $zero, ($v0)
/* 007814 9FC07814 01431021 */  addu        $v0, $t2, $v1
/* 007818 9FC07818 27B00428 */  addiu       $s0, $sp, 0x428
/* 00781C 9FC0781C AC400000 */  sw          $zero, ($v0)
/* 007820 9FC07820 02031021 */  addu        $v0, $s0, $v1
/* 007824 9FC07824 27B10630 */  addiu       $s1, $sp, 0x630
/* 007828 9FC07828 02231821 */  addu        $v1, $s1, $v1
/* 00782C 9FC0782C AC400000 */  sw          $zero, ($v0)
/* 007830 9FC07830 28820081 */  slti        $v0, $a0, 0x81
/* 007834 9FC07834 1440FFF1 */  bnez        $v0, .L9FC077FC
/* 007838 9FC07838 AC600000 */   sw         $zero, ($v1)
/* 00783C 9FC0783C 1900000D */  blez        $t0, .L9FC07874
/* 007840 9FC07840 00002021 */   addu       $a0, $zero, $zero
/* 007844 9FC07844 24820001 */  addiu       $v0, $a0, 1
.L9FC07848:
/* 007848 9FC07848 00041880 */  sll         $v1, $a0, 2
/* 00784C 9FC0784C 00402021 */  addu        $a0, $v0, $zero
/* 007850 9FC07850 01021023 */  subu        $v0, $t0, $v0
/* 007854 9FC07854 00021080 */  sll         $v0, $v0, 2
/* 007858 9FC07858 00661821 */  addu        $v1, $v1, $a2
/* 00785C 9FC0785C 8C630000 */  lw          $v1, ($v1)
/* 007860 9FC07860 01221021 */  addu        $v0, $t1, $v0
/* 007864 9FC07864 AC430000 */  sw          $v1, ($v0)
/* 007868 9FC07868 0088102A */  slt         $v0, $a0, $t0
/* 00786C 9FC0786C 1440FFF6 */  bnez        $v0, .L9FC07848
/* 007870 9FC07870 24820001 */   addiu      $v0, $a0, 1
.L9FC07874:
/* 007874 9FC07874 1900000D */  blez        $t0, .L9FC078AC
/* 007878 9FC07878 00002021 */   addu       $a0, $zero, $zero
/* 00787C 9FC0787C 24820001 */  addiu       $v0, $a0, 1
.L9FC07880:
/* 007880 9FC07880 00041880 */  sll         $v1, $a0, 2
/* 007884 9FC07884 00402021 */  addu        $a0, $v0, $zero
/* 007888 9FC07888 01021023 */  subu        $v0, $t0, $v0
/* 00788C 9FC0788C 00021080 */  sll         $v0, $v0, 2
/* 007890 9FC07890 00651821 */  addu        $v1, $v1, $a1
/* 007894 9FC07894 8C630000 */  lw          $v1, ($v1)
/* 007898 9FC07898 01421021 */  addu        $v0, $t2, $v0
/* 00789C 9FC0789C AC430000 */  sw          $v1, ($v0)
/* 0078A0 9FC078A0 0088102A */  slt         $v0, $a0, $t0
/* 0078A4 9FC078A4 1440FFF6 */  bnez        $v0, .L9FC07880
/* 0078A8 9FC078A8 24820001 */   addiu      $v0, $a0, 1
.L9FC078AC:
/* 0078AC 9FC078AC 27A40018 */  addiu       $a0, $sp, 0x18
/* 0078B0 9FC078B0 8CE20000 */  lw          $v0, ($a3)
/* 0078B4 9FC078B4 24050081 */  addiu       $a1, $zero, 0x81
/* 0078B8 9FC078B8 0FF01C0B */  jal         bigint_digits
/* 0078BC 9FC078BC AFA20428 */   sw         $v0, 0x428($sp)
/* 0078C0 9FC078C0 02202021 */  addu        $a0, $s1, $zero
/* 0078C4 9FC078C4 27A50220 */  addiu       $a1, $sp, 0x220
/* 0078C8 9FC078C8 02003021 */  addu        $a2, $s0, $zero
/* 0078CC 9FC078CC 24070001 */  addiu       $a3, $zero, 1
/* 0078D0 9FC078D0 27A30018 */  addiu       $v1, $sp, 0x18
/* 0078D4 9FC078D4 00408021 */  addu        $s0, $v0, $zero
/* 0078D8 9FC078D8 AFA30010 */  sw          $v1, 0x10($sp)
/* 0078DC 9FC078DC 0FF01D4B */  jal         bigint_mod_exp
/* 0078E0 9FC078E0 AFB00014 */   sw         $s0, 0x14($sp)
/* 0078E4 9FC078E4 26450007 */  addiu       $a1, $s2, 7
/* 0078E8 9FC078E8 04A20001 */  bltzl       $a1, .L9FC078F0
/* 0078EC 9FC078EC 2645000E */   addiu      $a1, $s2, 0xe
.L9FC078F0:
/* 0078F0 9FC078F0 02602021 */  addu        $a0, $s3, $zero
/* 0078F4 9FC078F4 000528C3 */  sra         $a1, $a1, 3
/* 0078F8 9FC078F8 02203021 */  addu        $a2, $s1, $zero
/* 0078FC 9FC078FC 0FF01BAB */  jal         bigint_encode
/* 007900 9FC07900 02003821 */   addu       $a3, $s0, $zero
/* 007904 9FC07904 8FBF0848 */  lw          $ra, 0x848($sp)
/* 007908 9FC07908 8FB30844 */  lw          $s3, 0x844($sp)
/* 00790C 9FC0790C 8FB20840 */  lw          $s2, 0x840($sp)
/* 007910 9FC07910 8FB1083C */  lw          $s1, 0x83c($sp)
/* 007914 9FC07914 8FB00838 */  lw          $s0, 0x838($sp)
/* 007918 9FC07918 03E00008 */  jr          $ra
/* 00791C 9FC0791C 27BD0850 */   addiu      $sp, $sp, 0x850
