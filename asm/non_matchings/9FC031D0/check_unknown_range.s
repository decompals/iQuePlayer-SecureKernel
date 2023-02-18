## check_certs_against_revocation_list
/* 003DD0 9FC03DD0 3C03603C */  lui         $v1, 0x603c
/* 003DD4 9FC03DD4 00831021 */  addu        $v0, $a0, $v1
/* 003DD8 9FC03DD8 2C424001 */  sltiu       $v0, $v0, 0x4001
/* 003DDC 9FC03DDC 00852821 */  addu        $a1, $a0, $a1
/* 003DE0 9FC03DE0 00A32821 */  addu        $a1, $a1, $v1
/* 003DE4 9FC03DE4 2CA54001 */  sltiu       $a1, $a1, 0x4001
/* 003DE8 9FC03DE8 00451024 */  and         $v0, $v0, $a1
/* 003DEC 9FC03DEC 24C6FFFF */  addiu       $a2, $a2, -1
/* 003DF0 9FC03DF0 00862024 */  and         $a0, $a0, $a2
/* 003DF4 9FC03DF4 2C840001 */  sltiu       $a0, $a0, 1
/* 003DF8 9FC03DF8 03E00008 */  jr          $ra
/* 003DFC 9FC03DFC 00441024 */   and        $v0, $v0, $a0
