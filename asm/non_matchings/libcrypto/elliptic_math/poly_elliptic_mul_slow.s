## generate_shared_key
## do_precompute_two
/* 00B67C 9FC0B67C 27BDFE80 */  addiu       $sp, $sp, -0x180
/* 00B680 9FC0B680 AFB50174 */  sw          $s5, 0x174($sp)
/* 00B684 9FC0B684 00A0A821 */  addu        $s5, $a1, $zero
/* 00B688 9FC0B688 27A50100 */  addiu       $a1, $sp, 0x100
/* 00B68C 9FC0B68C AFB3016C */  sw          $s3, 0x16c($sp)
/* 00B690 9FC0B690 00C09821 */  addu        $s3, $a2, $zero
/* 00B694 9FC0B694 AFB40170 */  sw          $s4, 0x170($sp)
/* 00B698 9FC0B698 00E0A021 */  addu        $s4, $a3, $zero
/* 00B69C 9FC0B69C AFBF0178 */  sw          $ra, 0x178($sp)
/* 00B6A0 9FC0B6A0 AFB20168 */  sw          $s2, 0x168($sp)
/* 00B6A4 9FC0B6A4 AFB10164 */  sw          $s1, 0x164($sp)
/* 00B6A8 9FC0B6A8 0FF01F08 */  jal         copy
/* 00B6AC 9FC0B6AC AFB00160 */   sw         $s0, 0x160($sp)
/* 00B6B0 9FC0B6B0 00003021 */  addu        $a2, $zero, $zero
/* 00B6B4 9FC0B6B4 00002021 */  addu        $a0, $zero, $zero
/* 00B6B8 9FC0B6B8 3C050001 */  lui         $a1, 1
/* 00B6BC 9FC0B6BC 00A01821 */  addu        $v1, $a1, $zero
.L9FC0B6C0:
/* 00B6C0 9FC0B6C0 3C020001 */  lui         $v0, 1
/* 00B6C4 9FC0B6C4 00A22821 */  addu        $a1, $a1, $v0
/* 00B6C8 9FC0B6C8 00041080 */  sll         $v0, $a0, 2
/* 00B6CC 9FC0B6CC 03A21021 */  addu        $v0, $sp, $v0
/* 00B6D0 9FC0B6D0 8C420100 */  lw          $v0, 0x100($v0)
/* 00B6D4 9FC0B6D4 00032403 */  sra         $a0, $v1, 0x10
/* 00B6D8 9FC0B6D8 00C23025 */  or          $a2, $a2, $v0
/* 00B6DC 9FC0B6DC 3082FFFF */  andi        $v0, $a0, 0xffff
/* 00B6E0 9FC0B6E0 2C420008 */  sltiu       $v0, $v0, 8
/* 00B6E4 9FC0B6E4 1440FFF6 */  bnez        $v0, .L9FC0B6C0
/* 00B6E8 9FC0B6E8 00A01821 */   addu       $v1, $a1, $zero
/* 00B6EC 9FC0B6EC 14C00007 */  bnez        $a2, .L9FC0B70C
/* 00B6F0 9FC0B6F0 00008821 */   addu       $s1, $zero, $zero
/* 00B6F4 9FC0B6F4 0FF01EE0 */  jal         null
/* 00B6F8 9FC0B6F8 02602021 */   addu       $a0, $s3, $zero
/* 00B6FC 9FC0B6FC 0FF01EE0 */  jal         null
/* 00B700 9FC0B700 26640020 */   addiu      $a0, $s3, 0x20
/* 00B704 9FC0B704 0BF02E2C */  j           .L9FC0B8B0
/* 00B708 9FC0B708 8FBF0178 */   lw         $ra, 0x178($sp)
.L9FC0B70C:
/* 00B70C 9FC0B70C 3C120001 */  lui         $s2, 1
/* 00B710 9FC0B710 8FA2011C */  lw          $v0, 0x11c($sp)
.L9FC0B714:
/* 00B714 9FC0B714 30420001 */  andi        $v0, $v0, 1
/* 00B718 9FC0B718 10400019 */  beqz        $v0, .L9FC0B780
/* 00B71C 9FC0B71C 03B12021 */   addu       $a0, $sp, $s1
/* 00B720 9FC0B720 93A2011F */  lbu         $v0, 0x11f($sp)
/* 00B724 9FC0B724 24030002 */  addiu       $v1, $zero, 2
/* 00B728 9FC0B728 30420003 */  andi        $v0, $v0, 3
/* 00B72C 9FC0B72C 00621823 */  subu        $v1, $v1, $v0
/* 00B730 9FC0B730 A0830010 */  sb          $v1, 0x10($a0)
/* 00B734 9FC0B734 00031E00 */  sll         $v1, $v1, 0x18
/* 00B738 9FC0B738 04610014 */  bgez        $v1, .L9FC0B78C
/* 00B73C 9FC0B73C 27A40100 */   addiu      $a0, $sp, 0x100
/* 00B740 9FC0B740 24040007 */  addiu       $a0, $zero, 7
/* 00B744 9FC0B744 3C050006 */  lui         $a1, 6
.L9FC0B748:
/* 00B748 9FC0B748 00041080 */  sll         $v0, $a0, 2
/* 00B74C 9FC0B74C 27A30100 */  addiu       $v1, $sp, 0x100
/* 00B750 9FC0B750 00621821 */  addu        $v1, $v1, $v0
/* 00B754 9FC0B754 8C620000 */  lw          $v0, ($v1)
/* 00B758 9FC0B758 24420001 */  addiu       $v0, $v0, 1
/* 00B75C 9FC0B75C 1440000A */  bnez        $v0, .L9FC0B788
/* 00B760 9FC0B760 AC620000 */   sw         $v0, ($v1)
/* 00B764 9FC0B764 00A01821 */  addu        $v1, $a1, $zero
/* 00B768 9FC0B768 3C02FFFF */  lui         $v0, 0xffff
/* 00B76C 9FC0B76C 00032403 */  sra         $a0, $v1, 0x10
/* 00B770 9FC0B770 0481FFF5 */  bgez        $a0, .L9FC0B748
/* 00B774 9FC0B774 00A22821 */   addu       $a1, $a1, $v0
/* 00B778 9FC0B778 0BF02DE3 */  j           .L9FC0B78C
/* 00B77C 9FC0B77C 27A40100 */   addiu      $a0, $sp, 0x100
.L9FC0B780:
/* 00B780 9FC0B780 03B11021 */  addu        $v0, $sp, $s1
/* 00B784 9FC0B784 A0400010 */  sb          $zero, 0x10($v0)
.L9FC0B788:
/* 00B788 9FC0B788 27A40100 */  addiu       $a0, $sp, 0x100
.L9FC0B78C:
/* 00B78C 9FC0B78C 8FA2011C */  lw          $v0, 0x11c($sp)
/* 00B790 9FC0B790 2403FFFE */  addiu       $v1, $zero, -2
/* 00B794 9FC0B794 00431024 */  and         $v0, $v0, $v1
/* 00B798 9FC0B798 0FF02391 */  jal         poly_rot_right
/* 00B79C 9FC0B79C AFA2011C */   sw         $v0, 0x11c($sp)
/* 00B7A0 9FC0B7A0 02401821 */  addu        $v1, $s2, $zero
/* 00B7A4 9FC0B7A4 3C020001 */  lui         $v0, 1
/* 00B7A8 9FC0B7A8 02429021 */  addu        $s2, $s2, $v0
/* 00B7AC 9FC0B7AC 00038C03 */  sra         $s1, $v1, 0x10
/* 00B7B0 9FC0B7B0 00003021 */  addu        $a2, $zero, $zero
/* 00B7B4 9FC0B7B4 00002021 */  addu        $a0, $zero, $zero
/* 00B7B8 9FC0B7B8 3C050001 */  lui         $a1, 1
.L9FC0B7BC:
/* 00B7BC 9FC0B7BC 00A01821 */  addu        $v1, $a1, $zero
/* 00B7C0 9FC0B7C0 3C100001 */  lui         $s0, 1
/* 00B7C4 9FC0B7C4 00041080 */  sll         $v0, $a0, 2
/* 00B7C8 9FC0B7C8 03A21021 */  addu        $v0, $sp, $v0
/* 00B7CC 9FC0B7CC 8C420100 */  lw          $v0, 0x100($v0)
/* 00B7D0 9FC0B7D0 00032403 */  sra         $a0, $v1, 0x10
/* 00B7D4 9FC0B7D4 00C23025 */  or          $a2, $a2, $v0
/* 00B7D8 9FC0B7D8 3082FFFF */  andi        $v0, $a0, 0xffff
/* 00B7DC 9FC0B7DC 2C420008 */  sltiu       $v0, $v0, 8
/* 00B7E0 9FC0B7E0 1440FFF6 */  bnez        $v0, .L9FC0B7BC
/* 00B7E4 9FC0B7E4 00B02821 */   addu       $a1, $a1, $s0
/* 00B7E8 9FC0B7E8 14C0FFCA */  bnez        $a2, .L9FC0B714
/* 00B7EC 9FC0B7EC 8FA2011C */   lw         $v0, 0x11c($sp)
/* 00B7F0 9FC0B7F0 2622FFFF */  addiu       $v0, $s1, -1
/* 00B7F4 9FC0B7F4 00021400 */  sll         $v0, $v0, 0x10
/* 00B7F8 9FC0B7F8 00028C03 */  sra         $s1, $v0, 0x10
/* 00B7FC 9FC0B7FC 02A02021 */  addu        $a0, $s5, $zero
/* 00B800 9FC0B800 0FF02C0C */  jal         copy_point
/* 00B804 9FC0B804 02602821 */   addu       $a1, $s3, $zero
/* 00B808 9FC0B808 1A200028 */  blez        $s1, .L9FC0B8AC
/* 00B80C 9FC0B80C 00111400 */   sll        $v0, $s1, 0x10
/* 00B810 9FC0B810 00509023 */  subu        $s2, $v0, $s0
/* 00B814 9FC0B814 02602021 */  addu        $a0, $s3, $zero
.L9FC0B818:
/* 00B818 9FC0B818 27B00120 */  addiu       $s0, $sp, 0x120
/* 00B81C 9FC0B81C 02002821 */  addu        $a1, $s0, $zero
/* 00B820 9FC0B820 0FF02D00 */  jal         poly_elliptic_double
/* 00B824 9FC0B824 02803021 */   addu       $a2, $s4, $zero
/* 00B828 9FC0B828 02401021 */  addu        $v0, $s2, $zero
/* 00B82C 9FC0B82C 00028C03 */  sra         $s1, $v0, 0x10
/* 00B830 9FC0B830 3C03FFFF */  lui         $v1, 0xffff
/* 00B834 9FC0B834 03B11021 */  addu        $v0, $sp, $s1
/* 00B838 9FC0B838 80440010 */  lb          $a0, 0x10($v0)
/* 00B83C 9FC0B83C 10800016 */  beqz        $a0, .L9FC0B898
/* 00B840 9FC0B840 02439021 */   addu       $s2, $s2, $v1
/* 00B844 9FC0B844 1C800006 */  bgtz        $a0, .L9FC0B860
/* 00B848 9FC0B848 24020001 */   addiu      $v0, $zero, 1
/* 00B84C 9FC0B84C 2402FFFF */  addiu       $v0, $zero, -1
/* 00B850 9FC0B850 1082000B */  beq         $a0, $v0, .L9FC0B880
/* 00B854 9FC0B854 02002021 */   addu       $a0, $s0, $zero
/* 00B858 9FC0B858 0BF02E29 */  j           .L9FC0B8A4
/* 00B85C 9FC0B85C 00000000 */   nop
.L9FC0B860:
/* 00B860 9FC0B860 14820010 */  bne         $a0, $v0, .L9FC0B8A4
/* 00B864 9FC0B864 02A02021 */   addu       $a0, $s5, $zero
/* 00B868 9FC0B868 02002821 */  addu        $a1, $s0, $zero
/* 00B86C 9FC0B86C 02603021 */  addu        $a2, $s3, $zero
/* 00B870 9FC0B870 0FF02C1B */  jal         poly_elliptic_sum
/* 00B874 9FC0B874 02803821 */   addu       $a3, $s4, $zero
/* 00B878 9FC0B878 0BF02E29 */  j           .L9FC0B8A4
/* 00B87C 9FC0B87C 00000000 */   nop
.L9FC0B880:
/* 00B880 9FC0B880 02A02821 */  addu        $a1, $s5, $zero
/* 00B884 9FC0B884 02603021 */  addu        $a2, $s3, $zero
/* 00B888 9FC0B888 0FF02D72 */  jal         poly_elliptic_sub
/* 00B88C 9FC0B88C 02803821 */   addu       $a3, $s4, $zero
/* 00B890 9FC0B890 0BF02E29 */  j           .L9FC0B8A4
/* 00B894 9FC0B894 00000000 */   nop
.L9FC0B898:
/* 00B898 9FC0B898 02002021 */  addu        $a0, $s0, $zero
/* 00B89C 9FC0B89C 0FF02C0C */  jal         copy_point
/* 00B8A0 9FC0B8A0 02602821 */   addu       $a1, $s3, $zero
.L9FC0B8A4:
/* 00B8A4 9FC0B8A4 1E20FFDC */  bgtz        $s1, .L9FC0B818
/* 00B8A8 9FC0B8A8 02602021 */   addu       $a0, $s3, $zero
.L9FC0B8AC:
/* 00B8AC 9FC0B8AC 8FBF0178 */  lw          $ra, 0x178($sp)
.L9FC0B8B0:
/* 00B8B0 9FC0B8B0 8FB50174 */  lw          $s5, 0x174($sp)
/* 00B8B4 9FC0B8B4 8FB40170 */  lw          $s4, 0x170($sp)
/* 00B8B8 9FC0B8B8 8FB3016C */  lw          $s3, 0x16c($sp)
/* 00B8BC 9FC0B8BC 8FB20168 */  lw          $s2, 0x168($sp)
/* 00B8C0 9FC0B8C0 8FB10164 */  lw          $s1, 0x164($sp)
/* 00B8C4 9FC0B8C4 8FB00160 */  lw          $s0, 0x160($sp)
/* 00B8C8 9FC0B8C8 03E00008 */  jr          $ra
/* 00B8CC 9FC0B8CC 27BD0180 */   addiu      $sp, $sp, 0x180
