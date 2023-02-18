## single_to_double
## poly_mul_partial
## poly_mul
## cus_times_u_to_n
/* 007BAC 9FC07BAC 3C050001 */  lui         $a1, 1
.L9FC07BB0:
/* 007BB0 9FC07BB0 AC800000 */  sw          $zero, ($a0)
/* 007BB4 9FC07BB4 24840004 */  addiu       $a0, $a0, 4
/* 007BB8 9FC07BB8 00A01821 */  addu        $v1, $a1, $zero
/* 007BBC 9FC07BBC 3C020001 */  lui         $v0, 1
/* 007BC0 9FC07BC0 00031C02 */  srl         $v1, $v1, 0x10
/* 007BC4 9FC07BC4 2C63000F */  sltiu       $v1, $v1, 0xf
/* 007BC8 9FC07BC8 1460FFF9 */  bnez        $v1, .L9FC07BB0
/* 007BCC 9FC07BCC 00A22821 */   addu       $a1, $a1, $v0
/* 007BD0 9FC07BD0 03E00008 */  jr          $ra
/* 007BD4 9FC07BD4 00000000 */   nop
