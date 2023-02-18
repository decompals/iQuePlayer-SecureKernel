## func_9FC00DCC
/* 000BAC 9FC00BAC 27BDFFA0 */  addiu       $sp, $sp, -0x60
/* 000BB0 9FC00BB0 AFB20050 */  sw          $s2, 0x50($sp)
/* 000BB4 9FC00BB4 00809021 */  addu        $s2, $a0, $zero
/* 000BB8 9FC00BB8 26440018 */  addiu       $a0, $s2, 0x18
/* 000BBC 9FC00BBC AFBF005C */  sw          $ra, 0x5c($sp)
/* 000BC0 9FC00BC0 AFB40058 */  sw          $s4, 0x58($sp)
/* 000BC4 9FC00BC4 AFB30054 */  sw          $s3, 0x54($sp)
/* 000BC8 9FC00BC8 AFB1004C */  sw          $s1, 0x4c($sp)
/* 000BCC 9FC00BCC AFB00048 */  sw          $s0, 0x48($sp)
/* 000BD0 9FC00BD0 8E500000 */  lw          $s0, ($s2)
/* 000BD4 9FC00BD4 24050002 */  addiu       $a1, $zero, 2
/* 000BD8 9FC00BD8 261129AC */  addiu       $s1, $s0, 0x29ac
/* 000BDC 9FC00BDC 0FF00A2F */  jal         verify_cert_chain
/* 000BE0 9FC00BE0 26132800 */   addiu      $s3, $s0, 0x2800
/* 000BE4 9FC00BE4 1440005F */  bnez        $v0, .L9FC00D64
/* 000BE8 9FC00BE8 2402FFFF */   addiu      $v0, $zero, -1
/* 000BEC 9FC00BEC 26440004 */  addiu       $a0, $s2, 4
/* 000BF0 9FC00BF0 0FF00A2F */  jal         verify_cert_chain
/* 000BF4 9FC00BF4 24050001 */   addiu      $a1, $zero, 1
/* 000BF8 9FC00BF8 1440005A */  bnez        $v0, .L9FC00D64
/* 000BFC 9FC00BFC 2402FFFF */   addiu      $v0, $zero, -1
/* 000C00 9FC00C00 3C029FC1 */  lui         $v0, %hi(virage2_offset)
/* 000C04 9FC00C04 8C42EBC0 */  lw          $v0, %lo(virage2_offset)($v0)
/* 000C08 9FC00C08 8E0329AC */  lw          $v1, 0x29ac($s0)
/* 000C0C 9FC00C0C 8C420094 */  lw          $v0, 0x94($v0)
/* 000C10 9FC00C10 14620054 */  bne         $v1, $v0, .L9FC00D64
/* 000C14 9FC00C14 2402FFFF */   addiu      $v0, $zero, -1
/* 000C18 9FC00C18 86220004 */  lh          $v0, 4($s1)
/* 000C1C 9FC00C1C 0441000F */  bgez        $v0, .L9FC00C5C
/* 000C20 9FC00C20 27B40028 */   addiu      $s4, $sp, 0x28
/* 000C24 9FC00C24 0FF00F53 */  jal         getTrialConsumptionByCid
/* 000C28 9FC00C28 96240004 */   lhu        $a0, 4($s1)
/* 000C2C 9FC00C2C 00401821 */  addu        $v1, $v0, $zero
/* 000C30 9FC00C30 1060004C */  beqz        $v1, .L9FC00D64
/* 000C34 9FC00C34 2402FFFF */   addiu      $v0, $zero, -1
/* 000C38 9FC00C38 96220006 */  lhu         $v0, 6($s1)
/* 000C3C 9FC00C3C 2C420003 */  sltiu       $v0, $v0, 3
/* 000C40 9FC00C40 10400006 */  beqz        $v0, .L9FC00C5C
/* 000C44 9FC00C44 27B40028 */   addiu      $s4, $sp, 0x28
/* 000C48 9FC00C48 94620000 */  lhu         $v0, ($v1)
/* 000C4C 9FC00C4C 96230008 */  lhu         $v1, 8($s1)
/* 000C50 9FC00C50 0043102B */  sltu        $v0, $v0, $v1
/* 000C54 9FC00C54 10400043 */  beqz        $v0, .L9FC00D64
/* 000C58 9FC00C58 2402FFFF */   addiu      $v0, $zero, -1
.L9FC00C5C:
/* 000C5C 9FC00C5C 02802021 */  addu        $a0, $s4, $zero
/* 000C60 9FC00C60 24050001 */  addiu       $a1, $zero, 1
/* 000C64 9FC00C64 8E420000 */  lw          $v0, ($s2)
/* 000C68 9FC00C68 24032A4C */  addiu       $v1, $zero, 0x2a4c
/* 000C6C 9FC00C6C AFA3002C */  sw          $v1, 0x2c($sp)
/* 000C70 9FC00C70 AFA00010 */  sw          $zero, 0x10($sp)
/* 000C74 9FC00C74 AFA20028 */  sw          $v0, 0x28($sp)
/* 000C78 9FC00C78 8E460004 */  lw          $a2, 4($s2)
/* 000C7C 9FC00C7C 24422A4C */  addiu       $v0, $v0, 0x2a4c
/* 000C80 9FC00C80 AFA20014 */  sw          $v0, 0x14($sp)
/* 000C84 9FC00C84 8CC7018C */  lw          $a3, 0x18c($a2)
/* 000C88 9FC00C88 0FF00CB3 */  jal         rsa_verify_signature
/* 000C8C 9FC00C8C 24C6008C */   addiu      $a2, $a2, 0x8c
/* 000C90 9FC00C90 04400033 */  bltz        $v0, .L9FC00D60
/* 000C94 9FC00C94 02602821 */   addu       $a1, $s3, $zero
/* 000C98 9FC00C98 3C109FC1 */  lui         $s0, %hi(contentMetaDataHead)
/* 000C9C 9FC00C9C 2610ED34 */  addiu       $s0, $s0, %lo(contentMetaDataHead)
/* 000CA0 9FC00CA0 02002021 */  addu        $a0, $s0, $zero
/* 000CA4 9FC00CA4 0FF00EA1 */  jal         memcpy
/* 000CA8 9FC00CA8 240601AC */   addiu      $a2, $zero, 0x1ac
/* 000CAC 9FC00CAC 26240020 */  addiu       $a0, $s1, 0x20
/* 000CB0 9FC00CB0 3C059FC1 */  lui         $a1, %hi(virage2_offset)
/* 000CB4 9FC00CB4 8CA5EBC0 */  lw          $a1, %lo(virage2_offset)($a1)
/* 000CB8 9FC00CB8 27A60018 */  addiu       $a2, $sp, 0x18
/* 000CBC 9FC00CBC 0FF023AC */  jal         eccGenAesKey
/* 000CC0 9FC00CC0 24A50098 */   addiu      $a1, $a1, 0x98
/* 000CC4 9FC00CC4 27A40018 */  addiu       $a0, $sp, 0x18
/* 000CC8 9FC00CC8 26250010 */  addiu       $a1, $s1, 0x10
/* 000CCC 9FC00CCC 2666009C */  addiu       $a2, $s3, 0x9c
/* 000CD0 9FC00CD0 24070010 */  addiu       $a3, $zero, 0x10
/* 000CD4 9FC00CD4 2611009C */  addiu       $s1, $s0, 0x9c
/* 000CD8 9FC00CD8 0FF012D7 */  jal         aes_SwDecrypt
/* 000CDC 9FC00CDC AFB10010 */   sw         $s1, 0x10($sp)
/* 000CE0 9FC00CE0 02802021 */  addu        $a0, $s4, $zero
/* 000CE4 9FC00CE4 24050002 */  addiu       $a1, $zero, 2
/* 000CE8 9FC00CE8 24022800 */  addiu       $v0, $zero, 0x2800
/* 000CEC 9FC00CEC AFA2002C */  sw          $v0, 0x2c($sp)
/* 000CF0 9FC00CF0 AFB00030 */  sw          $s0, 0x30($sp)
/* 000CF4 9FC00CF4 8E430000 */  lw          $v1, ($s2)
/* 000CF8 9FC00CF8 240200AC */  addiu       $v0, $zero, 0xac
/* 000CFC 9FC00CFC AFA20034 */  sw          $v0, 0x34($sp)
/* 000D00 9FC00D00 AFA00010 */  sw          $zero, 0x10($sp)
/* 000D04 9FC00D04 AFA30028 */  sw          $v1, 0x28($sp)
/* 000D08 9FC00D08 8E460018 */  lw          $a2, 0x18($s2)
/* 000D0C 9FC00D0C 246328AC */  addiu       $v1, $v1, 0x28ac
/* 000D10 9FC00D10 AFA30014 */  sw          $v1, 0x14($sp)
/* 000D14 9FC00D14 8CC7018C */  lw          $a3, 0x18c($a2)
/* 000D18 9FC00D18 0FF00CB3 */  jal         rsa_verify_signature
/* 000D1C 9FC00D1C 24C6008C */   addiu      $a2, $a2, 0x8c
/* 000D20 9FC00D20 0440000F */  bltz        $v0, .L9FC00D60
/* 000D24 9FC00D24 26650014 */   addiu      $a1, $s3, 0x14
/* 000D28 9FC00D28 02203021 */  addu        $a2, $s1, $zero
/* 000D2C 9FC00D2C 24070010 */  addiu       $a3, $zero, 0x10
/* 000D30 9FC00D30 3C049FC1 */  lui         $a0, %hi(virage2_offset)
/* 000D34 9FC00D34 8C84EBC0 */  lw          $a0, %lo(virage2_offset)($a0)
/* 000D38 9FC00D38 27B00038 */  addiu       $s0, $sp, 0x38
/* 000D3C 9FC00D3C AFB00010 */  sw          $s0, 0x10($sp)
/* 000D40 9FC00D40 0FF012D7 */  jal         aes_SwDecrypt
/* 000D44 9FC00D44 248400B8 */   addiu      $a0, $a0, 0xb8
/* 000D48 9FC00D48 02202021 */  addu        $a0, $s1, $zero
/* 000D4C 9FC00D4C 02002821 */  addu        $a1, $s0, $zero
/* 000D50 9FC00D50 0FF00EA1 */  jal         memcpy
/* 000D54 9FC00D54 24060010 */   addiu      $a2, $zero, 0x10
/* 000D58 9FC00D58 0BF00359 */  j           .L9FC00D64
/* 000D5C 9FC00D5C 00001021 */   addu       $v0, $zero, $zero
.L9FC00D60:
/* 000D60 9FC00D60 2402FFFF */  addiu       $v0, $zero, -1
.L9FC00D64:
/* 000D64 9FC00D64 8FBF005C */  lw          $ra, 0x5c($sp)
/* 000D68 9FC00D68 8FB40058 */  lw          $s4, 0x58($sp)
/* 000D6C 9FC00D6C 8FB30054 */  lw          $s3, 0x54($sp)
/* 000D70 9FC00D70 8FB20050 */  lw          $s2, 0x50($sp)
/* 000D74 9FC00D74 8FB1004C */  lw          $s1, 0x4c($sp)
/* 000D78 9FC00D78 8FB00048 */  lw          $s0, 0x48($sp)
/* 000D7C 9FC00D7C 03E00008 */  jr          $ra
/* 000D80 9FC00D80 27BD0060 */   addiu      $sp, $sp, 0x60
