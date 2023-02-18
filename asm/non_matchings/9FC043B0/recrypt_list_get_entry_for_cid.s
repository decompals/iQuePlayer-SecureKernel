## recrypt_list_add_new_entry
## recrypt_list_get_key_for_cid
/* 004584 9FC04584 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 004588 9FC04588 AFB00010 */  sw          $s0, 0x10($sp)
/* 00458C 9FC0458C 00008021 */  addu        $s0, $zero, $zero
/* 004590 9FC04590 AFB20018 */  sw          $s2, 0x18($sp)
/* 004594 9FC04594 00809021 */  addu        $s2, $a0, $zero
/* 004598 9FC04598 AFB3001C */  sw          $s3, 0x1c($sp)
/* 00459C 9FC0459C 00A09821 */  addu        $s3, $a1, $zero
/* 0045A0 9FC045A0 AFBF0020 */  sw          $ra, 0x20($sp)
/* 0045A4 9FC045A4 AFB10014 */  sw          $s1, 0x14($sp)
/* 0045A8 9FC045A8 8E420040 */  lw          $v0, 0x40($s2)
/* 0045AC 9FC045AC 1040000E */  beqz        $v0, .L9FC045E8
/* 0045B0 9FC045B0 00C08821 */   addu       $s1, $a2, $zero
/* 0045B4 9FC045B4 02202021 */  addu        $a0, $s1, $zero
.L9FC045B8:
/* 0045B8 9FC045B8 02402821 */  addu        $a1, $s2, $zero
/* 0045BC 9FC045BC 0FF0111F */  jal         recrypt_list_decrypt_entry
/* 0045C0 9FC045C0 02003021 */   addu       $a2, $s0, $zero
/* 0045C4 9FC045C4 8E220000 */  lw          $v0, ($s1)
/* 0045C8 9FC045C8 54530003 */  bnel        $v0, $s3, .L9FC045D8
/* 0045CC 9FC045CC 8E420040 */   lw         $v0, 0x40($s2)
/* 0045D0 9FC045D0 0BF0117B */  j           .L9FC045EC
/* 0045D4 9FC045D4 02001021 */   addu       $v0, $s0, $zero
.L9FC045D8:
/* 0045D8 9FC045D8 26100001 */  addiu       $s0, $s0, 1
/* 0045DC 9FC045DC 0202102B */  sltu        $v0, $s0, $v0
/* 0045E0 9FC045E0 1440FFF5 */  bnez        $v0, .L9FC045B8
/* 0045E4 9FC045E4 02202021 */   addu       $a0, $s1, $zero
.L9FC045E8:
/* 0045E8 9FC045E8 2402FFFF */  addiu       $v0, $zero, -1
.L9FC045EC:
/* 0045EC 9FC045EC 8FBF0020 */  lw          $ra, 0x20($sp)
/* 0045F0 9FC045F0 8FB3001C */  lw          $s3, 0x1c($sp)
/* 0045F4 9FC045F4 8FB20018 */  lw          $s2, 0x18($sp)
/* 0045F8 9FC045F8 8FB10014 */  lw          $s1, 0x14($sp)
/* 0045FC 9FC045FC 8FB00010 */  lw          $s0, 0x10($sp)
/* 004600 9FC04600 03E00008 */  jr          $ra
/* 004604 9FC04604 27BD0028 */   addiu      $sp, $sp, 0x28
