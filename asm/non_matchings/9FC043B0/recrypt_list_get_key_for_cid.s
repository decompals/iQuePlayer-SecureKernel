## skLaunchSetup
## skRecryptBegin
/* 0046B8 9FC046B8 27BDFFC0 */  addiu       $sp, $sp, -0x40
/* 0046BC 9FC046BC AFB00030 */  sw          $s0, 0x30($sp)
/* 0046C0 9FC046C0 00808021 */  addu        $s0, $a0, $zero
/* 0046C4 9FC046C4 AFB20038 */  sw          $s2, 0x38($sp)
/* 0046C8 9FC046C8 00A09021 */  addu        $s2, $a1, $zero
/* 0046CC 9FC046CC AFB10034 */  sw          $s1, 0x34($sp)
/* 0046D0 9FC046D0 AFBF003C */  sw          $ra, 0x3c($sp)
/* 0046D4 9FC046D4 0FF01182 */  jal         recrypt_list_verify_size_and_sig
/* 0046D8 9FC046D8 00C08821 */   addu       $s1, $a2, $zero
/* 0046DC 9FC046DC 10400004 */  beqz        $v0, .L9FC046F0
/* 0046E0 9FC046E0 02002021 */   addu       $a0, $s0, $zero
/* 0046E4 9FC046E4 0FF01117 */  jal         recrypt_list_clear
/* 0046E8 9FC046E8 02002021 */   addu       $a0, $s0, $zero
/* 0046EC 9FC046EC 02002021 */  addu        $a0, $s0, $zero
.L9FC046F0:
/* 0046F0 9FC046F0 02202821 */  addu        $a1, $s1, $zero
/* 0046F4 9FC046F4 0FF01161 */  jal         recrypt_list_get_entry_for_cid
/* 0046F8 9FC046F8 27A60010 */   addiu      $a2, $sp, 0x10
/* 0046FC 9FC046FC 04430013 */  bgezl       $v0, .L9FC0474C
/* 004700 9FC04700 8FB10024 */   lw         $s1, 0x24($sp)
/* 004704 9FC04704 27A40014 */  addiu       $a0, $sp, 0x14
/* 004708 9FC04708 24050004 */  addiu       $a1, $zero, 4
/* 00470C 9FC0470C 0FF00D7B */  jal         func_9FC035EC
/* 004710 9FC04710 AFB10010 */   sw         $s1, 0x10($sp)
/* 004714 9FC04714 27A40010 */  addiu       $a0, $sp, 0x10
/* 004718 9FC04718 02002821 */  addu        $a1, $s0, $zero
/* 00471C 9FC0471C 24110004 */  addiu       $s1, $zero, 4
/* 004720 9FC04720 8E060040 */  lw          $a2, 0x40($s0)
/* 004724 9FC04724 24020003 */  addiu       $v0, $zero, 3
/* 004728 9FC04728 0FF0113A */  jal         recrypt_list_add_entry
/* 00472C 9FC0472C AFA20024 */   sw         $v0, 0x24($sp)
/* 004730 9FC04730 8E020040 */  lw          $v0, 0x40($s0)
/* 004734 9FC04734 02002021 */  addu        $a0, $s0, $zero
/* 004738 9FC04738 24420001 */  addiu       $v0, $v0, 1
/* 00473C 9FC0473C 0FF01106 */  jal         recrypt_list_sign
/* 004740 9FC04740 AE020040 */   sw         $v0, 0x40($s0)
/* 004744 9FC04744 0BF011D4 */  j           .L9FC04750
/* 004748 9FC04748 02402021 */   addu       $a0, $s2, $zero
.L9FC0474C:
/* 00474C 9FC0474C 02402021 */  addu        $a0, $s2, $zero
.L9FC04750:
/* 004750 9FC04750 27A50014 */  addiu       $a1, $sp, 0x14
/* 004754 9FC04754 0FF00EA1 */  jal         memcpy
/* 004758 9FC04758 24060010 */   addiu      $a2, $zero, 0x10
/* 00475C 9FC0475C 02201021 */  addu        $v0, $s1, $zero
/* 004760 9FC04760 8FBF003C */  lw          $ra, 0x3c($sp)
/* 004764 9FC04764 8FB20038 */  lw          $s2, 0x38($sp)
/* 004768 9FC04768 8FB10034 */  lw          $s1, 0x34($sp)
/* 00476C 9FC0476C 8FB00030 */  lw          $s0, 0x30($sp)
/* 004770 9FC04770 03E00008 */  jr          $ra
/* 004774 9FC04774 27BD0040 */   addiu      $sp, $sp, 0x40
