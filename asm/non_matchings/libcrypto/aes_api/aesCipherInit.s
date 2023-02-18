## skRecryptBegin
## skRecryptData
## aes_SwEncrypt
## aes_SwDecrypt
/* 004CD8 9FC04CD8 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 004CDC 9FC04CDC 30A500FF */  andi        $a1, $a1, 0xff
/* 004CE0 9FC04CE0 24A2FFFF */  addiu       $v0, $a1, -1
/* 004CE4 9FC04CE4 2C420002 */  sltiu       $v0, $v0, 2
/* 004CE8 9FC04CE8 14400003 */  bnez        $v0, .L9FC04CF8
/* 004CEC 9FC04CEC AFBF0010 */   sw         $ra, 0x10($sp)
/* 004CF0 9FC04CF0 0BF0134A */  j           .L9FC04D28
/* 004CF4 9FC04CF4 2402FFFC */   addiu      $v0, $zero, -4
.L9FC04CF8:
/* 004CF8 9FC04CF8 10C00007 */  beqz        $a2, .L9FC04D18
/* 004CFC 9FC04CFC AC850000 */   sw         $a1, ($a0)
/* 004D00 9FC04D00 24840004 */  addiu       $a0, $a0, 4
/* 004D04 9FC04D04 00C02821 */  addu        $a1, $a2, $zero
/* 004D08 9FC04D08 0FF00EA1 */  jal         memcpy
/* 004D0C 9FC04D0C 24060010 */   addiu      $a2, $zero, 0x10
/* 004D10 9FC04D10 0BF0134A */  j           .L9FC04D28
/* 004D14 9FC04D14 24020001 */   addiu      $v0, $zero, 1
.L9FC04D18:
/* 004D18 9FC04D18 24840004 */  addiu       $a0, $a0, 4
/* 004D1C 9FC04D1C 0FF00EBF */  jal         memclear
/* 004D20 9FC04D20 24050010 */   addiu      $a1, $zero, 0x10
/* 004D24 9FC04D24 24020001 */  addiu       $v0, $zero, 1
.L9FC04D28:
/* 004D28 9FC04D28 8FBF0010 */  lw          $ra, 0x10($sp)
/* 004D2C 9FC04D2C 03E00008 */  jr          $ra
/* 004D30 9FC04D30 27BD0018 */   addiu      $sp, $sp, 0x18
