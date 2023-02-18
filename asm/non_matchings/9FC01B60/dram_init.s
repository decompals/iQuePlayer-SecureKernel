## func_9FC022A8
/* 001C78 9FC01C78 3C03A460 */  lui         $v1, (0xA4600060 >> 16)
/* 001C7C 9FC01C7C 34630060 */  ori         $v1, $v1, (0xA4600060 & 0xFFFF)
/* 001C80 9FC01C80 3C02A470 */  lui         $v0, (0xA4700020 >> 16)
/* 001C84 9FC01C84 34420020 */  ori         $v0, $v0, (0xA4700020 & 0xFFFF)
/* 001C88 9FC01C88 3C08A470 */  lui         $t0, (0xA4700040 >> 16)
/* 001C8C 9FC01C8C 35080040 */  ori         $t0, $t0, (0xA4700040 & 0xFFFF)
/* 001C90 9FC01C90 3C060311 */  lui         $a2, (0x031111E4 >> 16)
/* 001C94 9FC01C94 34C611E4 */  ori         $a2, $a2, (0x031111E4 & 0xFFFF)
/* 001C98 9FC01C98 3C05A470 */  lui         $a1, (0xA4700030 >> 16)
/* 001C9C 9FC01C9C 34A50030 */  ori         $a1, $a1, (0xA4700030 & 0xFFFF)
/* 001CA0 9FC01CA0 3C07A470 */  lui         $a3, (0xA4700060 >> 16)
/* 001CA4 9FC01CA4 8C630000 */  lw          $v1, ($v1)
/* 001CA8 9FC01CA8 3C048000 */  lui         $a0, 0x8000
/* 001CAC 9FC01CAC AC440000 */  sw          $a0, ($v0)
/* 001CB0 9FC01CB0 8C430000 */  lw          $v1, ($v0)
/* 001CB4 9FC01CB4 24032002 */  addiu       $v1, $zero, 0x2002
/* 001CB8 9FC01CB8 AC430000 */  sw          $v1, ($v0)
/* 001CBC 9FC01CBC 8C430000 */  lw          $v1, ($v0)
/* 001CC0 9FC01CC0 24030100 */  addiu       $v1, $zero, 0x100
/* 001CC4 9FC01CC4 AC430000 */  sw          $v1, ($v0)
/* 001CC8 9FC01CC8 8C430000 */  lw          $v1, ($v0)
/* 001CCC 9FC01CCC 34E70060 */  ori         $a3, $a3, (0xA4700060 & 0xFFFF)
/* 001CD0 9FC01CD0 AC440000 */  sw          $a0, ($v0)
/* 001CD4 9FC01CD4 8C430000 */  lw          $v1, ($v0)
/* 001CD8 9FC01CD8 3C034000 */  lui         $v1, 0x4000
/* 001CDC 9FC01CDC AC430000 */  sw          $v1, ($v0)
/* 001CE0 9FC01CE0 8C440000 */  lw          $a0, ($v0)
/* 001CE4 9FC01CE4 3C04A470 */  lui         $a0, (0xA4700080 >> 16)
/* 001CE8 9FC01CE8 AC430000 */  sw          $v1, ($v0)
/* 001CEC 9FC01CEC 8C430000 */  lw          $v1, ($v0)
/* 001CF0 9FC01CF0 2403003A */  addiu       $v1, $zero, 0x3a
/* 001CF4 9FC01CF4 AC430000 */  sw          $v1, ($v0)
/* 001CF8 9FC01CF8 8C420000 */  lw          $v0, ($v0)
/* 001CFC 9FC01CFC 34840080 */  ori         $a0, $a0, (0xA4700080 & 0xFFFF)
/* 001D00 9FC01D00 AD060000 */  sw          $a2, ($t0)
/* 001D04 9FC01D04 8CA20000 */  lw          $v0, ($a1)
/* 001D08 9FC01D08 8CA20000 */  lw          $v0, ($a1)
/* 001D0C 9FC01D0C 24020001 */  addiu       $v0, $zero, 1
/* 001D10 9FC01D10 ACE20000 */  sw          $v0, ($a3)
/* 001D14 9FC01D14 8CA30000 */  lw          $v1, ($a1)
/* 001D18 9FC01D18 00003021 */  addu        $a2, $zero, $zero
/* 001D1C 9FC01D1C AC820000 */  sw          $v0, ($a0)
/* 001D20 9FC01D20 8CA20000 */  lw          $v0, ($a1)
/* 001D24 9FC01D24 3C03A470 */  lui         $v1, (0xA4700030 >> 16)
.L9FC01D28:
/* 001D28 9FC01D28 34630030 */  ori         $v1, $v1, (0xA4700030 & 0xFFFF)
/* 001D2C 9FC01D2C 8C620000 */  lw          $v0, ($v1)
/* 001D30 9FC01D30 24C60001 */  addiu       $a2, $a2, 1
/* 001D34 9FC01D34 28C20064 */  slti        $v0, $a2, 0x64
/* 001D38 9FC01D38 5440FFFB */  bnel        $v0, $zero, .L9FC01D28
/* 001D3C 9FC01D3C 3C03A470 */   lui        $v1, (0xA4700030 >> 16)
/* 001D40 9FC01D40 240211E0 */  addiu       $v0, $zero, 0x11e0
/* 001D44 9FC01D44 AC620000 */  sw          $v0, ($v1)
/* 001D48 9FC01D48 8C620000 */  lw          $v0, ($v1)
/* 001D4C 9FC01D4C 03E00008 */  jr          $ra
/* 001D50 9FC01D50 00000000 */   nop
