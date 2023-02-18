## func_9FC022A8
/* 0020C4 9FC020C4 27BDFF40 */  addiu       $sp, $sp, -0xc0
/* 0020C8 9FC020C8 AFB100A4 */  sw          $s1, 0xa4($sp)
/* 0020CC 9FC020CC 00808821 */  addu        $s1, $a0, $zero
/* 0020D0 9FC020D0 27A40098 */  addiu       $a0, $sp, 0x98
/* 0020D4 9FC020D4 AFBF00B8 */  sw          $ra, 0xb8($sp)
/* 0020D8 9FC020D8 AFB500B4 */  sw          $s5, 0xb4($sp)
/* 0020DC 9FC020DC AFB400B0 */  sw          $s4, 0xb0($sp)
/* 0020E0 9FC020E0 AFB300AC */  sw          $s3, 0xac($sp)
/* 0020E4 9FC020E4 AFB200A8 */  sw          $s2, 0xa8($sp)
/* 0020E8 9FC020E8 AFB000A0 */  sw          $s0, 0xa0($sp)
/* 0020EC 9FC020EC 0FF00755 */  jal         func_9FC01D54
/* 0020F0 9FC020F0 AFA00098 */   sw         $zero, 0x98($sp)
/* 0020F4 9FC020F4 00409021 */  addu        $s2, $v0, $zero
/* 0020F8 9FC020F8 06400062 */  bltz        $s2, .L9FC02284
/* 0020FC 9FC020FC 3C049FC4 */   lui        $a0, (0x9FC4009C >> 16)
/* 002100 9FC02100 3484009C */  ori         $a0, $a0, (0x9FC4009C & 0xFFFF)
/* 002104 9FC02104 3C059FC4 */  lui         $a1, (0x9FC40038 >> 16)
/* 002108 9FC02108 34A50038 */  ori         $a1, $a1, (0x9FC40038 & 0xFFFF)
/* 00210C 9FC0210C 24130200 */  addiu       $s3, $zero, 0x200
/* 002110 9FC02110 3C029FC4 */  lui         $v0, %hi(D_9FC4000C)
/* 002114 9FC02114 8C42000C */  lw          $v0, %lo(D_9FC4000C)($v0)
/* 002118 9FC02118 00008021 */  addu        $s0, $zero, $zero
/* 00211C 9FC0211C 24420200 */  addiu       $v0, $v0, 0x200
/* 002120 9FC02120 0FF00DFF */  jal         aes_cbc_set_key_iv
/* 002124 9FC02124 0002AA42 */   srl        $s5, $v0, 9
/* 002128 9FC02128 0FF019FF */  jal         SHA1Reset
/* 00212C 9FC0212C 27A40020 */   addiu      $a0, $sp, 0x20
/* 002130 9FC02130 00003021 */  addu        $a2, $zero, $zero
/* 002134 9FC02134 00002821 */  addu        $a1, $zero, $zero
.L9FC02138:
/* 002138 9FC02138 27A7009C */  addiu       $a3, $sp, 0x9c
/* 00213C 9FC0213C 8FA40098 */  lw          $a0, 0x98($sp)
/* 002140 9FC02140 27A20020 */  addiu       $v0, $sp, 0x20
/* 002144 9FC02144 AFA20014 */  sw          $v0, 0x14($sp)
/* 002148 9FC02148 2E020001 */  sltiu       $v0, $s0, 1
/* 00214C 9FC0214C AFB30010 */  sw          $s3, 0x10($sp)
/* 002150 9FC02150 AFA20018 */  sw          $v0, 0x18($sp)
/* 002154 9FC02154 00042140 */  sll         $a0, $a0, 5
/* 002158 9FC02158 0FF007EF */  jal         func_9FC01FBC
/* 00215C 9FC0215C 00902021 */   addu       $a0, $a0, $s0
/* 002160 9FC02160 00409021 */  addu        $s2, $v0, $zero
/* 002164 9FC02164 06400047 */  bltz        $s2, .L9FC02284
/* 002168 9FC02168 02401021 */   addu       $v0, $s2, $zero
/* 00216C 9FC0216C 16000007 */  bnez        $s0, .L9FC0218C
/* 002170 9FC02170 24060001 */   addiu      $a2, $zero, 1
/* 002174 9FC02174 8FA2009C */  lw          $v0, 0x9c($sp)
/* 002178 9FC02178 3C038000 */  lui         $v1, 0x8000
/* 00217C 9FC0217C 24420008 */  addiu       $v0, $v0, 8
/* 002180 9FC02180 00431025 */  or          $v0, $v0, $v1
/* 002184 9FC02184 8C420000 */  lw          $v0, ($v0)
/* 002188 9FC02188 AE220000 */  sw          $v0, ($s1)
.L9FC0218C:
/* 00218C 9FC0218C 26100001 */  addiu       $s0, $s0, 1
/* 002190 9FC02190 2E020008 */  sltiu       $v0, $s0, 8
/* 002194 9FC02194 1440FFE8 */  bnez        $v0, .L9FC02138
/* 002198 9FC02198 00002821 */   addu       $a1, $zero, $zero
/* 00219C 9FC0219C 3C029FC4 */  lui         $v0, %hi(D_9FC4000C)
/* 0021A0 9FC021A0 8C42000C */  lw          $v0, %lo(D_9FC4000C)($v0)
/* 0021A4 9FC021A4 0200A021 */  addu        $s4, $s0, $zero
/* 0021A8 9FC021A8 2451F000 */  addiu       $s1, $v0, -0x1000
/* 0021AC 9FC021AC 0295102B */  sltu        $v0, $s4, $s5
/* 0021B0 9FC021B0 10400027 */  beqz        $v0, .L9FC02250
/* 0021B4 9FC021B4 27A40020 */   addiu      $a0, $sp, 0x20
/* 0021B8 9FC021B8 8FA20098 */  lw          $v0, 0x98($sp)
.L9FC021BC:
/* 0021BC 9FC021BC 00021140 */  sll         $v0, $v0, 5
/* 0021C0 9FC021C0 00502021 */  addu        $a0, $v0, $s0
/* 0021C4 9FC021C4 2E220201 */  sltiu       $v0, $s1, 0x201
/* 0021C8 9FC021C8 14400004 */  bnez        $v0, .L9FC021DC
/* 0021CC 9FC021CC 02209821 */   addu       $s3, $s1, $zero
/* 0021D0 9FC021D0 24130200 */  addiu       $s3, $zero, 0x200
/* 0021D4 9FC021D4 0BF00878 */  j           .L9FC021E0
/* 0021D8 9FC021D8 2631FE00 */   addiu      $s1, $s1, -0x200
.L9FC021DC:
/* 0021DC 9FC021DC 00008821 */  addu        $s1, $zero, $zero
.L9FC021E0:
/* 0021E0 9FC021E0 00002821 */  addu        $a1, $zero, $zero
/* 0021E4 9FC021E4 24060001 */  addiu       $a2, $zero, 1
/* 0021E8 9FC021E8 27A7009C */  addiu       $a3, $sp, 0x9c
/* 0021EC 9FC021EC 27A20020 */  addiu       $v0, $sp, 0x20
/* 0021F0 9FC021F0 AFB30010 */  sw          $s3, 0x10($sp)
/* 0021F4 9FC021F4 AFA20014 */  sw          $v0, 0x14($sp)
/* 0021F8 9FC021F8 0FF007EF */  jal         func_9FC01FBC
/* 0021FC 9FC021FC AFA00018 */   sw         $zero, 0x18($sp)
/* 002200 9FC02200 00409021 */  addu        $s2, $v0, $zero
/* 002204 9FC02204 0640001E */  bltz        $s2, .L9FC02280
/* 002208 9FC02208 02001821 */   addu       $v1, $s0, $zero
/* 00220C 9FC0220C 2402001F */  addiu       $v0, $zero, 0x1f
/* 002210 9FC02210 14620007 */  bne         $v1, $v0, .L9FC02230
/* 002214 9FC02214 26100001 */   addiu      $s0, $s0, 1
/* 002218 9FC02218 3C02A461 */  lui         $v0, (0xA4610400 >> 16)
/* 00221C 9FC0221C 34420400 */  ori         $v0, $v0, (0xA4610400 & 0xFFFF)
/* 002220 9FC02220 8C440000 */  lw          $a0, ($v0)
/* 002224 9FC02224 0FF006D8 */  jal         func_9FC01B60
/* 002228 9FC02228 00008021 */   addu       $s0, $zero, $zero
/* 00222C 9FC0222C AFA20098 */  sw          $v0, 0x98($sp)
.L9FC02230:
/* 002230 9FC02230 8FA2009C */  lw          $v0, 0x9c($sp)
/* 002234 9FC02234 26940001 */  addiu       $s4, $s4, 1
/* 002238 9FC02238 24420200 */  addiu       $v0, $v0, 0x200
/* 00223C 9FC0223C AFA2009C */  sw          $v0, 0x9c($sp)
/* 002240 9FC02240 0295102B */  sltu        $v0, $s4, $s5
/* 002244 9FC02244 1440FFDD */  bnez        $v0, .L9FC021BC
/* 002248 9FC02248 8FA20098 */   lw         $v0, 0x98($sp)
/* 00224C 9FC0224C 27A40020 */  addiu       $a0, $sp, 0x20
.L9FC02250:
/* 002250 9FC02250 27B00080 */  addiu       $s0, $sp, 0x80
/* 002254 9FC02254 0FF01A54 */  jal         SHA1Result
/* 002258 9FC02258 02002821 */   addu       $a1, $s0, $zero
/* 00225C 9FC0225C 02002021 */  addu        $a0, $s0, $zero
/* 002260 9FC02260 3C059FC4 */  lui         $a1, (0x9FC40024 >> 16)
/* 002264 9FC02264 34A50024 */  ori         $a1, $a1, (0x9FC40024 & 0xFFFF)
/* 002268 9FC02268 0FF00EC7 */  jal         memcmp
/* 00226C 9FC0226C 24060014 */   addiu      $a2, $zero, 0x14
/* 002270 9FC02270 14400004 */  bnez        $v0, .L9FC02284
/* 002274 9FC02274 2402FFFF */   addiu      $v0, $zero, -1
/* 002278 9FC02278 0FF00C94 */  jal         set_proc_permissions
/* 00227C 9FC0227C 3C049FC4 */   lui        $a0, 0x9fc4
.L9FC02280:
/* 002280 9FC02280 02401021 */  addu        $v0, $s2, $zero
.L9FC02284:
/* 002284 9FC02284 8FBF00B8 */  lw          $ra, 0xb8($sp)
/* 002288 9FC02288 8FB500B4 */  lw          $s5, 0xb4($sp)
/* 00228C 9FC0228C 8FB400B0 */  lw          $s4, 0xb0($sp)
/* 002290 9FC02290 8FB300AC */  lw          $s3, 0xac($sp)
/* 002294 9FC02294 8FB200A8 */  lw          $s2, 0xa8($sp)
/* 002298 9FC02298 8FB100A4 */  lw          $s1, 0xa4($sp)
/* 00229C 9FC0229C 8FB000A0 */  lw          $s0, 0xa0($sp)
/* 0022A0 9FC022A0 03E00008 */  jr          $ra
/* 0022A4 9FC022A4 27BD00C0 */   addiu      $sp, $sp, 0xc0
