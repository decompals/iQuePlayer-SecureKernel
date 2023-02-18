## func_9FC0134C
## aes_SwEncrypt
/* 004D34 9FC04D34 27BDFFB8 */  addiu       $sp, $sp, -0x48
/* 004D38 9FC04D38 AFB3002C */  sw          $s3, 0x2c($sp)
/* 004D3C 9FC04D3C 8FB30058 */  lw          $s3, 0x58($sp)
/* 004D40 9FC04D40 AFB00020 */  sw          $s0, 0x20($sp)
/* 004D44 9FC04D44 00C08021 */  addu        $s0, $a2, $zero
/* 004D48 9FC04D48 AFB50034 */  sw          $s5, 0x34($sp)
/* 004D4C 9FC04D4C 00A0A821 */  addu        $s5, $a1, $zero
/* 004D50 9FC04D50 AFBF0040 */  sw          $ra, 0x40($sp)
/* 004D54 9FC04D54 AFB7003C */  sw          $s7, 0x3c($sp)
/* 004D58 9FC04D58 AFB60038 */  sw          $s6, 0x38($sp)
/* 004D5C 9FC04D5C AFB40030 */  sw          $s4, 0x30($sp)
/* 004D60 9FC04D60 AFB20028 */  sw          $s2, 0x28($sp)
/* 004D64 9FC04D64 10800048 */  beqz        $a0, .L9FC04E88
/* 004D68 9FC04D68 AFB10024 */   sw         $s1, 0x24($sp)
/* 004D6C 9FC04D6C 12A00046 */  beqz        $s5, .L9FC04E88
/* 004D70 9FC04D70 24050001 */   addiu      $a1, $zero, 1
/* 004D74 9FC04D74 92A20000 */  lbu         $v0, ($s5)
/* 004D78 9FC04D78 50450046 */  beql        $v0, $a1, .L9FC04E94
/* 004D7C 9FC04D7C 2402FFFB */   addiu      $v0, $zero, -5
/* 004D80 9FC04D80 12000044 */  beqz        $s0, .L9FC04E94
/* 004D84 9FC04D84 00001021 */   addu       $v0, $zero, $zero
/* 004D88 9FC04D88 5CE00003 */  bgtzl       $a3, .L9FC04D98
/* 004D8C 9FC04D8C 8C830000 */   lw         $v1, ($a0)
/* 004D90 9FC04D90 0BF013A6 */  j           .L9FC04E98
/* 004D94 9FC04D94 8FBF0040 */   lw         $ra, 0x40($sp)
.L9FC04D98:
/* 004D98 9FC04D98 10650006 */  beq         $v1, $a1, .L9FC04DB4
/* 004D9C 9FC04D9C 0007B1C3 */   sra        $s6, $a3, 7
/* 004DA0 9FC04DA0 24020002 */  addiu       $v0, $zero, 2
/* 004DA4 9FC04DA4 10620010 */  beq         $v1, $v0, .L9FC04DE8
/* 004DA8 9FC04DA8 2402FFFB */   addiu      $v0, $zero, -5
/* 004DAC 9FC04DAC 0BF013A6 */  j           .L9FC04E98
/* 004DB0 9FC04DB0 8FBF0040 */   lw         $ra, 0x40($sp)
.L9FC04DB4:
/* 004DB4 9FC04DB4 1AC00036 */  blez        $s6, .L9FC04E90
/* 004DB8 9FC04DB8 02C08821 */   addu       $s1, $s6, $zero
.L9FC04DBC:
/* 004DBC 9FC04DBC 26A40008 */  addiu       $a0, $s5, 8
/* 004DC0 9FC04DC0 8EA50004 */  lw          $a1, 4($s5)
/* 004DC4 9FC04DC4 02003021 */  addu        $a2, $s0, $zero
/* 004DC8 9FC04DC8 02603821 */  addu        $a3, $s3, $zero
/* 004DCC 9FC04DCC 0FF01634 */  jal         rijndaelEncrypt
/* 004DD0 9FC04DD0 2631FFFF */   addiu      $s1, $s1, -1
/* 004DD4 9FC04DD4 26100010 */  addiu       $s0, $s0, 0x10
/* 004DD8 9FC04DD8 1E20FFF8 */  bgtz        $s1, .L9FC04DBC
/* 004DDC 9FC04DDC 26730010 */   addiu      $s3, $s3, 0x10
/* 004DE0 9FC04DE0 0BF013A5 */  j           .L9FC04E94
/* 004DE4 9FC04DE4 001611C0 */   sll        $v0, $s6, 7
.L9FC04DE8:
/* 004DE8 9FC04DE8 248A0004 */  addiu       $t2, $a0, 4
/* 004DEC 9FC04DEC 02C08821 */  addu        $s1, $s6, $zero
/* 004DF0 9FC04DF0 1AC0001F */  blez        $s6, .L9FC04E70
/* 004DF4 9FC04DF4 0140B821 */   addu       $s7, $t2, $zero
/* 004DF8 9FC04DF8 2614000C */  addiu       $s4, $s0, 0xc
/* 004DFC 9FC04DFC 26120008 */  addiu       $s2, $s0, 8
.L9FC04E00:
/* 004E00 9FC04E00 26A40008 */  addiu       $a0, $s5, 8
/* 004E04 9FC04E04 27A60010 */  addiu       $a2, $sp, 0x10
/* 004E08 9FC04E08 02603821 */  addu        $a3, $s3, $zero
/* 004E0C 9FC04E0C 8E43FFFC */  lw          $v1, -4($s2)
/* 004E10 9FC04E10 8E490000 */  lw          $t1, ($s2)
/* 004E14 9FC04E14 26520010 */  addiu       $s2, $s2, 0x10
/* 004E18 9FC04E18 8E020000 */  lw          $v0, ($s0)
/* 004E1C 9FC04E1C 8D450000 */  lw          $a1, ($t2)
/* 004E20 9FC04E20 2631FFFF */  addiu       $s1, $s1, -1
/* 004E24 9FC04E24 00451026 */  xor         $v0, $v0, $a1
/* 004E28 9FC04E28 AFA20010 */  sw          $v0, 0x10($sp)
/* 004E2C 9FC04E2C 8D420004 */  lw          $v0, 4($t2)
/* 004E30 9FC04E30 8E880000 */  lw          $t0, ($s4)
/* 004E34 9FC04E34 00621826 */  xor         $v1, $v1, $v0
/* 004E38 9FC04E38 AFA30014 */  sw          $v1, 0x14($sp)
/* 004E3C 9FC04E3C 8D420008 */  lw          $v0, 8($t2)
/* 004E40 9FC04E40 26940010 */  addiu       $s4, $s4, 0x10
/* 004E44 9FC04E44 01224826 */  xor         $t1, $t1, $v0
/* 004E48 9FC04E48 AFA90018 */  sw          $t1, 0x18($sp)
/* 004E4C 9FC04E4C 8D42000C */  lw          $v0, 0xc($t2)
/* 004E50 9FC04E50 8EA50004 */  lw          $a1, 4($s5)
/* 004E54 9FC04E54 01024026 */  xor         $t0, $t0, $v0
/* 004E58 9FC04E58 0FF01634 */  jal         rijndaelEncrypt
/* 004E5C 9FC04E5C AFA8001C */   sw         $t0, 0x1c($sp)
/* 004E60 9FC04E60 02605021 */  addu        $t2, $s3, $zero
/* 004E64 9FC04E64 26100010 */  addiu       $s0, $s0, 0x10
/* 004E68 9FC04E68 1E20FFE5 */  bgtz        $s1, .L9FC04E00
/* 004E6C 9FC04E6C 25530010 */   addiu      $s3, $t2, 0x10
.L9FC04E70:
/* 004E70 9FC04E70 02E02021 */  addu        $a0, $s7, $zero
/* 004E74 9FC04E74 01402821 */  addu        $a1, $t2, $zero
/* 004E78 9FC04E78 0FF00EA1 */  jal         memcpy
/* 004E7C 9FC04E7C 24060010 */   addiu      $a2, $zero, 0x10
/* 004E80 9FC04E80 0BF013A5 */  j           .L9FC04E94
/* 004E84 9FC04E84 001611C0 */   sll        $v0, $s6, 7
.L9FC04E88:
/* 004E88 9FC04E88 0BF013A5 */  j           .L9FC04E94
/* 004E8C 9FC04E8C 2402FFFB */   addiu      $v0, $zero, -5
.L9FC04E90:
/* 004E90 9FC04E90 001611C0 */  sll         $v0, $s6, 7
.L9FC04E94:
/* 004E94 9FC04E94 8FBF0040 */  lw          $ra, 0x40($sp)
.L9FC04E98:
/* 004E98 9FC04E98 8FB7003C */  lw          $s7, 0x3c($sp)
/* 004E9C 9FC04E9C 8FB60038 */  lw          $s6, 0x38($sp)
/* 004EA0 9FC04EA0 8FB50034 */  lw          $s5, 0x34($sp)
/* 004EA4 9FC04EA4 8FB40030 */  lw          $s4, 0x30($sp)
/* 004EA8 9FC04EA8 8FB3002C */  lw          $s3, 0x2c($sp)
/* 004EAC 9FC04EAC 8FB20028 */  lw          $s2, 0x28($sp)
/* 004EB0 9FC04EB0 8FB10024 */  lw          $s1, 0x24($sp)
/* 004EB4 9FC04EB4 8FB00020 */  lw          $s0, 0x20($sp)
/* 004EB8 9FC04EB8 03E00008 */  jr          $ra
/* 004EBC 9FC04EBC 27BD0048 */   addiu      $sp, $sp, 0x48
