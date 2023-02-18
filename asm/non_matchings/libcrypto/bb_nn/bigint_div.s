## bigint_mod
## bigint_mod_inv
## poly_key_gen_primitive
## poly_ECDSA_signature
## poly_DSA_verify
/* 00726C 9FC0726C 27BDF998 */  addiu       $sp, $sp, -0x668
/* 007270 9FC07270 AFB3064C */  sw          $s3, 0x64c($sp)
/* 007274 9FC07274 8FB30678 */  lw          $s3, 0x678($sp)
/* 007278 9FC07278 AFA5066C */  sw          $a1, 0x66c($sp)
/* 00727C 9FC0727C 8FA5067C */  lw          $a1, 0x67c($sp)
/* 007280 9FC07280 AFB40650 */  sw          $s4, 0x650($sp)
/* 007284 9FC07284 0080A021 */  addu        $s4, $a0, $zero
/* 007288 9FC07288 AFB00640 */  sw          $s0, 0x640($sp)
/* 00728C 9FC0728C 00C08021 */  addu        $s0, $a2, $zero
/* 007290 9FC07290 AFB10644 */  sw          $s1, 0x644($sp)
/* 007294 9FC07294 00E08821 */  addu        $s1, $a3, $zero
/* 007298 9FC07298 AFBF0664 */  sw          $ra, 0x664($sp)
/* 00729C 9FC0729C AFBE0660 */  sw          $fp, 0x660($sp)
/* 0072A0 9FC072A0 AFB7065C */  sw          $s7, 0x65c($sp)
/* 0072A4 9FC072A4 AFB60658 */  sw          $s6, 0x658($sp)
/* 0072A8 9FC072A8 AFB50654 */  sw          $s5, 0x654($sp)
/* 0072AC 9FC072AC AFB20648 */  sw          $s2, 0x648($sp)
/* 0072B0 9FC072B0 0FF01C0B */  jal         bigint_digits
/* 0072B4 9FC072B4 02602021 */   addu       $a0, $s3, $zero
/* 0072B8 9FC072B8 00409021 */  addu        $s2, $v0, $zero
/* 0072BC 9FC072BC 12400069 */  beqz        $s2, .L9FC07464
/* 0072C0 9FC072C0 00121080 */   sll        $v0, $s2, 2
/* 0072C4 9FC072C4 00531021 */  addu        $v0, $v0, $s3
/* 0072C8 9FC072C8 0FF01B23 */  jal         bigint_digit_bits
/* 0072CC 9FC072CC 8C44FFFC */   lw         $a0, -4($v0)
/* 0072D0 9FC072D0 27A40018 */  addiu       $a0, $sp, 0x18
/* 0072D4 9FC072D4 02402821 */  addu        $a1, $s2, $zero
/* 0072D8 9FC072D8 24030020 */  addiu       $v1, $zero, 0x20
/* 0072DC 9FC072DC 00621823 */  subu        $v1, $v1, $v0
/* 0072E0 9FC072E0 0FF01BD0 */  jal         bigint_zero
/* 0072E4 9FC072E4 AFA30638 */   sw         $v1, 0x638($sp)
/* 0072E8 9FC072E8 27A40018 */  addiu       $a0, $sp, 0x18
/* 0072EC 9FC072EC 02002821 */  addu        $a1, $s0, $zero
/* 0072F0 9FC072F0 8FA60638 */  lw          $a2, 0x638($sp)
/* 0072F4 9FC072F4 0FF01C54 */  jal         bigint_left_shift
/* 0072F8 9FC072F8 02203821 */   addu       $a3, $s1, $zero
/* 0072FC 9FC072FC 27B00428 */  addiu       $s0, $sp, 0x428
/* 007300 9FC07300 02002021 */  addu        $a0, $s0, $zero
/* 007304 9FC07304 02602821 */  addu        $a1, $s3, $zero
/* 007308 9FC07308 02403821 */  addu        $a3, $s2, $zero
/* 00730C 9FC0730C 00111880 */  sll         $v1, $s1, 2
/* 007310 9FC07310 8FA60638 */  lw          $a2, 0x638($sp)
/* 007314 9FC07314 03A31821 */  addu        $v1, $sp, $v1
/* 007318 9FC07318 0FF01C54 */  jal         bigint_left_shift
/* 00731C 9FC0731C AC620018 */   sw         $v0, 0x18($v1)
/* 007320 9FC07320 02802021 */  addu        $a0, $s4, $zero
/* 007324 9FC07324 2642FFFF */  addiu       $v0, $s2, -1
/* 007328 9FC07328 00021080 */  sll         $v0, $v0, 2
/* 00732C 9FC0732C 02028021 */  addu        $s0, $s0, $v0
/* 007330 9FC07330 8E100000 */  lw          $s0, ($s0)
/* 007334 9FC07334 02202821 */  addu        $a1, $s1, $zero
/* 007338 9FC07338 0FF01BD0 */  jal         bigint_zero
/* 00733C 9FC0733C AFB00634 */   sw         $s0, 0x634($sp)
/* 007340 9FC07340 0232B023 */  subu        $s6, $s1, $s2
/* 007344 9FC07344 06C0003F */  bltz        $s6, .L9FC07444
/* 007348 9FC07348 00161080 */   sll        $v0, $s6, 2
/* 00734C 9FC0734C 0054F021 */  addu        $fp, $v0, $s4
/* 007350 9FC07350 00409821 */  addu        $s3, $v0, $zero
/* 007354 9FC07354 02D2A021 */  addu        $s4, $s6, $s2
/* 007358 9FC07358 0014A880 */  sll         $s5, $s4, 2
/* 00735C 9FC0735C 26B7FFFC */  addiu       $s7, $s5, -4
.L9FC07360:
/* 007360 9FC07360 8FA80634 */  lw          $t0, 0x634($sp)
/* 007364 9FC07364 2402FFFF */  addiu       $v0, $zero, -1
/* 007368 9FC07368 15020005 */  bne         $t0, $v0, .L9FC07380
/* 00736C 9FC0736C 27A40630 */   addiu      $a0, $sp, 0x630
/* 007370 9FC07370 03B51021 */  addu        $v0, $sp, $s5
/* 007374 9FC07374 8C420018 */  lw          $v0, 0x18($v0)
/* 007378 9FC07378 0BF01CE5 */  j           .L9FC07394
/* 00737C 9FC0737C AFA20630 */   sw         $v0, 0x630($sp)
.L9FC07380:
/* 007380 9FC07380 27A50018 */  addiu       $a1, $sp, 0x18
/* 007384 9FC07384 8FA80634 */  lw          $t0, 0x634($sp)
/* 007388 9FC07388 00B72821 */  addu        $a1, $a1, $s7
/* 00738C 9FC0738C 0FF01B2C */  jal         bigint_digit_div
/* 007390 9FC07390 25060001 */   addiu      $a2, $t0, 1
.L9FC07394:
/* 007394 9FC07394 27B00018 */  addiu       $s0, $sp, 0x18
/* 007398 9FC07398 02132021 */  addu        $a0, $s0, $s3
/* 00739C 9FC0739C 00802821 */  addu        $a1, $a0, $zero
/* 0073A0 9FC073A0 8FA60630 */  lw          $a2, 0x630($sp)
/* 0073A4 9FC073A4 27A70428 */  addiu       $a3, $sp, 0x428
/* 0073A8 9FC073A8 0FF01AE7 */  jal         bigint_sub_digit_mult
/* 0073AC 9FC073AC AFB20010 */   sw         $s2, 0x10($sp)
/* 0073B0 9FC073B0 0BF01CF9 */  j           .L9FC073E4
/* 0073B4 9FC073B4 02158021 */   addu       $s0, $s0, $s5
.L9FC073B8:
/* 0073B8 9FC073B8 27B00018 */  addiu       $s0, $sp, 0x18
.L9FC073BC:
/* 0073BC 9FC073BC 02132021 */  addu        $a0, $s0, $s3
/* 0073C0 9FC073C0 00802821 */  addu        $a1, $a0, $zero
/* 0073C4 9FC073C4 27A60428 */  addiu       $a2, $sp, 0x428
/* 0073C8 9FC073C8 8FA20630 */  lw          $v0, 0x630($sp)
/* 0073CC 9FC073CC 02403821 */  addu        $a3, $s2, $zero
/* 0073D0 9FC073D0 24420001 */  addiu       $v0, $v0, 1
/* 0073D4 9FC073D4 0FF01BF1 */  jal         bigint_sub
/* 0073D8 9FC073D8 AFA20630 */   sw         $v0, 0x630($sp)
/* 0073DC 9FC073DC 00111880 */  sll         $v1, $s1, 2
/* 0073E0 9FC073E0 02038021 */  addu        $s0, $s0, $v1
.L9FC073E4:
/* 0073E4 9FC073E4 8E030000 */  lw          $v1, ($s0)
/* 0073E8 9FC073E8 00621823 */  subu        $v1, $v1, $v0
/* 0073EC 9FC073EC AE030000 */  sw          $v1, ($s0)
/* 0073F0 9FC073F0 00141080 */  sll         $v0, $s4, 2
/* 0073F4 9FC073F4 27A40018 */  addiu       $a0, $sp, 0x18
/* 0073F8 9FC073F8 00821021 */  addu        $v0, $a0, $v0
/* 0073FC 9FC073FC 8C420000 */  lw          $v0, ($v0)
/* 007400 9FC07400 1440FFED */  bnez        $v0, .L9FC073B8
/* 007404 9FC07404 02808821 */   addu       $s1, $s4, $zero
/* 007408 9FC07408 00932021 */  addu        $a0, $a0, $s3
/* 00740C 9FC0740C 27A50428 */  addiu       $a1, $sp, 0x428
/* 007410 9FC07410 0FF01C86 */  jal         bigint_cmp
/* 007414 9FC07414 02403021 */   addu       $a2, $s2, $zero
/* 007418 9FC07418 0441FFE8 */  bgez        $v0, .L9FC073BC
/* 00741C 9FC0741C 27B00018 */   addiu      $s0, $sp, 0x18
/* 007420 9FC07420 2673FFFC */  addiu       $s3, $s3, -4
/* 007424 9FC07424 26B5FFFC */  addiu       $s5, $s5, -4
/* 007428 9FC07428 26F7FFFC */  addiu       $s7, $s7, -4
/* 00742C 9FC0742C 2694FFFF */  addiu       $s4, $s4, -1
/* 007430 9FC07430 8FA20630 */  lw          $v0, 0x630($sp)
/* 007434 9FC07434 26D6FFFF */  addiu       $s6, $s6, -1
/* 007438 9FC07438 AFC20000 */  sw          $v0, ($fp)
/* 00743C 9FC0743C 06C1FFC8 */  bgez        $s6, .L9FC07360
/* 007440 9FC07440 27DEFFFC */   addiu      $fp, $fp, -4
.L9FC07444:
/* 007444 9FC07444 8FA4066C */  lw          $a0, 0x66c($sp)
/* 007448 9FC07448 0FF01BD0 */  jal         bigint_zero
/* 00744C 9FC0744C 8FA5067C */   lw         $a1, 0x67c($sp)
/* 007450 9FC07450 27A50018 */  addiu       $a1, $sp, 0x18
/* 007454 9FC07454 8FA4066C */  lw          $a0, 0x66c($sp)
/* 007458 9FC07458 8FA60638 */  lw          $a2, 0x638($sp)
/* 00745C 9FC0745C 0FF01C6C */  jal         bigint_right_shift
/* 007460 9FC07460 02403821 */   addu       $a3, $s2, $zero
.L9FC07464:
/* 007464 9FC07464 8FBF0664 */  lw          $ra, 0x664($sp)
/* 007468 9FC07468 8FBE0660 */  lw          $fp, 0x660($sp)
/* 00746C 9FC0746C 8FB7065C */  lw          $s7, 0x65c($sp)
/* 007470 9FC07470 8FB60658 */  lw          $s6, 0x658($sp)
/* 007474 9FC07474 8FB50654 */  lw          $s5, 0x654($sp)
/* 007478 9FC07478 8FB40650 */  lw          $s4, 0x650($sp)
/* 00747C 9FC0747C 8FB3064C */  lw          $s3, 0x64c($sp)
/* 007480 9FC07480 8FB20648 */  lw          $s2, 0x648($sp)
/* 007484 9FC07484 8FB10644 */  lw          $s1, 0x644($sp)
/* 007488 9FC07488 8FB00640 */  lw          $s0, 0x640($sp)
/* 00748C 9FC0748C 03E00008 */  jr          $ra
/* 007490 9FC07490 27BD0668 */   addiu      $sp, $sp, 0x668
