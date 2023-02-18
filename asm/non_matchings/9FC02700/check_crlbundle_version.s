## verify_crlbundle
/* 002A6C 9FC02A6C 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 002A70 9FC02A70 AFBF0010 */  sw          $ra, 0x10($sp)
/* 002A74 9FC02A74 8C840000 */  lw          $a0, ($a0)
/* 002A78 9FC02A78 8C830200 */  lw          $v1, 0x200($a0)
/* 002A7C 9FC02A7C 24020001 */  addiu       $v0, $zero, 1
/* 002A80 9FC02A80 50620010 */  beql        $v1, $v0, .L9FC02AC4
/* 002A84 9FC02A84 8C83020C */   lw         $v1, 0x20c($a0)
/* 002A88 9FC02A88 10600005 */  beqz        $v1, .L9FC02AA0
/* 002A8C 9FC02A8C 24020002 */   addiu      $v0, $zero, 2
/* 002A90 9FC02A90 10620014 */  beq         $v1, $v0, .L9FC02AE4
/* 002A94 9FC02A94 2402FFFF */   addiu      $v0, $zero, -1
/* 002A98 9FC02A98 0BF00ACC */  j           .L9FC02B30
/* 002A9C 9FC02A9C 8FBF0010 */   lw         $ra, 0x10($sp)
.L9FC02AA0:
/* 002AA0 9FC02AA0 3C059FC1 */  lui         $a1, %hi(D_9FC0F308)
/* 002AA4 9FC02AA4 24A5F308 */  addiu       $a1, $a1, %lo(D_9FC0F308)
/* 002AA8 9FC02AA8 90A20000 */  lbu         $v0, ($a1)
/* 002AAC 9FC02AAC 8C83020C */  lw          $v1, 0x20c($a0)
/* 002AB0 9FC02AB0 0043102B */  sltu        $v0, $v0, $v1
/* 002AB4 9FC02AB4 54400016 */  bnel        $v0, $zero, .L9FC02B10
/* 002AB8 9FC02AB8 9082020F */   lbu        $v0, 0x20f($a0)
/* 002ABC 9FC02ABC 0BF00ACB */  j           .L9FC02B2C
/* 002AC0 9FC02AC0 00001021 */   addu       $v0, $zero, $zero
.L9FC02AC4:
/* 002AC4 9FC02AC4 3C059FC1 */  lui         $a1, %hi(D_9FC0F30A)
/* 002AC8 9FC02AC8 24A5F30A */  addiu       $a1, $a1, %lo(D_9FC0F30A)
/* 002ACC 9FC02ACC 90A20000 */  lbu         $v0, ($a1)
/* 002AD0 9FC02AD0 0043102B */  sltu        $v0, $v0, $v1
/* 002AD4 9FC02AD4 10400015 */  beqz        $v0, .L9FC02B2C
/* 002AD8 9FC02AD8 00001021 */   addu       $v0, $zero, $zero
/* 002ADC 9FC02ADC 0BF00AC4 */  j           .L9FC02B10
/* 002AE0 9FC02AE0 9082020F */   lbu        $v0, 0x20f($a0)
.L9FC02AE4:
/* 002AE4 9FC02AE4 3C059FC1 */  lui         $a1, %hi(D_9FC0F309)
/* 002AE8 9FC02AE8 24A5F309 */  addiu       $a1, $a1, %lo(D_9FC0F309)
/* 002AEC 9FC02AEC 90A20000 */  lbu         $v0, ($a1)
/* 002AF0 9FC02AF0 8C83020C */  lw          $v1, 0x20c($a0)
/* 002AF4 9FC02AF4 0043102B */  sltu        $v0, $v0, $v1
/* 002AF8 9FC02AF8 1040000C */  beqz        $v0, .L9FC02B2C
/* 002AFC 9FC02AFC 00001021 */   addu       $v0, $zero, $zero
/* 002B00 9FC02B00 9082020F */  lbu         $v0, 0x20f($a0)
/* 002B04 9FC02B04 A0A00001 */  sb          $zero, 1($a1)
/* 002B08 9FC02B08 A0A00002 */  sb          $zero, 2($a1)
/* 002B0C 9FC02B0C A0A0FFFF */  sb          $zero, -1($a1)
.L9FC02B10:
/* 002B10 9FC02B10 3C049FC1 */  lui         $a0, %hi(D_9FC0F308)
/* 002B14 9FC02B14 2484F308 */  addiu       $a0, $a0, %lo(D_9FC0F308)
/* 002B18 9FC02B18 0FF00EF3 */  jal         write_virage01_data
/* 002B1C 9FC02B1C A0A20000 */   sb         $v0, ($a1)
/* 002B20 9FC02B20 14400002 */  bnez        $v0, .L9FC02B2C
/* 002B24 9FC02B24 2402FFFF */   addiu      $v0, $zero, -1
/* 002B28 9FC02B28 00001021 */  addu        $v0, $zero, $zero
.L9FC02B2C:
/* 002B2C 9FC02B2C 8FBF0010 */  lw          $ra, 0x10($sp)
.L9FC02B30:
/* 002B30 9FC02B30 03E00008 */  jr          $ra
/* 002B34 9FC02B34 27BD0018 */   addiu      $sp, $sp, 0x18
