## write_virage_data
## func_9FC0425C
## func_9FC04304
/* 003F10 9FC03F10 18800005 */  blez        $a0, .L9FC03F28
/* 003F14 9FC03F14 00001821 */   addu       $v1, $zero, $zero
/* 003F18 9FC03F18 24630001 */  addiu       $v1, $v1, 1
.L9FC03F1C:
/* 003F1C 9FC03F1C 0064102A */  slt         $v0, $v1, $a0
/* 003F20 9FC03F20 1440FFFE */  bnez        $v0, .L9FC03F1C
/* 003F24 9FC03F24 24630001 */   addiu      $v1, $v1, 1
.L9FC03F28:
/* 003F28 9FC03F28 03E00008 */  jr          $ra
/* 003F2C 9FC03F2C 00000000 */   nop
