## memclear
## set_virage01_selector
## func_9FC047CC
/* 003AD4 9FC03AD4 10C00007 */  beqz        $a2, .L9FC03AF4
/* 003AD8 9FC03AD8 00001821 */   addu       $v1, $zero, $zero
/* 003ADC 9FC03ADC 00831021 */  addu        $v0, $a0, $v1
.L9FC03AE0:
/* 003AE0 9FC03AE0 A0450000 */  sb          $a1, ($v0)
/* 003AE4 9FC03AE4 24630001 */  addiu       $v1, $v1, 1
/* 003AE8 9FC03AE8 0066102B */  sltu        $v0, $v1, $a2
/* 003AEC 9FC03AEC 1440FFFC */  bnez        $v0, .L9FC03AE0
/* 003AF0 9FC03AF0 00831021 */   addu       $v0, $a0, $v1
.L9FC03AF4:
/* 003AF4 9FC03AF4 03E00008 */  jr          $ra
/* 003AF8 9FC03AF8 00801021 */   addu       $v0, $a0, $zero
