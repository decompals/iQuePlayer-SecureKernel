## skRecryptBegin
## aes_HwKeyExpand
## aes_SwEncrypt
## aes_SwDecrypt
/* 004C20 9FC04C20 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 004C24 9FC04C24 AFB00010 */  sw          $s0, 0x10($sp)
/* 004C28 9FC04C28 00808021 */  addu        $s0, $a0, $zero
/* 004C2C 9FC04C2C AFB10014 */  sw          $s1, 0x14($sp)
/* 004C30 9FC04C30 00C08821 */  addu        $s1, $a2, $zero
/* 004C34 9FC04C34 AFB20018 */  sw          $s2, 0x18($sp)
/* 004C38 9FC04C38 00E09021 */  addu        $s2, $a3, $zero
/* 004C3C 9FC04C3C 30A500FF */  andi        $a1, $a1, 0xff
/* 004C40 9FC04C40 16000003 */  bnez        $s0, .L9FC04C50
/* 004C44 9FC04C44 AFBF001C */   sw         $ra, 0x1c($sp)
/* 004C48 9FC04C48 0BF01330 */  j           .L9FC04CC0
/* 004C4C 9FC04C4C 2402FFFD */   addiu      $v0, $zero, -3
.L9FC04C50:
/* 004C50 9FC04C50 2CA20002 */  sltiu       $v0, $a1, 2
/* 004C54 9FC04C54 14400003 */  bnez        $v0, .L9FC04C64
/* 004C58 9FC04C58 24020080 */   addiu      $v0, $zero, 0x80
/* 004C5C 9FC04C5C 0BF01330 */  j           .L9FC04CC0
/* 004C60 9FC04C60 2402FFFF */   addiu      $v0, $zero, -1
.L9FC04C64:
/* 004C64 9FC04C64 12220006 */  beq         $s1, $v0, .L9FC04C80
/* 004C68 9FC04C68 A2050000 */   sb         $a1, ($s0)
/* 004C6C 9FC04C6C 240200C0 */  addiu       $v0, $zero, 0xc0
/* 004C70 9FC04C70 12220003 */  beq         $s1, $v0, .L9FC04C80
/* 004C74 9FC04C74 24020100 */   addiu      $v0, $zero, 0x100
/* 004C78 9FC04C78 12220011 */  beq         $s1, $v0, .L9FC04CC0
/* 004C7C 9FC04C7C 2402FFFE */   addiu      $v0, $zero, -2
.L9FC04C80:
/* 004C80 9FC04C80 14A00006 */  bnez        $a1, .L9FC04C9C
/* 004C84 9FC04C84 26040008 */   addiu      $a0, $s0, 8
/* 004C88 9FC04C88 02402821 */  addu        $a1, $s2, $zero
/* 004C8C 9FC04C8C 0FF01418 */  jal         rijndaelKeySetupEnc
/* 004C90 9FC04C90 02203021 */   addu       $a2, $s1, $zero
/* 004C94 9FC04C94 0BF0132B */  j           .L9FC04CAC
/* 004C98 9FC04C98 AE020004 */   sw         $v0, 4($s0)
.L9FC04C9C:
/* 004C9C 9FC04C9C 02402821 */  addu        $a1, $s2, $zero
/* 004CA0 9FC04CA0 0FF0154E */  jal         rijndaelKeySetupDec
/* 004CA4 9FC04CA4 02203021 */   addu       $a2, $s1, $zero
/* 004CA8 9FC04CA8 AE020004 */  sw          $v0, 4($s0)
.L9FC04CAC:
/* 004CAC 9FC04CAC 260400F8 */  addiu       $a0, $s0, 0xf8
/* 004CB0 9FC04CB0 02402821 */  addu        $a1, $s2, $zero
/* 004CB4 9FC04CB4 0FF01418 */  jal         rijndaelKeySetupEnc
/* 004CB8 9FC04CB8 02203021 */   addu       $a2, $s1, $zero
/* 004CBC 9FC04CBC 24020001 */  addiu       $v0, $zero, 1
.L9FC04CC0:
/* 004CC0 9FC04CC0 8FBF001C */  lw          $ra, 0x1c($sp)
/* 004CC4 9FC04CC4 8FB20018 */  lw          $s2, 0x18($sp)
/* 004CC8 9FC04CC8 8FB10014 */  lw          $s1, 0x14($sp)
/* 004CCC 9FC04CCC 8FB00010 */  lw          $s0, 0x10($sp)
/* 004CD0 9FC04CD0 03E00008 */  jr          $ra
/* 004CD4 9FC04CD4 27BD0020 */   addiu      $sp, $sp, 0x20
