## skLaunch
## func_9FC0134C
## func_9FC01FBC
## func_9FC02488
## rsa_verify_signature
## func_9FC03410
## hash_to_integer
/* 006848 9FC06848 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 00684C 9FC0684C AFB10014 */  sw          $s1, 0x14($sp)
/* 006850 9FC06850 AFB3001C */  sw          $s3, 0x1c($sp)
/* 006854 9FC06854 00809821 */  addu        $s3, $a0, $zero
/* 006858 9FC06858 AFB00010 */  sw          $s0, 0x10($sp)
/* 00685C 9FC0685C 00C08021 */  addu        $s0, $a2, $zero
/* 006860 9FC06860 AFBF0024 */  sw          $ra, 0x24($sp)
/* 006864 9FC06864 AFB40020 */  sw          $s4, 0x20($sp)
/* 006868 9FC06868 AFB20018 */  sw          $s2, 0x18($sp)
/* 00686C 9FC0686C 8E630014 */  lw          $v1, 0x14($s3)
/* 006870 9FC06870 001020C0 */  sll         $a0, $s0, 3
/* 006874 9FC06874 000310C2 */  srl         $v0, $v1, 3
/* 006878 9FC06878 3052003F */  andi        $s2, $v0, 0x3f
/* 00687C 9FC0687C 00641021 */  addu        $v0, $v1, $a0
/* 006880 9FC06880 0043102B */  sltu        $v0, $v0, $v1
/* 006884 9FC06884 10400004 */  beqz        $v0, .L9FC06898
/* 006888 9FC06888 00A08821 */   addu       $s1, $a1, $zero
/* 00688C 9FC0688C 8E620018 */  lw          $v0, 0x18($s3)
/* 006890 9FC06890 24420001 */  addiu       $v0, $v0, 1
/* 006894 9FC06894 AE620018 */  sw          $v0, 0x18($s3)
.L9FC06898:
/* 006898 9FC06898 8E620014 */  lw          $v0, 0x14($s3)
/* 00689C 9FC0689C 00441021 */  addu        $v0, $v0, $a0
/* 0068A0 9FC068A0 AE620014 */  sw          $v0, 0x14($s3)
/* 0068A4 9FC068A4 8E620018 */  lw          $v0, 0x18($s3)
/* 0068A8 9FC068A8 00101F42 */  srl         $v1, $s0, 0x1d
/* 0068AC 9FC068AC 00431021 */  addu        $v0, $v0, $v1
/* 0068B0 9FC068B0 12400016 */  beqz        $s2, .L9FC0690C
/* 0068B4 9FC068B4 AE620018 */   sw         $v0, 0x18($s3)
/* 0068B8 9FC068B8 0250A021 */  addu        $s4, $s2, $s0
/* 0068BC 9FC068BC 2A820040 */  slti        $v0, $s4, 0x40
/* 0068C0 9FC068C0 14400013 */  bnez        $v0, .L9FC06910
/* 0068C4 9FC068C4 2A020040 */   slti       $v0, $s0, 0x40
/* 0068C8 9FC068C8 2644001C */  addiu       $a0, $s2, 0x1c
/* 0068CC 9FC068CC 02642021 */  addu        $a0, $s3, $a0
/* 0068D0 9FC068D0 02202821 */  addu        $a1, $s1, $zero
/* 0068D4 9FC068D4 24060040 */  addiu       $a2, $zero, 0x40
/* 0068D8 9FC068D8 0FF00EA1 */  jal         memcpy
/* 0068DC 9FC068DC 00D23023 */   subu       $a2, $a2, $s2
/* 0068E0 9FC068E0 02808021 */  addu        $s0, $s4, $zero
/* 0068E4 9FC068E4 02328823 */  subu        $s1, $s1, $s2
/* 0068E8 9FC068E8 0BF01A3F */  j           .L9FC068FC
/* 0068EC 9FC068EC 00009021 */   addu       $s2, $zero, $zero
.L9FC068F0:
/* 0068F0 9FC068F0 02202821 */  addu        $a1, $s1, $zero
/* 0068F4 9FC068F4 0FF00EA1 */  jal         memcpy
/* 0068F8 9FC068F8 24060040 */   addiu      $a2, $zero, 0x40
.L9FC068FC:
/* 0068FC 9FC068FC 0FF0195C */  jal         SHA1Transform
/* 006900 9FC06900 02602021 */   addu       $a0, $s3, $zero
/* 006904 9FC06904 26310040 */  addiu       $s1, $s1, 0x40
/* 006908 9FC06908 2610FFC0 */  addiu       $s0, $s0, -0x40
.L9FC0690C:
/* 00690C 9FC0690C 2A020040 */  slti        $v0, $s0, 0x40
.L9FC06910:
/* 006910 9FC06910 1040FFF7 */  beqz        $v0, .L9FC068F0
/* 006914 9FC06914 2664001C */   addiu      $a0, $s3, 0x1c
/* 006918 9FC06918 2644001C */  addiu       $a0, $s2, 0x1c
/* 00691C 9FC0691C 02642021 */  addu        $a0, $s3, $a0
/* 006920 9FC06920 02202821 */  addu        $a1, $s1, $zero
/* 006924 9FC06924 0FF00EA1 */  jal         memcpy
/* 006928 9FC06928 02003021 */   addu       $a2, $s0, $zero
/* 00692C 9FC0692C 8FBF0024 */  lw          $ra, 0x24($sp)
/* 006930 9FC06930 8FB40020 */  lw          $s4, 0x20($sp)
/* 006934 9FC06934 8FB3001C */  lw          $s3, 0x1c($sp)
/* 006938 9FC06938 8FB20018 */  lw          $s2, 0x18($sp)
/* 00693C 9FC0693C 8FB10014 */  lw          $s1, 0x14($sp)
/* 006940 9FC06940 8FB00010 */  lw          $s0, 0x10($sp)
/* 006944 9FC06944 00001021 */  addu        $v0, $zero, $zero
/* 006948 9FC06948 03E00008 */  jr          $ra
/* 00694C 9FC0694C 27BD0028 */   addiu      $sp, $sp, 0x28
