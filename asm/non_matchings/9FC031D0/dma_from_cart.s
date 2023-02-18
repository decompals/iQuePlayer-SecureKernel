## func_9FC0134C
## func_9FC01FBC
/* 0037A8 9FC037A8 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 0037AC 9FC037AC 3C02A460 */  lui         $v0, (0xA4600000 >> 16)
/* 0037B0 9FC037B0 AFBF0010 */  sw          $ra, 0x10($sp)
/* 0037B4 9FC037B4 AC450000 */  sw          $a1, (0xA4600000 & 0xFFFF)($v0)
/* 0037B8 9FC037B8 14800002 */  bnez        $a0, .L9FC037C4
/* 0037BC 9FC037BC 24020400 */   addiu      $v0, $zero, 0x400
/* 0037C0 9FC037C0 00001021 */  addu        $v0, $zero, $zero
.L9FC037C4:
/* 0037C4 9FC037C4 3C01A460 */  lui         $at, (0xA4600004 >> 16)
/* 0037C8 9FC037C8 AC220004 */  sw          $v0, (0xA4600004 & 0xFFFF)($at)
/* 0037CC 9FC037CC 14E00003 */  bnez        $a3, .L9FC037DC
/* 0037D0 9FC037D0 3C02A460 */   lui        $v0, (0xA4600058 >> 16)
/* 0037D4 9FC037D4 0BF00DF8 */  j           .L9FC037E0
/* 0037D8 9FC037D8 3442005C */   ori        $v0, $v0, (0xA460005C & 0xFFFF)
.L9FC037DC:
/* 0037DC 9FC037DC 34420058 */  ori         $v0, $v0, (0xA4600058 & 0xFFFF)
.L9FC037E0:
/* 0037E0 9FC037E0 24C3FFFF */  addiu       $v1, $a2, -1
/* 0037E4 9FC037E4 AC430000 */  sw          $v1, ($v0)
/* 0037E8 9FC037E8 0FF00DD3 */  jal         func_9FC0374C
/* 0037EC 9FC037EC 00000000 */   nop
/* 0037F0 9FC037F0 8FBF0010 */  lw          $ra, 0x10($sp)
/* 0037F4 9FC037F4 03E00008 */  jr          $ra
/* 0037F8 9FC037F8 27BD0018 */   addiu      $sp, $sp, 0x18
