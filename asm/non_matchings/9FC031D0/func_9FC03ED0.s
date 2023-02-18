## startup
/* 003ED0 9FC03ED0 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 003ED4 9FC03ED4 00801821 */  addu        $v1, $a0, $zero
/* 003ED8 9FC03ED8 3C029FC1 */  lui         $v0, %hi(aEntering_excep)
/* 003EDC 9FC03EDC 2442EBD0 */  addiu       $v0, $v0, %lo(aEntering_excep)
/* 003EE0 9FC03EE0 3C04A000 */  lui         $a0, 0xa000
/* 003EE4 9FC03EE4 AFBF0010 */  sw          $ra, 0x10($sp)
/* 003EE8 9FC03EE8 0060F809 */  jalr        $v1
/* 003EEC 9FC03EEC 00442025 */   or         $a0, $v0, $a0
/* 003EF0 9FC03EF0 3C02A460 */  lui         $v0, (0xA4600060 >> 16)
/* 003EF4 9FC03EF4 34420060 */  ori         $v0, $v0, (0xA4600060 & 0xFFFF)
/* 003EF8 9FC03EF8 24030030 */  addiu       $v1, $zero, 0x30
/* 003EFC 9FC03EFC AC430000 */  sw          $v1, ($v0)
.L9FC03F00:
/* 003F00 9FC03F00 0BF00FC0 */  j           .L9FC03F00
/* 003F04 9FC03F04 00000000 */   nop
