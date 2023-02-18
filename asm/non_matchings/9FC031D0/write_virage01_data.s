## skLaunch
## skAdvanceTicketWindow
## func_9FC022A8
## check_crlbundle_version
## set_virage01_selector
/* 003BCC 9FC03BCC 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 003BD0 9FC03BD0 AFB00010 */  sw          $s0, 0x10($sp)
/* 003BD4 9FC03BD4 00808021 */  addu        $s0, $a0, $zero
/* 003BD8 9FC03BD8 AFBF0014 */  sw          $ra, 0x14($sp)
/* 003BDC 9FC03BDC 9602003C */  lhu         $v0, 0x3c($s0)
/* 003BE0 9FC03BE0 A600003E */  sh          $zero, 0x3e($s0)
/* 003BE4 9FC03BE4 24420001 */  addiu       $v0, $v0, 1
/* 003BE8 9FC03BE8 0FF00ED5 */  jal         calc_virage01_checksum
/* 003BEC 9FC03BEC A602003C */   sh         $v0, 0x3c($s0)
/* 003BF0 9FC03BF0 24037ADC */  addiu       $v1, $zero, 0x7adc
/* 003BF4 9FC03BF4 00621823 */  subu        $v1, $v1, $v0
/* 003BF8 9FC03BF8 A603003E */  sh          $v1, 0x3e($s0)
/* 003BFC 9FC03BFC 3C039FC1 */  lui         $v1, %hi(D_9FC0EBC4)
/* 003C00 9FC03C00 8063EBC4 */  lb          $v1, %lo(D_9FC0EBC4)($v1)
/* 003C04 9FC03C04 24020001 */  addiu       $v0, $zero, 1
/* 003C08 9FC03C08 14620002 */  bne         $v1, $v0, .L9FC03C14
/* 003C0C 9FC03C0C 3C041FC9 */   lui        $a0, (0x1FC9C000 >> 16)
/* 003C10 9FC03C10 3C041FC8 */  lui         $a0, 0x1fc8
.L9FC03C14:
/* 003C14 9FC03C14 3484C000 */  ori         $a0, $a0, (0x1FC9C000 & 0xFFFF)
/* 003C18 9FC03C18 02002821 */  addu        $a1, $s0, $zero
/* 003C1C 9FC03C1C 0FF00FFA */  jal         write_virage_data
/* 003C20 9FC03C20 24060010 */   addiu      $a2, $zero, 0x10
/* 003C24 9FC03C24 04400008 */  bltz        $v0, .L9FC03C48
/* 003C28 9FC03C28 00001021 */   addu       $v0, $zero, $zero
/* 003C2C 9FC03C2C 3C039FC1 */  lui         $v1, %hi(D_9FC0EBC4)
/* 003C30 9FC03C30 9063EBC4 */  lbu         $v1, %lo(D_9FC0EBC4)($v1)
/* 003C34 9FC03C34 38630001 */  xori        $v1, $v1, 1
/* 003C38 9FC03C38 3C019FC1 */  lui         $at, %hi(D_9FC0EBC4)
/* 003C3C 9FC03C3C A023EBC4 */  sb          $v1, %lo(D_9FC0EBC4)($at)
/* 003C40 9FC03C40 0BF00F14 */  j           .L9FC03C50
/* 003C44 9FC03C44 8FBF0014 */   lw         $ra, 0x14($sp)
.L9FC03C48:
/* 003C48 9FC03C48 2402FFFF */  addiu       $v0, $zero, -1
/* 003C4C 9FC03C4C 8FBF0014 */  lw          $ra, 0x14($sp)
.L9FC03C50:
/* 003C50 9FC03C50 8FB00010 */  lw          $s0, 0x10($sp)
/* 003C54 9FC03C54 03E00008 */  jr          $ra
/* 003C58 9FC03C58 27BD0018 */   addiu      $sp, $sp, 0x18
