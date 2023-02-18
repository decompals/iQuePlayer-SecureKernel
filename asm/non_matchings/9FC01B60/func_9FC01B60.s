## func_9FC01D54
## func_9FC020C4
/* 001B60 9FC01B60 00041202 */  srl         $v0, $a0, 8
/* 001B64 9FC01B64 304300FF */  andi        $v1, $v0, 0xff
/* 001B68 9FC01B68 00041402 */  srl         $v0, $a0, 0x10
/* 001B6C 9FC01B6C 304200FF */  andi        $v0, $v0, 0xff
/* 001B70 9FC01B70 14620003 */  bne         $v1, $v0, .L9FC01B80
/* 001B74 9FC01B74 00041602 */   srl        $v0, $a0, 0x18
/* 001B78 9FC01B78 03E00008 */  jr          $ra
/* 001B7C 9FC01B7C 00601021 */   addu       $v0, $v1, $zero
.L9FC01B80:
/* 001B80 9FC01B80 03E00008 */  jr          $ra
/* 001B84 9FC01B84 00000000 */   nop
