## poly_mul
## cus_times_u_to_n
/* 007CF4 9FC07CF4 3C060001 */  lui         $a2, 1
/* 007CF8 9FC07CF8 2484001C */  addiu       $a0, $a0, 0x1c
.L9FC07CFC:
/* 007CFC 9FC07CFC 00C01021 */  addu        $v0, $a2, $zero
/* 007D00 9FC07D00 3C030001 */  lui         $v1, 1
/* 007D04 9FC07D04 00C33021 */  addu        $a2, $a2, $v1
/* 007D08 9FC07D08 8C830000 */  lw          $v1, ($a0)
/* 007D0C 9FC07D0C 24840004 */  addiu       $a0, $a0, 4
/* 007D10 9FC07D10 00021402 */  srl         $v0, $v0, 0x10
/* 007D14 9FC07D14 2C420008 */  sltiu       $v0, $v0, 8
/* 007D18 9FC07D18 ACA30000 */  sw          $v1, ($a1)
/* 007D1C 9FC07D1C 1440FFF7 */  bnez        $v0, .L9FC07CFC
/* 007D20 9FC07D20 24A50004 */   addiu      $a1, $a1, 4
/* 007D24 9FC07D24 03E00008 */  jr          $ra
/* 007D28 9FC07D28 00000000 */   nop
