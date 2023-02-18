## func_9FC01C24
## func_9FC02488
/* 001B88 9FC01B88 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 001B8C 9FC01B8C AFB00010 */  sw          $s0, 0x10($sp)
/* 001B90 9FC01B90 00808021 */  addu        $s0, $a0, $zero
/* 001B94 9FC01B94 AFBF0014 */  sw          $ra, 0x14($sp)
.L9FC01B98:
/* 001B98 9FC01B98 00102140 */  sll         $a0, $s0, 5
/* 001B9C 9FC01B9C 0FF00E21 */  jal         card_read_block
/* 001BA0 9FC01BA0 00002821 */   addu       $a1, $zero, $zero
/* 001BA4 9FC01BA4 00403021 */  addu        $a2, $v0, $zero
/* 001BA8 9FC01BA8 2402FFFD */  addiu       $v0, $zero, -3
/* 001BAC 9FC01BAC 10C20016 */  beq         $a2, $v0, .L9FC01C08
/* 001BB0 9FC01BB0 3C02A461 */   lui        $v0, (0xA4610404 >> 16)
/* 001BB4 9FC01BB4 34420404 */  ori         $v0, $v0, (0xA4610404 & 0xFFFF)
/* 001BB8 9FC01BB8 8C450000 */  lw          $a1, ($v0)
/* 001BBC 9FC01BBC 00002021 */  addu        $a0, $zero, $zero
/* 001BC0 9FC01BC0 00001821 */  addu        $v1, $zero, $zero
/* 001BC4 9FC01BC4 24620010 */  addiu       $v0, $v1, 0x10
.L9FC01BC8:
/* 001BC8 9FC01BC8 00451006 */  srlv        $v0, $a1, $v0
/* 001BCC 9FC01BCC 30420001 */  andi        $v0, $v0, 1
/* 001BD0 9FC01BD0 50400001 */  beql        $v0, $zero, .L9FC01BD8
/* 001BD4 9FC01BD4 24840001 */   addiu      $a0, $a0, 1
.L9FC01BD8:
/* 001BD8 9FC01BD8 24630001 */  addiu       $v1, $v1, 1
/* 001BDC 9FC01BDC 28620008 */  slti        $v0, $v1, 8
/* 001BE0 9FC01BE0 1440FFF9 */  bnez        $v0, .L9FC01BC8
/* 001BE4 9FC01BE4 24620010 */   addiu      $v0, $v1, 0x10
/* 001BE8 9FC01BE8 28820002 */  slti        $v0, $a0, 2
/* 001BEC 9FC01BEC 1040FFEA */  beqz        $v0, .L9FC01B98
/* 001BF0 9FC01BF0 26100001 */   addiu      $s0, $s0, 1
/* 001BF4 9FC01BF4 2402FFFE */  addiu       $v0, $zero, -2
/* 001BF8 9FC01BF8 10C20005 */  beq         $a2, $v0, .L9FC01C10
/* 001BFC 9FC01BFC 2602FFFF */   addiu      $v0, $s0, -1
/* 001C00 9FC01C00 0BF00706 */  j           .L9FC01C18
/* 001C04 9FC01C04 8FBF0014 */   lw         $ra, 0x14($sp)
.L9FC01C08:
/* 001C08 9FC01C08 0BF00705 */  j           .L9FC01C14
/* 001C0C 9FC01C0C 2402FFFD */   addiu      $v0, $zero, -3
.L9FC01C10:
/* 001C10 9FC01C10 2402FFFE */  addiu       $v0, $zero, -2
.L9FC01C14:
/* 001C14 9FC01C14 8FBF0014 */  lw          $ra, 0x14($sp)
.L9FC01C18:
/* 001C18 9FC01C18 8FB00010 */  lw          $s0, 0x10($sp)
/* 001C1C 9FC01C1C 03E00008 */  jr          $ra
/* 001C20 9FC01C20 27BD0018 */   addiu      $sp, $sp, 0x18
