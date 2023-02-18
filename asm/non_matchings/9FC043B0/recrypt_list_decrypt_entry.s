## recrypt_list_get_entry_for_cid
/* 00447C 9FC0447C 27BDFFD0 */  addiu       $sp, $sp, -0x30
/* 004480 9FC04480 AFBF0028 */  sw          $ra, 0x28($sp)
/* 004484 9FC04484 00804021 */  addu        $t0, $a0, $zero
/* 004488 9FC04488 00A04821 */  addu        $t1, $a1, $zero
/* 00448C 9FC0448C 00003821 */  addu        $a3, $zero, $zero
/* 004490 9FC04490 00071080 */  sll         $v0, $a3, 2
.L9FC04494:
/* 004494 9FC04494 3C049FC1 */  lui         $a0, %hi(virage2_offset)
/* 004498 9FC04498 8C84EBC0 */  lw          $a0, %lo(virage2_offset)($a0)
/* 00449C 9FC0449C 27A50018 */  addiu       $a1, $sp, 0x18
/* 0044A0 9FC044A0 8C830094 */  lw          $v1, 0x94($a0)
/* 0044A4 9FC044A4 00A21021 */  addu        $v0, $a1, $v0
/* 0044A8 9FC044A8 00671821 */  addu        $v1, $v1, $a3
/* 0044AC 9FC044AC 24E70001 */  addiu       $a3, $a3, 1
/* 0044B0 9FC044B0 AC430000 */  sw          $v1, ($v0)
/* 0044B4 9FC044B4 2CE20004 */  sltiu       $v0, $a3, 4
/* 0044B8 9FC044B8 1440FFF6 */  bnez        $v0, .L9FC04494
/* 0044BC 9FC044BC 00071080 */   sll        $v0, $a3, 2
/* 0044C0 9FC044C0 00063140 */  sll         $a2, $a2, 5
/* 0044C4 9FC044C4 24C60044 */  addiu       $a2, $a2, 0x44
/* 0044C8 9FC044C8 248400C8 */  addiu       $a0, $a0, 0xc8
/* 0044CC 9FC044CC 01263021 */  addu        $a2, $t1, $a2
/* 0044D0 9FC044D0 24070020 */  addiu       $a3, $zero, 0x20
/* 0044D4 9FC044D4 0FF012D7 */  jal         aes_SwDecrypt
/* 0044D8 9FC044D8 AFA80010 */   sw         $t0, 0x10($sp)
/* 0044DC 9FC044DC 8FBF0028 */  lw          $ra, 0x28($sp)
/* 0044E0 9FC044E0 03E00008 */  jr          $ra
/* 0044E4 9FC044E4 27BD0030 */   addiu      $sp, $sp, 0x30
