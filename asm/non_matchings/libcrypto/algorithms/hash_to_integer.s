## poly_ECDSA_signature
## poly_DSA_verify
/* 0093D4 9FC093D4 27BDFF40 */  addiu       $sp, $sp, -0xc0
/* 0093D8 9FC093D8 AFB300B4 */  sw          $s3, 0xb4($sp)
/* 0093DC 9FC093DC 00809821 */  addu        $s3, $a0, $zero
/* 0093E0 9FC093E0 AFB000A8 */  sw          $s0, 0xa8($sp)
/* 0093E4 9FC093E4 27B00048 */  addiu       $s0, $sp, 0x48
/* 0093E8 9FC093E8 02002021 */  addu        $a0, $s0, $zero
/* 0093EC 9FC093EC AFB200B0 */  sw          $s2, 0xb0($sp)
/* 0093F0 9FC093F0 00A09021 */  addu        $s2, $a1, $zero
/* 0093F4 9FC093F4 AFB400B8 */  sw          $s4, 0xb8($sp)
/* 0093F8 9FC093F8 00C0A021 */  addu        $s4, $a2, $zero
/* 0093FC 9FC093FC AFB100AC */  sw          $s1, 0xac($sp)
/* 009400 9FC09400 AFBF00BC */  sw          $ra, 0xbc($sp)
/* 009404 9FC09404 0FF019FF */  jal         SHA1Reset
/* 009408 9FC09408 00078942 */   srl        $s1, $a3, 5
/* 00940C 9FC0940C 02002021 */  addu        $a0, $s0, $zero
/* 009410 9FC09410 02602821 */  addu        $a1, $s3, $zero
/* 009414 9FC09414 0FF01A12 */  jal         SHA1Input
/* 009418 9FC09418 02403021 */   addu       $a2, $s2, $zero
/* 00941C 9FC0941C 02002021 */  addu        $a0, $s0, $zero
/* 009420 9FC09420 27A500D0 */  addiu       $a1, $sp, 0xd0
/* 009424 9FC09424 0FF01A12 */  jal         SHA1Input
/* 009428 9FC09428 24060004 */   addiu      $a2, $zero, 4
/* 00942C 9FC0942C 02002021 */  addu        $a0, $s0, $zero
/* 009430 9FC09430 0FF01A54 */  jal         SHA1Result
/* 009434 9FC09434 27A50010 */   addiu      $a1, $sp, 0x10
/* 009438 9FC09438 27B00028 */  addiu       $s0, $sp, 0x28
/* 00943C 9FC0943C 0FF01EE0 */  jal         null
/* 009440 9FC09440 02002021 */   addu       $a0, $s0, $zero
/* 009444 9FC09444 02002021 */  addu        $a0, $s0, $zero
/* 009448 9FC09448 02802821 */  addu        $a1, $s4, $zero
/* 00944C 9FC0944C 2622FFFC */  addiu       $v0, $s1, -4
/* 009450 9FC09450 00021080 */  sll         $v0, $v0, 2
/* 009454 9FC09454 8FA30010 */  lw          $v1, 0x10($sp)
/* 009458 9FC09458 02021021 */  addu        $v0, $s0, $v0
/* 00945C 9FC0945C AC430000 */  sw          $v1, ($v0)
/* 009460 9FC09460 2622FFFD */  addiu       $v0, $s1, -3
/* 009464 9FC09464 00021080 */  sll         $v0, $v0, 2
/* 009468 9FC09468 8FA30014 */  lw          $v1, 0x14($sp)
/* 00946C 9FC0946C 02021021 */  addu        $v0, $s0, $v0
/* 009470 9FC09470 AC430000 */  sw          $v1, ($v0)
/* 009474 9FC09474 2622FFFE */  addiu       $v0, $s1, -2
/* 009478 9FC09478 00021080 */  sll         $v0, $v0, 2
/* 00947C 9FC0947C 8FA30018 */  lw          $v1, 0x18($sp)
/* 009480 9FC09480 02021021 */  addu        $v0, $s0, $v0
/* 009484 9FC09484 AC430000 */  sw          $v1, ($v0)
/* 009488 9FC09488 2622FFFF */  addiu       $v0, $s1, -1
/* 00948C 9FC0948C 00021080 */  sll         $v0, $v0, 2
/* 009490 9FC09490 02021021 */  addu        $v0, $s0, $v0
/* 009494 9FC09494 8FA3001C */  lw          $v1, 0x1c($sp)
/* 009498 9FC09498 00118880 */  sll         $s1, $s1, 2
/* 00949C 9FC0949C AC430000 */  sw          $v1, ($v0)
/* 0094A0 9FC094A0 8FA20020 */  lw          $v0, 0x20($sp)
/* 0094A4 9FC094A4 02118021 */  addu        $s0, $s0, $s1
/* 0094A8 9FC094A8 AE020000 */  sw          $v0, ($s0)
/* 0094AC 9FC094AC 8FA20028 */  lw          $v0, 0x28($sp)
/* 0094B0 9FC094B0 24060008 */  addiu       $a2, $zero, 8
/* 0094B4 9FC094B4 304201FF */  andi        $v0, $v0, 0x1ff
/* 0094B8 9FC094B8 0FF01E48 */  jal         field_to_bigint
/* 0094BC 9FC094BC AFA20028 */   sw         $v0, 0x28($sp)
/* 0094C0 9FC094C0 8FBF00BC */  lw          $ra, 0xbc($sp)
/* 0094C4 9FC094C4 8FB400B8 */  lw          $s4, 0xb8($sp)
/* 0094C8 9FC094C8 8FB300B4 */  lw          $s3, 0xb4($sp)
/* 0094CC 9FC094CC 8FB200B0 */  lw          $s2, 0xb0($sp)
/* 0094D0 9FC094D0 8FB100AC */  lw          $s1, 0xac($sp)
/* 0094D4 9FC094D4 8FB000A8 */  lw          $s0, 0xa8($sp)
/* 0094D8 9FC094D8 00001021 */  addu        $v0, $zero, $zero
/* 0094DC 9FC094DC 03E00008 */  jr          $ra
/* 0094E0 9FC094E0 27BD00C0 */   addiu      $sp, $sp, 0xc0
