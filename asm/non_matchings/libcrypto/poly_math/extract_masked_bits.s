## shift_and_add
## cus_times_u_to_n
/* 0082D8 9FC082D8 3C080001 */  lui         $t0, 1
/* 0082DC 9FC082DC 00803821 */  addu        $a3, $a0, $zero
.L9FC082E0:
/* 0082E0 9FC082E0 01001821 */  addu        $v1, $t0, $zero
/* 0082E4 9FC082E4 3C020001 */  lui         $v0, 1
/* 0082E8 9FC082E8 01024021 */  addu        $t0, $t0, $v0
/* 0082EC 9FC082EC 8CA40000 */  lw          $a0, ($a1)
/* 0082F0 9FC082F0 24A50004 */  addiu       $a1, $a1, 4
/* 0082F4 9FC082F4 8CE20000 */  lw          $v0, ($a3)
/* 0082F8 9FC082F8 24E70004 */  addiu       $a3, $a3, 4
/* 0082FC 9FC082FC 00031C02 */  srl         $v1, $v1, 0x10
/* 008300 9FC08300 2C63000F */  sltiu       $v1, $v1, 0xf
/* 008304 9FC08304 00441024 */  and         $v0, $v0, $a0
/* 008308 9FC08308 ACC20000 */  sw          $v0, ($a2)
/* 00830C 9FC0830C 1460FFF4 */  bnez        $v1, .L9FC082E0
/* 008310 9FC08310 24C60004 */   addiu      $a2, $a2, 4
/* 008314 9FC08314 03E00008 */  jr          $ra
/* 008318 9FC08318 00000000 */   nop
