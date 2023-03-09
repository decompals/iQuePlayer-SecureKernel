## shift_and_add
## poly_mul
## cus_times_u_to_n
glabel divide_shift_n
/* 0081E4 9FC081E4 00A04821 */  addu        $t1, $a1, $zero
/* 0081E8 9FC081E8 000912C0 */  sll         $v0, $t1, 0xb
/* 0081EC 9FC081EC 3129001F */  andi        $t1, $t1, 0x1f
/* 0081F0 9FC081F0 00024403 */  sra         $t0, $v0, 0x10
/* 0081F4 9FC081F4 2402000E */  addiu       $v0, $zero, 0xe
/* 0081F8 9FC081F8 00481023 */  subu        $v0, $v0, $t0
/* 0081FC 9FC081FC 00021400 */  sll         $v0, $v0, 0x10
/* 008200 9FC08200 00022C03 */  sra         $a1, $v0, 0x10
/* 008204 9FC08204 04A00011 */  bltz        $a1, .L9FC0824C
/* 008208 9FC08208 00805021 */   addu       $t2, $a0, $zero
/* 00820C 9FC0820C 00051400 */  sll         $v0, $a1, 0x10
/* 008210 9FC08210 3C03FFFF */  lui         $v1, 0xffff
/* 008214 9FC08214 00433821 */  addu        $a3, $v0, $v1
/* 008218 9FC08218 00051080 */  sll         $v0, $a1, 2
/* 00821C 9FC0821C 004A3021 */  addu        $a2, $v0, $t2
.L9FC08220:
/* 008220 9FC08220 00E01821 */  addu        $v1, $a3, $zero
/* 008224 9FC08224 3C02FFFF */  lui         $v0, 0xffff
/* 008228 9FC08228 00E23821 */  addu        $a3, $a3, $v0
/* 00822C 9FC0822C 8CC40000 */  lw          $a0, ($a2)
/* 008230 9FC08230 24C6FFFC */  addiu       $a2, $a2, -4
/* 008234 9FC08234 00A81021 */  addu        $v0, $a1, $t0
/* 008238 9FC08238 00032C03 */  sra         $a1, $v1, 0x10
/* 00823C 9FC0823C 00021080 */  sll         $v0, $v0, 2
/* 008240 9FC08240 01421021 */  addu        $v0, $t2, $v0
/* 008244 9FC08244 04A1FFF6 */  bgez        $a1, .L9FC08220
/* 008248 9FC08248 AC440000 */   sw         $a0, ($v0)
.L9FC0824C:
/* 00824C 9FC0824C 1900000A */  blez        $t0, .L9FC08278
/* 008250 9FC08250 01402021 */   addu       $a0, $t2, $zero
/* 008254 9FC08254 3C060001 */  lui         $a2, 1
.L9FC08258:
/* 008258 9FC08258 AC800000 */  sw          $zero, ($a0)
/* 00825C 9FC0825C 00C01021 */  addu        $v0, $a2, $zero
/* 008260 9FC08260 3C030001 */  lui         $v1, 1
/* 008264 9FC08264 00C33021 */  addu        $a2, $a2, $v1
/* 008268 9FC08268 00022C03 */  sra         $a1, $v0, 0x10
/* 00826C 9FC0826C 00A8102A */  slt         $v0, $a1, $t0
/* 008270 9FC08270 1440FFF9 */  bnez        $v0, .L9FC08258
/* 008274 9FC08274 24840004 */   addiu      $a0, $a0, 4
.L9FC08278:
/* 008278 9FC08278 01403021 */  addu        $a2, $t2, $zero
/* 00827C 9FC0827C 00004021 */  addu        $t0, $zero, $zero
/* 008280 9FC08280 3C070001 */  lui         $a3, 1
.L9FC08284:
/* 008284 9FC08284 00E02821 */  addu        $a1, $a3, $zero
/* 008288 9FC08288 3C020001 */  lui         $v0, 1
/* 00828C 9FC0828C 00E23821 */  addu        $a3, $a3, $v0
/* 008290 9FC08290 00091080 */  sll         $v0, $t1, 2
/* 008294 9FC08294 00052C02 */  srl         $a1, $a1, 0x10
/* 008298 9FC08298 2CA5000F */  sltiu       $a1, $a1, 0xf
/* 00829C 9FC0829C 8CC30000 */  lw          $v1, ($a2)
/* 0082A0 9FC082A0 3C019FC1 */  lui         $at, %hi(rightmask)
/* 0082A4 9FC082A4 00220821 */  addu        $at, $at, $v0
/* 0082A8 9FC082A8 8C22E9B0 */  lw          $v0, %lo(rightmask)($at)
/* 0082AC 9FC082AC 01232006 */  srlv        $a0, $v1, $t1
/* 0082B0 9FC082B0 00882025 */  or          $a0, $a0, $t0
/* 0082B4 9FC082B4 00621824 */  and         $v1, $v1, $v0
/* 0082B8 9FC082B8 24020020 */  addiu       $v0, $zero, 0x20
/* 0082BC 9FC082BC 00491023 */  subu        $v0, $v0, $t1
/* 0082C0 9FC082C0 00434004 */  sllv        $t0, $v1, $v0
/* 0082C4 9FC082C4 ACC40000 */  sw          $a0, ($a2)
/* 0082C8 9FC082C8 14A0FFEE */  bnez        $a1, .L9FC08284
/* 0082CC 9FC082CC 24C60004 */   addiu      $a2, $a2, 4
/* 0082D0 9FC082D0 03E00008 */  jr          $ra
/* 0082D4 9FC082D4 00000000 */   nop
