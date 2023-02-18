## generate_public_key
## poly_key_gen_primitive
## poly_DSA_verify
/* 00B8D0 9FC0B8D0 27BDFE78 */  addiu       $sp, $sp, -0x188
/* 00B8D4 9FC0B8D4 AFB00170 */  sw          $s0, 0x170($sp)
/* 00B8D8 9FC0B8D8 00808021 */  addu        $s0, $a0, $zero
/* 00B8DC 9FC0B8DC 27A50150 */  addiu       $a1, $sp, 0x150
/* 00B8E0 9FC0B8E0 AFB20178 */  sw          $s2, 0x178($sp)
/* 00B8E4 9FC0B8E4 00C09021 */  addu        $s2, $a2, $zero
/* 00B8E8 9FC0B8E8 AFB3017C */  sw          $s3, 0x17c($sp)
/* 00B8EC 9FC0B8EC 00E09821 */  addu        $s3, $a3, $zero
/* 00B8F0 9FC0B8F0 AFBF0180 */  sw          $ra, 0x180($sp)
/* 00B8F4 9FC0B8F4 0FF01F08 */  jal         copy
/* 00B8F8 9FC0B8F8 AFB10174 */   sw         $s1, 0x174($sp)
/* 00B8FC 9FC0B8FC 00001821 */  addu        $v1, $zero, $zero
/* 00B900 9FC0B900 00008821 */  addu        $s1, $zero, $zero
/* 00B904 9FC0B904 00111080 */  sll         $v0, $s1, 2
.L9FC0B908:
/* 00B908 9FC0B908 03A21021 */  addu        $v0, $sp, $v0
/* 00B90C 9FC0B90C 8C420150 */  lw          $v0, 0x150($v0)
/* 00B910 9FC0B910 26310001 */  addiu       $s1, $s1, 1
/* 00B914 9FC0B914 00621825 */  or          $v1, $v1, $v0
/* 00B918 9FC0B918 2E220008 */  sltiu       $v0, $s1, 8
/* 00B91C 9FC0B91C 1440FFFA */  bnez        $v0, .L9FC0B908
/* 00B920 9FC0B920 00111080 */   sll        $v0, $s1, 2
/* 00B924 9FC0B924 14600007 */  bnez        $v1, .L9FC0B944
/* 00B928 9FC0B928 3C088000 */   lui        $t0, 0x8000
/* 00B92C 9FC0B92C 0FF01EE0 */  jal         null
/* 00B930 9FC0B930 02402021 */   addu       $a0, $s2, $zero
/* 00B934 9FC0B934 0FF01EE0 */  jal         null
/* 00B938 9FC0B938 26440020 */   addiu      $a0, $s2, 0x20
/* 00B93C 9FC0B93C 0BF02EA2 */  j           .L9FC0BA88
/* 00B940 9FC0B940 8FBF0180 */   lw         $ra, 0x180($sp)
.L9FC0B944:
/* 00B944 9FC0B944 00008821 */  addu        $s1, $zero, $zero
.L9FC0B948:
/* 00B948 9FC0B948 00115080 */  sll         $t2, $s1, 2
/* 00B94C 9FC0B94C 27A90010 */  addiu       $t1, $sp, 0x10
/* 00B950 9FC0B950 012A1021 */  addu        $v0, $t1, $t2
/* 00B954 9FC0B954 AC400000 */  sw          $zero, ($v0)
/* 00B958 9FC0B958 24060003 */  addiu       $a2, $zero, 3
/* 00B95C 9FC0B95C 00002821 */  addu        $a1, $zero, $zero
/* 00B960 9FC0B960 02003821 */  addu        $a3, $s0, $zero
.L9FC0B964:
/* 00B964 9FC0B964 8CE30000 */  lw          $v1, ($a3)
/* 00B968 9FC0B968 24E70008 */  addiu       $a3, $a3, 8
/* 00B96C 9FC0B96C 24A50002 */  addiu       $a1, $a1, 2
/* 00B970 9FC0B970 012A2021 */  addu        $a0, $t1, $t2
/* 00B974 9FC0B974 2402001F */  addiu       $v0, $zero, 0x1f
/* 00B978 9FC0B978 00511023 */  subu        $v0, $v0, $s1
/* 00B97C 9FC0B97C 00681824 */  and         $v1, $v1, $t0
/* 00B980 9FC0B980 00431806 */  srlv        $v1, $v1, $v0
/* 00B984 9FC0B984 00C31804 */  sllv        $v1, $v1, $a2
/* 00B988 9FC0B988 8C820000 */  lw          $v0, ($a0)
/* 00B98C 9FC0B98C 00431025 */  or          $v0, $v0, $v1
/* 00B990 9FC0B990 AC820000 */  sw          $v0, ($a0)
/* 00B994 9FC0B994 28A20008 */  slti        $v0, $a1, 8
/* 00B998 9FC0B998 1440FFF2 */  bnez        $v0, .L9FC0B964
/* 00B99C 9FC0B99C 24C6FFFF */   addiu      $a2, $a2, -1
/* 00B9A0 9FC0B9A0 26310001 */  addiu       $s1, $s1, 1
/* 00B9A4 9FC0B9A4 2A220020 */  slti        $v0, $s1, 0x20
/* 00B9A8 9FC0B9A8 1440FFE7 */  bnez        $v0, .L9FC0B948
/* 00B9AC 9FC0B9AC 00084042 */   srl        $t0, $t0, 1
/* 00B9B0 9FC0B9B0 3C088000 */  lui         $t0, 0x8000
/* 00B9B4 9FC0B9B4 24110020 */  addiu       $s1, $zero, 0x20
.L9FC0B9B8:
/* 00B9B8 9FC0B9B8 00115080 */  sll         $t2, $s1, 2
/* 00B9BC 9FC0B9BC 27A90010 */  addiu       $t1, $sp, 0x10
/* 00B9C0 9FC0B9C0 012A1021 */  addu        $v0, $t1, $t2
/* 00B9C4 9FC0B9C4 AC400000 */  sw          $zero, ($v0)
/* 00B9C8 9FC0B9C8 24060003 */  addiu       $a2, $zero, 3
/* 00B9CC 9FC0B9CC 24050001 */  addiu       $a1, $zero, 1
/* 00B9D0 9FC0B9D0 26070004 */  addiu       $a3, $s0, 4
.L9FC0B9D4:
/* 00B9D4 9FC0B9D4 8CE30000 */  lw          $v1, ($a3)
/* 00B9D8 9FC0B9D8 24E70008 */  addiu       $a3, $a3, 8
/* 00B9DC 9FC0B9DC 24A50002 */  addiu       $a1, $a1, 2
/* 00B9E0 9FC0B9E0 012A2021 */  addu        $a0, $t1, $t2
/* 00B9E4 9FC0B9E4 2402003F */  addiu       $v0, $zero, 0x3f
/* 00B9E8 9FC0B9E8 00511023 */  subu        $v0, $v0, $s1
/* 00B9EC 9FC0B9EC 00681824 */  and         $v1, $v1, $t0
/* 00B9F0 9FC0B9F0 00431806 */  srlv        $v1, $v1, $v0
/* 00B9F4 9FC0B9F4 00C31804 */  sllv        $v1, $v1, $a2
/* 00B9F8 9FC0B9F8 8C820000 */  lw          $v0, ($a0)
/* 00B9FC 9FC0B9FC 00431025 */  or          $v0, $v0, $v1
/* 00BA00 9FC0BA00 AC820000 */  sw          $v0, ($a0)
/* 00BA04 9FC0BA04 28A20008 */  slti        $v0, $a1, 8
/* 00BA08 9FC0BA08 1440FFF2 */  bnez        $v0, .L9FC0B9D4
/* 00BA0C 9FC0BA0C 24C6FFFF */   addiu      $a2, $a2, -1
/* 00BA10 9FC0BA10 26310001 */  addiu       $s1, $s1, 1
/* 00BA14 9FC0BA14 2A220040 */  slti        $v0, $s1, 0x40
/* 00BA18 9FC0BA18 1440FFE7 */  bnez        $v0, .L9FC0B9B8
/* 00BA1C 9FC0BA1C 00084042 */   srl        $t0, $t0, 1
/* 00BA20 9FC0BA20 0FF01EE0 */  jal         null
/* 00BA24 9FC0BA24 02402021 */   addu       $a0, $s2, $zero
/* 00BA28 9FC0BA28 0FF01EE0 */  jal         null
/* 00BA2C 9FC0BA2C 26440020 */   addiu      $a0, $s2, 0x20
/* 00BA30 9FC0BA30 00008821 */  addu        $s1, $zero, $zero
/* 00BA34 9FC0BA34 02402021 */  addu        $a0, $s2, $zero
.L9FC0BA38:
/* 00BA38 9FC0BA38 27B00110 */  addiu       $s0, $sp, 0x110
/* 00BA3C 9FC0BA3C 02002821 */  addu        $a1, $s0, $zero
/* 00BA40 9FC0BA40 0FF02D00 */  jal         poly_elliptic_double
/* 00BA44 9FC0BA44 02603021 */   addu       $a2, $s3, $zero
/* 00BA48 9FC0BA48 02002021 */  addu        $a0, $s0, $zero
/* 00BA4C 9FC0BA4C 02403021 */  addu        $a2, $s2, $zero
/* 00BA50 9FC0BA50 00111080 */  sll         $v0, $s1, 2
/* 00BA54 9FC0BA54 03A21021 */  addu        $v0, $sp, $v0
/* 00BA58 9FC0BA58 8C420010 */  lw          $v0, 0x10($v0)
/* 00BA5C 9FC0BA5C 26310001 */  addiu       $s1, $s1, 1
/* 00BA60 9FC0BA60 3C059FC1 */  lui         $a1, %hi(precomputed_bp)
/* 00BA64 9FC0BA64 24A5F390 */  addiu       $a1, $a1, %lo(precomputed_bp)
/* 00BA68 9FC0BA68 02603821 */  addu        $a3, $s3, $zero
/* 00BA6C 9FC0BA6C 00021180 */  sll         $v0, $v0, 6
/* 00BA70 9FC0BA70 0FF02C1B */  jal         poly_elliptic_sum
/* 00BA74 9FC0BA74 00452821 */   addu       $a1, $v0, $a1
/* 00BA78 9FC0BA78 2A220040 */  slti        $v0, $s1, 0x40
/* 00BA7C 9FC0BA7C 1440FFEE */  bnez        $v0, .L9FC0BA38
/* 00BA80 9FC0BA80 02402021 */   addu       $a0, $s2, $zero
/* 00BA84 9FC0BA84 8FBF0180 */  lw          $ra, 0x180($sp)
.L9FC0BA88:
/* 00BA88 9FC0BA88 8FB3017C */  lw          $s3, 0x17c($sp)
/* 00BA8C 9FC0BA8C 8FB20178 */  lw          $s2, 0x178($sp)
/* 00BA90 9FC0BA90 8FB10174 */  lw          $s1, 0x174($sp)
/* 00BA94 9FC0BA94 8FB00170 */  lw          $s0, 0x170($sp)
/* 00BA98 9FC0BA98 03E00008 */  jr          $ra
/* 00BA9C 9FC0BA9C 27BD0188 */   addiu      $sp, $sp, 0x188
