## bigint_div
/* 006CB0 9FC06CB0 27BDFFF8 */  addiu       $sp, $sp, -8
/* 006CB4 9FC06CB4 8CA20000 */  lw          $v0, ($a1)
/* 006CB8 9FC06CB8 8CA30004 */  lw          $v1, 4($a1)
/* 006CBC 9FC06CBC 00062C02 */  srl         $a1, $a2, 0x10
/* 006CC0 9FC06CC0 30CBFFFF */  andi        $t3, $a2, 0xffff
/* 006CC4 9FC06CC4 AFA20000 */  sw          $v0, ($sp)
/* 006CC8 9FC06CC8 3402FFFF */  ori         $v0, $zero, 0xffff
/* 006CCC 9FC06CCC 14A20003 */  bne         $a1, $v0, .L9FC06CDC
/* 006CD0 9FC06CD0 AFA30004 */   sw         $v1, 4($sp)
/* 006CD4 9FC06CD4 0BF01B3E */  j           .L9FC06CF8
/* 006CD8 9FC06CD8 00035402 */   srl        $t2, $v1, 0x10
.L9FC06CDC:
/* 006CDC 9FC06CDC 24A20001 */  addiu       $v0, $a1, 1
/* 006CE0 9FC06CE0 14400002 */  bnez        $v0, .L9FC06CEC
/* 006CE4 9FC06CE4 0062001B */   divu       $zero, $v1, $v0
/* 006CE8 9FC06CE8 0007000D */  break       7
.L9FC06CEC:
/* 006CEC 9FC06CEC 00001012 */  mflo        $v0
/* 006CF0 9FC06CF0 304AFFFF */  andi        $t2, $v0, 0xffff
/* 006CF4 9FC06CF4 00000000 */  nop
.L9FC06CF8:
/* 006CF8 9FC06CF8 014B0018 */  mult        $t2, $t3
/* 006CFC 9FC06CFC 00003812 */  mflo        $a3
/* 006D00 9FC06D00 8FA30000 */  lw          $v1, ($sp)
/* 006D04 9FC06D04 00071400 */  sll         $v0, $a3, 0x10
/* 006D08 9FC06D08 01450018 */  mult        $t2, $a1
/* 006D0C 9FC06D0C 00621823 */  subu        $v1, $v1, $v0
/* 006D10 9FC06D10 00021027 */  nor         $v0, $zero, $v0
/* 006D14 9FC06D14 0043102B */  sltu        $v0, $v0, $v1
/* 006D18 9FC06D18 00004812 */  mflo        $t1
/* 006D1C 9FC06D1C 10400004 */  beqz        $v0, .L9FC06D30
/* 006D20 9FC06D20 AFA30000 */   sw         $v1, ($sp)
/* 006D24 9FC06D24 8FA20004 */  lw          $v0, 4($sp)
/* 006D28 9FC06D28 2442FFFF */  addiu       $v0, $v0, -1
/* 006D2C 9FC06D2C AFA20004 */  sw          $v0, 4($sp)
.L9FC06D30:
/* 006D30 9FC06D30 8FA20004 */  lw          $v0, 4($sp)
/* 006D34 9FC06D34 00071C02 */  srl         $v1, $a3, 0x10
/* 006D38 9FC06D38 00431023 */  subu        $v0, $v0, $v1
/* 006D3C 9FC06D3C 0BF01B63 */  j           .L9FC06D8C
/* 006D40 9FC06D40 00491823 */   subu       $v1, $v0, $t1
.L9FC06D44:
/* 006D44 9FC06D44 000B1C00 */  sll         $v1, $t3, 0x10
/* 006D48 9FC06D48 0043102B */  sltu        $v0, $v0, $v1
/* 006D4C 9FC06D4C 14400015 */  bnez        $v0, .L9FC06DA4
/* 006D50 9FC06D50 3402FFFF */   ori        $v0, $zero, 0xffff
.L9FC06D54:
/* 006D54 9FC06D54 8FA30000 */  lw          $v1, ($sp)
/* 006D58 9FC06D58 000B1400 */  sll         $v0, $t3, 0x10
/* 006D5C 9FC06D5C 00621823 */  subu        $v1, $v1, $v0
/* 006D60 9FC06D60 00021027 */  nor         $v0, $zero, $v0
/* 006D64 9FC06D64 0043102B */  sltu        $v0, $v0, $v1
/* 006D68 9FC06D68 10400004 */  beqz        $v0, .L9FC06D7C
/* 006D6C 9FC06D6C AFA30000 */   sw         $v1, ($sp)
/* 006D70 9FC06D70 8FA20004 */  lw          $v0, 4($sp)
/* 006D74 9FC06D74 2442FFFF */  addiu       $v0, $v0, -1
/* 006D78 9FC06D78 AFA20004 */  sw          $v0, 4($sp)
.L9FC06D7C:
/* 006D7C 9FC06D7C 25420001 */  addiu       $v0, $t2, 1
/* 006D80 9FC06D80 8FA30004 */  lw          $v1, 4($sp)
/* 006D84 9FC06D84 304AFFFF */  andi        $t2, $v0, 0xffff
/* 006D88 9FC06D88 00651823 */  subu        $v1, $v1, $a1
.L9FC06D8C:
/* 006D8C 9FC06D8C 00A3102B */  sltu        $v0, $a1, $v1
/* 006D90 9FC06D90 1440FFF0 */  bnez        $v0, .L9FC06D54
/* 006D94 9FC06D94 AFA30004 */   sw         $v1, 4($sp)
/* 006D98 9FC06D98 1065FFEA */  beq         $v1, $a1, .L9FC06D44
/* 006D9C 9FC06D9C 8FA20000 */   lw         $v0, ($sp)
/* 006DA0 9FC06DA0 3402FFFF */  ori         $v0, $zero, 0xffff
.L9FC06DA4:
/* 006DA4 9FC06DA4 14A20003 */  bne         $a1, $v0, .L9FC06DB4
/* 006DA8 9FC06DA8 8FA20004 */   lw         $v0, 4($sp)
/* 006DAC 9FC06DAC 0BF01B77 */  j           .L9FC06DDC
/* 006DB0 9FC06DB0 97A80006 */   lhu        $t0, 6($sp)
.L9FC06DB4:
/* 006DB4 9FC06DB4 97A30000 */  lhu         $v1, ($sp)
/* 006DB8 9FC06DB8 00021400 */  sll         $v0, $v0, 0x10
/* 006DBC 9FC06DBC 00431021 */  addu        $v0, $v0, $v1
/* 006DC0 9FC06DC0 24A30001 */  addiu       $v1, $a1, 1
/* 006DC4 9FC06DC4 14600002 */  bnez        $v1, .L9FC06DD0
/* 006DC8 9FC06DC8 0043001B */   divu       $zero, $v0, $v1
/* 006DCC 9FC06DCC 0007000D */  break       7
.L9FC06DD0:
/* 006DD0 9FC06DD0 00001012 */  mflo        $v0
/* 006DD4 9FC06DD4 3048FFFF */  andi        $t0, $v0, 0xffff
/* 006DD8 9FC06DD8 00000000 */  nop
.L9FC06DDC:
/* 006DDC 9FC06DDC 010B0018 */  mult        $t0, $t3
/* 006DE0 9FC06DE0 00003812 */  mflo        $a3
/* 006DE4 9FC06DE4 8FA30000 */  lw          $v1, ($sp)
/* 006DE8 9FC06DE8 00000000 */  nop
/* 006DEC 9FC06DEC 01050018 */  mult        $t0, $a1
/* 006DF0 9FC06DF0 00671823 */  subu        $v1, $v1, $a3
/* 006DF4 9FC06DF4 00071027 */  nor         $v0, $zero, $a3
/* 006DF8 9FC06DF8 0043102B */  sltu        $v0, $v0, $v1
/* 006DFC 9FC06DFC 00004812 */  mflo        $t1
/* 006E00 9FC06E00 10400004 */  beqz        $v0, .L9FC06E14
/* 006E04 9FC06E04 AFA30000 */   sw         $v1, ($sp)
/* 006E08 9FC06E08 8FA20004 */  lw          $v0, 4($sp)
/* 006E0C 9FC06E0C 2442FFFF */  addiu       $v0, $v0, -1
/* 006E10 9FC06E10 AFA20004 */  sw          $v0, 4($sp)
.L9FC06E14:
/* 006E14 9FC06E14 8FA30000 */  lw          $v1, ($sp)
/* 006E18 9FC06E18 00091400 */  sll         $v0, $t1, 0x10
/* 006E1C 9FC06E1C 00621823 */  subu        $v1, $v1, $v0
/* 006E20 9FC06E20 00021027 */  nor         $v0, $zero, $v0
/* 006E24 9FC06E24 0043102B */  sltu        $v0, $v0, $v1
/* 006E28 9FC06E28 10400004 */  beqz        $v0, .L9FC06E3C
/* 006E2C 9FC06E2C AFA30000 */   sw         $v1, ($sp)
/* 006E30 9FC06E30 8FA20004 */  lw          $v0, 4($sp)
/* 006E34 9FC06E34 2442FFFF */  addiu       $v0, $v0, -1
/* 006E38 9FC06E38 AFA20004 */  sw          $v0, 4($sp)
.L9FC06E3C:
/* 006E3C 9FC06E3C 8FA20004 */  lw          $v0, 4($sp)
/* 006E40 9FC06E40 00091C02 */  srl         $v1, $t1, 0x10
/* 006E44 9FC06E44 00431023 */  subu        $v0, $v0, $v1
/* 006E48 9FC06E48 14400005 */  bnez        $v0, .L9FC06E60
/* 006E4C 9FC06E4C AFA20004 */   sw         $v0, 4($sp)
/* 006E50 9FC06E50 8FA20000 */  lw          $v0, ($sp)
.L9FC06E54:
/* 006E54 9FC06E54 0046102B */  sltu        $v0, $v0, $a2
/* 006E58 9FC06E58 14400010 */  bnez        $v0, .L9FC06E9C
/* 006E5C 9FC06E5C 000A1400 */   sll        $v0, $t2, 0x10
.L9FC06E60:
/* 006E60 9FC06E60 8FA30000 */  lw          $v1, ($sp)
/* 006E64 9FC06E64 00061027 */  nor         $v0, $zero, $a2
/* 006E68 9FC06E68 00661823 */  subu        $v1, $v1, $a2
/* 006E6C 9FC06E6C 0043102B */  sltu        $v0, $v0, $v1
/* 006E70 9FC06E70 10400004 */  beqz        $v0, .L9FC06E84
/* 006E74 9FC06E74 AFA30000 */   sw         $v1, ($sp)
/* 006E78 9FC06E78 8FA20004 */  lw          $v0, 4($sp)
/* 006E7C 9FC06E7C 2442FFFF */  addiu       $v0, $v0, -1
/* 006E80 9FC06E80 AFA20004 */  sw          $v0, 4($sp)
.L9FC06E84:
/* 006E84 9FC06E84 25020001 */  addiu       $v0, $t0, 1
/* 006E88 9FC06E88 8FA30004 */  lw          $v1, 4($sp)
/* 006E8C 9FC06E8C 1460FFF4 */  bnez        $v1, .L9FC06E60
/* 006E90 9FC06E90 3048FFFF */   andi       $t0, $v0, 0xffff
/* 006E94 9FC06E94 0BF01B95 */  j           .L9FC06E54
/* 006E98 9FC06E98 8FA20000 */   lw         $v0, ($sp)
.L9FC06E9C:
/* 006E9C 9FC06E9C 00481021 */  addu        $v0, $v0, $t0
/* 006EA0 9FC06EA0 AC820000 */  sw          $v0, ($a0)
/* 006EA4 9FC06EA4 03E00008 */  jr          $ra
/* 006EA8 9FC06EA8 27BD0008 */   addiu      $sp, $sp, 8
