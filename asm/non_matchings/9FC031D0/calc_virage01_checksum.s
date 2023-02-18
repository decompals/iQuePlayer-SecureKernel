## read_virage01
## write_virage01_data
/* 003B54 9FC03B54 00002821 */  addu        $a1, $zero, $zero
/* 003B58 9FC03B58 00001821 */  addu        $v1, $zero, $zero
.L9FC03B5C:
/* 003B5C 9FC03B5C 94820000 */  lhu         $v0, ($a0)
/* 003B60 9FC03B60 24630001 */  addiu       $v1, $v1, 1
/* 003B64 9FC03B64 00A21021 */  addu        $v0, $a1, $v0
/* 003B68 9FC03B68 3045FFFF */  andi        $a1, $v0, 0xffff
/* 003B6C 9FC03B6C 28620020 */  slti        $v0, $v1, 0x20
/* 003B70 9FC03B70 1440FFFA */  bnez        $v0, .L9FC03B5C
/* 003B74 9FC03B74 24840002 */   addiu      $a0, $a0, 2
/* 003B78 9FC03B78 03E00008 */  jr          $ra
/* 003B7C 9FC03B7C 00A01021 */   addu       $v0, $a1, $zero
