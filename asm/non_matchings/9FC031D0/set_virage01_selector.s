## func_9FC022A8
/* 003C5C 9FC03C5C 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 003C60 9FC03C60 AFB10014 */  sw          $s1, 0x14($sp)
/* 003C64 9FC03C64 00808821 */  addu        $s1, $a0, $zero
/* 003C68 9FC03C68 AFBF0018 */  sw          $ra, 0x18($sp)
/* 003C6C 9FC03C6C 0FF00FE9 */  jal         initialize_virage_controllers
/* 003C70 9FC03C70 AFB00010 */   sw         $s0, 0x10($sp)
/* 003C74 9FC03C74 3C041FC8 */  lui         $a0, (0x1FC8C000 >> 16)
/* 003C78 9FC03C78 0FF01097 */  jal         func_9FC0425C
/* 003C7C 9FC03C7C 3484C000 */   ori        $a0, $a0, (0x1FC8C000 & 0xFFFF)
/* 003C80 9FC03C80 04400023 */  bltz        $v0, .L9FC03D10
/* 003C84 9FC03C84 3C04BFC8 */   lui        $a0, 0xbfc8
/* 003C88 9FC03C88 0FF00EE0 */  jal         read_virage01
/* 003C8C 9FC03C8C 02202821 */   addu       $a1, $s1, $zero
/* 003C90 9FC03C90 3C041FC9 */  lui         $a0, (0x1FC9C000 >> 16)
/* 003C94 9FC03C94 3484C000 */  ori         $a0, $a0, (0x1FC9C000 & 0xFFFF)
/* 003C98 9FC03C98 0FF01097 */  jal         func_9FC0425C
/* 003C9C 9FC03C9C 00408021 */   addu       $s0, $v0, $zero
/* 003CA0 9FC03CA0 0440001B */  bltz        $v0, .L9FC03D10
/* 003CA4 9FC03CA4 3C04BFC9 */   lui        $a0, 0xbfc9
/* 003CA8 9FC03CA8 0FF00EE0 */  jal         read_virage01
/* 003CAC 9FC03CAC 02202821 */   addu       $a1, $s1, $zero
/* 003CB0 9FC03CB0 0603000D */  bgezl       $s0, .L9FC03CE8
/* 003CB4 9FC03CB4 0050102A */   slt        $v0, $v0, $s0
/* 003CB8 9FC03CB8 0441000B */  bgez        $v0, .L9FC03CE8
/* 003CBC 9FC03CBC 0050102A */   slt        $v0, $v0, $s0
/* 003CC0 9FC03CC0 02202021 */  addu        $a0, $s1, $zero
/* 003CC4 9FC03CC4 00002821 */  addu        $a1, $zero, $zero
/* 003CC8 9FC03CC8 0FF00EB5 */  jal         memset
/* 003CCC 9FC03CCC 24060040 */   addiu      $a2, $zero, 0x40
/* 003CD0 9FC03CD0 3C019FC1 */  lui         $at, %hi(D_9FC0EBC4)
/* 003CD4 9FC03CD4 A020EBC4 */  sb          $zero, %lo(D_9FC0EBC4)($at)
/* 003CD8 9FC03CD8 0FF00EF3 */  jal         write_virage01_data
/* 003CDC 9FC03CDC 02202021 */   addu       $a0, $s1, $zero
/* 003CE0 9FC03CE0 0BF00F4F */  j           .L9FC03D3C
/* 003CE4 9FC03CE4 8FBF0018 */   lw         $ra, 0x18($sp)
.L9FC03CE8:
/* 003CE8 9FC03CE8 1040000F */  beqz        $v0, .L9FC03D28
/* 003CEC 9FC03CEC 3C041FC8 */   lui        $a0, (0x1FC8C000 >> 16)
/* 003CF0 9FC03CF0 0FF01097 */  jal         func_9FC0425C
/* 003CF4 9FC03CF4 3484C000 */   ori        $a0, $a0, (0x1FC8C000 & 0xFFFF)
/* 003CF8 9FC03CF8 04400005 */  bltz        $v0, .L9FC03D10
/* 003CFC 9FC03CFC 3C04BFC8 */   lui        $a0, 0xbfc8
/* 003D00 9FC03D00 0FF00EE0 */  jal         read_virage01
/* 003D04 9FC03D04 02202821 */   addu       $a1, $s1, $zero
/* 003D08 9FC03D08 04410003 */  bgez        $v0, .L9FC03D18
/* 003D0C 9FC03D0C 00000000 */   nop
.L9FC03D10:
/* 003D10 9FC03D10 0BF00F4E */  j           .L9FC03D38
/* 003D14 9FC03D14 2402FFFF */   addiu      $v0, $zero, -1
.L9FC03D18:
/* 003D18 9FC03D18 3C019FC1 */  lui         $at, %hi(D_9FC0EBC4)
/* 003D1C 9FC03D1C A020EBC4 */  sb          $zero, %lo(D_9FC0EBC4)($at)
/* 003D20 9FC03D20 0BF00F4E */  j           .L9FC03D38
/* 003D24 9FC03D24 00001021 */   addu       $v0, $zero, $zero
.L9FC03D28:
/* 003D28 9FC03D28 24020001 */  addiu       $v0, $zero, 1
/* 003D2C 9FC03D2C 3C019FC1 */  lui         $at, %hi(D_9FC0EBC4)
/* 003D30 9FC03D30 A022EBC4 */  sb          $v0, %lo(D_9FC0EBC4)($at)
/* 003D34 9FC03D34 00001021 */  addu        $v0, $zero, $zero
.L9FC03D38:
/* 003D38 9FC03D38 8FBF0018 */  lw          $ra, 0x18($sp)
.L9FC03D3C:
/* 003D3C 9FC03D3C 8FB10014 */  lw          $s1, 0x14($sp)
/* 003D40 9FC03D40 8FB00010 */  lw          $s0, 0x10($sp)
/* 003D44 9FC03D44 03E00008 */  jr          $ra
/* 003D48 9FC03D48 27BD0020 */   addiu      $sp, $sp, 0x20
