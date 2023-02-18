## poly_elliptic_sum
## poly_elliptic_mul_slow
## poly_elliptic_mul_four
## poly_elliptic_mul
/* 00B400 9FC0B400 27BDFF40 */  addiu       $sp, $sp, -0xc0
/* 00B404 9FC0B404 AFB100B4 */  sw          $s1, 0xb4($sp)
/* 00B408 9FC0B408 00A08821 */  addu        $s1, $a1, $zero
/* 00B40C 9FC0B40C AFB200B8 */  sw          $s2, 0xb8($sp)
/* 00B410 9FC0B410 00C09021 */  addu        $s2, $a2, $zero
/* 00B414 9FC0B414 00003021 */  addu        $a2, $zero, $zero
/* 00B418 9FC0B418 3C050001 */  lui         $a1, 1
/* 00B41C 9FC0B41C AFB000B0 */  sw          $s0, 0xb0($sp)
/* 00B420 9FC0B420 00808021 */  addu        $s0, $a0, $zero
/* 00B424 9FC0B424 AFBF00BC */  sw          $ra, 0xbc($sp)
.L9FC0B428:
/* 00B428 9FC0B428 00A01021 */  addu        $v0, $a1, $zero
/* 00B42C 9FC0B42C 3C030001 */  lui         $v1, 1
/* 00B430 9FC0B430 00A32821 */  addu        $a1, $a1, $v1
/* 00B434 9FC0B434 8C830000 */  lw          $v1, ($a0)
/* 00B438 9FC0B438 24840004 */  addiu       $a0, $a0, 4
/* 00B43C 9FC0B43C 00021402 */  srl         $v0, $v0, 0x10
/* 00B440 9FC0B440 2C420008 */  sltiu       $v0, $v0, 8
/* 00B444 9FC0B444 1440FFF8 */  bnez        $v0, .L9FC0B428
/* 00B448 9FC0B448 00C33025 */   or         $a2, $a2, $v1
/* 00B44C 9FC0B44C 14C00007 */  bnez        $a2, .L9FC0B46C
/* 00B450 9FC0B450 02002021 */   addu       $a0, $s0, $zero
/* 00B454 9FC0B454 0FF01EE0 */  jal         null
/* 00B458 9FC0B458 02202021 */   addu       $a0, $s1, $zero
/* 00B45C 9FC0B45C 0FF01EE0 */  jal         null
/* 00B460 9FC0B460 26240020 */   addiu      $a0, $s1, 0x20
/* 00B464 9FC0B464 0BF02D6D */  j           .L9FC0B5B4
/* 00B468 9FC0B468 8FBF00BC */   lw         $ra, 0xbc($sp)
.L9FC0B46C:
/* 00B46C 9FC0B46C 0FF021C8 */  jal         poly_inv
/* 00B470 9FC0B470 27A50010 */   addiu      $a1, $sp, 0x10
/* 00B474 9FC0B474 27A40010 */  addiu       $a0, $sp, 0x10
/* 00B478 9FC0B478 26050020 */  addiu       $a1, $s0, 0x20
/* 00B47C 9FC0B47C 0FF020F9 */  jal         poly_mul
/* 00B480 9FC0B480 27A60030 */   addiu      $a2, $sp, 0x30
/* 00B484 9FC0B484 00003021 */  addu        $a2, $zero, $zero
/* 00B488 9FC0B488 3C080001 */  lui         $t0, 1
/* 00B48C 9FC0B48C 02003821 */  addu        $a3, $s0, $zero
.L9FC0B490:
/* 00B490 9FC0B490 01002821 */  addu        $a1, $t0, $zero
/* 00B494 9FC0B494 3C020001 */  lui         $v0, 1
/* 00B498 9FC0B498 01024021 */  addu        $t0, $t0, $v0
/* 00B49C 9FC0B49C 8CE40000 */  lw          $a0, ($a3)
/* 00B4A0 9FC0B4A0 24E70004 */  addiu       $a3, $a3, 4
/* 00B4A4 9FC0B4A4 00061880 */  sll         $v1, $a2, 2
/* 00B4A8 9FC0B4A8 00053403 */  sra         $a2, $a1, 0x10
/* 00B4AC 9FC0B4AC 27A50050 */  addiu       $a1, $sp, 0x50
/* 00B4B0 9FC0B4B0 03A31021 */  addu        $v0, $sp, $v1
/* 00B4B4 9FC0B4B4 8C420030 */  lw          $v0, 0x30($v0)
/* 00B4B8 9FC0B4B8 00A31821 */  addu        $v1, $a1, $v1
/* 00B4BC 9FC0B4BC 00822026 */  xor         $a0, $a0, $v0
/* 00B4C0 9FC0B4C0 30C2FFFF */  andi        $v0, $a2, 0xffff
/* 00B4C4 9FC0B4C4 2C420008 */  sltiu       $v0, $v0, 8
/* 00B4C8 9FC0B4C8 1440FFF1 */  bnez        $v0, .L9FC0B490
/* 00B4CC 9FC0B4CC AC640000 */   sw         $a0, ($v1)
/* 00B4D0 9FC0B4D0 00A02021 */  addu        $a0, $a1, $zero
/* 00B4D4 9FC0B4D4 0FF020F9 */  jal         poly_mul
/* 00B4D8 9FC0B4D8 27A60070 */   addiu      $a2, $sp, 0x70
/* 00B4DC 9FC0B4DC 86420000 */  lh          $v0, ($s2)
/* 00B4E0 9FC0B4E0 10400033 */  beqz        $v0, .L9FC0B5B0
/* 00B4E4 9FC0B4E4 3C080001 */   lui        $t0, 1
/* 00B4E8 9FC0B4E8 00003021 */  addu        $a2, $zero, $zero
/* 00B4EC 9FC0B4EC 02202821 */  addu        $a1, $s1, $zero
.L9FC0B4F0:
/* 00B4F0 9FC0B4F0 01002021 */  addu        $a0, $t0, $zero
/* 00B4F4 9FC0B4F4 3C020001 */  lui         $v0, 1
/* 00B4F8 9FC0B4F8 01024021 */  addu        $t0, $t0, $v0
/* 00B4FC 9FC0B4FC 00061880 */  sll         $v1, $a2, 2
/* 00B500 9FC0B500 00043403 */  sra         $a2, $a0, 0x10
/* 00B504 9FC0B504 27A70050 */  addiu       $a3, $sp, 0x50
/* 00B508 9FC0B508 00E31021 */  addu        $v0, $a3, $v1
/* 00B50C 9FC0B50C 03A32021 */  addu        $a0, $sp, $v1
/* 00B510 9FC0B510 02431821 */  addu        $v1, $s2, $v1
/* 00B514 9FC0B514 8C420000 */  lw          $v0, ($v0)
/* 00B518 9FC0B518 8C840070 */  lw          $a0, 0x70($a0)
/* 00B51C 9FC0B51C 8C630004 */  lw          $v1, 4($v1)
/* 00B520 9FC0B520 00441026 */  xor         $v0, $v0, $a0
/* 00B524 9FC0B524 00431026 */  xor         $v0, $v0, $v1
/* 00B528 9FC0B528 ACA20000 */  sw          $v0, ($a1)
/* 00B52C 9FC0B52C 30C2FFFF */  andi        $v0, $a2, 0xffff
/* 00B530 9FC0B530 2C420008 */  sltiu       $v0, $v0, 8
/* 00B534 9FC0B534 1440FFEE */  bnez        $v0, .L9FC0B4F0
/* 00B538 9FC0B538 24A50004 */   addiu      $a1, $a1, 4
/* 00B53C 9FC0B53C 00E02021 */  addu        $a0, $a3, $zero
/* 00B540 9FC0B540 02202821 */  addu        $a1, $s1, $zero
/* 00B544 9FC0B544 8FA2006C */  lw          $v0, 0x6c($sp)
/* 00B548 9FC0B548 27A60090 */  addiu       $a2, $sp, 0x90
/* 00B54C 9FC0B54C 38420001 */  xori        $v0, $v0, 1
/* 00B550 9FC0B550 0FF020F9 */  jal         poly_mul
/* 00B554 9FC0B554 AFA2006C */   sw         $v0, 0x6c($sp)
/* 00B558 9FC0B558 02002021 */  addu        $a0, $s0, $zero
/* 00B55C 9FC0B55C 00802821 */  addu        $a1, $a0, $zero
/* 00B560 9FC0B560 0FF020F9 */  jal         poly_mul
/* 00B564 9FC0B564 27A60010 */   addiu      $a2, $sp, 0x10
/* 00B568 9FC0B568 00003021 */  addu        $a2, $zero, $zero
/* 00B56C 9FC0B56C 3C050001 */  lui         $a1, 1
/* 00B570 9FC0B570 00A02021 */  addu        $a0, $a1, $zero
.L9FC0B574:
/* 00B574 9FC0B574 3C020001 */  lui         $v0, 1
/* 00B578 9FC0B578 00A22821 */  addu        $a1, $a1, $v0
/* 00B57C 9FC0B57C 00061880 */  sll         $v1, $a2, 2
/* 00B580 9FC0B580 00043403 */  sra         $a2, $a0, 0x10
/* 00B584 9FC0B584 03A31021 */  addu        $v0, $sp, $v1
/* 00B588 9FC0B588 00402021 */  addu        $a0, $v0, $zero
/* 00B58C 9FC0B58C 8C420010 */  lw          $v0, 0x10($v0)
/* 00B590 9FC0B590 8C840090 */  lw          $a0, 0x90($a0)
/* 00B594 9FC0B594 02231821 */  addu        $v1, $s1, $v1
/* 00B598 9FC0B598 00441026 */  xor         $v0, $v0, $a0
/* 00B59C 9FC0B59C AC620020 */  sw          $v0, 0x20($v1)
/* 00B5A0 9FC0B5A0 30C2FFFF */  andi        $v0, $a2, 0xffff
/* 00B5A4 9FC0B5A4 2C420008 */  sltiu       $v0, $v0, 8
/* 00B5A8 9FC0B5A8 1440FFF2 */  bnez        $v0, .L9FC0B574
/* 00B5AC 9FC0B5AC 00A02021 */   addu       $a0, $a1, $zero
.L9FC0B5B0:
/* 00B5B0 9FC0B5B0 8FBF00BC */  lw          $ra, 0xbc($sp)
.L9FC0B5B4:
/* 00B5B4 9FC0B5B4 8FB200B8 */  lw          $s2, 0xb8($sp)
/* 00B5B8 9FC0B5B8 8FB100B4 */  lw          $s1, 0xb4($sp)
/* 00B5BC 9FC0B5BC 8FB000B0 */  lw          $s0, 0xb0($sp)
/* 00B5C0 9FC0B5C0 03E00008 */  jr          $ra
/* 00B5C4 9FC0B5C4 27BD00C0 */   addiu      $sp, $sp, 0xc0
