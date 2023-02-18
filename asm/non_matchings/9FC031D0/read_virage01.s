## set_virage01_selector
/* 003B80 9FC03B80 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 003B84 9FC03B84 AFB00010 */  sw          $s0, 0x10($sp)
/* 003B88 9FC03B88 00A08021 */  addu        $s0, $a1, $zero
/* 003B8C 9FC03B8C 3C02A000 */  lui         $v0, 0xa000
/* 003B90 9FC03B90 00822825 */  or          $a1, $a0, $v0
/* 003B94 9FC03B94 02002021 */  addu        $a0, $s0, $zero
/* 003B98 9FC03B98 AFBF0014 */  sw          $ra, 0x14($sp)
/* 003B9C 9FC03B9C 0FF00EAB */  jal         wordcopy
/* 003BA0 9FC03BA0 24060010 */   addiu      $a2, $zero, 0x10
/* 003BA4 9FC03BA4 0FF00ED5 */  jal         calc_virage01_checksum
/* 003BA8 9FC03BA8 02002021 */   addu       $a0, $s0, $zero
/* 003BAC 9FC03BAC 24037ADC */  addiu       $v1, $zero, 0x7adc
/* 003BB0 9FC03BB0 14430002 */  bne         $v0, $v1, .L9FC03BBC
/* 003BB4 9FC03BB4 2402FFFF */   addiu      $v0, $zero, -1
/* 003BB8 9FC03BB8 9602003C */  lhu         $v0, 0x3c($s0)
.L9FC03BBC:
/* 003BBC 9FC03BBC 8FBF0014 */  lw          $ra, 0x14($sp)
/* 003BC0 9FC03BC0 8FB00010 */  lw          $s0, 0x10($sp)
/* 003BC4 9FC03BC4 03E00008 */  jr          $ra
/* 003BC8 9FC03BC8 27BD0018 */   addiu      $sp, $sp, 0x18
