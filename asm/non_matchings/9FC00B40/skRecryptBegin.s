/* 00121C 9FC0121C 27BDFFC8 */  addiu       $sp, $sp, -0x38
/* 001220 9FC01220 00801021 */  addu        $v0, $a0, $zero
/* 001224 9FC01224 AFB3002C */  sw          $s3, 0x2c($sp)
/* 001228 9FC01228 00C09821 */  addu        $s3, $a2, $zero
/* 00122C 9FC0122C AFBF0034 */  sw          $ra, 0x34($sp)
/* 001230 9FC01230 AFB40030 */  sw          $s4, 0x30($sp)
/* 001234 9FC01234 AFB20028 */  sw          $s2, 0x28($sp)
/* 001238 9FC01238 AFB10024 */  sw          $s1, 0x24($sp)
/* 00123C 9FC0123C AFB00020 */  sw          $s0, 0x20($sp)
/* 001240 9FC01240 8C420000 */  lw          $v0, ($v0)
/* 001244 9FC01244 24070001 */  addiu       $a3, $zero, 1
/* 001248 9FC01248 0FF00373 */  jal         func_9FC00DCC
/* 00124C 9FC0124C 245429AC */   addiu      $s4, $v0, 0x29ac
/* 001250 9FC01250 00408821 */  addu        $s1, $v0, $zero
/* 001254 9FC01254 16200036 */  bnez        $s1, .L9FC01330
/* 001258 9FC01258 8FBF0034 */   lw         $ra, 0x34($sp)
/* 00125C 9FC0125C 02602021 */  addu        $a0, $s3, $zero
/* 001260 9FC01260 3C129FC1 */  lui         $s2, %hi(contentMetaDataHead + 0x98)
/* 001264 9FC01264 2652EDCC */  addiu       $s2, $s2, %lo(contentMetaDataHead + 0x98)
/* 001268 9FC01268 8E460000 */  lw          $a2, ($s2)
/* 00126C 9FC0126C 0FF011AE */  jal         recrypt_list_get_key_for_cid
/* 001270 9FC01270 27A50010 */   addiu      $a1, $sp, 0x10
/* 001274 9FC01274 00408821 */  addu        $s1, $v0, $zero
/* 001278 9FC01278 24020003 */  addiu       $v0, $zero, 3
/* 00127C 9FC0127C 16220009 */  bne         $s1, $v0, .L9FC012A4
/* 001280 9FC01280 26440004 */   addiu      $a0, $s2, 4
/* 001284 9FC01284 24020001 */  addiu       $v0, $zero, 1
/* 001288 9FC01288 3C019FC1 */  lui         $at, %hi(D_9FC0F2DC)
/* 00128C 9FC0128C AC22F2DC */  sw          $v0, %lo(D_9FC0F2DC)($at)
/* 001290 9FC01290 27A40010 */  addiu       $a0, $sp, 0x10
/* 001294 9FC01294 0FF00DFF */  jal         aes_cbc_set_key_iv
/* 001298 9FC01298 2645FFA0 */   addiu      $a1, $s2, -0x60
/* 00129C 9FC0129C 0BF004B7 */  j           .L9FC012DC
/* 0012A0 9FC012A0 00000000 */   nop
.L9FC012A4:
/* 0012A4 9FC012A4 2650FFA0 */  addiu       $s0, $s2, -0x60
/* 0012A8 9FC012A8 3C019FC1 */  lui         $at, %hi(D_9FC0F2DC)
/* 0012AC 9FC012AC AC20F2DC */  sw          $zero, %lo(D_9FC0F2DC)($at)
/* 0012B0 9FC012B0 0FF00DFF */  jal         aes_cbc_set_key_iv
/* 0012B4 9FC012B4 02002821 */   addu       $a1, $s0, $zero
/* 0012B8 9FC012B8 3C049FC1 */  lui         $a0, %hi(D_9FC0F2C8)
/* 0012BC 9FC012BC 2484F2C8 */  addiu       $a0, $a0, %lo(D_9FC0F2C8)
/* 0012C0 9FC012C0 24050002 */  addiu       $a1, $zero, 2
/* 0012C4 9FC012C4 0FF01336 */  jal         aesCipherInit
/* 0012C8 9FC012C8 02003021 */   addu       $a2, $s0, $zero
/* 0012CC 9FC012CC 02602021 */  addu        $a0, $s3, $zero
/* 0012D0 9FC012D0 8E450000 */  lw          $a1, ($s2)
/* 0012D4 9FC012D4 0FF01190 */  jal         recrypt_list_add_new_entry
/* 0012D8 9FC012D8 24060003 */   addiu      $a2, $zero, 3
.L9FC012DC:
/* 0012DC 9FC012DC 3C049FC1 */  lui         $a0, %hi(D_9FC0F0E0)
/* 0012E0 9FC012E0 2484F0E0 */  addiu       $a0, $a0, %lo(D_9FC0F0E0)
/* 0012E4 9FC012E4 00002821 */  addu        $a1, $zero, $zero
/* 0012E8 9FC012E8 24060080 */  addiu       $a2, $zero, 0x80
/* 0012EC 9FC012EC 0FF01308 */  jal         aesMakeKey
/* 0012F0 9FC012F0 27A70010 */   addiu      $a3, $sp, 0x10
/* 0012F4 9FC012F4 3C049FC1 */  lui         $a0, %hi(sha1_ctx)
/* 0012F8 9FC012F8 2484F080 */  addiu       $a0, $a0, %lo(sha1_ctx)
/* 0012FC 9FC012FC 0FF019FF */  jal         SHA1Reset
/* 001300 9FC01300 00000000 */   nop
/* 001304 9FC01304 3C049FC1 */  lui         $a0, %hi(ticketHead)
/* 001308 9FC01308 2484EEE0 */  addiu       $a0, $a0, %lo(ticketHead)
/* 00130C 9FC0130C 02802821 */  addu        $a1, $s4, $zero
/* 001310 9FC01310 0FF00EA1 */  jal         memcpy
/* 001314 9FC01314 240601A0 */   addiu      $a2, $zero, 0x1a0
/* 001318 9FC01318 02201021 */  addu        $v0, $s1, $zero
/* 00131C 9FC0131C 3C019FC1 */  lui         $at, %hi(D_9FC0F0DC)
/* 001320 9FC01320 AC20F0DC */  sw          $zero, %lo(D_9FC0F0DC)($at)
/* 001324 9FC01324 3C019FC1 */  lui         $at, %hi(D_9FC0F2E0)
/* 001328 9FC01328 AC20F2E0 */  sw          $zero, %lo(D_9FC0F2E0)($at)
/* 00132C 9FC0132C 8FBF0034 */  lw          $ra, 0x34($sp)
.L9FC01330:
/* 001330 9FC01330 8FB40030 */  lw          $s4, 0x30($sp)
/* 001334 9FC01334 8FB3002C */  lw          $s3, 0x2c($sp)
/* 001338 9FC01338 8FB20028 */  lw          $s2, 0x28($sp)
/* 00133C 9FC0133C 8FB10024 */  lw          $s1, 0x24($sp)
/* 001340 9FC01340 8FB00020 */  lw          $s0, 0x20($sp)
/* 001344 9FC01344 03E00008 */  jr          $ra
/* 001348 9FC01348 27BD0038 */   addiu      $sp, $sp, 0x38
