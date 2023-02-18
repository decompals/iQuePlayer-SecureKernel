## verify_ecc_signature
/* 009CEC 9FC09CEC 27BDFEB8 */  addiu       $sp, $sp, -0x148
/* 009CF0 9FC09CF0 AFB5013C */  sw          $s5, 0x13c($sp)
/* 009CF4 9FC09CF4 0080A821 */  addu        $s5, $a0, $zero
/* 009CF8 9FC09CF8 AFB20130 */  sw          $s2, 0x130($sp)
/* 009CFC 9FC09CFC 8FB20158 */  lw          $s2, 0x158($sp)
/* 009D00 9FC09D00 27A40020 */  addiu       $a0, $sp, 0x20
/* 009D04 9FC09D04 AFB40138 */  sw          $s4, 0x138($sp)
/* 009D08 9FC09D08 00A0A021 */  addu        $s4, $a1, $zero
/* 009D0C 9FC09D0C AFB30134 */  sw          $s3, 0x134($sp)
/* 009D10 9FC09D10 8FB3015C */  lw          $s3, 0x15c($sp)
/* 009D14 9FC09D14 240500E9 */  addiu       $a1, $zero, 0xe9
/* 009D18 9FC09D18 AFB60140 */  sw          $s6, 0x140($sp)
/* 009D1C 9FC09D1C 00C0B021 */  addu        $s6, $a2, $zero
/* 009D20 9FC09D20 AFB00128 */  sw          $s0, 0x128($sp)
/* 009D24 9FC09D24 00E08021 */  addu        $s0, $a3, $zero
/* 009D28 9FC09D28 AFBF0144 */  sw          $ra, 0x144($sp)
/* 009D2C 9FC09D2C 0FF02539 */  jal         Init_233_bit_ECDSA
/* 009D30 9FC09D30 AFB1012C */   sw         $s1, 0x12c($sp)
/* 009D34 9FC09D34 02002021 */  addu        $a0, $s0, $zero
/* 009D38 9FC09D38 27B100E8 */  addiu       $s1, $sp, 0xe8
/* 009D3C 9FC09D3C 0FF01F08 */  jal         copy
/* 009D40 9FC09D40 02202821 */   addu       $a1, $s1, $zero
/* 009D44 9FC09D44 26040020 */  addiu       $a0, $s0, 0x20
/* 009D48 9FC09D48 0FF01F08 */  jal         copy
/* 009D4C 9FC09D4C 27A50108 */   addiu      $a1, $sp, 0x108
/* 009D50 9FC09D50 02A02021 */  addu        $a0, $s5, $zero
/* 009D54 9FC09D54 02802821 */  addu        $a1, $s4, $zero
/* 009D58 9FC09D58 27A60020 */  addiu       $a2, $sp, 0x20
/* 009D5C 9FC09D5C 02C03821 */  addu        $a3, $s6, $zero
/* 009D60 9FC09D60 AFB10010 */  sw          $s1, 0x10($sp)
/* 009D64 9FC09D64 AFB20014 */  sw          $s2, 0x14($sp)
/* 009D68 9FC09D68 0FF0262B */  jal         poly_DSA_verify
/* 009D6C 9FC09D6C AFB30018 */   sw         $s3, 0x18($sp)
/* 009D70 9FC09D70 8FBF0144 */  lw          $ra, 0x144($sp)
/* 009D74 9FC09D74 8FB60140 */  lw          $s6, 0x140($sp)
/* 009D78 9FC09D78 8FB5013C */  lw          $s5, 0x13c($sp)
/* 009D7C 9FC09D7C 8FB40138 */  lw          $s4, 0x138($sp)
/* 009D80 9FC09D80 8FB30134 */  lw          $s3, 0x134($sp)
/* 009D84 9FC09D84 8FB20130 */  lw          $s2, 0x130($sp)
/* 009D88 9FC09D88 8FB1012C */  lw          $s1, 0x12c($sp)
/* 009D8C 9FC09D8C 8FB00128 */  lw          $s0, 0x128($sp)
/* 009D90 9FC09D90 03E00008 */  jr          $ra
/* 009D94 9FC09D94 27BD0148 */   addiu      $sp, $sp, 0x148
