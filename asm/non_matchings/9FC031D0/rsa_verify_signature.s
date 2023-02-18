## func_9FC00BAC
## func_9FC01D54
## verify_cert_signature
## verify_crlbundle
/* 0032CC 9FC032CC 27BDFF50 */  addiu       $sp, $sp, -0xb0
/* 0032D0 9FC032D0 AFB00090 */  sw          $s0, 0x90($sp)
/* 0032D4 9FC032D4 00808021 */  addu        $s0, $a0, $zero
/* 0032D8 9FC032D8 27A40030 */  addiu       $a0, $sp, 0x30
/* 0032DC 9FC032DC AFB3009C */  sw          $s3, 0x9c($sp)
/* 0032E0 9FC032E0 00A09821 */  addu        $s3, $a1, $zero
/* 0032E4 9FC032E4 AFB400A0 */  sw          $s4, 0xa0($sp)
/* 0032E8 9FC032E8 00C0A021 */  addu        $s4, $a2, $zero
/* 0032EC 9FC032EC AFB500A4 */  sw          $s5, 0xa4($sp)
/* 0032F0 9FC032F0 00E0A821 */  addu        $s5, $a3, $zero
/* 0032F4 9FC032F4 AFBF00A8 */  sw          $ra, 0xa8($sp)
/* 0032F8 9FC032F8 AFB20098 */  sw          $s2, 0x98($sp)
/* 0032FC 9FC032FC 0FF019FF */  jal         SHA1Reset
/* 003300 9FC03300 AFB10094 */   sw         $s1, 0x94($sp)
/* 003304 9FC03304 1A60000D */  blez        $s3, .L9FC0333C
/* 003308 9FC03308 00009021 */   addu       $s2, $zero, $zero
/* 00330C 9FC0330C 26110004 */  addiu       $s1, $s0, 4
.L9FC03310:
/* 003310 9FC03310 8E260000 */  lw          $a2, ($s1)
/* 003314 9FC03314 50C00005 */  beql        $a2, $zero, .L9FC0332C
/* 003318 9FC03318 26100008 */   addiu      $s0, $s0, 8
/* 00331C 9FC0331C 8E050000 */  lw          $a1, ($s0)
/* 003320 9FC03320 0FF01A12 */  jal         SHA1Input
/* 003324 9FC03324 27A40030 */   addiu      $a0, $sp, 0x30
/* 003328 9FC03328 26100008 */  addiu       $s0, $s0, 8
.L9FC0332C:
/* 00332C 9FC0332C 26520001 */  addiu       $s2, $s2, 1
/* 003330 9FC03330 0253102A */  slt         $v0, $s2, $s3
/* 003334 9FC03334 1440FFF6 */  bnez        $v0, .L9FC03310
/* 003338 9FC03338 26310008 */   addiu      $s1, $s1, 8
.L9FC0333C:
/* 00333C 9FC0333C 27A40030 */  addiu       $a0, $sp, 0x30
/* 003340 9FC03340 0FF01A54 */  jal         SHA1Result
/* 003344 9FC03344 27A50018 */   addiu      $a1, $sp, 0x18
/* 003348 9FC03348 27A40018 */  addiu       $a0, $sp, 0x18
/* 00334C 9FC0334C 02802821 */  addu        $a1, $s4, $zero
/* 003350 9FC03350 8FA200C4 */  lw          $v0, 0xc4($sp)
/* 003354 9FC03354 8FA700C0 */  lw          $a3, 0xc0($sp)
/* 003358 9FC03358 02A03021 */  addu        $a2, $s5, $zero
/* 00335C 9FC0335C 0FF00CE2 */  jal         rsa_check_signature
/* 003360 9FC03360 AFA20010 */   sw         $v0, 0x10($sp)
/* 003364 9FC03364 8FBF00A8 */  lw          $ra, 0xa8($sp)
/* 003368 9FC03368 8FB500A4 */  lw          $s5, 0xa4($sp)
/* 00336C 9FC0336C 8FB400A0 */  lw          $s4, 0xa0($sp)
/* 003370 9FC03370 8FB3009C */  lw          $s3, 0x9c($sp)
/* 003374 9FC03374 8FB20098 */  lw          $s2, 0x98($sp)
/* 003378 9FC03378 8FB10094 */  lw          $s1, 0x94($sp)
/* 00337C 9FC0337C 8FB00090 */  lw          $s0, 0x90($sp)
/* 003380 9FC03380 03E00008 */  jr          $ra
/* 003384 9FC03384 27BD00B0 */   addiu      $sp, $sp, 0xb0
