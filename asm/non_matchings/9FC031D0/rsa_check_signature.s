## skVerifyHash
## rsa_verify_signature
/* 003388 9FC03388 27BDFDD8 */  addiu       $sp, $sp, -0x228
/* 00338C 9FC0338C AFB1021C */  sw          $s1, 0x21c($sp)
/* 003390 9FC03390 00808821 */  addu        $s1, $a0, $zero
/* 003394 9FC03394 AFA60230 */  sw          $a2, 0x230($sp)
/* 003398 9FC03398 00A03021 */  addu        $a2, $a1, $zero
/* 00339C 9FC0339C AFBF0220 */  sw          $ra, 0x220($sp)
/* 0033A0 9FC033A0 14E00004 */  bnez        $a3, .L9FC033B4
/* 0033A4 9FC033A4 AFB00218 */   sw         $s0, 0x218($sp)
/* 0033A8 9FC033A8 24020800 */  addiu       $v0, $zero, 0x800
/* 0033AC 9FC033AC 0BF00CF2 */  j           .L9FC033C8
/* 0033B0 9FC033B0 24100100 */   addiu      $s0, $zero, 0x100
.L9FC033B4:
/* 0033B4 9FC033B4 24020001 */  addiu       $v0, $zero, 1
/* 0033B8 9FC033B8 14E20010 */  bne         $a3, $v0, .L9FC033FC
/* 0033BC 9FC033BC 2402FFFF */   addiu      $v0, $zero, -1
/* 0033C0 9FC033C0 24021000 */  addiu       $v0, $zero, 0x1000
/* 0033C4 9FC033C4 24100200 */  addiu       $s0, $zero, 0x200
.L9FC033C8:
/* 0033C8 9FC033C8 27A40018 */  addiu       $a0, $sp, 0x18
/* 0033CC 9FC033CC 8FA50238 */  lw          $a1, 0x238($sp)
/* 0033D0 9FC033D0 27A70230 */  addiu       $a3, $sp, 0x230
/* 0033D4 9FC033D4 0FF01DF2 */  jal         bsl_rsa_verify
/* 0033D8 9FC033D8 AFA20010 */   sw         $v0, 0x10($sp)
/* 0033DC 9FC033DC 02202021 */  addu        $a0, $s1, $zero
/* 0033E0 9FC033E0 021D2821 */  addu        $a1, $s0, $sp
/* 0033E4 9FC033E4 24A50004 */  addiu       $a1, $a1, 4
/* 0033E8 9FC033E8 0FF00EC7 */  jal         memcmp
/* 0033EC 9FC033EC 24060014 */   addiu      $a2, $zero, 0x14
/* 0033F0 9FC033F0 14400002 */  bnez        $v0, .L9FC033FC
/* 0033F4 9FC033F4 2402FFFF */   addiu      $v0, $zero, -1
/* 0033F8 9FC033F8 00001021 */  addu        $v0, $zero, $zero
.L9FC033FC:
/* 0033FC 9FC033FC 8FBF0220 */  lw          $ra, 0x220($sp)
/* 003400 9FC03400 8FB1021C */  lw          $s1, 0x21c($sp)
/* 003404 9FC03404 8FB00218 */  lw          $s0, 0x218($sp)
/* 003408 9FC03408 03E00008 */  jr          $ra
/* 00340C 9FC0340C 27BD0228 */   addiu      $sp, $sp, 0x228
