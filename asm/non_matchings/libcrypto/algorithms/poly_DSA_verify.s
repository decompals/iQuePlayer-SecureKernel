## bsl_verify_ecc_sig
/* 0098AC 9FC098AC 27BDFD80 */  addiu       $sp, $sp, -0x280
/* 0098B0 9FC098B0 AFBE0278 */  sw          $fp, 0x278($sp)
/* 0098B4 9FC098B4 8FBE0298 */  lw          $fp, 0x298($sp)
/* 0098B8 9FC098B8 AFA40280 */  sw          $a0, 0x280($sp)
/* 0098BC 9FC098BC 27A40018 */  addiu       $a0, $sp, 0x18
/* 0098C0 9FC098C0 AFA50284 */  sw          $a1, 0x284($sp)
/* 0098C4 9FC098C4 24050008 */  addiu       $a1, $zero, 8
/* 0098C8 9FC098C8 AFB60270 */  sw          $s6, 0x270($sp)
/* 0098CC 9FC098CC 00C0B021 */  addu        $s6, $a2, $zero
/* 0098D0 9FC098D0 AFBF027C */  sw          $ra, 0x27c($sp)
/* 0098D4 9FC098D4 AFB70274 */  sw          $s7, 0x274($sp)
/* 0098D8 9FC098D8 AFB5026C */  sw          $s5, 0x26c($sp)
/* 0098DC 9FC098DC AFB40268 */  sw          $s4, 0x268($sp)
/* 0098E0 9FC098E0 AFB30264 */  sw          $s3, 0x264($sp)
/* 0098E4 9FC098E4 AFB20260 */  sw          $s2, 0x260($sp)
/* 0098E8 9FC098E8 AFB1025C */  sw          $s1, 0x25c($sp)
/* 0098EC 9FC098EC AFB00258 */  sw          $s0, 0x258($sp)
/* 0098F0 9FC098F0 0FF01BD0 */  jal         bigint_zero
/* 0098F4 9FC098F4 AFA7028C */   sw         $a3, 0x28c($sp)
/* 0098F8 9FC098F8 27B70038 */  addiu       $s7, $sp, 0x38
/* 0098FC 9FC098FC 02E02021 */  addu        $a0, $s7, $zero
/* 009900 9FC09900 0FF01BD0 */  jal         bigint_zero
/* 009904 9FC09904 24050008 */   addiu      $a1, $zero, 8
/* 009908 9FC09908 27B30058 */  addiu       $s3, $sp, 0x58
/* 00990C 9FC0990C 02602021 */  addu        $a0, $s3, $zero
/* 009910 9FC09910 0FF01BD0 */  jal         bigint_zero
/* 009914 9FC09914 24050008 */   addiu      $a1, $zero, 8
/* 009918 9FC09918 27B00078 */  addiu       $s0, $sp, 0x78
/* 00991C 9FC0991C 02002021 */  addu        $a0, $s0, $zero
/* 009920 9FC09920 0FF01BD0 */  jal         bigint_zero
/* 009924 9FC09924 24050010 */   addiu      $a1, $zero, 0x10
/* 009928 9FC09928 27B500B8 */  addiu       $s5, $sp, 0xb8
/* 00992C 9FC0992C 02A02021 */  addu        $a0, $s5, $zero
/* 009930 9FC09930 0FF01BD0 */  jal         bigint_zero
/* 009934 9FC09934 24050008 */   addiu      $a1, $zero, 8
/* 009938 9FC09938 27B200D8 */  addiu       $s2, $sp, 0xd8
/* 00993C 9FC0993C 02402021 */  addu        $a0, $s2, $zero
/* 009940 9FC09940 0FF01BD0 */  jal         bigint_zero
/* 009944 9FC09944 24050008 */   addiu      $a1, $zero, 8
/* 009948 9FC09948 27B400F8 */  addiu       $s4, $sp, 0xf8
/* 00994C 9FC0994C 02802021 */  addu        $a0, $s4, $zero
/* 009950 9FC09950 0FF01BD0 */  jal         bigint_zero
/* 009954 9FC09954 24050008 */   addiu      $a1, $zero, 8
/* 009958 9FC09958 27A40118 */  addiu       $a0, $sp, 0x118
/* 00995C 9FC0995C 0FF01BD0 */  jal         bigint_zero
/* 009960 9FC09960 24050008 */   addiu      $a1, $zero, 8
/* 009964 9FC09964 27B10138 */  addiu       $s1, $sp, 0x138
/* 009968 9FC09968 02202021 */  addu        $a0, $s1, $zero
/* 00996C 9FC0996C 0FF01BD0 */  jal         bigint_zero
/* 009970 9FC09970 24050008 */   addiu      $a1, $zero, 8
/* 009974 9FC09974 26C40084 */  addiu       $a0, $s6, 0x84
/* 009978 9FC09978 02202821 */  addu        $a1, $s1, $zero
/* 00997C 9FC0997C 0FF01E48 */  jal         field_to_bigint
/* 009980 9FC09980 24060008 */   addiu      $a2, $zero, 8
/* 009984 9FC09984 02002821 */  addu        $a1, $s0, $zero
/* 009988 9FC09988 8FA80290 */  lw          $t0, 0x290($sp)
/* 00998C 9FC0998C 24060008 */  addiu       $a2, $zero, 8
/* 009990 9FC09990 0FF01E48 */  jal         field_to_bigint
/* 009994 9FC09994 25040020 */   addiu      $a0, $t0, 0x20
/* 009998 9FC09998 02602021 */  addu        $a0, $s3, $zero
/* 00999C 9FC0999C 02002821 */  addu        $a1, $s0, $zero
/* 0099A0 9FC099A0 02203021 */  addu        $a2, $s1, $zero
/* 0099A4 9FC099A4 0FF01E79 */  jal         bigint_mod_inv
/* 0099A8 9FC099A8 24070008 */   addiu      $a3, $zero, 8
/* 0099AC 9FC099AC 27A60018 */  addiu       $a2, $sp, 0x18
/* 0099B0 9FC099B0 8FA40280 */  lw          $a0, 0x280($sp)
/* 0099B4 9FC099B4 8FA50284 */  lw          $a1, 0x284($sp)
/* 0099B8 9FC099B8 240700E9 */  addiu       $a3, $zero, 0xe9
/* 0099BC 9FC099BC 0FF024F5 */  jal         hash_to_integer
/* 0099C0 9FC099C0 AFBE0010 */   sw         $fp, 0x10($sp)
/* 0099C4 9FC099C4 02002021 */  addu        $a0, $s0, $zero
/* 0099C8 9FC099C8 27A50018 */  addiu       $a1, $sp, 0x18
/* 0099CC 9FC099CC 02603021 */  addu        $a2, $s3, $zero
/* 0099D0 9FC099D0 0FF01C17 */  jal         bigint_mult
/* 0099D4 9FC099D4 24070008 */   addiu      $a3, $zero, 8
/* 0099D8 9FC099D8 02002021 */  addu        $a0, $s0, $zero
/* 0099DC 9FC099DC 0FF01C0B */  jal         bigint_digits
/* 0099E0 9FC099E0 24050010 */   addiu      $a1, $zero, 0x10
/* 0099E4 9FC099E4 02202021 */  addu        $a0, $s1, $zero
/* 0099E8 9FC099E8 24050008 */  addiu       $a1, $zero, 8
/* 0099EC 9FC099EC 0FF01C0B */  jal         bigint_digits
/* 0099F0 9FC099F0 0040F021 */   addu       $fp, $v0, $zero
/* 0099F4 9FC099F4 02A02021 */  addu        $a0, $s5, $zero
/* 0099F8 9FC099F8 02402821 */  addu        $a1, $s2, $zero
/* 0099FC 9FC099FC 02003021 */  addu        $a2, $s0, $zero
/* 009A00 9FC09A00 03C03821 */  addu        $a3, $fp, $zero
/* 009A04 9FC09A04 0040F021 */  addu        $fp, $v0, $zero
/* 009A08 9FC09A08 AFB10010 */  sw          $s1, 0x10($sp)
/* 009A0C 9FC09A0C 0FF01C9B */  jal         bigint_div
/* 009A10 9FC09A10 AFBE0014 */   sw         $fp, 0x14($sp)
/* 009A14 9FC09A14 02402021 */  addu        $a0, $s2, $zero
/* 009A18 9FC09A18 27B20218 */  addiu       $s2, $sp, 0x218
/* 009A1C 9FC09A1C 02402821 */  addu        $a1, $s2, $zero
/* 009A20 9FC09A20 0FF01E5A */  jal         bigint_to_field
/* 009A24 9FC09A24 24060008 */   addiu      $a2, $zero, 8
/* 009A28 9FC09A28 02E02821 */  addu        $a1, $s7, $zero
/* 009A2C 9FC09A2C 8FA40290 */  lw          $a0, 0x290($sp)
/* 009A30 9FC09A30 0FF01E48 */  jal         field_to_bigint
/* 009A34 9FC09A34 24060008 */   addiu      $a2, $zero, 8
/* 009A38 9FC09A38 02002021 */  addu        $a0, $s0, $zero
/* 009A3C 9FC09A3C 02602821 */  addu        $a1, $s3, $zero
/* 009A40 9FC09A40 02E03021 */  addu        $a2, $s7, $zero
/* 009A44 9FC09A44 0FF01C17 */  jal         bigint_mult
/* 009A48 9FC09A48 24070008 */   addiu      $a3, $zero, 8
/* 009A4C 9FC09A4C 02002021 */  addu        $a0, $s0, $zero
/* 009A50 9FC09A50 0FF01C0B */  jal         bigint_digits
/* 009A54 9FC09A54 24050010 */   addiu      $a1, $zero, 0x10
/* 009A58 9FC09A58 02A02021 */  addu        $a0, $s5, $zero
/* 009A5C 9FC09A5C 02802821 */  addu        $a1, $s4, $zero
/* 009A60 9FC09A60 02003021 */  addu        $a2, $s0, $zero
/* 009A64 9FC09A64 00403821 */  addu        $a3, $v0, $zero
/* 009A68 9FC09A68 AFB10010 */  sw          $s1, 0x10($sp)
/* 009A6C 9FC09A6C 0FF01C9B */  jal         bigint_div
/* 009A70 9FC09A70 AFBE0014 */   sw         $fp, 0x14($sp)
/* 009A74 9FC09A74 02802021 */  addu        $a0, $s4, $zero
/* 009A78 9FC09A78 27B00238 */  addiu       $s0, $sp, 0x238
/* 009A7C 9FC09A7C 02002821 */  addu        $a1, $s0, $zero
/* 009A80 9FC09A80 0FF01E5A */  jal         bigint_to_field
/* 009A84 9FC09A84 24060008 */   addiu      $a2, $zero, 8
/* 009A88 9FC09A88 02402021 */  addu        $a0, $s2, $zero
/* 009A8C 9FC09A8C 26C50044 */  addiu       $a1, $s6, 0x44
/* 009A90 9FC09A90 27B10158 */  addiu       $s1, $sp, 0x158
/* 009A94 9FC09A94 02203021 */  addu        $a2, $s1, $zero
/* 009A98 9FC09A98 0FF02E34 */  jal         poly_elliptic_mul_four
/* 009A9C 9FC09A9C 02C03821 */   addu       $a3, $s6, $zero
/* 009AA0 9FC09AA0 02002021 */  addu        $a0, $s0, $zero
/* 009AA4 9FC09AA4 27B00198 */  addiu       $s0, $sp, 0x198
/* 009AA8 9FC09AA8 02003021 */  addu        $a2, $s0, $zero
/* 009AAC 9FC09AAC 8FA5028C */  lw          $a1, 0x28c($sp)
/* 009AB0 9FC09AB0 0FF02EC9 */  jal         poly_elliptic_mul
/* 009AB4 9FC09AB4 02C03821 */   addu       $a3, $s6, $zero
/* 009AB8 9FC09AB8 02202021 */  addu        $a0, $s1, $zero
/* 009ABC 9FC09ABC 02002821 */  addu        $a1, $s0, $zero
/* 009AC0 9FC09AC0 27A601D8 */  addiu       $a2, $sp, 0x1d8
/* 009AC4 9FC09AC4 0FF02C1B */  jal         poly_elliptic_sum
/* 009AC8 9FC09AC8 02C03821 */   addu       $a3, $s6, $zero
/* 009ACC 9FC09ACC 00001821 */  addu        $v1, $zero, $zero
/* 009AD0 9FC09AD0 3C050001 */  lui         $a1, 1
/* 009AD4 9FC09AD4 8FA80294 */  lw          $t0, 0x294($sp)
/* 009AD8 9FC09AD8 24020001 */  addiu       $v0, $zero, 1
/* 009ADC 9FC09ADC AD020000 */  sw          $v0, ($t0)
/* 009AE0 9FC09AE0 00031880 */  sll         $v1, $v1, 2
.L9FC09AE4:
/* 009AE4 9FC09AE4 27A401D8 */  addiu       $a0, $sp, 0x1d8
/* 009AE8 9FC09AE8 00831021 */  addu        $v0, $a0, $v1
/* 009AEC 9FC09AEC 8C420000 */  lw          $v0, ($v0)
/* 009AF0 9FC09AF0 14400005 */  bnez        $v0, .L9FC09B08
/* 009AF4 9FC09AF4 8FA80294 */   lw         $t0, 0x294($sp)
/* 009AF8 9FC09AF8 03A31021 */  addu        $v0, $sp, $v1
/* 009AFC 9FC09AFC 8C4201F8 */  lw          $v0, 0x1f8($v0)
/* 009B00 9FC09B00 10400003 */  beqz        $v0, .L9FC09B10
/* 009B04 9FC09B04 00A01821 */   addu       $v1, $a1, $zero
.L9FC09B08:
/* 009B08 9FC09B08 AD000000 */  sw          $zero, ($t0)
/* 009B0C 9FC09B0C 00A01821 */  addu        $v1, $a1, $zero
.L9FC09B10:
/* 009B10 9FC09B10 3C020001 */  lui         $v0, 1
/* 009B14 9FC09B14 00A22821 */  addu        $a1, $a1, $v0
/* 009B18 9FC09B18 00031C03 */  sra         $v1, $v1, 0x10
/* 009B1C 9FC09B1C 3062FFFF */  andi        $v0, $v1, 0xffff
/* 009B20 9FC09B20 2C420008 */  sltiu       $v0, $v0, 8
/* 009B24 9FC09B24 1440FFEF */  bnez        $v0, .L9FC09AE4
/* 009B28 9FC09B28 00031880 */   sll        $v1, $v1, 2
/* 009B2C 9FC09B2C 8FA80294 */  lw          $t0, 0x294($sp)
/* 009B30 9FC09B30 8D030000 */  lw          $v1, ($t0)
/* 009B34 9FC09B34 24020001 */  addiu       $v0, $zero, 1
/* 009B38 9FC09B38 14620003 */  bne         $v1, $v0, .L9FC09B48
/* 009B3C 9FC09B3C 27B00078 */   addiu      $s0, $sp, 0x78
/* 009B40 9FC09B40 0BF026F9 */  j           .L9FC09BE4
/* 009B44 9FC09B44 24020002 */   addiu      $v0, $zero, 2
.L9FC09B48:
/* 009B48 9FC09B48 02002821 */  addu        $a1, $s0, $zero
/* 009B4C 9FC09B4C 0FF01E48 */  jal         field_to_bigint
/* 009B50 9FC09B50 24060008 */   addiu      $a2, $zero, 8
/* 009B54 9FC09B54 02002021 */  addu        $a0, $s0, $zero
/* 009B58 9FC09B58 0FF01C0B */  jal         bigint_digits
/* 009B5C 9FC09B5C 24050008 */   addiu      $a1, $zero, 8
/* 009B60 9FC09B60 27A400B8 */  addiu       $a0, $sp, 0xb8
/* 009B64 9FC09B64 27B10118 */  addiu       $s1, $sp, 0x118
/* 009B68 9FC09B68 02202821 */  addu        $a1, $s1, $zero
/* 009B6C 9FC09B6C 02003021 */  addu        $a2, $s0, $zero
/* 009B70 9FC09B70 00403821 */  addu        $a3, $v0, $zero
/* 009B74 9FC09B74 27A20138 */  addiu       $v0, $sp, 0x138
/* 009B78 9FC09B78 AFA20010 */  sw          $v0, 0x10($sp)
/* 009B7C 9FC09B7C 0FF01C9B */  jal         bigint_div
/* 009B80 9FC09B80 AFBE0014 */   sw         $fp, 0x14($sp)
/* 009B84 9FC09B84 02002021 */  addu        $a0, $s0, $zero
/* 009B88 9FC09B88 27A50038 */  addiu       $a1, $sp, 0x38
/* 009B8C 9FC09B8C 02203021 */  addu        $a2, $s1, $zero
/* 009B90 9FC09B90 0FF01BF1 */  jal         bigint_sub
/* 009B94 9FC09B94 24070008 */   addiu      $a3, $zero, 8
/* 009B98 9FC09B98 00001821 */  addu        $v1, $zero, $zero
/* 009B9C 9FC09B9C 8FA80294 */  lw          $t0, 0x294($sp)
/* 009BA0 9FC09BA0 3C040001 */  lui         $a0, 1
/* 009BA4 9FC09BA4 AD000000 */  sw          $zero, ($t0)
/* 009BA8 9FC09BA8 00031080 */  sll         $v0, $v1, 2
.L9FC09BAC:
/* 009BAC 9FC09BAC 03A21021 */  addu        $v0, $sp, $v0
/* 009BB0 9FC09BB0 8C420078 */  lw          $v0, 0x78($v0)
/* 009BB4 9FC09BB4 10400003 */  beqz        $v0, .L9FC09BC4
/* 009BB8 9FC09BB8 8FA80294 */   lw         $t0, 0x294($sp)
/* 009BBC 9FC09BBC 24020001 */  addiu       $v0, $zero, 1
/* 009BC0 9FC09BC0 AD020000 */  sw          $v0, ($t0)
.L9FC09BC4:
/* 009BC4 9FC09BC4 00801021 */  addu        $v0, $a0, $zero
/* 009BC8 9FC09BC8 3C030001 */  lui         $v1, 1
/* 009BCC 9FC09BCC 00832021 */  addu        $a0, $a0, $v1
/* 009BD0 9FC09BD0 00021C03 */  sra         $v1, $v0, 0x10
/* 009BD4 9FC09BD4 28620008 */  slti        $v0, $v1, 8
/* 009BD8 9FC09BD8 1440FFF4 */  bnez        $v0, .L9FC09BAC
/* 009BDC 9FC09BDC 00031080 */   sll        $v0, $v1, 2
/* 009BE0 9FC09BE0 00001021 */  addu        $v0, $zero, $zero
.L9FC09BE4:
/* 009BE4 9FC09BE4 8FBF027C */  lw          $ra, 0x27c($sp)
/* 009BE8 9FC09BE8 8FBE0278 */  lw          $fp, 0x278($sp)
/* 009BEC 9FC09BEC 8FB70274 */  lw          $s7, 0x274($sp)
/* 009BF0 9FC09BF0 8FB60270 */  lw          $s6, 0x270($sp)
/* 009BF4 9FC09BF4 8FB5026C */  lw          $s5, 0x26c($sp)
/* 009BF8 9FC09BF8 8FB40268 */  lw          $s4, 0x268($sp)
/* 009BFC 9FC09BFC 8FB30264 */  lw          $s3, 0x264($sp)
/* 009C00 9FC09C00 8FB20260 */  lw          $s2, 0x260($sp)
/* 009C04 9FC09C04 8FB1025C */  lw          $s1, 0x25c($sp)
/* 009C08 9FC09C08 8FB00258 */  lw          $s0, 0x258($sp)
/* 009C0C 9FC09C0C 03E00008 */  jr          $ra
/* 009C10 9FC09C10 27BD0280 */   addiu      $sp, $sp, 0x280
