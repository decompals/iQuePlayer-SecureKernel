## skVerifyHash
## check_ticket_bundle_revocations
/* 003114 9FC03114 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 003118 9FC03118 AFB20018 */  sw          $s2, 0x18($sp)
/* 00311C 9FC0311C 00009021 */  addu        $s2, $zero, $zero
/* 003120 9FC03120 AFB00010 */  sw          $s0, 0x10($sp)
/* 003124 9FC03124 00808021 */  addu        $s0, $a0, $zero
/* 003128 9FC03128 AFB10014 */  sw          $s1, 0x14($sp)
/* 00312C 9FC0312C 26110008 */  addiu       $s1, $s0, 8
/* 003130 9FC03130 AFBF001C */  sw          $ra, 0x1c($sp)
.L9FC03134:
/* 003134 9FC03134 8E040000 */  lw          $a0, ($s0)
/* 003138 9FC03138 50800017 */  beql        $a0, $zero, .L9FC03198
/* 00313C 9FC0313C 26520001 */   addiu      $s2, $s2, 1
/* 003140 9FC03140 24050258 */  addiu       $a1, $zero, 0x258
/* 003144 9FC03144 0FF00F65 */  jal         check_untrusted_ptr_range
/* 003148 9FC03148 24060004 */   addiu      $a2, $zero, 4
/* 00314C 9FC0314C 10400008 */  beqz        $v0, .L9FC03170
/* 003150 9FC03150 24060004 */   addiu      $a2, $zero, 4
/* 003154 9FC03154 8E020000 */  lw          $v0, ($s0)
/* 003158 9FC03158 8C450254 */  lw          $a1, 0x254($v0)
/* 00315C 9FC0315C 8E24FFFC */  lw          $a0, -4($s1)
/* 003160 9FC03160 0FF00F65 */  jal         check_untrusted_ptr_range
/* 003164 9FC03164 00052980 */   sll        $a1, $a1, 6
/* 003168 9FC03168 54400003 */  bnel        $v0, $zero, .L9FC03178
/* 00316C 9FC0316C 8E020000 */   lw         $v0, ($s0)
.L9FC03170:
/* 003170 9FC03170 0BF00C6B */  j           .L9FC031AC
/* 003174 9FC03174 00001021 */   addu       $v0, $zero, $zero
.L9FC03178:
/* 003178 9FC03178 8C430200 */  lw          $v1, 0x200($v0)
/* 00317C 9FC0317C 24020002 */  addiu       $v0, $zero, 2
/* 003180 9FC03180 50620005 */  beql        $v1, $v0, .L9FC03198
/* 003184 9FC03184 26520001 */   addiu      $s2, $s2, 1
/* 003188 9FC03188 0FF00F80 */  jal         check_cert_ranges
/* 00318C 9FC0318C 02202021 */   addu       $a0, $s1, $zero
/* 003190 9FC03190 1040FFF7 */  beqz        $v0, .L9FC03170
/* 003194 9FC03194 26520001 */   addiu      $s2, $s2, 1
.L9FC03198:
/* 003198 9FC03198 2631001C */  addiu       $s1, $s1, 0x1c
/* 00319C 9FC0319C 2E420003 */  sltiu       $v0, $s2, 3
/* 0031A0 9FC031A0 1440FFE4 */  bnez        $v0, .L9FC03134
/* 0031A4 9FC031A4 2610001C */   addiu      $s0, $s0, 0x1c
/* 0031A8 9FC031A8 24020001 */  addiu       $v0, $zero, 1
.L9FC031AC:
/* 0031AC 9FC031AC 8FBF001C */  lw          $ra, 0x1c($sp)
/* 0031B0 9FC031B0 8FB20018 */  lw          $s2, 0x18($sp)
/* 0031B4 9FC031B4 8FB10014 */  lw          $s1, 0x14($sp)
/* 0031B8 9FC031B8 8FB00010 */  lw          $s0, 0x10($sp)
/* 0031BC 9FC031BC 03E00008 */  jr          $ra
/* 0031C0 9FC031C0 27BD0020 */   addiu      $sp, $sp, 0x20
