## func_9FC00BAC
## skVerifyHash
## func_9FC01D54
## verify_crlbundle
/* 0028BC 9FC028BC 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 0028C0 9FC028C0 AFB10014 */  sw          $s1, 0x14($sp)
/* 0028C4 9FC028C4 3C119FC1 */  lui         $s1, %hi(aXS)
/* 0028C8 9FC028C8 2631BDF8 */  addiu       $s1, $s1, %lo(aXS)
/* 0028CC 9FC028CC AFB20018 */  sw          $s2, 0x18($sp)
/* 0028D0 9FC028D0 00A09021 */  addu        $s2, $a1, $zero
/* 0028D4 9FC028D4 24020002 */  addiu       $v0, $zero, 2
/* 0028D8 9FC028D8 AFBF0020 */  sw          $ra, 0x20($sp)
/* 0028DC 9FC028DC AFB3001C */  sw          $s3, 0x1c($sp)
/* 0028E0 9FC028E0 16420003 */  bne         $s2, $v0, .L9FC028F0
/* 0028E4 9FC028E4 AFB00010 */   sw         $s0, 0x10($sp)
/* 0028E8 9FC028E8 3C119FC1 */  lui         $s1, %hi(aCP)
/* 0028EC 9FC028EC 2631BDFC */  addiu       $s1, $s1, %lo(aCP)
.L9FC028F0:
/* 0028F0 9FC028F0 00808021 */  addu        $s0, $a0, $zero
/* 0028F4 9FC028F4 26130014 */  addiu       $s3, $s0, 0x14
.L9FC028F8:
/* 0028F8 9FC028F8 12400007 */  beqz        $s2, .L9FC02918
/* 0028FC 9FC028FC 02202821 */   addu       $a1, $s1, $zero
/* 002900 9FC02900 8E040000 */  lw          $a0, ($s0)
/* 002904 9FC02904 24060002 */  addiu       $a2, $zero, 2
/* 002908 9FC02908 0FF00E6B */  jal         strncmp
/* 00290C 9FC0290C 2484004C */   addiu      $a0, $a0, 0x4c
/* 002910 9FC02910 14400014 */  bnez        $v0, .L9FC02964
/* 002914 9FC02914 2402FFFF */   addiu      $v0, $zero, -1
.L9FC02918:
/* 002918 9FC02918 8E040000 */  lw          $a0, ($s0)
/* 00291C 9FC0291C 3C059FC1 */  lui         $a1, %hi(aRoot)
/* 002920 9FC02920 24A5BDF0 */  addiu       $a1, $a1, %lo(aRoot)
/* 002924 9FC02924 0FF00E5C */  jal         strcmp
/* 002928 9FC02928 2484000C */   addiu      $a0, $a0, 0xc
/* 00292C 9FC0292C 14400005 */  bnez        $v0, .L9FC02944
/* 002930 9FC02930 8E040000 */   lw         $a0, ($s0)
/* 002934 9FC02934 0FF009EB */  jal         verify_cert_signature
/* 002938 9FC02938 00002821 */   addu       $a1, $zero, $zero
/* 00293C 9FC0293C 0BF00A5A */  j           .L9FC02968
/* 002940 9FC02940 8FBF0020 */   lw         $ra, 0x20($sp)
.L9FC02944:
/* 002944 9FC02944 0FF009EB */  jal         verify_cert_signature
/* 002948 9FC02948 8E050004 */   lw         $a1, 4($s0)
/* 00294C 9FC0294C 14400005 */  bnez        $v0, .L9FC02964
/* 002950 9FC02950 2402FFFF */   addiu      $v0, $zero, -1
/* 002954 9FC02954 26100004 */  addiu       $s0, $s0, 4
/* 002958 9FC02958 0213102A */  slt         $v0, $s0, $s3
/* 00295C 9FC0295C 1440FFE6 */  bnez        $v0, .L9FC028F8
/* 002960 9FC02960 00001021 */   addu       $v0, $zero, $zero
.L9FC02964:
/* 002964 9FC02964 8FBF0020 */  lw          $ra, 0x20($sp)
.L9FC02968:
/* 002968 9FC02968 8FB3001C */  lw          $s3, 0x1c($sp)
/* 00296C 9FC0296C 8FB20018 */  lw          $s2, 0x18($sp)
/* 002970 9FC02970 8FB10014 */  lw          $s1, 0x14($sp)
/* 002974 9FC02974 8FB00010 */  lw          $s0, 0x10($sp)
/* 002978 9FC02978 03E00008 */  jr          $ra
/* 00297C 9FC0297C 27BD0028 */   addiu      $sp, $sp, 0x28
