## skVerifyHash
## recrypt_list_verify_ecc_sig
/* 0031D0 9FC031D0 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 0031D4 9FC031D4 AFB00010 */  sw          $s0, 0x10($sp)
/* 0031D8 9FC031D8 00808021 */  addu        $s0, $a0, $zero
/* 0031DC 9FC031DC 00001821 */  addu        $v1, $zero, $zero
/* 0031E0 9FC031E0 AFBF0014 */  sw          $ra, 0x14($sp)
.L9FC031E4:
/* 0031E4 9FC031E4 3C069FC1 */  lui         $a2, %hi(virage2_offset)
/* 0031E8 9FC031E8 8CC6EBC0 */  lw          $a2, %lo(virage2_offset)($a2)
/* 0031EC 9FC031EC 00031080 */  sll         $v0, $v1, 2
/* 0031F0 9FC031F0 24C50054 */  addiu       $a1, $a2, 0x54
/* 0031F4 9FC031F4 00A21021 */  addu        $v0, $a1, $v0
/* 0031F8 9FC031F8 8C420000 */  lw          $v0, ($v0)
/* 0031FC 9FC031FC 10400004 */  beqz        $v0, .L9FC03210
/* 003200 9FC03200 24630001 */   addiu      $v1, $v1, 1
/* 003204 9FC03204 02002021 */  addu        $a0, $s0, $zero
/* 003208 9FC03208 0BF00C8E */  j           .L9FC03238
/* 00320C 9FC0320C 24060010 */   addiu      $a2, $zero, 0x10
.L9FC03210:
/* 003210 9FC03210 2C620010 */  sltiu       $v0, $v1, 0x10
/* 003214 9FC03214 1440FFF3 */  bnez        $v0, .L9FC031E4
/* 003218 9FC03218 02002021 */   addu       $a0, $s0, $zero
/* 00321C 9FC0321C 0FF023ED */  jal         eccGenPublicKey
/* 003220 9FC03220 24C50098 */   addiu      $a1, $a2, 0x98
/* 003224 9FC03224 02002821 */  addu        $a1, $s0, $zero
/* 003228 9FC03228 3C049FC1 */  lui         $a0, %hi(virage2_offset)
/* 00322C 9FC0322C 8C84EBC0 */  lw          $a0, %lo(virage2_offset)($a0)
/* 003230 9FC03230 24060010 */  addiu       $a2, $zero, 0x10
/* 003234 9FC03234 24840054 */  addiu       $a0, $a0, 0x54
.L9FC03238:
/* 003238 9FC03238 0FF00EAB */  jal         wordcopy
/* 00323C 9FC0323C 00000000 */   nop
/* 003240 9FC03240 8FBF0014 */  lw          $ra, 0x14($sp)
/* 003244 9FC03244 8FB00010 */  lw          $s0, 0x10($sp)
/* 003248 9FC03248 03E00008 */  jr          $ra
/* 00324C 9FC0324C 27BD0018 */   addiu      $sp, $sp, 0x18
