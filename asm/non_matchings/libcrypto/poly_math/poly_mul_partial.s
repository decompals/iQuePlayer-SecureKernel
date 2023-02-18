## poly_mul
/* 007D70 9FC07D70 27BDFBE0 */  addiu       $sp, $sp, -0x420
/* 007D74 9FC07D74 AFB10414 */  sw          $s1, 0x414($sp)
/* 007D78 9FC07D78 00808821 */  addu        $s1, $a0, $zero
/* 007D7C 9FC07D7C 00A02021 */  addu        $a0, $a1, $zero
/* 007D80 9FC07D80 AFB00410 */  sw          $s0, 0x410($sp)
/* 007D84 9FC07D84 00C08021 */  addu        $s0, $a2, $zero
/* 007D88 9FC07D88 00005821 */  addu        $t3, $zero, $zero
/* 007D8C 9FC07D8C 3C060001 */  lui         $a2, 1
/* 007D90 9FC07D90 AFBF0418 */  sw          $ra, 0x418($sp)
/* 007D94 9FC07D94 000B1080 */  sll         $v0, $t3, 2
.L9FC07D98:
/* 007D98 9FC07D98 03A21021 */  addu        $v0, $sp, $v0
/* 007D9C 9FC07D9C AC400050 */  sw          $zero, 0x50($v0)
/* 007DA0 9FC07DA0 00C01821 */  addu        $v1, $a2, $zero
/* 007DA4 9FC07DA4 3C020001 */  lui         $v0, 1
/* 007DA8 9FC07DA8 00C23021 */  addu        $a2, $a2, $v0
/* 007DAC 9FC07DAC 00035C03 */  sra         $t3, $v1, 0x10
/* 007DB0 9FC07DB0 3162FFFF */  andi        $v0, $t3, 0xffff
/* 007DB4 9FC07DB4 2C42000F */  sltiu       $v0, $v0, 0xf
/* 007DB8 9FC07DB8 1440FFF7 */  bnez        $v0, .L9FC07D98
/* 007DBC 9FC07DBC 000B1080 */   sll        $v0, $t3, 2
/* 007DC0 9FC07DC0 0FF01F24 */  jal         single_to_double
/* 007DC4 9FC07DC4 27A5008C */   addiu      $a1, $sp, 0x8c
/* 007DC8 9FC07DC8 00005821 */  addu        $t3, $zero, $zero
/* 007DCC 9FC07DCC 3C050001 */  lui         $a1, 1
/* 007DD0 9FC07DD0 00A02021 */  addu        $a0, $a1, $zero
.L9FC07DD4:
/* 007DD4 9FC07DD4 3C020001 */  lui         $v0, 1
/* 007DD8 9FC07DD8 00A22821 */  addu        $a1, $a1, $v0
/* 007DDC 9FC07DDC 000B1880 */  sll         $v1, $t3, 2
/* 007DE0 9FC07DE0 00045C03 */  sra         $t3, $a0, 0x10
/* 007DE4 9FC07DE4 27A40010 */  addiu       $a0, $sp, 0x10
/* 007DE8 9FC07DE8 03A31021 */  addu        $v0, $sp, $v1
/* 007DEC 9FC07DEC 8C42008C */  lw          $v0, 0x8c($v0)
/* 007DF0 9FC07DF0 00831821 */  addu        $v1, $a0, $v1
/* 007DF4 9FC07DF4 AC620000 */  sw          $v0, ($v1)
/* 007DF8 9FC07DF8 3162FFFF */  andi        $v0, $t3, 0xffff
/* 007DFC 9FC07DFC 2C42000F */  sltiu       $v0, $v0, 0xf
/* 007E00 9FC07E00 5440FFF4 */  bnel        $v0, $zero, .L9FC07DD4
/* 007E04 9FC07E04 00A02021 */   addu       $a0, $a1, $zero
/* 007E08 9FC07E08 0FF01F4B */  jal         multiply_shift
/* 007E0C 9FC07E0C 00000000 */   nop
/* 007E10 9FC07E10 00005821 */  addu        $t3, $zero, $zero
/* 007E14 9FC07E14 3C060001 */  lui         $a2, 1
/* 007E18 9FC07E18 00C01821 */  addu        $v1, $a2, $zero
.L9FC07E1C:
/* 007E1C 9FC07E1C 3C020001 */  lui         $v0, 1
/* 007E20 9FC07E20 00C23021 */  addu        $a2, $a2, $v0
/* 007E24 9FC07E24 000B2080 */  sll         $a0, $t3, 2
/* 007E28 9FC07E28 00035C03 */  sra         $t3, $v1, 0x10
/* 007E2C 9FC07E2C 27A50010 */  addiu       $a1, $sp, 0x10
/* 007E30 9FC07E30 00A41021 */  addu        $v0, $a1, $a0
/* 007E34 9FC07E34 8C430000 */  lw          $v1, ($v0)
/* 007E38 9FC07E38 03A41021 */  addu        $v0, $sp, $a0
/* 007E3C 9FC07E3C AC4300C8 */  sw          $v1, 0xc8($v0)
/* 007E40 9FC07E40 3162FFFF */  andi        $v0, $t3, 0xffff
/* 007E44 9FC07E44 2C42000F */  sltiu       $v0, $v0, 0xf
/* 007E48 9FC07E48 1440FFF4 */  bnez        $v0, .L9FC07E1C
/* 007E4C 9FC07E4C 00C01821 */   addu       $v1, $a2, $zero
/* 007E50 9FC07E50 0FF01F4B */  jal         multiply_shift
/* 007E54 9FC07E54 00A02021 */   addu       $a0, $a1, $zero
/* 007E58 9FC07E58 00005821 */  addu        $t3, $zero, $zero
/* 007E5C 9FC07E5C 3C060001 */  lui         $a2, 1
/* 007E60 9FC07E60 00C01821 */  addu        $v1, $a2, $zero
.L9FC07E64:
/* 007E64 9FC07E64 3C020001 */  lui         $v0, 1
/* 007E68 9FC07E68 00C23021 */  addu        $a2, $a2, $v0
/* 007E6C 9FC07E6C 000B2080 */  sll         $a0, $t3, 2
/* 007E70 9FC07E70 00035C03 */  sra         $t3, $v1, 0x10
/* 007E74 9FC07E74 27A50010 */  addiu       $a1, $sp, 0x10
/* 007E78 9FC07E78 00A41021 */  addu        $v0, $a1, $a0
/* 007E7C 9FC07E7C 8C430000 */  lw          $v1, ($v0)
/* 007E80 9FC07E80 03A41021 */  addu        $v0, $sp, $a0
/* 007E84 9FC07E84 AC430140 */  sw          $v1, 0x140($v0)
/* 007E88 9FC07E88 3162FFFF */  andi        $v0, $t3, 0xffff
/* 007E8C 9FC07E8C 2C42000F */  sltiu       $v0, $v0, 0xf
/* 007E90 9FC07E90 1440FFF4 */  bnez        $v0, .L9FC07E64
/* 007E94 9FC07E94 00C01821 */   addu       $v1, $a2, $zero
/* 007E98 9FC07E98 0FF01F4B */  jal         multiply_shift
/* 007E9C 9FC07E9C 00A02021 */   addu       $a0, $a1, $zero
/* 007EA0 9FC07EA0 00005821 */  addu        $t3, $zero, $zero
/* 007EA4 9FC07EA4 3C050001 */  lui         $a1, 1
/* 007EA8 9FC07EA8 00A02021 */  addu        $a0, $a1, $zero
.L9FC07EAC:
/* 007EAC 9FC07EAC 3C020001 */  lui         $v0, 1
/* 007EB0 9FC07EB0 00A22821 */  addu        $a1, $a1, $v0
/* 007EB4 9FC07EB4 000B1880 */  sll         $v1, $t3, 2
/* 007EB8 9FC07EB8 00045C03 */  sra         $t3, $a0, 0x10
/* 007EBC 9FC07EBC 27AD0230 */  addiu       $t5, $sp, 0x230
/* 007EC0 9FC07EC0 03A31021 */  addu        $v0, $sp, $v1
/* 007EC4 9FC07EC4 8C420010 */  lw          $v0, 0x10($v0)
/* 007EC8 9FC07EC8 01A31821 */  addu        $v1, $t5, $v1
/* 007ECC 9FC07ECC AC620000 */  sw          $v0, ($v1)
/* 007ED0 9FC07ED0 3162FFFF */  andi        $v0, $t3, 0xffff
/* 007ED4 9FC07ED4 2C42000F */  sltiu       $v0, $v0, 0xf
/* 007ED8 9FC07ED8 1440FFF4 */  bnez        $v0, .L9FC07EAC
/* 007EDC 9FC07EDC 00A02021 */   addu       $a0, $a1, $zero
/* 007EE0 9FC07EE0 00005821 */  addu        $t3, $zero, $zero
/* 007EE4 9FC07EE4 3C0C0001 */  lui         $t4, 1
/* 007EE8 9FC07EE8 01801821 */  addu        $v1, $t4, $zero
.L9FC07EEC:
/* 007EEC 9FC07EEC 3C020001 */  lui         $v0, 1
/* 007EF0 9FC07EF0 01826021 */  addu        $t4, $t4, $v0
/* 007EF4 9FC07EF4 000B3080 */  sll         $a2, $t3, 2
/* 007EF8 9FC07EF8 00035C03 */  sra         $t3, $v1, 0x10
/* 007EFC 9FC07EFC 27AA00C8 */  addiu       $t2, $sp, 0xc8
/* 007F00 9FC07F00 01465021 */  addu        $t2, $t2, $a2
/* 007F04 9FC07F04 27A7008C */  addiu       $a3, $sp, 0x8c
/* 007F08 9FC07F08 00E63821 */  addu        $a3, $a3, $a2
/* 007F0C 9FC07F0C 03A62021 */  addu        $a0, $sp, $a2
/* 007F10 9FC07F10 27A90140 */  addiu       $t1, $sp, 0x140
/* 007F14 9FC07F14 8D420000 */  lw          $v0, ($t2)
/* 007F18 9FC07F18 8CE30000 */  lw          $v1, ($a3)
/* 007F1C 9FC07F1C 01264821 */  addu        $t1, $t1, $a2
/* 007F20 9FC07F20 00431026 */  xor         $v0, $v0, $v1
/* 007F24 9FC07F24 AC820104 */  sw          $v0, 0x104($a0)
/* 007F28 9FC07F28 8D220000 */  lw          $v0, ($t1)
/* 007F2C 9FC07F2C 8CE30000 */  lw          $v1, ($a3)
/* 007F30 9FC07F30 00431026 */  xor         $v0, $v0, $v1
/* 007F34 9FC07F34 AC82017C */  sw          $v0, 0x17c($a0)
/* 007F38 9FC07F38 8D220000 */  lw          $v0, ($t1)
/* 007F3C 9FC07F3C 8D430000 */  lw          $v1, ($t2)
/* 007F40 9FC07F40 00431026 */  xor         $v0, $v0, $v1
/* 007F44 9FC07F44 AC8201B8 */  sw          $v0, 0x1b8($a0)
/* 007F48 9FC07F48 8CE30000 */  lw          $v1, ($a3)
/* 007F4C 9FC07F4C 01A64021 */  addu        $t0, $t5, $a2
/* 007F50 9FC07F50 00431026 */  xor         $v0, $v0, $v1
/* 007F54 9FC07F54 AC8201F4 */  sw          $v0, 0x1f4($a0)
/* 007F58 9FC07F58 8D020000 */  lw          $v0, ($t0)
/* 007F5C 9FC07F5C 8CE30000 */  lw          $v1, ($a3)
/* 007F60 9FC07F60 00431026 */  xor         $v0, $v0, $v1
/* 007F64 9FC07F64 AC82026C */  sw          $v0, 0x26c($a0)
/* 007F68 9FC07F68 8D020000 */  lw          $v0, ($t0)
/* 007F6C 9FC07F6C 8D430000 */  lw          $v1, ($t2)
/* 007F70 9FC07F70 00431026 */  xor         $v0, $v0, $v1
/* 007F74 9FC07F74 AC8202A8 */  sw          $v0, 0x2a8($a0)
/* 007F78 9FC07F78 8CE30000 */  lw          $v1, ($a3)
/* 007F7C 9FC07F7C 27A50320 */  addiu       $a1, $sp, 0x320
/* 007F80 9FC07F80 00431026 */  xor         $v0, $v0, $v1
/* 007F84 9FC07F84 AC8202E4 */  sw          $v0, 0x2e4($a0)
/* 007F88 9FC07F88 8D020000 */  lw          $v0, ($t0)
/* 007F8C 9FC07F8C 8D230000 */  lw          $v1, ($t1)
/* 007F90 9FC07F90 00A62821 */  addu        $a1, $a1, $a2
/* 007F94 9FC07F94 00431026 */  xor         $v0, $v0, $v1
/* 007F98 9FC07F98 ACA20000 */  sw          $v0, ($a1)
/* 007F9C 9FC07F9C 8CE30000 */  lw          $v1, ($a3)
/* 007FA0 9FC07FA0 00431026 */  xor         $v0, $v0, $v1
/* 007FA4 9FC07FA4 AC82035C */  sw          $v0, 0x35c($a0)
/* 007FA8 9FC07FA8 8CA20000 */  lw          $v0, ($a1)
/* 007FAC 9FC07FAC 8D430000 */  lw          $v1, ($t2)
/* 007FB0 9FC07FB0 00431026 */  xor         $v0, $v0, $v1
/* 007FB4 9FC07FB4 AC820398 */  sw          $v0, 0x398($a0)
/* 007FB8 9FC07FB8 8CE30000 */  lw          $v1, ($a3)
/* 007FBC 9FC07FBC 00431026 */  xor         $v0, $v0, $v1
/* 007FC0 9FC07FC0 AC8203D4 */  sw          $v0, 0x3d4($a0)
/* 007FC4 9FC07FC4 3162FFFF */  andi        $v0, $t3, 0xffff
/* 007FC8 9FC07FC8 2C42000F */  sltiu       $v0, $v0, 0xf
/* 007FCC 9FC07FCC 1440FFC7 */  bnez        $v0, .L9FC07EEC
/* 007FD0 9FC07FD0 01801821 */   addu       $v1, $t4, $zero
/* 007FD4 9FC07FD4 0FF01EEB */  jal         double_null
/* 007FD8 9FC07FD8 02002021 */   addu       $a0, $s0, $zero
/* 007FDC 9FC07FDC 3C0CF000 */  lui         $t4, 0xf000
/* 007FE0 9FC07FE0 240E0007 */  addiu       $t6, $zero, 7
/* 007FE4 9FC07FE4 240B0007 */  addiu       $t3, $zero, 7
/* 007FE8 9FC07FE8 3C0D0006 */  lui         $t5, 6
.L9FC07FEC:
/* 007FEC 9FC07FEC 24030007 */  addiu       $v1, $zero, 7
/* 007FF0 9FC07FF0 3C0A0006 */  lui         $t2, 6
/* 007FF4 9FC07FF4 2629001C */  addiu       $t1, $s1, 0x1c
.L9FC07FF8:
/* 007FF8 9FC07FF8 24020007 */  addiu       $v0, $zero, 7
/* 007FFC 9FC07FFC 00431023 */  subu        $v0, $v0, $v1
/* 008000 9FC08000 01C21023 */  subu        $v0, $t6, $v0
/* 008004 9FC08004 00021080 */  sll         $v0, $v0, 2
/* 008008 9FC08008 02023021 */  addu        $a2, $s0, $v0
/* 00800C 9FC0800C 8D230000 */  lw          $v1, ($t1)
/* 008010 9FC08010 3C070001 */  lui         $a3, 1
/* 008014 9FC08014 000B1080 */  sll         $v0, $t3, 2
/* 008018 9FC08018 27A40050 */  addiu       $a0, $sp, 0x50
/* 00801C 9FC0801C 01831824 */  and         $v1, $t4, $v1
/* 008020 9FC08020 00431806 */  srlv        $v1, $v1, $v0
/* 008024 9FC08024 00031100 */  sll         $v0, $v1, 4
/* 008028 9FC08028 00431023 */  subu        $v0, $v0, $v1
/* 00802C 9FC0802C 00021080 */  sll         $v0, $v0, 2
/* 008030 9FC08030 00822021 */  addu        $a0, $a0, $v0
/* 008034 9FC08034 000E1080 */  sll         $v0, $t6, 2
/* 008038 9FC08038 00822821 */  addu        $a1, $a0, $v0
.L9FC0803C:
/* 00803C 9FC0803C 8CA40000 */  lw          $a0, ($a1)
/* 008040 9FC08040 24A50004 */  addiu       $a1, $a1, 4
/* 008044 9FC08044 00E01821 */  addu        $v1, $a3, $zero
/* 008048 9FC08048 3C080001 */  lui         $t0, 1
/* 00804C 9FC0804C 00E83821 */  addu        $a3, $a3, $t0
/* 008050 9FC08050 00031C02 */  srl         $v1, $v1, 0x10
/* 008054 9FC08054 8CC20000 */  lw          $v0, ($a2)
/* 008058 9FC08058 2C630008 */  sltiu       $v1, $v1, 8
/* 00805C 9FC0805C 00822026 */  xor         $a0, $a0, $v0
/* 008060 9FC08060 ACC40000 */  sw          $a0, ($a2)
/* 008064 9FC08064 1460FFF5 */  bnez        $v1, .L9FC0803C
/* 008068 9FC08068 24C60004 */   addiu      $a2, $a2, 4
/* 00806C 9FC0806C 01401021 */  addu        $v0, $t2, $zero
/* 008070 9FC08070 01485023 */  subu        $t2, $t2, $t0
/* 008074 9FC08074 00021C03 */  sra         $v1, $v0, 0x10
/* 008078 9FC08078 0461FFDF */  bgez        $v1, .L9FC07FF8
/* 00807C 9FC0807C 2529FFFC */   addiu      $t1, $t1, -4
/* 008080 9FC08080 5160000E */  beql        $t3, $zero, .L9FC080BC
/* 008084 9FC08084 000C6102 */   srl        $t4, $t4, 4
/* 008088 9FC08088 26040038 */  addiu       $a0, $s0, 0x38
/* 00808C 9FC0808C 00003021 */  addu        $a2, $zero, $zero
/* 008090 9FC08090 00002821 */  addu        $a1, $zero, $zero
.L9FC08094:
/* 008094 9FC08094 8C820000 */  lw          $v0, ($a0)
/* 008098 9FC08098 24A50001 */  addiu       $a1, $a1, 1
/* 00809C 9FC0809C 00021900 */  sll         $v1, $v0, 4
/* 0080A0 9FC080A0 00661825 */  or          $v1, $v1, $a2
/* 0080A4 9FC080A4 00023702 */  srl         $a2, $v0, 0x1c
/* 0080A8 9FC080A8 AC830000 */  sw          $v1, ($a0)
/* 0080AC 9FC080AC 2CA2000F */  sltiu       $v0, $a1, 0xf
/* 0080B0 9FC080B0 1440FFF8 */  bnez        $v0, .L9FC08094
/* 0080B4 9FC080B4 2484FFFC */   addiu      $a0, $a0, -4
/* 0080B8 9FC080B8 000C6102 */  srl         $t4, $t4, 4
.L9FC080BC:
/* 0080BC 9FC080BC 01A01821 */  addu        $v1, $t5, $zero
/* 0080C0 9FC080C0 3C02FFFF */  lui         $v0, 0xffff
/* 0080C4 9FC080C4 00035C03 */  sra         $t3, $v1, 0x10
/* 0080C8 9FC080C8 0561FFC8 */  bgez        $t3, .L9FC07FEC
/* 0080CC 9FC080CC 01A26821 */   addu       $t5, $t5, $v0
/* 0080D0 9FC080D0 8FBF0418 */  lw          $ra, 0x418($sp)
/* 0080D4 9FC080D4 8FB10414 */  lw          $s1, 0x414($sp)
/* 0080D8 9FC080D8 8FB00410 */  lw          $s0, 0x410($sp)
/* 0080DC 9FC080DC 03E00008 */  jr          $ra
/* 0080E0 9FC080E0 27BD0420 */   addiu      $sp, $sp, 0x420
