## shift_and_add
## cus_times_u_to_n
/* 007BD8 9FC07BD8 00804821 */  addu        $t1, $a0, $zero
/* 007BDC 9FC07BDC 00A04021 */  addu        $t0, $a1, $zero
/* 007BE0 9FC07BE0 3C070001 */  lui         $a3, 1
.L9FC07BE4:
/* 007BE4 9FC07BE4 8D240000 */  lw          $a0, ($t1)
/* 007BE8 9FC07BE8 25290004 */  addiu       $t1, $t1, 4
/* 007BEC 9FC07BEC 8D050000 */  lw          $a1, ($t0)
/* 007BF0 9FC07BF0 25080004 */  addiu       $t0, $t0, 4
/* 007BF4 9FC07BF4 00E01821 */  addu        $v1, $a3, $zero
/* 007BF8 9FC07BF8 3C020001 */  lui         $v0, 1
/* 007BFC 9FC07BFC 00E23821 */  addu        $a3, $a3, $v0
/* 007C00 9FC07C00 00031C02 */  srl         $v1, $v1, 0x10
/* 007C04 9FC07C04 2C63000F */  sltiu       $v1, $v1, 0xf
/* 007C08 9FC07C08 00852026 */  xor         $a0, $a0, $a1
/* 007C0C 9FC07C0C ACC40000 */  sw          $a0, ($a2)
/* 007C10 9FC07C10 1460FFF4 */  bnez        $v1, .L9FC07BE4
/* 007C14 9FC07C14 24C60004 */   addiu      $a2, $a2, 4
/* 007C18 9FC07C18 03E00008 */  jr          $ra
/* 007C1C 9FC07C1C 00000000 */   nop
