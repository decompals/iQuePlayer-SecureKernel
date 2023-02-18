## skLaunch
## func_9FC020C4
/* 003250 9FC03250 3C03A460 */  lui         $v1, (0xA4600054 >> 16)
/* 003254 9FC03254 34630054 */  ori         $v1, $v1, (0xA4600054 & 0xFFFF)
/* 003258 9FC03258 3C07A494 */  lui         $a3, (0xA4940010 >> 16)
/* 00325C 9FC0325C 34E70010 */  ori         $a3, $a3, (0xA4940010 & 0xFFFF)
/* 003260 9FC03260 3C06A4A4 */  lui         $a2, (0xA4A40010 >> 16)
/* 003264 9FC03264 34C60010 */  ori         $a2, $a2, (0xA4A40010 & 0xFFFF)
/* 003268 9FC03268 3C05A430 */  lui         $a1, (0xA4300014 >> 16)
/* 00326C 9FC0326C 34A50014 */  ori         $a1, $a1, (0xA4300014 & 0xFFFF)
/* 003270 9FC03270 00804021 */  addu        $t0, $a0, $zero
/* 003274 9FC03274 9102004F */  lbu         $v0, 0x4f($t0)
/* 003278 9FC03278 3C04FEFF */  lui         $a0, (0xFEFFFFFF >> 16)
/* 00327C 9FC0327C AC620000 */  sw          $v0, ($v1)
/* 003280 9FC03280 9102004E */  lbu         $v0, 0x4e($t0)
/* 003284 9FC03284 3484FFFF */  ori         $a0, $a0, (0xFEFFFFFF & 0xFFFF)
/* 003288 9FC03288 30430001 */  andi        $v1, $v0, 1
/* 00328C 9FC0328C ACE30000 */  sw          $v1, ($a3)
/* 003290 9FC03290 ACC30000 */  sw          $v1, ($a2)
/* 003294 9FC03294 8CA30000 */  lw          $v1, ($a1)
/* 003298 9FC03298 8D02004C */  lw          $v0, 0x4c($t0)
/* 00329C 9FC0329C 30420200 */  andi        $v0, $v0, 0x200
/* 0032A0 9FC032A0 10400003 */  beqz        $v0, .L9FC032B0
/* 0032A4 9FC032A4 00641824 */   and        $v1, $v1, $a0
/* 0032A8 9FC032A8 3C020100 */  lui         $v0, 0x100
/* 0032AC 9FC032AC 00621825 */  or          $v1, $v1, $v0
.L9FC032B0:
/* 0032B0 9FC032B0 3C01A430 */  lui         $at, (0xA4300014 >> 16)
/* 0032B4 9FC032B4 AC230014 */  sw          $v1, (0xA4300014 & 0xFFFF)($at)
/* 0032B8 9FC032B8 8D020050 */  lw          $v0, 0x50($t0)
/* 0032BC 9FC032BC 3C019FC1 */  lui         $at, %hi(cur_proc_allowed_skc_bitmask)
/* 0032C0 9FC032C0 AC22F348 */  sw          $v0, %lo(cur_proc_allowed_skc_bitmask)($at)
/* 0032C4 9FC032C4 03E00008 */  jr          $ra
/* 0032C8 9FC032C8 00000000 */   nop
