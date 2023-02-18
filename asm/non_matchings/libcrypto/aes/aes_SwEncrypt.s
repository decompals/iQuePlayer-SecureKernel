## recrypt_list_add_entry
/* 004AA4 9FC04AA4 27BDFDD0 */  addiu       $sp, $sp, -0x230
/* 004AA8 9FC04AA8 00801021 */  addu        $v0, $a0, $zero
/* 004AAC 9FC04AAC 27A40018 */  addiu       $a0, $sp, 0x18
/* 004AB0 9FC04AB0 AFB20220 */  sw          $s2, 0x220($sp)
/* 004AB4 9FC04AB4 00A09021 */  addu        $s2, $a1, $zero
/* 004AB8 9FC04AB8 00002821 */  addu        $a1, $zero, $zero
/* 004ABC 9FC04ABC AFB40228 */  sw          $s4, 0x228($sp)
/* 004AC0 9FC04AC0 00C0A021 */  addu        $s4, $a2, $zero
/* 004AC4 9FC04AC4 24060080 */  addiu       $a2, $zero, 0x80
/* 004AC8 9FC04AC8 AFB30224 */  sw          $s3, 0x224($sp)
/* 004ACC 9FC04ACC 00E09821 */  addu        $s3, $a3, $zero
/* 004AD0 9FC04AD0 00403821 */  addu        $a3, $v0, $zero
/* 004AD4 9FC04AD4 AFBF022C */  sw          $ra, 0x22c($sp)
/* 004AD8 9FC04AD8 AFB1021C */  sw          $s1, 0x21c($sp)
/* 004ADC 9FC04ADC 0FF01308 */  jal         aesMakeKey
/* 004AE0 9FC04AE0 AFB00218 */   sw         $s0, 0x218($sp)
/* 004AE4 9FC04AE4 00408821 */  addu        $s1, $v0, $zero
/* 004AE8 9FC04AE8 24020001 */  addiu       $v0, $zero, 1
/* 004AEC 9FC04AEC 16220013 */  bne         $s1, $v0, .L9FC04B3C
/* 004AF0 9FC04AF0 2402FFFF */   addiu      $v0, $zero, -1
/* 004AF4 9FC04AF4 27B00200 */  addiu       $s0, $sp, 0x200
/* 004AF8 9FC04AF8 02002021 */  addu        $a0, $s0, $zero
/* 004AFC 9FC04AFC 24050002 */  addiu       $a1, $zero, 2
/* 004B00 9FC04B00 0FF01336 */  jal         aesCipherInit
/* 004B04 9FC04B04 02403021 */   addu       $a2, $s2, $zero
/* 004B08 9FC04B08 1451000C */  bne         $v0, $s1, .L9FC04B3C
/* 004B0C 9FC04B0C 2402FFFF */   addiu      $v0, $zero, -1
/* 004B10 9FC04B10 02002021 */  addu        $a0, $s0, $zero
/* 004B14 9FC04B14 27A50018 */  addiu       $a1, $sp, 0x18
/* 004B18 9FC04B18 02803021 */  addu        $a2, $s4, $zero
/* 004B1C 9FC04B1C 001380C0 */  sll         $s0, $s3, 3
/* 004B20 9FC04B20 8FA20240 */  lw          $v0, 0x240($sp)
/* 004B24 9FC04B24 02003821 */  addu        $a3, $s0, $zero
/* 004B28 9FC04B28 0FF0134D */  jal         aesBlockEncrypt
/* 004B2C 9FC04B2C AFA20010 */   sw         $v0, 0x10($sp)
/* 004B30 9FC04B30 14500002 */  bne         $v0, $s0, .L9FC04B3C
/* 004B34 9FC04B34 2402FFFF */   addiu      $v0, $zero, -1
/* 004B38 9FC04B38 00001021 */  addu        $v0, $zero, $zero
.L9FC04B3C:
/* 004B3C 9FC04B3C 8FBF022C */  lw          $ra, 0x22c($sp)
/* 004B40 9FC04B40 8FB40228 */  lw          $s4, 0x228($sp)
/* 004B44 9FC04B44 8FB30224 */  lw          $s3, 0x224($sp)
/* 004B48 9FC04B48 8FB20220 */  lw          $s2, 0x220($sp)
/* 004B4C 9FC04B4C 8FB1021C */  lw          $s1, 0x21c($sp)
/* 004B50 9FC04B50 8FB00218 */  lw          $s0, 0x218($sp)
/* 004B54 9FC04B54 03E00008 */  jr          $ra
/* 004B58 9FC04B58 27BD0230 */   addiu      $sp, $sp, 0x230
