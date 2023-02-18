## recrypt_list_clear
## recrypt_list_add_new_entry
## recrypt_list_get_key_for_cid
/* 004418 9FC04418 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 00441C 9FC0441C 3C020609 */  lui         $v0, (0x06091968 >> 16)
/* 004420 9FC04420 00803821 */  addu        $a3, $a0, $zero
/* 004424 9FC04424 34421968 */  ori         $v0, $v0, (0x06091968 & 0xFFFF)
/* 004428 9FC04428 AFBF0018 */  sw          $ra, 0x18($sp)
/* 00442C 9FC0442C 8CE50040 */  lw          $a1, 0x40($a3)
/* 004430 9FC04430 3C069FC1 */  lui         $a2, %hi(virage2_offset)
/* 004434 9FC04434 8CC6EBC0 */  lw          $a2, %lo(virage2_offset)($a2)
/* 004438 9FC04438 24E40040 */  addiu       $a0, $a3, 0x40
/* 00443C 9FC0443C AFA20010 */  sw          $v0, 0x10($sp)
/* 004440 9FC04440 00052940 */  sll         $a1, $a1, 5
/* 004444 9FC04444 34A50004 */  ori         $a1, $a1, 4
/* 004448 9FC04448 0FF00DA5 */  jal         func_9FC03694
/* 00444C 9FC0444C 24C60098 */   addiu      $a2, $a2, 0x98
/* 004450 9FC04450 8FBF0018 */  lw          $ra, 0x18($sp)
/* 004454 9FC04454 03E00008 */  jr          $ra
/* 004458 9FC04458 27BD0020 */   addiu      $sp, $sp, 0x20
