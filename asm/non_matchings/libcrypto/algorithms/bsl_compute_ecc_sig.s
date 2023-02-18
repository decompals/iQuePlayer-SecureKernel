## func_9FC03694
/* 009C14 9FC09C14 27BDFEA0 */  addiu       $sp, $sp, -0x160
/* 009C18 9FC09C18 AFB20150 */  sw          $s2, 0x150($sp)
/* 009C1C 9FC09C1C 00809021 */  addu        $s2, $a0, $zero
/* 009C20 9FC09C20 27A40020 */  addiu       $a0, $sp, 0x20
/* 009C24 9FC09C24 AFB1014C */  sw          $s1, 0x14c($sp)
/* 009C28 9FC09C28 00A08821 */  addu        $s1, $a1, $zero
/* 009C2C 9FC09C2C AFB40158 */  sw          $s4, 0x158($sp)
/* 009C30 9FC09C30 8FB40170 */  lw          $s4, 0x170($sp)
/* 009C34 9FC09C34 240500E9 */  addiu       $a1, $zero, 0xe9
/* 009C38 9FC09C38 AFB00148 */  sw          $s0, 0x148($sp)
/* 009C3C 9FC09C3C 00C08021 */  addu        $s0, $a2, $zero
/* 009C40 9FC09C40 AFB30154 */  sw          $s3, 0x154($sp)
/* 009C44 9FC09C44 AFBF015C */  sw          $ra, 0x15c($sp)
/* 009C48 9FC09C48 0FF02539 */  jal         Init_233_bit_ECDSA
/* 009C4C 9FC09C4C 00E09821 */   addu       $s3, $a3, $zero
/* 009C50 9FC09C50 00002021 */  addu        $a0, $zero, $zero
.L9FC09C54:
/* 009C54 9FC09C54 8E030000 */  lw          $v1, ($s0)
/* 009C58 9FC09C58 00041080 */  sll         $v0, $a0, 2
/* 009C5C 9FC09C5C 24840001 */  addiu       $a0, $a0, 1
/* 009C60 9FC09C60 27A70128 */  addiu       $a3, $sp, 0x128
/* 009C64 9FC09C64 00E21021 */  addu        $v0, $a3, $v0
/* 009C68 9FC09C68 AC430000 */  sw          $v1, ($v0)
/* 009C6C 9FC09C6C 2C820008 */  sltiu       $v0, $a0, 8
/* 009C70 9FC09C70 1440FFF8 */  bnez        $v0, .L9FC09C54
/* 009C74 9FC09C74 26100004 */   addiu      $s0, $s0, 4
/* 009C78 9FC09C78 02402021 */  addu        $a0, $s2, $zero
/* 009C7C 9FC09C7C 02202821 */  addu        $a1, $s1, $zero
/* 009C80 9FC09C80 27B000E8 */  addiu       $s0, $sp, 0xe8
/* 009C84 9FC09C84 8FA30128 */  lw          $v1, 0x128($sp)
/* 009C88 9FC09C88 8FA20174 */  lw          $v0, 0x174($sp)
/* 009C8C 9FC09C8C 27A60020 */  addiu       $a2, $sp, 0x20
/* 009C90 9FC09C90 AFB00010 */  sw          $s0, 0x10($sp)
/* 009C94 9FC09C94 AFB30014 */  sw          $s3, 0x14($sp)
/* 009C98 9FC09C98 306301FF */  andi        $v1, $v1, 0x1ff
/* 009C9C 9FC09C9C AFA20018 */  sw          $v0, 0x18($sp)
/* 009CA0 9FC09CA0 0FF02574 */  jal         poly_ECDSA_signature
/* 009CA4 9FC09CA4 AFA30128 */   sw         $v1, 0x128($sp)
/* 009CA8 9FC09CA8 14400008 */  bnez        $v0, .L9FC09CCC
/* 009CAC 9FC09CAC 24020002 */   addiu      $v0, $zero, 2
/* 009CB0 9FC09CB0 02002021 */  addu        $a0, $s0, $zero
/* 009CB4 9FC09CB4 0FF01F08 */  jal         copy
/* 009CB8 9FC09CB8 02802821 */   addu       $a1, $s4, $zero
/* 009CBC 9FC09CBC 27A40108 */  addiu       $a0, $sp, 0x108
/* 009CC0 9FC09CC0 0FF01F08 */  jal         copy
/* 009CC4 9FC09CC4 26850020 */   addiu      $a1, $s4, 0x20
/* 009CC8 9FC09CC8 00001021 */  addu        $v0, $zero, $zero
.L9FC09CCC:
/* 009CCC 9FC09CCC 8FBF015C */  lw          $ra, 0x15c($sp)
/* 009CD0 9FC09CD0 8FB40158 */  lw          $s4, 0x158($sp)
/* 009CD4 9FC09CD4 8FB30154 */  lw          $s3, 0x154($sp)
/* 009CD8 9FC09CD8 8FB20150 */  lw          $s2, 0x150($sp)
/* 009CDC 9FC09CDC 8FB1014C */  lw          $s1, 0x14c($sp)
/* 009CE0 9FC09CE0 8FB00148 */  lw          $s0, 0x148($sp)
/* 009CE4 9FC09CE4 03E00008 */  jr          $ra
/* 009CE8 9FC09CE8 27BD0160 */   addiu      $sp, $sp, 0x160
