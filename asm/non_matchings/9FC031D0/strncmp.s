## verify_cert_chain
## check_crl_root
/* 0039AC 9FC039AC 00003821 */  addu        $a3, $zero, $zero
/* 0039B0 9FC039B0 00004021 */  addu        $t0, $zero, $zero
/* 0039B4 9FC039B4 18C0000B */  blez        $a2, .L9FC039E4
/* 0039B8 9FC039B8 00804821 */   addu       $t1, $a0, $zero
/* 0039BC 9FC039BC 01271021 */  addu        $v0, $t1, $a3
.L9FC039C0:
/* 0039C0 9FC039C0 00A71821 */  addu        $v1, $a1, $a3
/* 0039C4 9FC039C4 80440000 */  lb          $a0, ($v0)
/* 0039C8 9FC039C8 80620000 */  lb          $v0, ($v1)
/* 0039CC 9FC039CC 54820001 */  bnel        $a0, $v0, .L9FC039D4
/* 0039D0 9FC039D0 2408FFFF */   addiu      $t0, $zero, -1
.L9FC039D4:
/* 0039D4 9FC039D4 24E70001 */  addiu       $a3, $a3, 1
/* 0039D8 9FC039D8 00E6102A */  slt         $v0, $a3, $a2
/* 0039DC 9FC039DC 1440FFF8 */  bnez        $v0, .L9FC039C0
/* 0039E0 9FC039E0 01271021 */   addu       $v0, $t1, $a3
.L9FC039E4:
/* 0039E4 9FC039E4 03E00008 */  jr          $ra
/* 0039E8 9FC039E8 01001021 */   addu       $v0, $t0, $zero
