## bigint_mod_mult
## bigint_mod_inv
## poly_ECDSA_signature
## poly_DSA_verify
/* 00705C 9FC0705C 27BDFBB8 */  addiu       $sp, $sp, -0x448
/* 007060 9FC07060 AFB7043C */  sw          $s7, 0x43c($sp)
/* 007064 9FC07064 0080B821 */  addu        $s7, $a0, $zero
/* 007068 9FC07068 27A40018 */  addiu       $a0, $sp, 0x18
/* 00706C 9FC0706C AFB20428 */  sw          $s2, 0x428($sp)
/* 007070 9FC07070 00A09021 */  addu        $s2, $a1, $zero
/* 007074 9FC07074 AFB00420 */  sw          $s0, 0x420($sp)
/* 007078 9FC07078 00E08021 */  addu        $s0, $a3, $zero
/* 00707C 9FC0707C AFB60438 */  sw          $s6, 0x438($sp)
/* 007080 9FC07080 0010B040 */  sll         $s6, $s0, 1
/* 007084 9FC07084 02C02821 */  addu        $a1, $s6, $zero
/* 007088 9FC07088 AFB50434 */  sw          $s5, 0x434($sp)
/* 00708C 9FC0708C 00C0A821 */  addu        $s5, $a2, $zero
/* 007090 9FC07090 AFBF0440 */  sw          $ra, 0x440($sp)
/* 007094 9FC07094 AFB40430 */  sw          $s4, 0x430($sp)
/* 007098 9FC07098 AFB3042C */  sw          $s3, 0x42c($sp)
/* 00709C 9FC0709C 0FF01BD0 */  jal         bigint_zero
/* 0070A0 9FC070A0 AFB10424 */   sw         $s1, 0x424($sp)
/* 0070A4 9FC070A4 02402021 */  addu        $a0, $s2, $zero
/* 0070A8 9FC070A8 0FF01C0B */  jal         bigint_digits
/* 0070AC 9FC070AC 02002821 */   addu       $a1, $s0, $zero
/* 0070B0 9FC070B0 02A02021 */  addu        $a0, $s5, $zero
/* 0070B4 9FC070B4 02002821 */  addu        $a1, $s0, $zero
/* 0070B8 9FC070B8 0FF01C0B */  jal         bigint_digits
/* 0070BC 9FC070BC 0040A021 */   addu       $s4, $v0, $zero
/* 0070C0 9FC070C0 00008821 */  addu        $s1, $zero, $zero
/* 0070C4 9FC070C4 1A800013 */  blez        $s4, .L9FC07114
/* 0070C8 9FC070C8 00409821 */   addu       $s3, $v0, $zero
.L9FC070CC:
/* 0070CC 9FC070CC 00112080 */  sll         $a0, $s1, 2
/* 0070D0 9FC070D0 27B00018 */  addiu       $s0, $sp, 0x18
/* 0070D4 9FC070D4 02042021 */  addu        $a0, $s0, $a0
/* 0070D8 9FC070D8 00802821 */  addu        $a1, $a0, $zero
/* 0070DC 9FC070DC 8E460000 */  lw          $a2, ($s2)
/* 0070E0 9FC070E0 26520004 */  addiu       $s2, $s2, 4
/* 0070E4 9FC070E4 02A03821 */  addu        $a3, $s5, $zero
/* 0070E8 9FC070E8 0FF01AAE */  jal         bigint_add_digit_mult
/* 0070EC 9FC070EC AFB30010 */   sw         $s3, 0x10($sp)
/* 0070F0 9FC070F0 02331821 */  addu        $v1, $s1, $s3
/* 0070F4 9FC070F4 00031880 */  sll         $v1, $v1, 2
/* 0070F8 9FC070F8 02038021 */  addu        $s0, $s0, $v1
/* 0070FC 9FC070FC 8E030000 */  lw          $v1, ($s0)
/* 007100 9FC07100 26310001 */  addiu       $s1, $s1, 1
/* 007104 9FC07104 00621821 */  addu        $v1, $v1, $v0
/* 007108 9FC07108 0234102A */  slt         $v0, $s1, $s4
/* 00710C 9FC0710C 1440FFEF */  bnez        $v0, .L9FC070CC
/* 007110 9FC07110 AE030000 */   sw         $v1, ($s0)
.L9FC07114:
/* 007114 9FC07114 02E02021 */  addu        $a0, $s7, $zero
/* 007118 9FC07118 27A50018 */  addiu       $a1, $sp, 0x18
/* 00711C 9FC0711C 0FF01BC5 */  jal         bigint_copy
/* 007120 9FC07120 02C03021 */   addu       $a2, $s6, $zero
/* 007124 9FC07124 8FBF0440 */  lw          $ra, 0x440($sp)
/* 007128 9FC07128 8FB7043C */  lw          $s7, 0x43c($sp)
/* 00712C 9FC0712C 8FB60438 */  lw          $s6, 0x438($sp)
/* 007130 9FC07130 8FB50434 */  lw          $s5, 0x434($sp)
/* 007134 9FC07134 8FB40430 */  lw          $s4, 0x430($sp)
/* 007138 9FC07138 8FB3042C */  lw          $s3, 0x42c($sp)
/* 00713C 9FC0713C 8FB20428 */  lw          $s2, 0x428($sp)
/* 007140 9FC07140 8FB10424 */  lw          $s1, 0x424($sp)
/* 007144 9FC07144 8FB00420 */  lw          $s0, 0x420($sp)
/* 007148 9FC07148 03E00008 */  jr          $ra
/* 00714C 9FC0714C 27BD0448 */   addiu      $sp, $sp, 0x448
