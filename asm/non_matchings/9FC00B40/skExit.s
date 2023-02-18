/* 001A58 9FC01A58 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 001A5C 9FC01A5C AFBF0010 */  sw          $ra, 0x10($sp)
/* 001A60 9FC01A60 0FF00013 */  jal         startup
/* 001A64 9FC01A64 00000000 */   nop
/* 001A68 9FC01A68 8FBF0010 */  lw          $ra, 0x10($sp)
/* 001A6C 9FC01A6C 00001021 */  addu        $v0, $zero, $zero
/* 001A70 9FC01A70 03E00008 */  jr          $ra
/* 001A74 9FC01A74 27BD0018 */   addiu      $sp, $sp, 0x18
