## skRecryptListValid
## recrypt_list_add_new_entry
## recrypt_list_get_key_for_cid
/* 004608 9FC04608 8C820040 */  lw          $v0, 0x40($a0)
/* 00460C 9FC0460C 27BDFFE8 */  addiu       $sp, $sp, -0x18
/* 004610 9FC04610 00021140 */  sll         $v0, $v0, 5
/* 004614 9FC04614 24420044 */  addiu       $v0, $v0, 0x44
/* 004618 9FC04618 28424000 */  slti        $v0, $v0, 0x4000
/* 00461C 9FC0461C 14400003 */  bnez        $v0, .L9FC0462C
/* 004620 9FC04620 AFBF0010 */   sw         $ra, 0x10($sp)
/* 004624 9FC04624 0BF0118D */  j           .L9FC04634
/* 004628 9FC04628 2402FFFF */   addiu      $v0, $zero, -1
.L9FC0462C:
/* 00462C 9FC0462C 0FF010EC */  jal         recrypt_list_verify_ecc_sig
/* 004630 9FC04630 00000000 */   nop
.L9FC04634:
/* 004634 9FC04634 8FBF0010 */  lw          $ra, 0x10($sp)
/* 004638 9FC04638 03E00008 */  jr          $ra
/* 00463C 9FC0463C 27BD0018 */   addiu      $sp, $sp, 0x18
