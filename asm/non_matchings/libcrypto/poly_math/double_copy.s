## cus_times_u_to_n
/* 007C58 9FC07C58 00803821 */  addu        $a3, $a0, $zero
/* 007C5C 9FC07C5C 3C060001 */  lui         $a2, 1
.L9FC07C60:
/* 007C60 9FC07C60 8CE40000 */  lw          $a0, ($a3)
/* 007C64 9FC07C64 24E70004 */  addiu       $a3, $a3, 4
/* 007C68 9FC07C68 00C01821 */  addu        $v1, $a2, $zero
/* 007C6C 9FC07C6C 3C020001 */  lui         $v0, 1
/* 007C70 9FC07C70 00C23021 */  addu        $a2, $a2, $v0
/* 007C74 9FC07C74 00031C02 */  srl         $v1, $v1, 0x10
/* 007C78 9FC07C78 2C63000F */  sltiu       $v1, $v1, 0xf
/* 007C7C 9FC07C7C ACA40000 */  sw          $a0, ($a1)
/* 007C80 9FC07C80 1460FFF7 */  bnez        $v1, .L9FC07C60
/* 007C84 9FC07C84 24A50004 */   addiu      $a1, $a1, 4
/* 007C88 9FC07C88 03E00008 */  jr          $ra
/* 007C8C 9FC07C8C 00000000 */   nop
