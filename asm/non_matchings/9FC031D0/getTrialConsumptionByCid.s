## func_9FC00BAC
## skLaunch
## func_9FC022A8
/* 003D4C 9FC03D4C 3C039FC1 */  lui         $v1, %hi(minimum_ticket_id)
/* 003D50 9FC03D50 2463F30E */  addiu       $v1, $v1, %lo(minimum_ticket_id)
/* 003D54 9FC03D54 94620000 */  lhu         $v0, ($v1)
/* 003D58 9FC03D58 30847FFF */  andi        $a0, $a0, 0x7fff
/* 003D5C 9FC03D5C 0082102B */  sltu        $v0, $a0, $v0
/* 003D60 9FC03D60 14400006 */  bnez        $v0, .L9FC03D7C
/* 003D64 9FC03D64 00000000 */   nop
/* 003D68 9FC03D68 94650000 */  lhu         $a1, ($v1)
/* 003D6C 9FC03D6C 24A2001A */  addiu       $v0, $a1, 0x1a
/* 003D70 9FC03D70 0082102A */  slt         $v0, $a0, $v0
/* 003D74 9FC03D74 14400003 */  bnez        $v0, .L9FC03D84
/* 003D78 9FC03D78 00851023 */   subu       $v0, $a0, $a1
.L9FC03D7C:
/* 003D7C 9FC03D7C 03E00008 */  jr          $ra
/* 003D80 9FC03D80 00001021 */   addu       $v0, $zero, $zero
.L9FC03D84:
/* 003D84 9FC03D84 00021040 */  sll         $v0, $v0, 1
/* 003D88 9FC03D88 24630002 */  addiu       $v1, $v1, 2
/* 003D8C 9FC03D8C 03E00008 */  jr          $ra
/* 003D90 9FC03D90 00431021 */   addu       $v0, $v0, $v1
