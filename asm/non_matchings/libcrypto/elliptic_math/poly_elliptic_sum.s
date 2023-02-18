## poly_DSA_verify
## poly_elliptic_sub
## poly_elliptic_mul_slow
## poly_elliptic_mul_four
## poly_elliptic_mul
/* 00B06C 9FC0B06C 27BDFF30 */  addiu       $sp, $sp, -0xd0
/* 00B070 9FC0B070 AFB000B0 */  sw          $s0, 0xb0($sp)
/* 00B074 9FC0B074 00A08021 */  addu        $s0, $a1, $zero
/* 00B078 9FC0B078 AFB400C0 */  sw          $s4, 0xc0($sp)
/* 00B07C 9FC0B07C 00C0A021 */  addu        $s4, $a2, $zero
/* 00B080 9FC0B080 AFB500C4 */  sw          $s5, 0xc4($sp)
/* 00B084 9FC0B084 00E0A821 */  addu        $s5, $a3, $zero
/* 00B088 9FC0B088 00004021 */  addu        $t0, $zero, $zero
/* 00B08C 9FC0B08C 00003821 */  addu        $a3, $zero, $zero
/* 00B090 9FC0B090 3C060001 */  lui         $a2, 1
/* 00B094 9FC0B094 AFB300BC */  sw          $s3, 0xbc($sp)
/* 00B098 9FC0B098 00809821 */  addu        $s3, $a0, $zero
/* 00B09C 9FC0B09C 02602821 */  addu        $a1, $s3, $zero
/* 00B0A0 9FC0B0A0 AFBF00C8 */  sw          $ra, 0xc8($sp)
/* 00B0A4 9FC0B0A4 AFB200B8 */  sw          $s2, 0xb8($sp)
/* 00B0A8 9FC0B0A8 AFB100B4 */  sw          $s1, 0xb4($sp)
.L9FC0B0AC:
/* 00B0AC 9FC0B0AC 00C02021 */  addu        $a0, $a2, $zero
/* 00B0B0 9FC0B0B0 3C020001 */  lui         $v0, 1
/* 00B0B4 9FC0B0B4 00C23021 */  addu        $a2, $a2, $v0
/* 00B0B8 9FC0B0B8 8CA30000 */  lw          $v1, ($a1)
/* 00B0BC 9FC0B0BC 24A50004 */  addiu       $a1, $a1, 4
/* 00B0C0 9FC0B0C0 00071080 */  sll         $v0, $a3, 2
/* 00B0C4 9FC0B0C4 266B0020 */  addiu       $t3, $s3, 0x20
/* 00B0C8 9FC0B0C8 01621021 */  addu        $v0, $t3, $v0
/* 00B0CC 9FC0B0CC 8C420000 */  lw          $v0, ($v0)
/* 00B0D0 9FC0B0D0 00043C03 */  sra         $a3, $a0, 0x10
/* 00B0D4 9FC0B0D4 00621825 */  or          $v1, $v1, $v0
/* 00B0D8 9FC0B0D8 30E2FFFF */  andi        $v0, $a3, 0xffff
/* 00B0DC 9FC0B0DC 2C420008 */  sltiu       $v0, $v0, 8
/* 00B0E0 9FC0B0E0 1440FFF2 */  bnez        $v0, .L9FC0B0AC
/* 00B0E4 9FC0B0E4 01034025 */   or         $t0, $t0, $v1
/* 00B0E8 9FC0B0E8 15000003 */  bnez        $t0, .L9FC0B0F8
/* 00B0EC 9FC0B0EC 00004021 */   addu       $t0, $zero, $zero
/* 00B0F0 9FC0B0F0 0BF02C53 */  j           .L9FC0B14C
/* 00B0F4 9FC0B0F4 02002021 */   addu       $a0, $s0, $zero
.L9FC0B0F8:
/* 00B0F8 9FC0B0F8 00003821 */  addu        $a3, $zero, $zero
/* 00B0FC 9FC0B0FC 3C060001 */  lui         $a2, 1
/* 00B100 9FC0B100 02002821 */  addu        $a1, $s0, $zero
.L9FC0B104:
/* 00B104 9FC0B104 00C02021 */  addu        $a0, $a2, $zero
/* 00B108 9FC0B108 3C020001 */  lui         $v0, 1
/* 00B10C 9FC0B10C 00C23021 */  addu        $a2, $a2, $v0
/* 00B110 9FC0B110 8CA30000 */  lw          $v1, ($a1)
/* 00B114 9FC0B114 24A50004 */  addiu       $a1, $a1, 4
/* 00B118 9FC0B118 00071080 */  sll         $v0, $a3, 2
/* 00B11C 9FC0B11C 260A0020 */  addiu       $t2, $s0, 0x20
/* 00B120 9FC0B120 01421021 */  addu        $v0, $t2, $v0
/* 00B124 9FC0B124 8C420000 */  lw          $v0, ($v0)
/* 00B128 9FC0B128 00043C03 */  sra         $a3, $a0, 0x10
/* 00B12C 9FC0B12C 00621825 */  or          $v1, $v1, $v0
/* 00B130 9FC0B130 30E2FFFF */  andi        $v0, $a3, 0xffff
/* 00B134 9FC0B134 2C420008 */  sltiu       $v0, $v0, 8
/* 00B138 9FC0B138 1440FFF2 */  bnez        $v0, .L9FC0B104
/* 00B13C 9FC0B13C 01034025 */   or         $t0, $t0, $v1
/* 00B140 9FC0B140 15000006 */  bnez        $t0, .L9FC0B15C
/* 00B144 9FC0B144 00004021 */   addu       $t0, $zero, $zero
/* 00B148 9FC0B148 02602021 */  addu        $a0, $s3, $zero
.L9FC0B14C:
/* 00B14C 9FC0B14C 0FF02C0C */  jal         copy_point
/* 00B150 9FC0B150 02802821 */   addu       $a1, $s4, $zero
/* 00B154 9FC0B154 0BF02CF8 */  j           .L9FC0B3E0
/* 00B158 9FC0B158 8FBF00C8 */   lw         $ra, 0xc8($sp)
.L9FC0B15C:
/* 00B15C 9FC0B15C 00003821 */  addu        $a3, $zero, $zero
/* 00B160 9FC0B160 3C090001 */  lui         $t1, 1
/* 00B164 9FC0B164 02003021 */  addu        $a2, $s0, $zero
/* 00B168 9FC0B168 02602821 */  addu        $a1, $s3, $zero
.L9FC0B16C:
/* 00B16C 9FC0B16C 8CA30000 */  lw          $v1, ($a1)
/* 00B170 9FC0B170 8CC20000 */  lw          $v0, ($a2)
/* 00B174 9FC0B174 14620007 */  bne         $v1, $v0, .L9FC0B194
/* 00B178 9FC0B178 00072080 */   sll        $a0, $a3, 2
/* 00B17C 9FC0B17C 01641021 */  addu        $v0, $t3, $a0
/* 00B180 9FC0B180 01441821 */  addu        $v1, $t2, $a0
/* 00B184 9FC0B184 8C440000 */  lw          $a0, ($v0)
/* 00B188 9FC0B188 8C620000 */  lw          $v0, ($v1)
/* 00B18C 9FC0B18C 10820003 */  beq         $a0, $v0, .L9FC0B19C
/* 00B190 9FC0B190 01201821 */   addu       $v1, $t1, $zero
.L9FC0B194:
/* 00B194 9FC0B194 24080001 */  addiu       $t0, $zero, 1
/* 00B198 9FC0B198 01201821 */  addu        $v1, $t1, $zero
.L9FC0B19C:
/* 00B19C 9FC0B19C 3C020001 */  lui         $v0, 1
/* 00B1A0 9FC0B1A0 01224821 */  addu        $t1, $t1, $v0
/* 00B1A4 9FC0B1A4 24C60004 */  addiu       $a2, $a2, 4
/* 00B1A8 9FC0B1A8 00033C03 */  sra         $a3, $v1, 0x10
/* 00B1AC 9FC0B1AC 30E2FFFF */  andi        $v0, $a3, 0xffff
/* 00B1B0 9FC0B1B0 2C420008 */  sltiu       $v0, $v0, 8
/* 00B1B4 9FC0B1B4 1440FFED */  bnez        $v0, .L9FC0B16C
/* 00B1B8 9FC0B1B8 24A50004 */   addiu      $a1, $a1, 4
/* 00B1BC 9FC0B1BC 24020001 */  addiu       $v0, $zero, 1
/* 00B1C0 9FC0B1C0 11020006 */  beq         $t0, $v0, .L9FC0B1DC
/* 00B1C4 9FC0B1C4 02602021 */   addu       $a0, $s3, $zero
/* 00B1C8 9FC0B1C8 02802821 */  addu        $a1, $s4, $zero
/* 00B1CC 9FC0B1CC 0FF02D00 */  jal         poly_elliptic_double
/* 00B1D0 9FC0B1D0 02A03021 */   addu       $a2, $s5, $zero
/* 00B1D4 9FC0B1D4 0BF02CF8 */  j           .L9FC0B3E0
/* 00B1D8 9FC0B1D8 8FBF00C8 */   lw         $ra, 0xc8($sp)
.L9FC0B1DC:
/* 00B1DC 9FC0B1DC 0FF01EE0 */  jal         null
/* 00B1E0 9FC0B1E0 27A40010 */   addiu      $a0, $sp, 0x10
/* 00B1E4 9FC0B1E4 0FF01EE0 */  jal         null
/* 00B1E8 9FC0B1E8 27A40030 */   addiu      $a0, $sp, 0x30
/* 00B1EC 9FC0B1EC 00004021 */  addu        $t0, $zero, $zero
/* 00B1F0 9FC0B1F0 00003821 */  addu        $a3, $zero, $zero
/* 00B1F4 9FC0B1F4 3C0C0001 */  lui         $t4, 1
/* 00B1F8 9FC0B1F8 02005021 */  addu        $t2, $s0, $zero
/* 00B1FC 9FC0B1FC 02604821 */  addu        $t1, $s3, $zero
.L9FC0B200:
/* 00B200 9FC0B200 01803021 */  addu        $a2, $t4, $zero
/* 00B204 9FC0B204 3C020001 */  lui         $v0, 1
/* 00B208 9FC0B208 01826021 */  addu        $t4, $t4, $v0
/* 00B20C 9FC0B20C 8D430000 */  lw          $v1, ($t2)
/* 00B210 9FC0B210 254A0004 */  addiu       $t2, $t2, 4
/* 00B214 9FC0B214 8D220000 */  lw          $v0, ($t1)
/* 00B218 9FC0B218 00072080 */  sll         $a0, $a3, 2
/* 00B21C 9FC0B21C 27AB0010 */  addiu       $t3, $sp, 0x10
/* 00B220 9FC0B220 01642821 */  addu        $a1, $t3, $a0
/* 00B224 9FC0B224 27B10030 */  addiu       $s1, $sp, 0x30
/* 00B228 9FC0B228 26720020 */  addiu       $s2, $s3, 0x20
/* 00B22C 9FC0B22C 00431026 */  xor         $v0, $v0, $v1
/* 00B230 9FC0B230 ACA20000 */  sw          $v0, ($a1)
/* 00B234 9FC0B234 02441021 */  addu        $v0, $s2, $a0
/* 00B238 9FC0B238 02041821 */  addu        $v1, $s0, $a0
/* 00B23C 9FC0B23C 8C420000 */  lw          $v0, ($v0)
/* 00B240 9FC0B240 8C630020 */  lw          $v1, 0x20($v1)
/* 00B244 9FC0B244 02242021 */  addu        $a0, $s1, $a0
/* 00B248 9FC0B248 00431026 */  xor         $v0, $v0, $v1
/* 00B24C 9FC0B24C AC820000 */  sw          $v0, ($a0)
/* 00B250 9FC0B250 8CA20000 */  lw          $v0, ($a1)
/* 00B254 9FC0B254 00063C03 */  sra         $a3, $a2, 0x10
/* 00B258 9FC0B258 01024025 */  or          $t0, $t0, $v0
/* 00B25C 9FC0B25C 30E2FFFF */  andi        $v0, $a3, 0xffff
/* 00B260 9FC0B260 2C420008 */  sltiu       $v0, $v0, 8
/* 00B264 9FC0B264 1440FFE6 */  bnez        $v0, .L9FC0B200
/* 00B268 9FC0B268 25290004 */   addiu      $t1, $t1, 4
/* 00B26C 9FC0B26C 15000007 */  bnez        $t0, .L9FC0B28C
/* 00B270 9FC0B270 01602021 */   addu       $a0, $t3, $zero
/* 00B274 9FC0B274 0FF01EE0 */  jal         null
/* 00B278 9FC0B278 02802021 */   addu       $a0, $s4, $zero
/* 00B27C 9FC0B27C 0FF01EE0 */  jal         null
/* 00B280 9FC0B280 26840020 */   addiu      $a0, $s4, 0x20
/* 00B284 9FC0B284 0BF02CF8 */  j           .L9FC0B3E0
/* 00B288 9FC0B288 8FBF00C8 */   lw         $ra, 0xc8($sp)
.L9FC0B28C:
/* 00B28C 9FC0B28C 27B00070 */  addiu       $s0, $sp, 0x70
/* 00B290 9FC0B290 0FF021C8 */  jal         poly_inv
/* 00B294 9FC0B294 02002821 */   addu       $a1, $s0, $zero
/* 00B298 9FC0B298 02002021 */  addu        $a0, $s0, $zero
/* 00B29C 9FC0B29C 02202821 */  addu        $a1, $s1, $zero
/* 00B2A0 9FC0B2A0 27B00050 */  addiu       $s0, $sp, 0x50
/* 00B2A4 9FC0B2A4 0FF020F9 */  jal         poly_mul
/* 00B2A8 9FC0B2A8 02003021 */   addu       $a2, $s0, $zero
/* 00B2AC 9FC0B2AC 02002021 */  addu        $a0, $s0, $zero
/* 00B2B0 9FC0B2B0 00802821 */  addu        $a1, $a0, $zero
/* 00B2B4 9FC0B2B4 0FF020F9 */  jal         poly_mul
/* 00B2B8 9FC0B2B8 27A60090 */   addiu      $a2, $sp, 0x90
/* 00B2BC 9FC0B2BC 86A20000 */  lh          $v0, ($s5)
/* 00B2C0 9FC0B2C0 10400046 */  beqz        $v0, .L9FC0B3DC
/* 00B2C4 9FC0B2C4 3C090001 */   lui        $t1, 1
/* 00B2C8 9FC0B2C8 00003821 */  addu        $a3, $zero, $zero
/* 00B2CC 9FC0B2CC 02804021 */  addu        $t0, $s4, $zero
.L9FC0B2D0:
/* 00B2D0 9FC0B2D0 01202821 */  addu        $a1, $t1, $zero
/* 00B2D4 9FC0B2D4 3C020001 */  lui         $v0, 1
/* 00B2D8 9FC0B2D8 01224821 */  addu        $t1, $t1, $v0
/* 00B2DC 9FC0B2DC 00072080 */  sll         $a0, $a3, 2
/* 00B2E0 9FC0B2E0 27AC0050 */  addiu       $t4, $sp, 0x50
/* 00B2E4 9FC0B2E4 01841021 */  addu        $v0, $t4, $a0
/* 00B2E8 9FC0B2E8 27A60090 */  addiu       $a2, $sp, 0x90
/* 00B2EC 9FC0B2EC 00C41821 */  addu        $v1, $a2, $a0
/* 00B2F0 9FC0B2F0 00053C03 */  sra         $a3, $a1, 0x10
/* 00B2F4 9FC0B2F4 8C420000 */  lw          $v0, ($v0)
/* 00B2F8 9FC0B2F8 8C630000 */  lw          $v1, ($v1)
/* 00B2FC 9FC0B2FC 27AB0010 */  addiu       $t3, $sp, 0x10
/* 00B300 9FC0B300 00431026 */  xor         $v0, $v0, $v1
/* 00B304 9FC0B304 01641821 */  addu        $v1, $t3, $a0
/* 00B308 9FC0B308 02A42021 */  addu        $a0, $s5, $a0
/* 00B30C 9FC0B30C 8C630000 */  lw          $v1, ($v1)
/* 00B310 9FC0B310 8C840004 */  lw          $a0, 4($a0)
/* 00B314 9FC0B314 00431026 */  xor         $v0, $v0, $v1
/* 00B318 9FC0B318 00441026 */  xor         $v0, $v0, $a0
/* 00B31C 9FC0B31C AD020000 */  sw          $v0, ($t0)
/* 00B320 9FC0B320 30E2FFFF */  andi        $v0, $a3, 0xffff
/* 00B324 9FC0B324 2C420008 */  sltiu       $v0, $v0, 8
/* 00B328 9FC0B328 1440FFE9 */  bnez        $v0, .L9FC0B2D0
/* 00B32C 9FC0B32C 25080004 */   addiu      $t0, $t0, 4
/* 00B330 9FC0B330 00003821 */  addu        $a3, $zero, $zero
/* 00B334 9FC0B334 3C0A0001 */  lui         $t2, 1
/* 00B338 9FC0B338 02804821 */  addu        $t1, $s4, $zero
/* 00B33C 9FC0B33C 02604021 */  addu        $t0, $s3, $zero
.L9FC0B340:
/* 00B340 9FC0B340 01402821 */  addu        $a1, $t2, $zero
/* 00B344 9FC0B344 3C020001 */  lui         $v0, 1
/* 00B348 9FC0B348 01425021 */  addu        $t2, $t2, $v0
/* 00B34C 9FC0B34C 8D240000 */  lw          $a0, ($t1)
/* 00B350 9FC0B350 25290004 */  addiu       $t1, $t1, 4
/* 00B354 9FC0B354 8D030000 */  lw          $v1, ($t0)
/* 00B358 9FC0B358 00071080 */  sll         $v0, $a3, 2
/* 00B35C 9FC0B35C 00053C03 */  sra         $a3, $a1, 0x10
/* 00B360 9FC0B360 01621021 */  addu        $v0, $t3, $v0
/* 00B364 9FC0B364 00641826 */  xor         $v1, $v1, $a0
/* 00B368 9FC0B368 AC430000 */  sw          $v1, ($v0)
/* 00B36C 9FC0B36C 30E2FFFF */  andi        $v0, $a3, 0xffff
/* 00B370 9FC0B370 2C420008 */  sltiu       $v0, $v0, 8
/* 00B374 9FC0B374 1440FFF2 */  bnez        $v0, .L9FC0B340
/* 00B378 9FC0B378 25080004 */   addiu      $t0, $t0, 4
/* 00B37C 9FC0B37C 27A40010 */  addiu       $a0, $sp, 0x10
/* 00B380 9FC0B380 0FF020F9 */  jal         poly_mul
/* 00B384 9FC0B384 01802821 */   addu       $a1, $t4, $zero
/* 00B388 9FC0B388 00003821 */  addu        $a3, $zero, $zero
/* 00B38C 9FC0B38C 3C080001 */  lui         $t0, 1
/* 00B390 9FC0B390 02803021 */  addu        $a2, $s4, $zero
.L9FC0B394:
/* 00B394 9FC0B394 01002021 */  addu        $a0, $t0, $zero
/* 00B398 9FC0B398 3C020001 */  lui         $v0, 1
/* 00B39C 9FC0B39C 01024021 */  addu        $t0, $t0, $v0
/* 00B3A0 9FC0B3A0 8CC50000 */  lw          $a1, ($a2)
/* 00B3A4 9FC0B3A4 00071880 */  sll         $v1, $a3, 2
/* 00B3A8 9FC0B3A8 00043C03 */  sra         $a3, $a0, 0x10
/* 00B3AC 9FC0B3AC 02832021 */  addu        $a0, $s4, $v1
/* 00B3B0 9FC0B3B0 03A31021 */  addu        $v0, $sp, $v1
/* 00B3B4 9FC0B3B4 02431821 */  addu        $v1, $s2, $v1
/* 00B3B8 9FC0B3B8 8C420090 */  lw          $v0, 0x90($v0)
/* 00B3BC 9FC0B3BC 8C630000 */  lw          $v1, ($v1)
/* 00B3C0 9FC0B3C0 00451026 */  xor         $v0, $v0, $a1
/* 00B3C4 9FC0B3C4 00431026 */  xor         $v0, $v0, $v1
/* 00B3C8 9FC0B3C8 AC820020 */  sw          $v0, 0x20($a0)
/* 00B3CC 9FC0B3CC 30E2FFFF */  andi        $v0, $a3, 0xffff
/* 00B3D0 9FC0B3D0 2C420008 */  sltiu       $v0, $v0, 8
/* 00B3D4 9FC0B3D4 1440FFEF */  bnez        $v0, .L9FC0B394
/* 00B3D8 9FC0B3D8 24C60004 */   addiu      $a2, $a2, 4
.L9FC0B3DC:
/* 00B3DC 9FC0B3DC 8FBF00C8 */  lw          $ra, 0xc8($sp)
.L9FC0B3E0:
/* 00B3E0 9FC0B3E0 8FB500C4 */  lw          $s5, 0xc4($sp)
/* 00B3E4 9FC0B3E4 8FB400C0 */  lw          $s4, 0xc0($sp)
/* 00B3E8 9FC0B3E8 8FB300BC */  lw          $s3, 0xbc($sp)
/* 00B3EC 9FC0B3EC 8FB200B8 */  lw          $s2, 0xb8($sp)
/* 00B3F0 9FC0B3F0 8FB100B4 */  lw          $s1, 0xb4($sp)
/* 00B3F4 9FC0B3F4 8FB000B0 */  lw          $s0, 0xb0($sp)
/* 00B3F8 9FC0B3F8 03E00008 */  jr          $ra
/* 00B3FC 9FC0B3FC 27BD00D0 */   addiu      $sp, $sp, 0xd0
