## aesCipherInit
## SHA1Result
/* 003AFC 9FC03AFC 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 003B00 9FC03B00 00A03021 */  addu        $a2, $a1, $zero
/* 003B04 9FC03B04 AFBF0010 */  sw          $ra, 0x10($sp)
/* 003B08 9FC03B08 0FF00EB5 */  jal         memset
/* 003B0C 9FC03B0C 00002821 */   addu       $a1, $zero, $zero
/* 003B10 9FC03B10 8FBF0010 */  lw          $ra, 0x10($sp)
/* 003B14 9FC03B14 03E00008 */  jr          $ra
/* 003B18 9FC03B18 27BD0018 */   addiu      $sp, $sp, 0x18
