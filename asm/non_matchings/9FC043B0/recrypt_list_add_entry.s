## recrypt_list_add_new_entry
## recrypt_list_get_key_for_cid
/* 0044E8 9FC044E8 27BDFFA8 */  addiu       $sp, $sp, -0x58
/* 0044EC 9FC044EC 00803821 */  addu        $a3, $a0, $zero
/* 0044F0 9FC044F0 AFB20050 */  sw          $s2, 0x50($sp)
/* 0044F4 9FC044F4 00A09021 */  addu        $s2, $a1, $zero
/* 0044F8 9FC044F8 AFB1004C */  sw          $s1, 0x4c($sp)
/* 0044FC 9FC044FC 00C08821 */  addu        $s1, $a2, $zero
/* 004500 9FC04500 00003021 */  addu        $a2, $zero, $zero
/* 004504 9FC04504 AFBF0054 */  sw          $ra, 0x54($sp)
/* 004508 9FC04508 AFB00048 */  sw          $s0, 0x48($sp)
/* 00450C 9FC0450C 00061080 */  sll         $v0, $a2, 2
.L9FC04510:
/* 004510 9FC04510 3C049FC1 */  lui         $a0, %hi(virage2_offset)
/* 004514 9FC04514 8C84EBC0 */  lw          $a0, %lo(virage2_offset)($a0)
/* 004518 9FC04518 27A50038 */  addiu       $a1, $sp, 0x38
/* 00451C 9FC0451C 8C830094 */  lw          $v1, 0x94($a0)
/* 004520 9FC04520 00A21021 */  addu        $v0, $a1, $v0
/* 004524 9FC04524 00661821 */  addu        $v1, $v1, $a2
/* 004528 9FC04528 24C60001 */  addiu       $a2, $a2, 1
/* 00452C 9FC0452C AC430000 */  sw          $v1, ($v0)
/* 004530 9FC04530 2CC20004 */  sltiu       $v0, $a2, 4
/* 004534 9FC04534 1440FFF6 */  bnez        $v0, .L9FC04510
/* 004538 9FC04538 00061080 */   sll        $v0, $a2, 2
/* 00453C 9FC0453C 27B00018 */  addiu       $s0, $sp, 0x18
/* 004540 9FC04540 248400C8 */  addiu       $a0, $a0, 0xc8
/* 004544 9FC04544 00E03021 */  addu        $a2, $a3, $zero
/* 004548 9FC04548 24070020 */  addiu       $a3, $zero, 0x20
/* 00454C 9FC0454C 0FF012A9 */  jal         aes_SwEncrypt
/* 004550 9FC04550 AFB00010 */   sw         $s0, 0x10($sp)
/* 004554 9FC04554 00112140 */  sll         $a0, $s1, 5
/* 004558 9FC04558 24840044 */  addiu       $a0, $a0, 0x44
/* 00455C 9FC0455C 02442021 */  addu        $a0, $s2, $a0
/* 004560 9FC04560 02002821 */  addu        $a1, $s0, $zero
/* 004564 9FC04564 0FF00EA1 */  jal         memcpy
/* 004568 9FC04568 24060020 */   addiu      $a2, $zero, 0x20
/* 00456C 9FC0456C 8FBF0054 */  lw          $ra, 0x54($sp)
/* 004570 9FC04570 8FB20050 */  lw          $s2, 0x50($sp)
/* 004574 9FC04574 8FB1004C */  lw          $s1, 0x4c($sp)
/* 004578 9FC04578 8FB00048 */  lw          $s0, 0x48($sp)
/* 00457C 9FC0457C 03E00008 */  jr          $ra
/* 004580 9FC04580 27BD0058 */   addiu      $sp, $sp, 0x58
