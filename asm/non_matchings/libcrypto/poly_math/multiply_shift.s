## poly_mul_partial
/* 007D2C 9FC07D2C 24850038 */  addiu       $a1, $a0, 0x38
/* 007D30 9FC07D30 00003821 */  addu        $a3, $zero, $zero
/* 007D34 9FC07D34 3C060001 */  lui         $a2, 1
.L9FC07D38:
/* 007D38 9FC07D38 00C01821 */  addu        $v1, $a2, $zero
/* 007D3C 9FC07D3C 3C020001 */  lui         $v0, 1
/* 007D40 9FC07D40 00C23021 */  addu        $a2, $a2, $v0
/* 007D44 9FC07D44 00031C02 */  srl         $v1, $v1, 0x10
/* 007D48 9FC07D48 8CA40000 */  lw          $a0, ($a1)
/* 007D4C 9FC07D4C 2C63000F */  sltiu       $v1, $v1, 0xf
/* 007D50 9FC07D50 00041040 */  sll         $v0, $a0, 1
/* 007D54 9FC07D54 00471025 */  or          $v0, $v0, $a3
/* 007D58 9FC07D58 00043FC2 */  srl         $a3, $a0, 0x1f
/* 007D5C 9FC07D5C ACA20000 */  sw          $v0, ($a1)
/* 007D60 9FC07D60 1460FFF5 */  bnez        $v1, .L9FC07D38
/* 007D64 9FC07D64 24A5FFFC */   addiu      $a1, $a1, -4
/* 007D68 9FC07D68 03E00008 */  jr          $ra
/* 007D6C 9FC07D6C 00000000 */   nop
