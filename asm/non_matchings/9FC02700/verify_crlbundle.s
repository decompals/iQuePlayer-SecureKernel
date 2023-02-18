## verify_all_crlbundles
/* 002B38 9FC02B38 27BDFFC0 */  addiu       $sp, $sp, -0x40
/* 002B3C 9FC02B3C AFB10034 */  sw          $s1, 0x34($sp)
/* 002B40 9FC02B40 00808821 */  addu        $s1, $a0, $zero
/* 002B44 9FC02B44 AFB00030 */  sw          $s0, 0x30($sp)
/* 002B48 9FC02B48 00A08021 */  addu        $s0, $a1, $zero
/* 002B4C 9FC02B4C 02002021 */  addu        $a0, $s0, $zero
/* 002B50 9FC02B50 27A50028 */  addiu       $a1, $sp, 0x28
/* 002B54 9FC02B54 AFB20038 */  sw          $s2, 0x38($sp)
/* 002B58 9FC02B58 AFBF003C */  sw          $ra, 0x3c($sp)
/* 002B5C 9FC02B5C 0FF00A60 */  jal         get_expected_revocation_list_version
/* 002B60 9FC02B60 00C09021 */   addu       $s2, $a2, $zero
/* 002B64 9FC02B64 1440004D */  bnez        $v0, .L9FC02C9C
/* 002B68 9FC02B68 2402FFFF */   addiu      $v0, $zero, -1
/* 002B6C 9FC02B6C 8E240000 */  lw          $a0, ($s1)
/* 002B70 9FC02B70 14800007 */  bnez        $a0, .L9FC02B90
/* 002B74 9FC02B74 8FA20028 */   lw         $v0, 0x28($sp)
/* 002B78 9FC02B78 14400048 */  bnez        $v0, .L9FC02C9C
/* 002B7C 9FC02B7C 2402FFFF */   addiu      $v0, $zero, -1
/* 002B80 9FC02B80 12400046 */  beqz        $s2, .L9FC02C9C
/* 002B84 9FC02B84 00001021 */   addu       $v0, $zero, $zero
/* 002B88 9FC02B88 0BF00B27 */  j           .L9FC02C9C
/* 002B8C 9FC02B8C 2402FFFF */   addiu      $v0, $zero, -1
.L9FC02B90:
/* 002B90 9FC02B90 8C83020C */  lw          $v1, 0x20c($a0)
/* 002B94 9FC02B94 0062102B */  sltu        $v0, $v1, $v0
/* 002B98 9FC02B98 14400040 */  bnez        $v0, .L9FC02C9C
/* 002B9C 9FC02B9C 2402FFFF */   addiu      $v0, $zero, -1
/* 002BA0 9FC02BA0 0072102B */  sltu        $v0, $v1, $s2
/* 002BA4 9FC02BA4 1440003D */  bnez        $v0, .L9FC02C9C
/* 002BA8 9FC02BA8 2402FFFF */   addiu      $v0, $zero, -1
/* 002BAC 9FC02BAC 0FF00A78 */  jal         check_crl_root
/* 002BB0 9FC02BB0 02002821 */   addu       $a1, $s0, $zero
/* 002BB4 9FC02BB4 14400039 */  bnez        $v0, .L9FC02C9C
/* 002BB8 9FC02BB8 2402FFFF */   addiu      $v0, $zero, -1
/* 002BBC 9FC02BBC 24020002 */  addiu       $v0, $zero, 2
/* 002BC0 9FC02BC0 1202000E */  beq         $s0, $v0, .L9FC02BFC
/* 002BC4 9FC02BC4 00000000 */   nop
/* 002BC8 9FC02BC8 12000005 */  beqz        $s0, .L9FC02BE0
/* 002BCC 9FC02BCC 24020001 */   addiu      $v0, $zero, 1
/* 002BD0 9FC02BD0 12020005 */  beq         $s0, $v0, .L9FC02BE8
/* 002BD4 9FC02BD4 2402FFFF */   addiu      $v0, $zero, -1
/* 002BD8 9FC02BD8 0BF00B28 */  j           .L9FC02CA0
/* 002BDC 9FC02BDC 8FBF003C */   lw         $ra, 0x3c($sp)
.L9FC02BE0:
/* 002BE0 9FC02BE0 0BF00AFB */  j           .L9FC02BEC
/* 002BE4 9FC02BE4 24050001 */   addiu      $a1, $zero, 1
.L9FC02BE8:
/* 002BE8 9FC02BE8 24050002 */  addiu       $a1, $zero, 2
.L9FC02BEC:
/* 002BEC 9FC02BEC 0FF00A2F */  jal         verify_cert_chain
/* 002BF0 9FC02BF0 26240008 */   addiu      $a0, $s1, 8
/* 002BF4 9FC02BF4 14400029 */  bnez        $v0, .L9FC02C9C
/* 002BF8 9FC02BF8 2402FFFF */   addiu      $v0, $zero, -1
.L9FC02BFC:
/* 002BFC 9FC02BFC 3C059FC1 */  lui         $a1, %hi(aRoot_0)
/* 002C00 9FC02C00 24A5BE18 */  addiu       $a1, $a1, %lo(aRoot_0)
/* 002C04 9FC02C04 24020058 */  addiu       $v0, $zero, 0x58
/* 002C08 9FC02C08 AFA2001C */  sw          $v0, 0x1c($sp)
/* 002C0C 9FC02C0C 8E240000 */  lw          $a0, ($s1)
/* 002C10 9FC02C10 8E230004 */  lw          $v1, 4($s1)
/* 002C14 9FC02C14 24820200 */  addiu       $v0, $a0, 0x200
/* 002C18 9FC02C18 AFA20018 */  sw          $v0, 0x18($sp)
/* 002C1C 9FC02C1C AFA30020 */  sw          $v1, 0x20($sp)
/* 002C20 9FC02C20 8C820254 */  lw          $v0, 0x254($a0)
/* 002C24 9FC02C24 24840214 */  addiu       $a0, $a0, 0x214
/* 002C28 9FC02C28 00021180 */  sll         $v0, $v0, 6
/* 002C2C 9FC02C2C 0FF00E5C */  jal         strcmp
/* 002C30 9FC02C30 AFA20024 */   sw         $v0, 0x24($sp)
/* 002C34 9FC02C34 1440000B */  bnez        $v0, .L9FC02C64
/* 002C38 9FC02C38 27A40018 */   addiu      $a0, $sp, 0x18
/* 002C3C 9FC02C3C 24050002 */  addiu       $a1, $zero, 2
/* 002C40 9FC02C40 3C079FC1 */  lui         $a3, %hi(exponent)
/* 002C44 9FC02C44 8CE7C150 */  lw          $a3, %lo(exponent)($a3)
/* 002C48 9FC02C48 24020001 */  addiu       $v0, $zero, 1
/* 002C4C 9FC02C4C AFA20010 */  sw          $v0, 0x10($sp)
/* 002C50 9FC02C50 8E220000 */  lw          $v0, ($s1)
/* 002C54 9FC02C54 3C069FC1 */  lui         $a2, %hi(pubkey)
/* 002C58 9FC02C58 24C6BF50 */  addiu       $a2, $a2, %lo(pubkey)
/* 002C5C 9FC02C5C 0BF00B21 */  j           .L9FC02C84
/* 002C60 9FC02C60 AFA20014 */   sw         $v0, 0x14($sp)
.L9FC02C64:
/* 002C64 9FC02C64 8E220000 */  lw          $v0, ($s1)
/* 002C68 9FC02C68 8E260008 */  lw          $a2, 8($s1)
/* 002C6C 9FC02C6C 8C430204 */  lw          $v1, 0x204($v0)
/* 002C70 9FC02C70 24050002 */  addiu       $a1, $zero, 2
/* 002C74 9FC02C74 AFA20014 */  sw          $v0, 0x14($sp)
/* 002C78 9FC02C78 AFA30010 */  sw          $v1, 0x10($sp)
/* 002C7C 9FC02C7C 8CC7018C */  lw          $a3, 0x18c($a2)
/* 002C80 9FC02C80 24C6008C */  addiu       $a2, $a2, 0x8c
.L9FC02C84:
/* 002C84 9FC02C84 0FF00CB3 */  jal         rsa_verify_signature
/* 002C88 9FC02C88 00000000 */   nop
/* 002C8C 9FC02C8C 14400004 */  bnez        $v0, .L9FC02CA0
/* 002C90 9FC02C90 8FBF003C */   lw         $ra, 0x3c($sp)
/* 002C94 9FC02C94 0FF00A9B */  jal         check_crlbundle_version
/* 002C98 9FC02C98 02202021 */   addu       $a0, $s1, $zero
.L9FC02C9C:
/* 002C9C 9FC02C9C 8FBF003C */  lw          $ra, 0x3c($sp)
.L9FC02CA0:
/* 002CA0 9FC02CA0 8FB20038 */  lw          $s2, 0x38($sp)
/* 002CA4 9FC02CA4 8FB10034 */  lw          $s1, 0x34($sp)
/* 002CA8 9FC02CA8 8FB00030 */  lw          $s0, 0x30($sp)
/* 002CAC 9FC02CAC 03E00008 */  jr          $ra
/* 002CB0 9FC02CB0 27BD0040 */   addiu      $sp, $sp, 0x40
