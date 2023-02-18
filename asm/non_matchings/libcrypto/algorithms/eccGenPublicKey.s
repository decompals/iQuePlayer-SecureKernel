## virage2_gen_public_key
/* 008FB4 9FC08FB4 27BDFF80 */  addiu       $sp, $sp, -0x80
/* 008FB8 9FC08FB8 AFB10074 */  sw          $s1, 0x74($sp)
/* 008FBC 9FC08FBC 00808821 */  addu        $s1, $a0, $zero
/* 008FC0 9FC08FC0 AFB00070 */  sw          $s0, 0x70($sp)
/* 008FC4 9FC08FC4 AFBF0078 */  sw          $ra, 0x78($sp)
/* 008FC8 9FC08FC8 0FF02768 */  jal         Init_233_bit
/* 008FCC 9FC08FCC 00A08021 */   addu       $s0, $a1, $zero
/* 008FD0 9FC08FD0 00002821 */  addu        $a1, $zero, $zero
.L9FC08FD4:
/* 008FD4 9FC08FD4 8E030000 */  lw          $v1, ($s0)
/* 008FD8 9FC08FD8 00051080 */  sll         $v0, $a1, 2
/* 008FDC 9FC08FDC 24A50001 */  addiu       $a1, $a1, 1
/* 008FE0 9FC08FE0 27A60010 */  addiu       $a2, $sp, 0x10
/* 008FE4 9FC08FE4 00C21021 */  addu        $v0, $a2, $v0
/* 008FE8 9FC08FE8 AC430000 */  sw          $v1, ($v0)
/* 008FEC 9FC08FEC 2CA20008 */  sltiu       $v0, $a1, 8
/* 008FF0 9FC08FF0 1440FFF8 */  bnez        $v0, .L9FC08FD4
/* 008FF4 9FC08FF4 26100004 */   addiu      $s0, $s0, 4
/* 008FF8 9FC08FF8 3C049FC1 */  lui         $a0, %hi(named_point)
/* 008FFC 9FC08FFC 2484F790 */  addiu       $a0, $a0, %lo(named_point)
/* 009000 9FC09000 3C059FC1 */  lui         $a1, %hi(named_curve)
/* 009004 9FC09004 24A5F34C */  addiu       $a1, $a1, %lo(named_curve)
/* 009008 9FC09008 8FA20010 */  lw          $v0, 0x10($sp)
/* 00900C 9FC0900C 27A70030 */  addiu       $a3, $sp, 0x30
/* 009010 9FC09010 304201FF */  andi        $v0, $v0, 0x1ff
/* 009014 9FC09014 0FF02422 */  jal         generate_public_key
/* 009018 9FC09018 AFA20010 */   sw         $v0, 0x10($sp)
/* 00901C 9FC0901C 00403021 */  addu        $a2, $v0, $zero
/* 009020 9FC09020 00002821 */  addu        $a1, $zero, $zero
/* 009024 9FC09024 02201821 */  addu        $v1, $s1, $zero
.L9FC09028:
/* 009028 9FC09028 00051080 */  sll         $v0, $a1, 2
/* 00902C 9FC0902C 03A21021 */  addu        $v0, $sp, $v0
/* 009030 9FC09030 8C420030 */  lw          $v0, 0x30($v0)
/* 009034 9FC09034 24A50001 */  addiu       $a1, $a1, 1
/* 009038 9FC09038 AC620000 */  sw          $v0, ($v1)
/* 00903C 9FC0903C 2CA20008 */  sltiu       $v0, $a1, 8
/* 009040 9FC09040 1440FFF9 */  bnez        $v0, .L9FC09028
/* 009044 9FC09044 24630004 */   addiu      $v1, $v1, 4
/* 009048 9FC09048 00002821 */  addu        $a1, $zero, $zero
/* 00904C 9FC0904C 26240020 */  addiu       $a0, $s1, 0x20
.L9FC09050:
/* 009050 9FC09050 00051080 */  sll         $v0, $a1, 2
/* 009054 9FC09054 03A21021 */  addu        $v0, $sp, $v0
/* 009058 9FC09058 8C420050 */  lw          $v0, 0x50($v0)
/* 00905C 9FC0905C 24A50001 */  addiu       $a1, $a1, 1
/* 009060 9FC09060 AC820000 */  sw          $v0, ($a0)
/* 009064 9FC09064 2CA20008 */  sltiu       $v0, $a1, 8
/* 009068 9FC09068 1440FFF9 */  bnez        $v0, .L9FC09050
/* 00906C 9FC0906C 24840004 */   addiu      $a0, $a0, 4
/* 009070 9FC09070 8FBF0078 */  lw          $ra, 0x78($sp)
/* 009074 9FC09074 8FB10074 */  lw          $s1, 0x74($sp)
/* 009078 9FC09078 8FB00070 */  lw          $s0, 0x70($sp)
/* 00907C 9FC0907C 00C01021 */  addu        $v0, $a2, $zero
/* 009080 9FC09080 03E00008 */  jr          $ra
/* 009084 9FC09084 27BD0080 */   addiu      $sp, $sp, 0x80
