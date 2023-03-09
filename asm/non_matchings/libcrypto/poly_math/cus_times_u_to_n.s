## poly_inv
glabel cus_times_u_to_n
/* 0084BC 9FC084BC 27BDFE48 */  addiu       $sp, $sp, -0x1b8
/* 0084C0 9FC084C0 AFB00190 */  sw          $s0, 0x190($sp)
/* 0084C4 9FC084C4 00A08021 */  addu        $s0, $a1, $zero
/* 0084C8 9FC084C8 27A50150 */  addiu       $a1, $sp, 0x150
/* 0084CC 9FC084CC AFB701AC */  sw          $s7, 0x1ac($sp)
/* 0084D0 9FC084D0 00C0B821 */  addu        $s7, $a2, $zero
/* 0084D4 9FC084D4 AFBF01B0 */  sw          $ra, 0x1b0($sp)
/* 0084D8 9FC084D8 AFB601A8 */  sw          $s6, 0x1a8($sp)
/* 0084DC 9FC084DC AFB501A4 */  sw          $s5, 0x1a4($sp)
/* 0084E0 9FC084E0 AFB401A0 */  sw          $s4, 0x1a0($sp)
/* 0084E4 9FC084E4 AFB3019C */  sw          $s3, 0x19c($sp)
/* 0084E8 9FC084E8 AFB20198 */  sw          $s2, 0x198($sp)
/* 0084EC 9FC084EC 0FF01F24 */  jal         single_to_double
/* 0084F0 9FC084F0 AFB10194 */   sw         $s1, 0x194($sp)
/* 0084F4 9FC084F4 0FF01EEB */  jal         double_null
/* 0084F8 9FC084F8 27A40010 */   addiu      $a0, $sp, 0x10
/* 0084FC 9FC084FC 2402FFFF */  addiu       $v0, $zero, -1
/* 008500 9FC08500 0000A021 */  addu        $s4, $zero, $zero
/* 008504 9FC08504 0010A942 */  srl         $s5, $s0, 5
/* 008508 9FC08508 3216001F */  andi        $s6, $s0, 0x1f
/* 00850C 9FC0850C 12A00032 */  beqz        $s5, .L9FC085D8
/* 008510 9FC08510 AFA20048 */   sw         $v0, 0x48($sp)
/* 008514 9FC08514 27A40150 */  addiu       $a0, $sp, 0x150
.L9FC08518:
/* 008518 9FC08518 27A50010 */  addiu       $a1, $sp, 0x10
/* 00851C 9FC0851C 27B00110 */  addiu       $s0, $sp, 0x110
/* 008520 9FC08520 0FF020B6 */  jal         extract_masked_bits
/* 008524 9FC08524 02003021 */   addu       $a2, $s0, $zero
/* 008528 9FC08528 27B20050 */  addiu       $s2, $sp, 0x50
/* 00852C 9FC0852C 02402821 */  addu        $a1, $s2, $zero
/* 008530 9FC08530 27B30090 */  addiu       $s3, $sp, 0x90
/* 008534 9FC08534 02602021 */  addu        $a0, $s3, $zero
/* 008538 9FC08538 00001821 */  addu        $v1, $zero, $zero
.L9FC0853C:
/* 00853C 9FC0853C 8E020000 */  lw          $v0, ($s0)
/* 008540 9FC08540 24630001 */  addiu       $v1, $v1, 1
/* 008544 9FC08544 ACA20000 */  sw          $v0, ($a1)
/* 008548 9FC08548 8E020000 */  lw          $v0, ($s0)
/* 00854C 9FC0854C 26100004 */  addiu       $s0, $s0, 4
/* 008550 9FC08550 24A50004 */  addiu       $a1, $a1, 4
/* 008554 9FC08554 AC820000 */  sw          $v0, ($a0)
/* 008558 9FC08558 2C62000F */  sltiu       $v0, $v1, 0xf
/* 00855C 9FC0855C 1440FFF7 */  bnez        $v0, .L9FC0853C
/* 008560 9FC08560 24840004 */   addiu      $a0, $a0, 4
/* 008564 9FC08564 02402021 */  addu        $a0, $s2, $zero
/* 008568 9FC08568 0FF02039 */  jal         multiply_shift_n
/* 00856C 9FC0856C 240500E9 */   addiu      $a1, $zero, 0xe9
/* 008570 9FC08570 02602021 */  addu        $a0, $s3, $zero
/* 008574 9FC08574 0FF02039 */  jal         multiply_shift_n
/* 008578 9FC08578 2405004A */   addiu      $a1, $zero, 0x4a
/* 00857C 9FC0857C 27B10150 */  addiu       $s1, $sp, 0x150
/* 008580 9FC08580 02202021 */  addu        $a0, $s1, $zero
/* 008584 9FC08584 02402821 */  addu        $a1, $s2, $zero
/* 008588 9FC08588 27B000D0 */  addiu       $s0, $sp, 0xd0
/* 00858C 9FC0858C 0FF01EF6 */  jal         double_add
/* 008590 9FC08590 02003021 */   addu       $a2, $s0, $zero
/* 008594 9FC08594 02002021 */  addu        $a0, $s0, $zero
/* 008598 9FC08598 02602821 */  addu        $a1, $s3, $zero
/* 00859C 9FC0859C 0FF01EF6 */  jal         double_add
/* 0085A0 9FC085A0 02403021 */   addu       $a2, $s2, $zero
/* 0085A4 9FC085A4 02402021 */  addu        $a0, $s2, $zero
/* 0085A8 9FC085A8 0FF020C7 */  jal         zero_masked_bits
/* 0085AC 9FC085AC 27A50010 */   addiu      $a1, $sp, 0x10
/* 0085B0 9FC085B0 02402021 */  addu        $a0, $s2, $zero
/* 0085B4 9FC085B4 0FF02079 */  jal         divide_shift_n
/* 0085B8 9FC085B8 24050020 */   addiu      $a1, $zero, 0x20
/* 0085BC 9FC085BC 02402021 */  addu        $a0, $s2, $zero
/* 0085C0 9FC085C0 0FF01F16 */  jal         double_copy
/* 0085C4 9FC085C4 02202821 */   addu       $a1, $s1, $zero
/* 0085C8 9FC085C8 26940001 */  addiu       $s4, $s4, 1
/* 0085CC 9FC085CC 0295102A */  slt         $v0, $s4, $s5
/* 0085D0 9FC085D0 1440FFD1 */  bnez        $v0, .L9FC08518
/* 0085D4 9FC085D4 27A40150 */   addiu      $a0, $sp, 0x150
.L9FC085D8:
/* 0085D8 9FC085D8 0FF01EEB */  jal         double_null
/* 0085DC 9FC085DC 27A40010 */   addiu      $a0, $sp, 0x10
/* 0085E0 9FC085E0 24040001 */  addiu       $a0, $zero, 1
/* 0085E4 9FC085E4 12C00008 */  beqz        $s6, .L9FC08608
/* 0085E8 9FC085E8 00001821 */   addu       $v1, $zero, $zero
.L9FC085EC:
/* 0085EC 9FC085EC 8FA20048 */  lw          $v0, 0x48($sp)
/* 0085F0 9FC085F0 24630001 */  addiu       $v1, $v1, 1
/* 0085F4 9FC085F4 00441025 */  or          $v0, $v0, $a0
/* 0085F8 9FC085F8 AFA20048 */  sw          $v0, 0x48($sp)
/* 0085FC 9FC085FC 0076102A */  slt         $v0, $v1, $s6
/* 008600 9FC08600 1440FFFA */  bnez        $v0, .L9FC085EC
/* 008604 9FC08604 00042040 */   sll        $a0, $a0, 1
.L9FC08608:
/* 008608 9FC08608 27B30150 */  addiu       $s3, $sp, 0x150
/* 00860C 9FC0860C 02602021 */  addu        $a0, $s3, $zero
/* 008610 9FC08610 27A50010 */  addiu       $a1, $sp, 0x10
/* 008614 9FC08614 27B00110 */  addiu       $s0, $sp, 0x110
/* 008618 9FC08618 0FF020B6 */  jal         extract_masked_bits
/* 00861C 9FC0861C 02003021 */   addu       $a2, $s0, $zero
/* 008620 9FC08620 02002021 */  addu        $a0, $s0, $zero
/* 008624 9FC08624 27B10050 */  addiu       $s1, $sp, 0x50
/* 008628 9FC08628 0FF01F16 */  jal         double_copy
/* 00862C 9FC0862C 02202821 */   addu       $a1, $s1, $zero
/* 008630 9FC08630 02002021 */  addu        $a0, $s0, $zero
/* 008634 9FC08634 27B20090 */  addiu       $s2, $sp, 0x90
/* 008638 9FC08638 0FF01F16 */  jal         double_copy
/* 00863C 9FC0863C 02402821 */   addu       $a1, $s2, $zero
/* 008640 9FC08640 02202021 */  addu        $a0, $s1, $zero
/* 008644 9FC08644 0FF02039 */  jal         multiply_shift_n
/* 008648 9FC08648 240500E9 */   addiu      $a1, $zero, 0xe9
/* 00864C 9FC0864C 02402021 */  addu        $a0, $s2, $zero
/* 008650 9FC08650 0FF02039 */  jal         multiply_shift_n
/* 008654 9FC08654 2405004A */   addiu      $a1, $zero, 0x4a
/* 008658 9FC08658 02602021 */  addu        $a0, $s3, $zero
/* 00865C 9FC0865C 02202821 */  addu        $a1, $s1, $zero
/* 008660 9FC08660 27B000D0 */  addiu       $s0, $sp, 0xd0
/* 008664 9FC08664 0FF01EF6 */  jal         double_add
/* 008668 9FC08668 02003021 */   addu       $a2, $s0, $zero
/* 00866C 9FC0866C 02002021 */  addu        $a0, $s0, $zero
/* 008670 9FC08670 02402821 */  addu        $a1, $s2, $zero
/* 008674 9FC08674 0FF01EF6 */  jal         double_add
/* 008678 9FC08678 02203021 */   addu       $a2, $s1, $zero
/* 00867C 9FC0867C 02202021 */  addu        $a0, $s1, $zero
/* 008680 9FC08680 0FF020C7 */  jal         zero_masked_bits
/* 008684 9FC08684 27A50010 */   addiu      $a1, $sp, 0x10
/* 008688 9FC08688 02202021 */  addu        $a0, $s1, $zero
/* 00868C 9FC0868C 0FF02079 */  jal         divide_shift_n
/* 008690 9FC08690 02C02821 */   addu       $a1, $s6, $zero
/* 008694 9FC08694 02202021 */  addu        $a0, $s1, $zero
/* 008698 9FC08698 0FF01F16 */  jal         double_copy
/* 00869C 9FC0869C 02602821 */   addu       $a1, $s3, $zero
/* 0086A0 9FC086A0 02602021 */  addu        $a0, $s3, $zero
/* 0086A4 9FC086A4 0FF01F3D */  jal         double_to_single
/* 0086A8 9FC086A8 02E02821 */   addu       $a1, $s7, $zero
/* 0086AC 9FC086AC 8FBF01B0 */  lw          $ra, 0x1b0($sp)
/* 0086B0 9FC086B0 8FB701AC */  lw          $s7, 0x1ac($sp)
/* 0086B4 9FC086B4 8FB601A8 */  lw          $s6, 0x1a8($sp)
/* 0086B8 9FC086B8 8FB501A4 */  lw          $s5, 0x1a4($sp)
/* 0086BC 9FC086BC 8FB401A0 */  lw          $s4, 0x1a0($sp)
/* 0086C0 9FC086C0 8FB3019C */  lw          $s3, 0x19c($sp)
/* 0086C4 9FC086C4 8FB20198 */  lw          $s2, 0x198($sp)
/* 0086C8 9FC086C8 8FB10194 */  lw          $s1, 0x194($sp)
/* 0086CC 9FC086CC 8FB00190 */  lw          $s0, 0x190($sp)
/* 0086D0 9FC086D0 03E00008 */  jr          $ra
/* 0086D4 9FC086D4 27BD01B8 */   addiu      $sp, $sp, 0x1b8
