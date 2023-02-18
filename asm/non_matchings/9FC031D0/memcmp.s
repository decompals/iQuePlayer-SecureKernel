## skLaunch
## skRecryptEnd
## func_9FC020C4
## rsa_check_signature
## strstr
/* 003B1C 9FC03B1C 0BF00ED1 */  j           .L9FC03B44
/* 003B20 9FC03B20 00C01021 */   addu       $v0, $a2, $zero
.L9FC03B24:
/* 003B24 9FC03B24 90A30000 */  lbu         $v1, ($a1)
/* 003B28 9FC03B28 24A50001 */  addiu       $a1, $a1, 1
/* 003B2C 9FC03B2C 90820000 */  lbu         $v0, ($a0)
/* 003B30 9FC03B30 10430003 */  beq         $v0, $v1, .L9FC03B40
/* 003B34 9FC03B34 24840001 */   addiu      $a0, $a0, 1
/* 003B38 9FC03B38 03E00008 */  jr          $ra
/* 003B3C 9FC03B3C 00431023 */   subu       $v0, $v0, $v1
.L9FC03B40:
/* 003B40 9FC03B40 00C01021 */  addu        $v0, $a2, $zero
.L9FC03B44:
/* 003B44 9FC03B44 1440FFF7 */  bnez        $v0, .L9FC03B24
/* 003B48 9FC03B48 24C6FFFF */   addiu      $a2, $a2, -1
/* 003B4C 9FC03B4C 03E00008 */  jr          $ra
/* 003B50 9FC03B50 00001021 */   addu       $v0, $zero, $zero
