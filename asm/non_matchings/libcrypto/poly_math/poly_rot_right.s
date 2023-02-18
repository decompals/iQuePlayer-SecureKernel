## poly_elliptic_mul_slow
/* 008E44 9FC08E44 8C82001C */  lw          $v0, 0x1c($a0)
/* 008E48 9FC08E48 30420001 */  andi        $v0, $v0, 1
/* 008E4C 9FC08E4C 14400002 */  bnez        $v0, .L9FC08E58
/* 008E50 9FC08E50 24060100 */   addiu      $a2, $zero, 0x100
/* 008E54 9FC08E54 00003021 */  addu        $a2, $zero, $zero
.L9FC08E58:
/* 008E58 9FC08E58 3C070001 */  lui         $a3, 1
/* 008E5C 9FC08E5C 00802821 */  addu        $a1, $a0, $zero
.L9FC08E60:
/* 008E60 9FC08E60 8CA30000 */  lw          $v1, ($a1)
/* 008E64 9FC08E64 00031042 */  srl         $v0, $v1, 1
/* 008E68 9FC08E68 30630001 */  andi        $v1, $v1, 1
/* 008E6C 9FC08E6C 10600003 */  beqz        $v1, .L9FC08E7C
/* 008E70 9FC08E70 00461025 */   or         $v0, $v0, $a2
/* 008E74 9FC08E74 0BF023A0 */  j           .L9FC08E80
/* 008E78 9FC08E78 3C068000 */   lui        $a2, 0x8000
.L9FC08E7C:
/* 008E7C 9FC08E7C 00003021 */  addu        $a2, $zero, $zero
.L9FC08E80:
/* 008E80 9FC08E80 ACA20000 */  sw          $v0, ($a1)
/* 008E84 9FC08E84 00E01821 */  addu        $v1, $a3, $zero
/* 008E88 9FC08E88 3C020001 */  lui         $v0, 1
/* 008E8C 9FC08E8C 00E23821 */  addu        $a3, $a3, $v0
/* 008E90 9FC08E90 00031C02 */  srl         $v1, $v1, 0x10
/* 008E94 9FC08E94 2C630008 */  sltiu       $v1, $v1, 8
/* 008E98 9FC08E98 1460FFF1 */  bnez        $v1, .L9FC08E60
/* 008E9C 9FC08E9C 24A50004 */   addiu      $a1, $a1, 4
/* 008EA0 9FC08EA0 8C820000 */  lw          $v0, ($a0)
/* 008EA4 9FC08EA4 304201FF */  andi        $v0, $v0, 0x1ff
/* 008EA8 9FC08EA8 03E00008 */  jr          $ra
/* 008EAC 9FC08EAC AC820000 */   sw         $v0, ($a0)
