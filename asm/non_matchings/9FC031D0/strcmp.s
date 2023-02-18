## verify_cert_signature
## verify_cert_chain
## verify_crlbundle
## check_cert_ranges
/* 003970 9FC03970 0BF00E64 */  j           .L9FC03990
/* 003974 9FC03974 80830000 */   lb         $v1, ($a0)
.L9FC03978:
/* 003978 9FC03978 14C00003 */  bnez        $a2, .L9FC03988
/* 00397C 9FC0397C 24840001 */   addiu      $a0, $a0, 1
/* 003980 9FC03980 03E00008 */  jr          $ra
/* 003984 9FC03984 00001021 */   addu       $v0, $zero, $zero
.L9FC03988:
/* 003988 9FC03988 24A50001 */  addiu       $a1, $a1, 1
/* 00398C 9FC0398C 80830000 */  lb          $v1, ($a0)
.L9FC03990:
/* 003990 9FC03990 80A20000 */  lb          $v0, ($a1)
/* 003994 9FC03994 1062FFF8 */  beq         $v1, $v0, .L9FC03978
/* 003998 9FC03998 90860000 */   lbu        $a2, ($a0)
/* 00399C 9FC0399C 80830000 */  lb          $v1, ($a0)
/* 0039A0 9FC039A0 80A20000 */  lb          $v0, ($a1)
/* 0039A4 9FC039A4 03E00008 */  jr          $ra
/* 0039A8 9FC039A8 00621023 */   subu       $v0, $v1, $v0
