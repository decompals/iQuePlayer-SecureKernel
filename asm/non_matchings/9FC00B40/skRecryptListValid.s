/* 0011D8 9FC011D8 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 0011DC 9FC011DC AFB00010 */  sw          $s0, 0x10($sp)
/* 0011E0 9FC011E0 00808021 */  addu        $s0, $a0, $zero
/* 0011E4 9FC011E4 24054000 */  addiu       $a1, $zero, 0x4000
/* 0011E8 9FC011E8 AFBF0014 */  sw          $ra, 0x14($sp)
/* 0011EC 9FC011EC 0FF00F65 */  jal         check_untrusted_ptr_range
/* 0011F0 9FC011F0 24060004 */   addiu      $a2, $zero, 4
/* 0011F4 9FC011F4 10400005 */  beqz        $v0, .L9FC0120C
/* 0011F8 9FC011F8 2402FFFF */   addiu      $v0, $zero, -1
/* 0011FC 9FC011FC 0FF01182 */  jal         recrypt_list_verify_size_and_sig
/* 001200 9FC01200 02002021 */   addu       $a0, $s0, $zero
/* 001204 9FC01204 0BF00484 */  j           .L9FC01210
/* 001208 9FC01208 8FBF0014 */   lw         $ra, 0x14($sp)
.L9FC0120C:
/* 00120C 9FC0120C 8FBF0014 */  lw          $ra, 0x14($sp)
.L9FC01210:
/* 001210 9FC01210 8FB00010 */  lw          $s0, 0x10($sp)
/* 001214 9FC01214 03E00008 */  jr          $ra
/* 001218 9FC01218 27BD0018 */   addiu      $sp, $sp, 0x18
