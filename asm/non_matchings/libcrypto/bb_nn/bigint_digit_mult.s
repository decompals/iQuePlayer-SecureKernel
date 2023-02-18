## bigint_add_digit_mult
## bigint_sub_digit_mult
/* 006A20 9FC06A20 30A2FFFF */  andi        $v0, $a1, 0xffff
/* 006A24 9FC06A24 00061C02 */  srl         $v1, $a2, 0x10
/* 006A28 9FC06A28 00430018 */  mult        $v0, $v1
/* 006A2C 9FC06A2C 00004012 */  mflo        $t0
/* 006A30 9FC06A30 00052C02 */  srl         $a1, $a1, 0x10
/* 006A34 9FC06A34 30C6FFFF */  andi        $a2, $a2, 0xffff
/* 006A38 9FC06A38 00A60018 */  mult        $a1, $a2
/* 006A3C 9FC06A3C 00003812 */  mflo        $a3
/* 006A40 9FC06A40 00000000 */  nop
/* 006A44 9FC06A44 00000000 */  nop
/* 006A48 9FC06A48 00460018 */  mult        $v0, $a2
/* 006A4C 9FC06A4C 00001012 */  mflo        $v0
/* 006A50 9FC06A50 00000000 */  nop
/* 006A54 9FC06A54 00000000 */  nop
/* 006A58 9FC06A58 00A30018 */  mult        $a1, $v1
/* 006A5C 9FC06A5C 01074021 */  addu        $t0, $t0, $a3
/* 006A60 9FC06A60 AC820000 */  sw          $v0, ($a0)
/* 006A64 9FC06A64 0107102B */  sltu        $v0, $t0, $a3
/* 006A68 9FC06A68 00002812 */  mflo        $a1
/* 006A6C 9FC06A6C 10400004 */  beqz        $v0, .L9FC06A80
/* 006A70 9FC06A70 AC850004 */   sw         $a1, 4($a0)
/* 006A74 9FC06A74 3C020001 */  lui         $v0, 1
/* 006A78 9FC06A78 00A21021 */  addu        $v0, $a1, $v0
/* 006A7C 9FC06A7C AC820004 */  sw          $v0, 4($a0)
.L9FC06A80:
/* 006A80 9FC06A80 8C820000 */  lw          $v0, ($a0)
/* 006A84 9FC06A84 00083C00 */  sll         $a3, $t0, 0x10
/* 006A88 9FC06A88 00471021 */  addu        $v0, $v0, $a3
/* 006A8C 9FC06A8C AC820000 */  sw          $v0, ($a0)
/* 006A90 9FC06A90 0047102B */  sltu        $v0, $v0, $a3
/* 006A94 9FC06A94 10400004 */  beqz        $v0, .L9FC06AA8
/* 006A98 9FC06A98 8C820004 */   lw         $v0, 4($a0)
/* 006A9C 9FC06A9C 24420001 */  addiu       $v0, $v0, 1
/* 006AA0 9FC06AA0 AC820004 */  sw          $v0, 4($a0)
/* 006AA4 9FC06AA4 8C820004 */  lw          $v0, 4($a0)
.L9FC06AA8:
/* 006AA8 9FC06AA8 00081C02 */  srl         $v1, $t0, 0x10
/* 006AAC 9FC06AAC 00431021 */  addu        $v0, $v0, $v1
/* 006AB0 9FC06AB0 03E00008 */  jr          $ra
/* 006AB4 9FC06AB4 AC820004 */   sw         $v0, 4($a0)
