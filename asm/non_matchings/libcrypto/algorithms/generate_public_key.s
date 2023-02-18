## eccGenPublicKey
/* 009088 9FC09088 27BDFEE0 */  addiu       $sp, $sp, -0x120
/* 00908C 9FC0908C 00801021 */  addu        $v0, $a0, $zero
/* 009090 9FC09090 00C02021 */  addu        $a0, $a2, $zero
/* 009094 9FC09094 AFB20118 */  sw          $s2, 0x118($sp)
/* 009098 9FC09098 00A09021 */  addu        $s2, $a1, $zero
/* 00909C 9FC0909C 00402821 */  addu        $a1, $v0, $zero
/* 0090A0 9FC090A0 AFB00110 */  sw          $s0, 0x110($sp)
/* 0090A4 9FC090A4 00E08021 */  addu        $s0, $a3, $zero
/* 0090A8 9FC090A8 02003021 */  addu        $a2, $s0, $zero
/* 0090AC 9FC090AC 02403821 */  addu        $a3, $s2, $zero
/* 0090B0 9FC090B0 AFBF011C */  sw          $ra, 0x11c($sp)
/* 0090B4 9FC090B4 0FF02E34 */  jal         poly_elliptic_mul_four
/* 0090B8 9FC090B8 AFB10114 */   sw         $s1, 0x114($sp)
/* 0090BC 9FC090BC 00002021 */  addu        $a0, $zero, $zero
/* 0090C0 9FC090C0 00004021 */  addu        $t0, $zero, $zero
/* 0090C4 9FC090C4 02001821 */  addu        $v1, $s0, $zero
.L9FC090C8:
/* 0090C8 9FC090C8 8C620000 */  lw          $v0, ($v1)
/* 0090CC 9FC090CC 25080001 */  addiu       $t0, $t0, 1
/* 0090D0 9FC090D0 00822025 */  or          $a0, $a0, $v0
/* 0090D4 9FC090D4 2D020008 */  sltiu       $v0, $t0, 8
/* 0090D8 9FC090D8 1440FFFB */  bnez        $v0, .L9FC090C8
/* 0090DC 9FC090DC 24630004 */   addiu      $v1, $v1, 4
/* 0090E0 9FC090E0 00004021 */  addu        $t0, $zero, $zero
/* 0090E4 9FC090E4 00081080 */  sll         $v0, $t0, 2
/* 0090E8 9FC090E8 26070020 */  addiu       $a3, $s0, 0x20
.L9FC090EC:
/* 0090EC 9FC090EC 00E21021 */  addu        $v0, $a3, $v0
/* 0090F0 9FC090F0 8C420000 */  lw          $v0, ($v0)
/* 0090F4 9FC090F4 25080001 */  addiu       $t0, $t0, 1
/* 0090F8 9FC090F8 00822025 */  or          $a0, $a0, $v0
/* 0090FC 9FC090FC 2D020008 */  sltiu       $v0, $t0, 8
/* 009100 9FC09100 1440FFFA */  bnez        $v0, .L9FC090EC
/* 009104 9FC09104 00081080 */   sll        $v0, $t0, 2
/* 009108 9FC09108 1080004F */  beqz        $a0, .L9FC09248
/* 00910C 9FC0910C 00004021 */   addu       $t0, $zero, $zero
/* 009110 9FC09110 02003021 */  addu        $a2, $s0, $zero
.L9FC09114:
/* 009114 9FC09114 8CC40000 */  lw          $a0, ($a2)
/* 009118 9FC09118 00081880 */  sll         $v1, $t0, 2
/* 00911C 9FC0911C 25080001 */  addiu       $t0, $t0, 1
/* 009120 9FC09120 27A500D0 */  addiu       $a1, $sp, 0xd0
/* 009124 9FC09124 00A31021 */  addu        $v0, $a1, $v1
/* 009128 9FC09128 27B000F0 */  addiu       $s0, $sp, 0xf0
/* 00912C 9FC0912C AC440000 */  sw          $a0, ($v0)
/* 009130 9FC09130 00E31021 */  addu        $v0, $a3, $v1
/* 009134 9FC09134 8C420000 */  lw          $v0, ($v0)
/* 009138 9FC09138 02031821 */  addu        $v1, $s0, $v1
/* 00913C 9FC0913C AC620000 */  sw          $v0, ($v1)
/* 009140 9FC09140 2D020008 */  sltiu       $v0, $t0, 8
/* 009144 9FC09144 1440FFF3 */  bnez        $v0, .L9FC09114
/* 009148 9FC09148 24C60004 */   addiu      $a2, $a2, 4
/* 00914C 9FC0914C 00A02021 */  addu        $a0, $a1, $zero
/* 009150 9FC09150 02002821 */  addu        $a1, $s0, $zero
/* 009154 9FC09154 0FF020F9 */  jal         poly_mul
/* 009158 9FC09158 27A60050 */   addiu      $a2, $sp, 0x50
/* 00915C 9FC0915C 02002021 */  addu        $a0, $s0, $zero
/* 009160 9FC09160 00802821 */  addu        $a1, $a0, $zero
/* 009164 9FC09164 0FF020F9 */  jal         poly_mul
/* 009168 9FC09168 27A60030 */   addiu      $a2, $sp, 0x30
/* 00916C 9FC0916C 00004021 */  addu        $t0, $zero, $zero
/* 009170 9FC09170 00081880 */  sll         $v1, $t0, 2
.L9FC09174:
/* 009174 9FC09174 25080001 */  addiu       $t0, $t0, 1
/* 009178 9FC09178 03A31021 */  addu        $v0, $sp, $v1
/* 00917C 9FC0917C 00402021 */  addu        $a0, $v0, $zero
/* 009180 9FC09180 8C420050 */  lw          $v0, 0x50($v0)
/* 009184 9FC09184 8C840030 */  lw          $a0, 0x30($a0)
/* 009188 9FC09188 03A31821 */  addu        $v1, $sp, $v1
/* 00918C 9FC0918C 00441026 */  xor         $v0, $v0, $a0
/* 009190 9FC09190 AC620010 */  sw          $v0, 0x10($v1)
/* 009194 9FC09194 2D020008 */  sltiu       $v0, $t0, 8
/* 009198 9FC09198 1440FFF6 */  bnez        $v0, .L9FC09174
/* 00919C 9FC0919C 00081880 */   sll        $v1, $t0, 2
/* 0091A0 9FC091A0 27B000D0 */  addiu       $s0, $sp, 0xd0
/* 0091A4 9FC091A4 02002021 */  addu        $a0, $s0, $zero
/* 0091A8 9FC091A8 02002821 */  addu        $a1, $s0, $zero
/* 0091AC 9FC091AC 27B10070 */  addiu       $s1, $sp, 0x70
/* 0091B0 9FC091B0 0FF020F9 */  jal         poly_mul
/* 0091B4 9FC091B4 02203021 */   addu       $a2, $s1, $zero
/* 0091B8 9FC091B8 02202021 */  addu        $a0, $s1, $zero
/* 0091BC 9FC091BC 02002821 */  addu        $a1, $s0, $zero
/* 0091C0 9FC091C0 0FF020F9 */  jal         poly_mul
/* 0091C4 9FC091C4 27A60090 */   addiu      $a2, $sp, 0x90
/* 0091C8 9FC091C8 00004021 */  addu        $t0, $zero, $zero
.L9FC091CC:
/* 0091CC 9FC091CC 00082880 */  sll         $a1, $t0, 2
/* 0091D0 9FC091D0 27A600B0 */  addiu       $a2, $sp, 0xb0
/* 0091D4 9FC091D4 03A51021 */  addu        $v0, $sp, $a1
/* 0091D8 9FC091D8 02452021 */  addu        $a0, $s2, $a1
/* 0091DC 9FC091DC 8C430090 */  lw          $v1, 0x90($v0)
/* 0091E0 9FC091E0 8C820024 */  lw          $v0, 0x24($a0)
/* 0091E4 9FC091E4 00C52021 */  addu        $a0, $a2, $a1
/* 0091E8 9FC091E8 00621826 */  xor         $v1, $v1, $v0
/* 0091EC 9FC091EC 03A51021 */  addu        $v0, $sp, $a1
/* 0091F0 9FC091F0 AC830000 */  sw          $v1, ($a0)
/* 0091F4 9FC091F4 8C420070 */  lw          $v0, 0x70($v0)
/* 0091F8 9FC091F8 25080001 */  addiu       $t0, $t0, 1
/* 0091FC 9FC091FC 00621826 */  xor         $v1, $v1, $v0
/* 009200 9FC09200 2D020008 */  sltiu       $v0, $t0, 8
/* 009204 9FC09204 1440FFF1 */  bnez        $v0, .L9FC091CC
/* 009208 9FC09208 AC830000 */   sw         $v1, ($a0)
/* 00920C 9FC0920C 24040001 */  addiu       $a0, $zero, 1
/* 009210 9FC09210 00004021 */  addu        $t0, $zero, $zero
/* 009214 9FC09214 00081080 */  sll         $v0, $t0, 2
.L9FC09218:
/* 009218 9FC09218 00C21821 */  addu        $v1, $a2, $v0
/* 00921C 9FC0921C 03A21021 */  addu        $v0, $sp, $v0
/* 009220 9FC09220 8C630000 */  lw          $v1, ($v1)
/* 009224 9FC09224 8C420010 */  lw          $v0, 0x10($v0)
/* 009228 9FC09228 54620001 */  bnel        $v1, $v0, .L9FC09230
/* 00922C 9FC0922C 00002021 */   addu       $a0, $zero, $zero
.L9FC09230:
/* 009230 9FC09230 25080001 */  addiu       $t0, $t0, 1
/* 009234 9FC09234 2D020008 */  sltiu       $v0, $t0, 8
/* 009238 9FC09238 1440FFF7 */  bnez        $v0, .L9FC09218
/* 00923C 9FC0923C 00081080 */   sll        $v0, $t0, 2
/* 009240 9FC09240 14800002 */  bnez        $a0, .L9FC0924C
/* 009244 9FC09244 00001021 */   addu       $v0, $zero, $zero
.L9FC09248:
/* 009248 9FC09248 24020004 */  addiu       $v0, $zero, 4
.L9FC0924C:
/* 00924C 9FC0924C 8FBF011C */  lw          $ra, 0x11c($sp)
/* 009250 9FC09250 8FB20118 */  lw          $s2, 0x118($sp)
/* 009254 9FC09254 8FB10114 */  lw          $s1, 0x114($sp)
/* 009258 9FC09258 8FB00110 */  lw          $s0, 0x110($sp)
/* 00925C 9FC0925C 03E00008 */  jr          $ra
/* 009260 9FC09260 27BD0120 */   addiu      $sp, $sp, 0x120
