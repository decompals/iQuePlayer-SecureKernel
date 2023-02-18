## write_virage2
## virage2_gen_public_key
## func_9FC03410
## aes_cbc_set_key_iv
## read_virage01
/* 003AAC 9FC03AAC 10C00007 */  beqz        $a2, .L9FC03ACC
/* 003AB0 9FC03AB0 00801821 */   addu       $v1, $a0, $zero
.L9FC03AB4:
/* 003AB4 9FC03AB4 8CA20000 */  lw          $v0, ($a1)
/* 003AB8 9FC03AB8 24A50004 */  addiu       $a1, $a1, 4
/* 003ABC 9FC03ABC 24C6FFFF */  addiu       $a2, $a2, -1
/* 003AC0 9FC03AC0 AC620000 */  sw          $v0, ($v1)
/* 003AC4 9FC03AC4 14C0FFFB */  bnez        $a2, .L9FC03AB4
/* 003AC8 9FC03AC8 24630004 */   addiu      $v1, $v1, 4
.L9FC03ACC:
/* 003ACC 9FC03ACC 03E00008 */  jr          $ra
/* 003AD0 9FC03AD0 00801021 */   addu       $v0, $a0, $zero
