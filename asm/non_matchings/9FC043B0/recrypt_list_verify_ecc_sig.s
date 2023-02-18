## recrypt_list_verify_size_and_sig
/* 0043B0 9FC043B0 27BDFF98 */  addiu       $sp, $sp, -0x68
/* 0043B4 9FC043B4 AFB1005C */  sw          $s1, 0x5c($sp)
/* 0043B8 9FC043B8 00808821 */  addu        $s1, $a0, $zero
/* 0043BC 9FC043BC AFBF0060 */  sw          $ra, 0x60($sp)
/* 0043C0 9FC043C0 AFB00058 */  sw          $s0, 0x58($sp)
/* 0043C4 9FC043C4 8E300040 */  lw          $s0, 0x40($s1)
/* 0043C8 9FC043C8 27A40018 */  addiu       $a0, $sp, 0x18
/* 0043CC 9FC043CC 00108140 */  sll         $s0, $s0, 5
/* 0043D0 9FC043D0 0FF00C74 */  jal         virage2_gen_public_key
/* 0043D4 9FC043D4 26100004 */   addiu      $s0, $s0, 4
/* 0043D8 9FC043D8 3C020609 */  lui         $v0, (0x06091968 >> 16)
/* 0043DC 9FC043DC 34421968 */  ori         $v0, $v0, (0x06091968 & 0xFFFF)
/* 0043E0 9FC043E0 26240040 */  addiu       $a0, $s1, 0x40
/* 0043E4 9FC043E4 02002821 */  addu        $a1, $s0, $zero
/* 0043E8 9FC043E8 27A60018 */  addiu       $a2, $sp, 0x18
/* 0043EC 9FC043EC 02203821 */  addu        $a3, $s1, $zero
/* 0043F0 9FC043F0 0FF00DC5 */  jal         verify_ecc_signature
/* 0043F4 9FC043F4 AFA20010 */   sw         $v0, 0x10($sp)
/* 0043F8 9FC043F8 14400002 */  bnez        $v0, .L9FC04404
/* 0043FC 9FC043FC 2402FFFF */   addiu      $v0, $zero, -1
/* 004400 9FC04400 00001021 */  addu        $v0, $zero, $zero
.L9FC04404:
/* 004404 9FC04404 8FBF0060 */  lw          $ra, 0x60($sp)
/* 004408 9FC04408 8FB1005C */  lw          $s1, 0x5c($sp)
/* 00440C 9FC0440C 8FB00058 */  lw          $s0, 0x58($sp)
/* 004410 9FC04410 03E00008 */  jr          $ra
/* 004414 9FC04414 27BD0068 */   addiu      $sp, $sp, 0x68
