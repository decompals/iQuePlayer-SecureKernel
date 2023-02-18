## initialize_virage_controllers
/* 003F30 9FC03F30 3C02FFFF */  lui         $v0, 0xffff
/* 003F34 9FC03F34 00822024 */  and         $a0, $a0, $v0
/* 003F38 9FC03F38 34828000 */  ori         $v0, $a0, 0x8000
/* 003F3C 9FC03F3C 3C05A000 */  lui         $a1, 0xa000
/* 003F40 9FC03F40 00451025 */  or          $v0, $v0, $a1
/* 003F44 9FC03F44 2403008A */  addiu       $v1, $zero, 0x8a
/* 003F48 9FC03F48 AC430000 */  sw          $v1, ($v0)
/* 003F4C 9FC03F4C 34828004 */  ori         $v0, $a0, 0x8004
/* 003F50 9FC03F50 00451025 */  or          $v0, $v0, $a1
/* 003F54 9FC03F54 24030013 */  addiu       $v1, $zero, 0x13
/* 003F58 9FC03F58 AC430000 */  sw          $v1, ($v0)
/* 003F5C 9FC03F5C 34828008 */  ori         $v0, $a0, 0x8008
/* 003F60 9FC03F60 00451025 */  or          $v0, $v0, $a1
/* 003F64 9FC03F64 24030080 */  addiu       $v1, $zero, 0x80
/* 003F68 9FC03F68 AC430000 */  sw          $v1, ($v0)
/* 003F6C 9FC03F6C 3482800C */  ori         $v0, $a0, 0x800c
/* 003F70 9FC03F70 00451025 */  or          $v0, $v0, $a1
/* 003F74 9FC03F74 24030092 */  addiu       $v1, $zero, 0x92
/* 003F78 9FC03F78 AC430000 */  sw          $v1, ($v0)
/* 003F7C 9FC03F7C 34828010 */  ori         $v0, $a0, 0x8010
/* 003F80 9FC03F80 00451025 */  or          $v0, $v0, $a1
/* 003F84 9FC03F84 24030018 */  addiu       $v1, $zero, 0x18
/* 003F88 9FC03F88 34848014 */  ori         $a0, $a0, 0x8014
/* 003F8C 9FC03F8C 00852025 */  or          $a0, $a0, $a1
/* 003F90 9FC03F90 AC430000 */  sw          $v1, ($v0)
/* 003F94 9FC03F94 24020005 */  addiu       $v0, $zero, 5
/* 003F98 9FC03F98 AC820000 */  sw          $v0, ($a0)
/* 003F9C 9FC03F9C 03E00008 */  jr          $ra
/* 003FA0 9FC03FA0 00000000 */   nop
