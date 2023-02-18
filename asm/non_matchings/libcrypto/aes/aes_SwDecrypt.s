## func_9FC00BAC
## func_9FC01D54
## recrypt_list_decrypt_entry
/* 004B5C 9FC04B5C 27BDFDD0 */  addiu       $sp, $sp, -0x230
/* 004B60 9FC04B60 00801021 */  addu        $v0, $a0, $zero
/* 004B64 9FC04B64 27A40018 */  addiu       $a0, $sp, 0x18
/* 004B68 9FC04B68 AFB20220 */  sw          $s2, 0x220($sp)
/* 004B6C 9FC04B6C 00A09021 */  addu        $s2, $a1, $zero
/* 004B70 9FC04B70 24050001 */  addiu       $a1, $zero, 1
/* 004B74 9FC04B74 AFB40228 */  sw          $s4, 0x228($sp)
/* 004B78 9FC04B78 00C0A021 */  addu        $s4, $a2, $zero
/* 004B7C 9FC04B7C 24060080 */  addiu       $a2, $zero, 0x80
/* 004B80 9FC04B80 AFB30224 */  sw          $s3, 0x224($sp)
/* 004B84 9FC04B84 00E09821 */  addu        $s3, $a3, $zero
/* 004B88 9FC04B88 00403821 */  addu        $a3, $v0, $zero
/* 004B8C 9FC04B8C AFBF022C */  sw          $ra, 0x22c($sp)
/* 004B90 9FC04B90 AFB1021C */  sw          $s1, 0x21c($sp)
/* 004B94 9FC04B94 0FF01308 */  jal         aesMakeKey
/* 004B98 9FC04B98 AFB00218 */   sw         $s0, 0x218($sp)
/* 004B9C 9FC04B9C 00408821 */  addu        $s1, $v0, $zero
/* 004BA0 9FC04BA0 24020001 */  addiu       $v0, $zero, 1
/* 004BA4 9FC04BA4 16220013 */  bne         $s1, $v0, .L9FC04BF4
/* 004BA8 9FC04BA8 2402FFFF */   addiu      $v0, $zero, -1
/* 004BAC 9FC04BAC 27B00200 */  addiu       $s0, $sp, 0x200
/* 004BB0 9FC04BB0 02002021 */  addu        $a0, $s0, $zero
/* 004BB4 9FC04BB4 24050002 */  addiu       $a1, $zero, 2
/* 004BB8 9FC04BB8 0FF01336 */  jal         aesCipherInit
/* 004BBC 9FC04BBC 02403021 */   addu       $a2, $s2, $zero
/* 004BC0 9FC04BC0 1451000C */  bne         $v0, $s1, .L9FC04BF4
/* 004BC4 9FC04BC4 2402FFFF */   addiu      $v0, $zero, -1
/* 004BC8 9FC04BC8 02002021 */  addu        $a0, $s0, $zero
/* 004BCC 9FC04BCC 27A50018 */  addiu       $a1, $sp, 0x18
/* 004BD0 9FC04BD0 02803021 */  addu        $a2, $s4, $zero
/* 004BD4 9FC04BD4 001380C0 */  sll         $s0, $s3, 3
/* 004BD8 9FC04BD8 8FA20240 */  lw          $v0, 0x240($sp)
/* 004BDC 9FC04BDC 02003821 */  addu        $a3, $s0, $zero
/* 004BE0 9FC04BE0 0FF013B0 */  jal         aesBlockDecrypt
/* 004BE4 9FC04BE4 AFA20010 */   sw         $v0, 0x10($sp)
/* 004BE8 9FC04BE8 14500002 */  bne         $v0, $s0, .L9FC04BF4
/* 004BEC 9FC04BEC 2402FFFF */   addiu      $v0, $zero, -1
/* 004BF0 9FC04BF0 00001021 */  addu        $v0, $zero, $zero
.L9FC04BF4:
/* 004BF4 9FC04BF4 8FBF022C */  lw          $ra, 0x22c($sp)
/* 004BF8 9FC04BF8 8FB40228 */  lw          $s4, 0x228($sp)
/* 004BFC 9FC04BFC 8FB30224 */  lw          $s3, 0x224($sp)
/* 004C00 9FC04C00 8FB20220 */  lw          $s2, 0x220($sp)
/* 004C04 9FC04C04 8FB1021C */  lw          $s1, 0x21c($sp)
/* 004C08 9FC04C08 8FB00218 */  lw          $s0, 0x218($sp)
/* 004C0C 9FC04C0C 03E00008 */  jr          $ra
/* 004C10 9FC04C10 27BD0230 */   addiu      $sp, $sp, 0x230
