/* 0015D8 9FC015D8 27BDFFC8 */  addiu       $sp, $sp, -0x38
/* 0015DC 9FC015DC AFB1002C */  sw          $s1, 0x2c($sp)
/* 0015E0 9FC015E0 00808821 */  addu        $s1, $a0, $zero
/* 0015E4 9FC015E4 24054000 */  addiu       $a1, $zero, 0x4000
/* 0015E8 9FC015E8 24060004 */  addiu       $a2, $zero, 4
/* 0015EC 9FC015EC AFBF0030 */  sw          $ra, 0x30($sp)
/* 0015F0 9FC015F0 0FF00F65 */  jal         check_untrusted_ptr_range
/* 0015F4 9FC015F4 AFB00028 */   sw         $s0, 0x28($sp)
/* 0015F8 9FC015F8 10400014 */  beqz        $v0, .L9FC0164C
/* 0015FC 9FC015FC 2402FFFF */   addiu      $v0, $zero, -1
/* 001600 9FC01600 3C049FC1 */  lui         $a0, %hi(sha1_ctx)
/* 001604 9FC01604 2484F080 */  addiu       $a0, $a0, %lo(sha1_ctx)
/* 001608 9FC01608 0FF01A54 */  jal         SHA1Result
/* 00160C 9FC0160C 27A50010 */   addiu      $a1, $sp, 0x10
/* 001610 9FC01610 27A40010 */  addiu       $a0, $sp, 0x10
/* 001614 9FC01614 3C109FC1 */  lui         $s0, %hi(contentMetaDataHead + 0x24)
/* 001618 9FC01618 2610ED58 */  addiu       $s0, $s0, %lo(contentMetaDataHead + 0x24)
/* 00161C 9FC0161C 02002821 */  addu        $a1, $s0, $zero
/* 001620 9FC01620 0FF00EC7 */  jal         memcmp
/* 001624 9FC01624 24060014 */   addiu      $a2, $zero, 0x14
/* 001628 9FC01628 14400008 */  bnez        $v0, .L9FC0164C
/* 00162C 9FC0162C 2402FFFF */   addiu      $v0, $zero, -1
/* 001630 9FC01630 02202021 */  addu        $a0, $s1, $zero
/* 001634 9FC01634 8E050074 */  lw          $a1, 0x74($s0)
/* 001638 9FC01638 0FF01190 */  jal         recrypt_list_add_new_entry
/* 00163C 9FC0163C 24060002 */   addiu      $a2, $zero, 2
/* 001640 9FC01640 14400002 */  bnez        $v0, .L9FC0164C
/* 001644 9FC01644 2402FFFF */   addiu      $v0, $zero, -1
/* 001648 9FC01648 00001021 */  addu        $v0, $zero, $zero
.L9FC0164C:
/* 00164C 9FC0164C 8FBF0030 */  lw          $ra, 0x30($sp)
/* 001650 9FC01650 8FB1002C */  lw          $s1, 0x2c($sp)
/* 001654 9FC01654 8FB00028 */  lw          $s0, 0x28($sp)
/* 001658 9FC01658 03E00008 */  jr          $ra
/* 00165C 9FC0165C 27BD0038 */   addiu      $sp, $sp, 0x38
