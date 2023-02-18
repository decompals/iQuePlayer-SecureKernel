## poly_ECDSA_signature
/* 0092A8 9FC092A8 27BDFF30 */  addiu       $sp, $sp, -0xd0
/* 0092AC 9FC092AC AFB300C4 */  sw          $s3, 0xc4($sp)
/* 0092B0 9FC092B0 00809821 */  addu        $s3, $a0, $zero
/* 0092B4 9FC092B4 27A40018 */  addiu       $a0, $sp, 0x18
/* 0092B8 9FC092B8 AFB400C8 */  sw          $s4, 0xc8($sp)
/* 0092BC 9FC092BC 00A0A021 */  addu        $s4, $a1, $zero
/* 0092C0 9FC092C0 24050008 */  addiu       $a1, $zero, 8
/* 0092C4 9FC092C4 AFB000B8 */  sw          $s0, 0xb8($sp)
/* 0092C8 9FC092C8 00C08021 */  addu        $s0, $a2, $zero
/* 0092CC 9FC092CC AFBF00CC */  sw          $ra, 0xcc($sp)
/* 0092D0 9FC092D0 AFB200C0 */  sw          $s2, 0xc0($sp)
/* 0092D4 9FC092D4 0FF01BD0 */  jal         bigint_zero
/* 0092D8 9FC092D8 AFB100BC */   sw         $s1, 0xbc($sp)
/* 0092DC 9FC092DC 27A40038 */  addiu       $a0, $sp, 0x38
/* 0092E0 9FC092E0 0FF01BD0 */  jal         bigint_zero
/* 0092E4 9FC092E4 24050008 */   addiu      $a1, $zero, 8
/* 0092E8 9FC092E8 27A40058 */  addiu       $a0, $sp, 0x58
/* 0092EC 9FC092EC 0FF01BD0 */  jal         bigint_zero
/* 0092F0 9FC092F0 24050008 */   addiu      $a1, $zero, 8
/* 0092F4 9FC092F4 27A40078 */  addiu       $a0, $sp, 0x78
/* 0092F8 9FC092F8 0FF01BD0 */  jal         bigint_zero
/* 0092FC 9FC092FC 24050008 */   addiu      $a1, $zero, 8
/* 009300 9FC09300 0FF01EE0 */  jal         null
/* 009304 9FC09304 27A40098 */   addiu      $a0, $sp, 0x98
/* 009308 9FC09308 00002821 */  addu        $a1, $zero, $zero
.L9FC0930C:
/* 00930C 9FC0930C 8E030000 */  lw          $v1, ($s0)
/* 009310 9FC09310 00051080 */  sll         $v0, $a1, 2
/* 009314 9FC09314 24A50001 */  addiu       $a1, $a1, 1
/* 009318 9FC09318 27A40098 */  addiu       $a0, $sp, 0x98
/* 00931C 9FC0931C 00821021 */  addu        $v0, $a0, $v0
/* 009320 9FC09320 AC430000 */  sw          $v1, ($v0)
/* 009324 9FC09324 28A20008 */  slti        $v0, $a1, 8
/* 009328 9FC09328 1440FFF8 */  bnez        $v0, .L9FC0930C
/* 00932C 9FC0932C 26100004 */   addiu      $s0, $s0, 4
/* 009330 9FC09330 27A50018 */  addiu       $a1, $sp, 0x18
/* 009334 9FC09334 0FF01E48 */  jal         field_to_bigint
/* 009338 9FC09338 24060008 */   addiu      $a2, $zero, 8
/* 00933C 9FC0933C 26640084 */  addiu       $a0, $s3, 0x84
/* 009340 9FC09340 27B00038 */  addiu       $s0, $sp, 0x38
/* 009344 9FC09344 02002821 */  addu        $a1, $s0, $zero
/* 009348 9FC09348 0FF01E48 */  jal         field_to_bigint
/* 00934C 9FC0934C 24060008 */   addiu      $a2, $zero, 8
/* 009350 9FC09350 27A40018 */  addiu       $a0, $sp, 0x18
/* 009354 9FC09354 0FF01C0B */  jal         bigint_digits
/* 009358 9FC09358 24050008 */   addiu      $a1, $zero, 8
/* 00935C 9FC0935C 02002021 */  addu        $a0, $s0, $zero
/* 009360 9FC09360 24050008 */  addiu       $a1, $zero, 8
/* 009364 9FC09364 0FF01C0B */  jal         bigint_digits
/* 009368 9FC09368 00409021 */   addu       $s2, $v0, $zero
/* 00936C 9FC0936C 27A40058 */  addiu       $a0, $sp, 0x58
/* 009370 9FC09370 27B10078 */  addiu       $s1, $sp, 0x78
/* 009374 9FC09374 02202821 */  addu        $a1, $s1, $zero
/* 009378 9FC09378 27A60018 */  addiu       $a2, $sp, 0x18
/* 00937C 9FC0937C 02403821 */  addu        $a3, $s2, $zero
/* 009380 9FC09380 AFB00010 */  sw          $s0, 0x10($sp)
/* 009384 9FC09384 0FF01C9B */  jal         bigint_div
/* 009388 9FC09388 AFA20014 */   sw         $v0, 0x14($sp)
/* 00938C 9FC0938C 02202021 */  addu        $a0, $s1, $zero
/* 009390 9FC09390 02802821 */  addu        $a1, $s4, $zero
/* 009394 9FC09394 0FF01E5A */  jal         bigint_to_field
/* 009398 9FC09398 24060008 */   addiu      $a2, $zero, 8
/* 00939C 9FC0939C 02802021 */  addu        $a0, $s4, $zero
/* 0093A0 9FC093A0 26650044 */  addiu       $a1, $s3, 0x44
/* 0093A4 9FC093A4 24860020 */  addiu       $a2, $a0, 0x20
/* 0093A8 9FC093A8 0FF02E34 */  jal         poly_elliptic_mul_four
/* 0093AC 9FC093AC 02603821 */   addu       $a3, $s3, $zero
/* 0093B0 9FC093B0 8FBF00CC */  lw          $ra, 0xcc($sp)
/* 0093B4 9FC093B4 8FB400C8 */  lw          $s4, 0xc8($sp)
/* 0093B8 9FC093B8 8FB300C4 */  lw          $s3, 0xc4($sp)
/* 0093BC 9FC093BC 8FB200C0 */  lw          $s2, 0xc0($sp)
/* 0093C0 9FC093C0 8FB100BC */  lw          $s1, 0xbc($sp)
/* 0093C4 9FC093C4 8FB000B8 */  lw          $s0, 0xb8($sp)
/* 0093C8 9FC093C8 00001021 */  addu        $v0, $zero, $zero
/* 0093CC 9FC093CC 03E00008 */  jr          $ra
/* 0093D0 9FC093D0 27BD00D0 */   addiu      $sp, $sp, 0xd0
