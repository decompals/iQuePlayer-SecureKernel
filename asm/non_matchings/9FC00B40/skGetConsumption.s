/* 001918 9FC01918 27BDFFE0 */  addiu       $sp, $sp, -0x20
/* 00191C 9FC0191C AFB10014 */  sw          $s1, 0x14($sp)
/* 001920 9FC01920 00808821 */  addu        $s1, $a0, $zero
/* 001924 9FC01924 AFB00010 */  sw          $s0, 0x10($sp)
/* 001928 9FC01928 00A08021 */  addu        $s0, $a1, $zero
/* 00192C 9FC0192C 24050002 */  addiu       $a1, $zero, 2
/* 001930 9FC01930 AFBF0018 */  sw          $ra, 0x18($sp)
/* 001934 9FC01934 0FF00F65 */  jal         check_untrusted_ptr_range
/* 001938 9FC01938 24060002 */   addiu      $a2, $zero, 2
/* 00193C 9FC0193C 10400006 */  beqz        $v0, .L9FC01958
/* 001940 9FC01940 02002021 */   addu       $a0, $s0, $zero
/* 001944 9FC01944 24050034 */  addiu       $a1, $zero, 0x34
/* 001948 9FC01948 0FF00F65 */  jal         check_untrusted_ptr_range
/* 00194C 9FC0194C 24060002 */   addiu      $a2, $zero, 2
/* 001950 9FC01950 14400003 */  bnez        $v0, .L9FC01960
/* 001954 9FC01954 02002021 */   addu       $a0, $s0, $zero
.L9FC01958:
/* 001958 9FC01958 0BF00660 */  j           .L9FC01980
/* 00195C 9FC0195C 2402FFFF */   addiu      $v0, $zero, -1
.L9FC01960:
/* 001960 9FC01960 3C029FC1 */  lui         $v0, %hi(minimum_ticket_id)
/* 001964 9FC01964 2442F30E */  addiu       $v0, $v0, %lo(minimum_ticket_id)
/* 001968 9FC01968 24450002 */  addiu       $a1, $v0, 2
/* 00196C 9FC0196C 94420000 */  lhu         $v0, ($v0)
/* 001970 9FC01970 24060034 */  addiu       $a2, $zero, 0x34
/* 001974 9FC01974 0FF00EA1 */  jal         memcpy
/* 001978 9FC01978 A6220000 */   sh         $v0, ($s1)
/* 00197C 9FC0197C 00001021 */  addu        $v0, $zero, $zero
.L9FC01980:
/* 001980 9FC01980 8FBF0018 */  lw          $ra, 0x18($sp)
/* 001984 9FC01984 8FB10014 */  lw          $s1, 0x14($sp)
/* 001988 9FC01988 8FB00010 */  lw          $s0, 0x10($sp)
/* 00198C 9FC0198C 03E00008 */  jr          $ra
/* 001990 9FC01990 27BD0020 */   addiu      $sp, $sp, 0x20
