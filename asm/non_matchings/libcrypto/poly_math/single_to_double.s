## poly_mul_partial
## cus_times_u_to_n
/* 007C90 9FC07C90 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 007C94 9FC07C94 AFB10014 */  sw          $s1, 0x14($sp)
/* 007C98 9FC07C98 00808821 */  addu        $s1, $a0, $zero
/* 007C9C 9FC07C9C AFB00010 */  sw          $s0, 0x10($sp)
/* 007CA0 9FC07CA0 00A08021 */  addu        $s0, $a1, $zero
/* 007CA4 9FC07CA4 AFBF0018 */  sw          $ra, 0x18($sp)
/* 007CA8 9FC07CA8 0FF01EEB */  jal         double_null
/* 007CAC 9FC07CAC 02002021 */   addu       $a0, $s0, $zero
/* 007CB0 9FC07CB0 3C040001 */  lui         $a0, 1
/* 007CB4 9FC07CB4 2610001C */  addiu       $s0, $s0, 0x1c
.L9FC07CB8:
/* 007CB8 9FC07CB8 00801021 */  addu        $v0, $a0, $zero
/* 007CBC 9FC07CBC 3C030001 */  lui         $v1, 1
/* 007CC0 9FC07CC0 00832021 */  addu        $a0, $a0, $v1
/* 007CC4 9FC07CC4 8E230000 */  lw          $v1, ($s1)
/* 007CC8 9FC07CC8 26310004 */  addiu       $s1, $s1, 4
/* 007CCC 9FC07CCC 00021402 */  srl         $v0, $v0, 0x10
/* 007CD0 9FC07CD0 2C420008 */  sltiu       $v0, $v0, 8
/* 007CD4 9FC07CD4 AE030000 */  sw          $v1, ($s0)
/* 007CD8 9FC07CD8 1440FFF7 */  bnez        $v0, .L9FC07CB8
/* 007CDC 9FC07CDC 26100004 */   addiu      $s0, $s0, 4
/* 007CE0 9FC07CE0 8FBF0018 */  lw          $ra, 0x18($sp)
/* 007CE4 9FC07CE4 8FB10014 */  lw          $s1, 0x14($sp)
/* 007CE8 9FC07CE8 8FB00010 */  lw          $s0, 0x10($sp)
/* 007CEC 9FC07CEC 03E00008 */  jr          $ra
/* 007CF0 9FC07CF0 27BD0020 */   addiu      $sp, $sp, 0x20
