## skLaunch
## skRecryptEnd
## func_9FC020C4
## func_9FC02488
## rsa_verify_signature
## func_9FC03410
## hash_to_integer
/* 006950 9FC06950 27BDFFD8 */  addiu       $sp, $sp, -0x28
/* 006954 9FC06954 AFB00010 */  sw          $s0, 0x10($sp)
/* 006958 9FC06958 00808021 */  addu        $s0, $a0, $zero
/* 00695C 9FC0695C AFB3001C */  sw          $s3, 0x1c($sp)
/* 006960 9FC06960 AFBF0020 */  sw          $ra, 0x20($sp)
/* 006964 9FC06964 AFB20018 */  sw          $s2, 0x18($sp)
/* 006968 9FC06968 AFB10014 */  sw          $s1, 0x14($sp)
/* 00696C 9FC0696C 8E110014 */  lw          $s1, 0x14($s0)
/* 006970 9FC06970 8E120018 */  lw          $s2, 0x18($s0)
/* 006974 9FC06974 001110C2 */  srl         $v0, $s1, 3
/* 006978 9FC06978 3046003F */  andi        $a2, $v0, 0x3f
/* 00697C 9FC0697C 00D01821 */  addu        $v1, $a2, $s0
/* 006980 9FC06980 24C60001 */  addiu       $a2, $a2, 1
/* 006984 9FC06984 24020080 */  addiu       $v0, $zero, 0x80
/* 006988 9FC06988 A062001C */  sb          $v0, 0x1c($v1)
/* 00698C 9FC0698C 28C20039 */  slti        $v0, $a2, 0x39
/* 006990 9FC06990 1440000B */  bnez        $v0, .L9FC069C0
/* 006994 9FC06994 00A09821 */   addu       $s3, $a1, $zero
/* 006998 9FC06998 24C4001C */  addiu       $a0, $a2, 0x1c
/* 00699C 9FC0699C 02042021 */  addu        $a0, $s0, $a0
/* 0069A0 9FC069A0 24050040 */  addiu       $a1, $zero, 0x40
/* 0069A4 9FC069A4 0FF00EBF */  jal         memclear
/* 0069A8 9FC069A8 00A62823 */   subu       $a1, $a1, $a2
/* 0069AC 9FC069AC 0FF0195C */  jal         SHA1Transform
/* 0069B0 9FC069B0 02002021 */   addu       $a0, $s0, $zero
/* 0069B4 9FC069B4 2604001C */  addiu       $a0, $s0, 0x1c
/* 0069B8 9FC069B8 0BF01A74 */  j           .L9FC069D0
/* 0069BC 9FC069BC 24050038 */   addiu      $a1, $zero, 0x38
.L9FC069C0:
/* 0069C0 9FC069C0 24C4001C */  addiu       $a0, $a2, 0x1c
/* 0069C4 9FC069C4 02042021 */  addu        $a0, $s0, $a0
/* 0069C8 9FC069C8 24050038 */  addiu       $a1, $zero, 0x38
/* 0069CC 9FC069CC 00A62823 */  subu        $a1, $a1, $a2
.L9FC069D0:
/* 0069D0 9FC069D0 0FF00EBF */  jal         memclear
/* 0069D4 9FC069D4 00000000 */   nop
/* 0069D8 9FC069D8 02002021 */  addu        $a0, $s0, $zero
/* 0069DC 9FC069DC AE120054 */  sw          $s2, 0x54($s0)
/* 0069E0 9FC069E0 0FF0195C */  jal         SHA1Transform
/* 0069E4 9FC069E4 AE110058 */   sw         $s1, 0x58($s0)
/* 0069E8 9FC069E8 02602021 */  addu        $a0, $s3, $zero
/* 0069EC 9FC069EC 02002821 */  addu        $a1, $s0, $zero
/* 0069F0 9FC069F0 0FF00EA1 */  jal         memcpy
/* 0069F4 9FC069F4 24060014 */   addiu      $a2, $zero, 0x14
/* 0069F8 9FC069F8 8FBF0020 */  lw          $ra, 0x20($sp)
/* 0069FC 9FC069FC 8FB3001C */  lw          $s3, 0x1c($sp)
/* 006A00 9FC06A00 8FB20018 */  lw          $s2, 0x18($sp)
/* 006A04 9FC06A04 8FB10014 */  lw          $s1, 0x14($sp)
/* 006A08 9FC06A08 8FB00010 */  lw          $s0, 0x10($sp)
/* 006A0C 9FC06A0C 00001021 */  addu        $v0, $zero, $zero
/* 006A10 9FC06A10 03E00008 */  jr          $ra
/* 006A14 9FC06A14 27BD0028 */   addiu      $sp, $sp, 0x28
