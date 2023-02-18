## set_virage01_selector
/* 003FA4 9FC03FA4 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 003FA8 9FC03FA8 3C02BFCA */  lui         $v0, (0xBFCAC000 >> 16)
/* 003FAC 9FC03FAC 3442C000 */  ori         $v0, $v0, (0xBFCAC000 & 0xFFFF)
/* 003FB0 9FC03FB0 3C041FC8 */  lui         $a0, (0x1FC8C000 >> 16)
/* 003FB4 9FC03FB4 AFBF0010 */  sw          $ra, 0x10($sp)
/* 003FB8 9FC03FB8 AC400000 */  sw          $zero, ($v0)
/* 003FBC 9FC03FBC 0FF00FCC */  jal         initialize_virage_controller
/* 003FC0 9FC03FC0 3484C000 */   ori        $a0, $a0, (0x1FC8C000 & 0xFFFF)
/* 003FC4 9FC03FC4 3C041FC9 */  lui         $a0, (0x1FC9C000 >> 16)
/* 003FC8 9FC03FC8 0FF00FCC */  jal         initialize_virage_controller
/* 003FCC 9FC03FCC 3484C000 */   ori        $a0, $a0, (0x1FC9C000 & 0xFFFF)
/* 003FD0 9FC03FD0 3C041FCA */  lui         $a0, (0x1FCAC000 >> 16)
/* 003FD4 9FC03FD4 0FF00FCC */  jal         initialize_virage_controller
/* 003FD8 9FC03FD8 3484C000 */   ori        $a0, $a0, (0x1FCAC000 & 0xFFFF)
/* 003FDC 9FC03FDC 8FBF0010 */  lw          $ra, 0x10($sp)
/* 003FE0 9FC03FE0 03E00008 */  jr          $ra
/* 003FE4 9FC03FE4 27BD0018 */   addiu      $sp, $sp, 0x18
