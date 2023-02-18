## poly_ECDSA_signature
## poly_DSA_verify
/* 0079E4 9FC079E4 27BDFEA0 */  addiu       $sp, $sp, -0x160
/* 0079E8 9FC079E8 AFA40160 */  sw          $a0, 0x160($sp)
/* 0079EC 9FC079EC 27A40078 */  addiu       $a0, $sp, 0x78
/* 0079F0 9FC079F0 AFB00138 */  sw          $s0, 0x138($sp)
/* 0079F4 9FC079F4 00A08021 */  addu        $s0, $a1, $zero
/* 0079F8 9FC079F8 AFB70154 */  sw          $s7, 0x154($sp)
/* 0079FC 9FC079FC 00E0B821 */  addu        $s7, $a3, $zero
/* 007A00 9FC07A00 02E02821 */  addu        $a1, $s7, $zero
/* 007A04 9FC07A04 AFBF015C */  sw          $ra, 0x15c($sp)
/* 007A08 9FC07A08 AFBE0158 */  sw          $fp, 0x158($sp)
/* 007A0C 9FC07A0C AFB60150 */  sw          $s6, 0x150($sp)
/* 007A10 9FC07A10 AFB5014C */  sw          $s5, 0x14c($sp)
/* 007A14 9FC07A14 AFB40148 */  sw          $s4, 0x148($sp)
/* 007A18 9FC07A18 AFB30144 */  sw          $s3, 0x144($sp)
/* 007A1C 9FC07A1C AFB20140 */  sw          $s2, 0x140($sp)
/* 007A20 9FC07A20 AFB1013C */  sw          $s1, 0x13c($sp)
/* 007A24 9FC07A24 0FF01BD0 */  jal         bigint_zero
/* 007A28 9FC07A28 AFA60168 */   sw         $a2, 0x168($sp)
/* 007A2C 9FC07A2C 24020001 */  addiu       $v0, $zero, 1
/* 007A30 9FC07A30 27A400B8 */  addiu       $a0, $sp, 0xb8
/* 007A34 9FC07A34 02E02821 */  addu        $a1, $s7, $zero
/* 007A38 9FC07A38 0FF01BD0 */  jal         bigint_zero
/* 007A3C 9FC07A3C AFA20078 */   sw         $v0, 0x78($sp)
/* 007A40 9FC07A40 27A40098 */  addiu       $a0, $sp, 0x98
/* 007A44 9FC07A44 02002821 */  addu        $a1, $s0, $zero
/* 007A48 9FC07A48 0FF01BC5 */  jal         bigint_copy
/* 007A4C 9FC07A4C 02E03021 */   addu       $a2, $s7, $zero
/* 007A50 9FC07A50 27A400D8 */  addiu       $a0, $sp, 0xd8
/* 007A54 9FC07A54 8FA50168 */  lw          $a1, 0x168($sp)
/* 007A58 9FC07A58 0FF01BC5 */  jal         bigint_copy
/* 007A5C 9FC07A5C 02E03021 */   addu       $a2, $s7, $zero
/* 007A60 9FC07A60 0BF01EC1 */  j           .L9FC07B04
/* 007A64 9FC07A64 241E0001 */   addiu      $fp, $zero, 1
.L9FC07A68:
/* 007A68 9FC07A68 27B50058 */  addiu       $s5, $sp, 0x58
/* 007A6C 9FC07A6C 02A02821 */  addu        $a1, $s5, $zero
/* 007A70 9FC07A70 27B40098 */  addiu       $s4, $sp, 0x98
/* 007A74 9FC07A74 02803021 */  addu        $a2, $s4, $zero
/* 007A78 9FC07A78 02E03821 */  addu        $a3, $s7, $zero
/* 007A7C 9FC07A7C AFB60010 */  sw          $s6, 0x10($sp)
/* 007A80 9FC07A80 0FF01C9B */  jal         bigint_div
/* 007A84 9FC07A84 AFB70014 */   sw         $s7, 0x14($sp)
/* 007A88 9FC07A88 27B200F8 */  addiu       $s2, $sp, 0xf8
/* 007A8C 9FC07A8C 02402021 */  addu        $a0, $s2, $zero
/* 007A90 9FC07A90 27A50018 */  addiu       $a1, $sp, 0x18
/* 007A94 9FC07A94 27B100B8 */  addiu       $s1, $sp, 0xb8
/* 007A98 9FC07A98 02203021 */  addu        $a2, $s1, $zero
/* 007A9C 9FC07A9C 0FF01C17 */  jal         bigint_mult
/* 007AA0 9FC07AA0 02E03821 */   addu       $a3, $s7, $zero
/* 007AA4 9FC07AA4 27B30038 */  addiu       $s3, $sp, 0x38
/* 007AA8 9FC07AA8 02602021 */  addu        $a0, $s3, $zero
/* 007AAC 9FC07AAC 27B00078 */  addiu       $s0, $sp, 0x78
/* 007AB0 9FC07AB0 02002821 */  addu        $a1, $s0, $zero
/* 007AB4 9FC07AB4 02403021 */  addu        $a2, $s2, $zero
/* 007AB8 9FC07AB8 0FF01BD9 */  jal         bigint_add
/* 007ABC 9FC07ABC 02E03821 */   addu       $a3, $s7, $zero
/* 007AC0 9FC07AC0 02002021 */  addu        $a0, $s0, $zero
/* 007AC4 9FC07AC4 02202821 */  addu        $a1, $s1, $zero
/* 007AC8 9FC07AC8 0FF01BC5 */  jal         bigint_copy
/* 007ACC 9FC07ACC 02E03021 */   addu       $a2, $s7, $zero
/* 007AD0 9FC07AD0 02202021 */  addu        $a0, $s1, $zero
/* 007AD4 9FC07AD4 02602821 */  addu        $a1, $s3, $zero
/* 007AD8 9FC07AD8 0FF01BC5 */  jal         bigint_copy
/* 007ADC 9FC07ADC 02E03021 */   addu       $a2, $s7, $zero
/* 007AE0 9FC07AE0 02802021 */  addu        $a0, $s4, $zero
/* 007AE4 9FC07AE4 02C02821 */  addu        $a1, $s6, $zero
/* 007AE8 9FC07AE8 0FF01BC5 */  jal         bigint_copy
/* 007AEC 9FC07AEC 02E03021 */   addu       $a2, $s7, $zero
/* 007AF0 9FC07AF0 02C02021 */  addu        $a0, $s6, $zero
/* 007AF4 9FC07AF4 02A02821 */  addu        $a1, $s5, $zero
/* 007AF8 9FC07AF8 0FF01BC5 */  jal         bigint_copy
/* 007AFC 9FC07AFC 02E03021 */   addu       $a2, $s7, $zero
/* 007B00 9FC07B00 001EF023 */  negu        $fp, $fp
.L9FC07B04:
/* 007B04 9FC07B04 27B600D8 */  addiu       $s6, $sp, 0xd8
/* 007B08 9FC07B08 02C02021 */  addu        $a0, $s6, $zero
/* 007B0C 9FC07B0C 0FF01DD0 */  jal         bigint_iszero
/* 007B10 9FC07B10 02E02821 */   addu       $a1, $s7, $zero
/* 007B14 9FC07B14 1040FFD4 */  beqz        $v0, .L9FC07A68
/* 007B18 9FC07B18 27A40018 */   addiu      $a0, $sp, 0x18
/* 007B1C 9FC07B1C 07C10007 */  bgez        $fp, .L9FC07B3C
/* 007B20 9FC07B20 8FA40160 */   lw         $a0, 0x160($sp)
/* 007B24 9FC07B24 27A60078 */  addiu       $a2, $sp, 0x78
/* 007B28 9FC07B28 8FA50168 */  lw          $a1, 0x168($sp)
/* 007B2C 9FC07B2C 0FF01BF1 */  jal         bigint_sub
/* 007B30 9FC07B30 02E03821 */   addu       $a3, $s7, $zero
/* 007B34 9FC07B34 0BF01ED3 */  j           .L9FC07B4C
/* 007B38 9FC07B38 8FBF015C */   lw         $ra, 0x15c($sp)
.L9FC07B3C:
/* 007B3C 9FC07B3C 27A50078 */  addiu       $a1, $sp, 0x78
/* 007B40 9FC07B40 0FF01BC5 */  jal         bigint_copy
/* 007B44 9FC07B44 02E03021 */   addu       $a2, $s7, $zero
/* 007B48 9FC07B48 8FBF015C */  lw          $ra, 0x15c($sp)
.L9FC07B4C:
/* 007B4C 9FC07B4C 8FBE0158 */  lw          $fp, 0x158($sp)
/* 007B50 9FC07B50 8FB70154 */  lw          $s7, 0x154($sp)
/* 007B54 9FC07B54 8FB60150 */  lw          $s6, 0x150($sp)
/* 007B58 9FC07B58 8FB5014C */  lw          $s5, 0x14c($sp)
/* 007B5C 9FC07B5C 8FB40148 */  lw          $s4, 0x148($sp)
/* 007B60 9FC07B60 8FB30144 */  lw          $s3, 0x144($sp)
/* 007B64 9FC07B64 8FB20140 */  lw          $s2, 0x140($sp)
/* 007B68 9FC07B68 8FB1013C */  lw          $s1, 0x13c($sp)
/* 007B6C 9FC07B6C 8FB00138 */  lw          $s0, 0x138($sp)
/* 007B70 9FC07B70 03E00008 */  jr          $ra
/* 007B74 9FC07B74 27BD0160 */   addiu      $sp, $sp, 0x160
