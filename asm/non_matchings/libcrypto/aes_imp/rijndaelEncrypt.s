## aesBlockEncrypt
/* 0058D0 9FC058D0 27BDFFF0 */  addiu       $sp, $sp, -0x10
/* 0058D4 9FC058D4 0080C021 */  addu        $t8, $a0, $zero
/* 0058D8 9FC058D8 AFB3000C */  sw          $s3, 0xc($sp)
/* 0058DC 9FC058DC 00059843 */  sra         $s3, $a1, 1
/* 0058E0 9FC058E0 AFB20008 */  sw          $s2, 8($sp)
/* 0058E4 9FC058E4 2712000C */  addiu       $s2, $t8, 0xc
/* 0058E8 9FC058E8 270E0008 */  addiu       $t6, $t8, 8
/* 0058EC 9FC058EC AFB10004 */  sw          $s1, 4($sp)
/* 0058F0 9FC058F0 00E08821 */  addu        $s1, $a3, $zero
/* 0058F4 9FC058F4 AFB00000 */  sw          $s0, ($sp)
/* 0058F8 9FC058F8 90C20000 */  lbu         $v0, ($a2)
/* 0058FC 9FC058FC 90C40001 */  lbu         $a0, 1($a2)
/* 005900 9FC05900 90C30002 */  lbu         $v1, 2($a2)
/* 005904 9FC05904 00021600 */  sll         $v0, $v0, 0x18
/* 005908 9FC05908 00042400 */  sll         $a0, $a0, 0x10
/* 00590C 9FC0590C 00441026 */  xor         $v0, $v0, $a0
/* 005910 9FC05910 00031A00 */  sll         $v1, $v1, 8
/* 005914 9FC05914 00431026 */  xor         $v0, $v0, $v1
/* 005918 9FC05918 90C30003 */  lbu         $v1, 3($a2)
/* 00591C 9FC0591C 8F040000 */  lw          $a0, ($t8)
/* 005920 9FC05920 00431026 */  xor         $v0, $v0, $v1
/* 005924 9FC05924 00446826 */  xor         $t5, $v0, $a0
/* 005928 9FC05928 90C20004 */  lbu         $v0, 4($a2)
/* 00592C 9FC0592C 90C40005 */  lbu         $a0, 5($a2)
/* 005930 9FC05930 90C30006 */  lbu         $v1, 6($a2)
/* 005934 9FC05934 00021600 */  sll         $v0, $v0, 0x18
/* 005938 9FC05938 00042400 */  sll         $a0, $a0, 0x10
/* 00593C 9FC0593C 00441026 */  xor         $v0, $v0, $a0
/* 005940 9FC05940 00031A00 */  sll         $v1, $v1, 8
/* 005944 9FC05944 00431026 */  xor         $v0, $v0, $v1
/* 005948 9FC05948 90C30007 */  lbu         $v1, 7($a2)
/* 00594C 9FC0594C 8F040004 */  lw          $a0, 4($t8)
/* 005950 9FC05950 00431026 */  xor         $v0, $v0, $v1
/* 005954 9FC05954 00446026 */  xor         $t4, $v0, $a0
/* 005958 9FC05958 90C20008 */  lbu         $v0, 8($a2)
/* 00595C 9FC0595C 90C40009 */  lbu         $a0, 9($a2)
/* 005960 9FC05960 90C3000A */  lbu         $v1, 0xa($a2)
/* 005964 9FC05964 00021600 */  sll         $v0, $v0, 0x18
/* 005968 9FC05968 00042400 */  sll         $a0, $a0, 0x10
/* 00596C 9FC0596C 00441026 */  xor         $v0, $v0, $a0
/* 005970 9FC05970 00031A00 */  sll         $v1, $v1, 8
/* 005974 9FC05974 00431026 */  xor         $v0, $v0, $v1
/* 005978 9FC05978 90C3000B */  lbu         $v1, 0xb($a2)
/* 00597C 9FC0597C 8F040008 */  lw          $a0, 8($t8)
/* 005980 9FC05980 00431026 */  xor         $v0, $v0, $v1
/* 005984 9FC05984 00445826 */  xor         $t3, $v0, $a0
/* 005988 9FC05988 90C2000C */  lbu         $v0, 0xc($a2)
/* 00598C 9FC0598C 90C4000D */  lbu         $a0, 0xd($a2)
/* 005990 9FC05990 90C3000E */  lbu         $v1, 0xe($a2)
/* 005994 9FC05994 00021600 */  sll         $v0, $v0, 0x18
/* 005998 9FC05998 00042400 */  sll         $a0, $a0, 0x10
/* 00599C 9FC0599C 00441026 */  xor         $v0, $v0, $a0
/* 0059A0 9FC059A0 00031A00 */  sll         $v1, $v1, 8
/* 0059A4 9FC059A4 00431026 */  xor         $v0, $v0, $v1
/* 0059A8 9FC059A8 90C3000F */  lbu         $v1, 0xf($a2)
/* 0059AC 9FC059AC 8F04000C */  lw          $a0, 0xc($t8)
/* 0059B0 9FC059B0 00431026 */  xor         $v0, $v0, $v1
/* 0059B4 9FC059B4 0BF016C3 */  j           .L9FC05B0C
/* 0059B8 9FC059B8 00445026 */   xor        $t2, $v0, $a0
.L9FC059BC:
/* 0059BC 9FC059BC 00101E02 */  srl         $v1, $s0, 0x18
/* 0059C0 9FC059C0 00031880 */  sll         $v1, $v1, 2
/* 0059C4 9FC059C4 00681821 */  addu        $v1, $v1, $t0
/* 0059C8 9FC059C8 000F2382 */  srl         $a0, $t7, 0xe
/* 0059CC 9FC059CC 308403FC */  andi        $a0, $a0, 0x3fc
/* 0059D0 9FC059D0 00862021 */  addu        $a0, $a0, $a2
/* 0059D4 9FC059D4 00191182 */  srl         $v0, $t9, 6
/* 0059D8 9FC059D8 304203FC */  andi        $v0, $v0, 0x3fc
/* 0059DC 9FC059DC 00451021 */  addu        $v0, $v0, $a1
/* 0059E0 9FC059E0 8C630000 */  lw          $v1, ($v1)
/* 0059E4 9FC059E4 8C840000 */  lw          $a0, ($a0)
/* 0059E8 9FC059E8 8C420000 */  lw          $v0, ($v0)
/* 0059EC 9FC059EC 00641826 */  xor         $v1, $v1, $a0
/* 0059F0 9FC059F0 00621826 */  xor         $v1, $v1, $v0
/* 0059F4 9FC059F4 312200FF */  andi        $v0, $t1, 0xff
/* 0059F8 9FC059F8 00021080 */  sll         $v0, $v0, 2
/* 0059FC 9FC059FC 00471021 */  addu        $v0, $v0, $a3
/* 005A00 9FC05A00 8C420000 */  lw          $v0, ($v0)
/* 005A04 9FC05A04 8F040000 */  lw          $a0, ($t8)
/* 005A08 9FC05A08 00621826 */  xor         $v1, $v1, $v0
/* 005A0C 9FC05A0C 00646826 */  xor         $t5, $v1, $a0
/* 005A10 9FC05A10 000F1E02 */  srl         $v1, $t7, 0x18
/* 005A14 9FC05A14 00031880 */  sll         $v1, $v1, 2
/* 005A18 9FC05A18 00681821 */  addu        $v1, $v1, $t0
/* 005A1C 9FC05A1C 00192382 */  srl         $a0, $t9, 0xe
/* 005A20 9FC05A20 308403FC */  andi        $a0, $a0, 0x3fc
/* 005A24 9FC05A24 00862021 */  addu        $a0, $a0, $a2
/* 005A28 9FC05A28 00091182 */  srl         $v0, $t1, 6
/* 005A2C 9FC05A2C 304203FC */  andi        $v0, $v0, 0x3fc
/* 005A30 9FC05A30 00451021 */  addu        $v0, $v0, $a1
/* 005A34 9FC05A34 8C630000 */  lw          $v1, ($v1)
/* 005A38 9FC05A38 8C840000 */  lw          $a0, ($a0)
/* 005A3C 9FC05A3C 8C420000 */  lw          $v0, ($v0)
/* 005A40 9FC05A40 00641826 */  xor         $v1, $v1, $a0
/* 005A44 9FC05A44 00621826 */  xor         $v1, $v1, $v0
/* 005A48 9FC05A48 320200FF */  andi        $v0, $s0, 0xff
/* 005A4C 9FC05A4C 00021080 */  sll         $v0, $v0, 2
/* 005A50 9FC05A50 00471021 */  addu        $v0, $v0, $a3
/* 005A54 9FC05A54 8C420000 */  lw          $v0, ($v0)
/* 005A58 9FC05A58 8DC4FFFC */  lw          $a0, -4($t6)
/* 005A5C 9FC05A5C 00621826 */  xor         $v1, $v1, $v0
/* 005A60 9FC05A60 00646026 */  xor         $t4, $v1, $a0
/* 005A64 9FC05A64 00191E02 */  srl         $v1, $t9, 0x18
/* 005A68 9FC05A68 00031880 */  sll         $v1, $v1, 2
/* 005A6C 9FC05A6C 00681821 */  addu        $v1, $v1, $t0
/* 005A70 9FC05A70 00092382 */  srl         $a0, $t1, 0xe
/* 005A74 9FC05A74 308403FC */  andi        $a0, $a0, 0x3fc
/* 005A78 9FC05A78 00862021 */  addu        $a0, $a0, $a2
/* 005A7C 9FC05A7C 00101182 */  srl         $v0, $s0, 6
/* 005A80 9FC05A80 304203FC */  andi        $v0, $v0, 0x3fc
/* 005A84 9FC05A84 00451021 */  addu        $v0, $v0, $a1
/* 005A88 9FC05A88 8C630000 */  lw          $v1, ($v1)
/* 005A8C 9FC05A8C 8C840000 */  lw          $a0, ($a0)
/* 005A90 9FC05A90 8C420000 */  lw          $v0, ($v0)
/* 005A94 9FC05A94 00641826 */  xor         $v1, $v1, $a0
/* 005A98 9FC05A98 00621826 */  xor         $v1, $v1, $v0
/* 005A9C 9FC05A9C 31E200FF */  andi        $v0, $t7, 0xff
/* 005AA0 9FC05AA0 00021080 */  sll         $v0, $v0, 2
/* 005AA4 9FC05AA4 00471021 */  addu        $v0, $v0, $a3
/* 005AA8 9FC05AA8 8C420000 */  lw          $v0, ($v0)
/* 005AAC 9FC05AAC 8DC40000 */  lw          $a0, ($t6)
/* 005AB0 9FC05AB0 00621826 */  xor         $v1, $v1, $v0
/* 005AB4 9FC05AB4 00645826 */  xor         $t3, $v1, $a0
/* 005AB8 9FC05AB8 00091E02 */  srl         $v1, $t1, 0x18
/* 005ABC 9FC05ABC 00031880 */  sll         $v1, $v1, 2
/* 005AC0 9FC05AC0 00681821 */  addu        $v1, $v1, $t0
/* 005AC4 9FC05AC4 00102382 */  srl         $a0, $s0, 0xe
/* 005AC8 9FC05AC8 308403FC */  andi        $a0, $a0, 0x3fc
/* 005ACC 9FC05ACC 00862021 */  addu        $a0, $a0, $a2
/* 005AD0 9FC05AD0 000F1182 */  srl         $v0, $t7, 6
/* 005AD4 9FC05AD4 304203FC */  andi        $v0, $v0, 0x3fc
/* 005AD8 9FC05AD8 00451021 */  addu        $v0, $v0, $a1
/* 005ADC 9FC05ADC 8C630000 */  lw          $v1, ($v1)
/* 005AE0 9FC05AE0 8C840000 */  lw          $a0, ($a0)
/* 005AE4 9FC05AE4 8C420000 */  lw          $v0, ($v0)
/* 005AE8 9FC05AE8 00641826 */  xor         $v1, $v1, $a0
/* 005AEC 9FC05AEC 00621826 */  xor         $v1, $v1, $v0
/* 005AF0 9FC05AF0 332200FF */  andi        $v0, $t9, 0xff
/* 005AF4 9FC05AF4 00021080 */  sll         $v0, $v0, 2
/* 005AF8 9FC05AF8 00471021 */  addu        $v0, $v0, $a3
/* 005AFC 9FC05AFC 8C420000 */  lw          $v0, ($v0)
/* 005B00 9FC05B00 8E440000 */  lw          $a0, ($s2)
/* 005B04 9FC05B04 00621826 */  xor         $v1, $v1, $v0
/* 005B08 9FC05B08 00645026 */  xor         $t2, $v1, $a0
.L9FC05B0C:
/* 005B0C 9FC05B0C 8DC60008 */  lw          $a2, 8($t6)
/* 005B10 9FC05B10 8DC7000C */  lw          $a3, 0xc($t6)
/* 005B14 9FC05B14 8DC80010 */  lw          $t0, 0x10($t6)
/* 005B18 9FC05B18 8DC90014 */  lw          $t1, 0x14($t6)
/* 005B1C 9FC05B1C 25CE0020 */  addiu       $t6, $t6, 0x20
/* 005B20 9FC05B20 26520020 */  addiu       $s2, $s2, 0x20
/* 005B24 9FC05B24 27180020 */  addiu       $t8, $t8, 0x20
/* 005B28 9FC05B28 000D1E02 */  srl         $v1, $t5, 0x18
/* 005B2C 9FC05B2C 00031880 */  sll         $v1, $v1, 2
/* 005B30 9FC05B30 000C1382 */  srl         $v0, $t4, 0xe
/* 005B34 9FC05B34 304203FC */  andi        $v0, $v0, 0x3fc
/* 005B38 9FC05B38 2673FFFF */  addiu       $s3, $s3, -1
/* 005B3C 9FC05B3C 3C049FC1 */  lui         $a0, %hi(Te0)
/* 005B40 9FC05B40 00832021 */  addu        $a0, $a0, $v1
/* 005B44 9FC05B44 8C84C160 */  lw          $a0, %lo(Te0)($a0)
/* 005B48 9FC05B48 000B1982 */  srl         $v1, $t3, 6
/* 005B4C 9FC05B4C 306303FC */  andi        $v1, $v1, 0x3fc
/* 005B50 9FC05B50 3C019FC1 */  lui         $at, %hi(Te1)
/* 005B54 9FC05B54 00220821 */  addu        $at, $at, $v0
/* 005B58 9FC05B58 8C22C560 */  lw          $v0, %lo(Te1)($at)
/* 005B5C 9FC05B5C 3C019FC1 */  lui         $at, %hi(Te2)
/* 005B60 9FC05B60 00230821 */  addu        $at, $at, $v1
/* 005B64 9FC05B64 8C23C960 */  lw          $v1, %lo(Te2)($at)
/* 005B68 9FC05B68 00822026 */  xor         $a0, $a0, $v0
/* 005B6C 9FC05B6C 314200FF */  andi        $v0, $t2, 0xff
/* 005B70 9FC05B70 00021080 */  sll         $v0, $v0, 2
/* 005B74 9FC05B74 00832026 */  xor         $a0, $a0, $v1
/* 005B78 9FC05B78 000C1E02 */  srl         $v1, $t4, 0x18
/* 005B7C 9FC05B7C 00031880 */  sll         $v1, $v1, 2
/* 005B80 9FC05B80 3C059FC1 */  lui         $a1, %hi(Te0)
/* 005B84 9FC05B84 00A32821 */  addu        $a1, $a1, $v1
/* 005B88 9FC05B88 8CA5C160 */  lw          $a1, %lo(Te0)($a1)
/* 005B8C 9FC05B8C 000A1982 */  srl         $v1, $t2, 6
/* 005B90 9FC05B90 306303FC */  andi        $v1, $v1, 0x3fc
/* 005B94 9FC05B94 3C019FC1 */  lui         $at, %hi(Te3)
/* 005B98 9FC05B98 00220821 */  addu        $at, $at, $v0
/* 005B9C 9FC05B9C 8C22CD60 */  lw          $v0, %lo(Te3)($at)
/* 005BA0 9FC05BA0 3C019FC1 */  lui         $at, %hi(Te2)
/* 005BA4 9FC05BA4 00230821 */  addu        $at, $at, $v1
/* 005BA8 9FC05BA8 8C23C960 */  lw          $v1, %lo(Te2)($at)
/* 005BAC 9FC05BAC 00822026 */  xor         $a0, $a0, $v0
/* 005BB0 9FC05BB0 000B1382 */  srl         $v0, $t3, 0xe
/* 005BB4 9FC05BB4 304203FC */  andi        $v0, $v0, 0x3fc
/* 005BB8 9FC05BB8 00868026 */  xor         $s0, $a0, $a2
/* 005BBC 9FC05BBC 3C019FC1 */  lui         $at, %hi(Te1)
/* 005BC0 9FC05BC0 00220821 */  addu        $at, $at, $v0
/* 005BC4 9FC05BC4 8C22C560 */  lw          $v0, %lo(Te1)($at)
/* 005BC8 9FC05BC8 3C069FC1 */  lui         $a2, %hi(Te1)
/* 005BCC 9FC05BCC 24C6C560 */  addiu       $a2, $a2, %lo(Te1)
/* 005BD0 9FC05BD0 00A22826 */  xor         $a1, $a1, $v0
/* 005BD4 9FC05BD4 31A200FF */  andi        $v0, $t5, 0xff
/* 005BD8 9FC05BD8 00021080 */  sll         $v0, $v0, 2
/* 005BDC 9FC05BDC 00A32826 */  xor         $a1, $a1, $v1
/* 005BE0 9FC05BE0 000B1E02 */  srl         $v1, $t3, 0x18
/* 005BE4 9FC05BE4 00031880 */  sll         $v1, $v1, 2
/* 005BE8 9FC05BE8 3C049FC1 */  lui         $a0, %hi(Te0)
/* 005BEC 9FC05BEC 00832021 */  addu        $a0, $a0, $v1
/* 005BF0 9FC05BF0 8C84C160 */  lw          $a0, %lo(Te0)($a0)
/* 005BF4 9FC05BF4 000D1982 */  srl         $v1, $t5, 6
/* 005BF8 9FC05BF8 306303FC */  andi        $v1, $v1, 0x3fc
/* 005BFC 9FC05BFC 3C019FC1 */  lui         $at, %hi(Te3)
/* 005C00 9FC05C00 00220821 */  addu        $at, $at, $v0
/* 005C04 9FC05C04 8C22CD60 */  lw          $v0, %lo(Te3)($at)
/* 005C08 9FC05C08 3C019FC1 */  lui         $at, %hi(Te2)
/* 005C0C 9FC05C0C 00230821 */  addu        $at, $at, $v1
/* 005C10 9FC05C10 8C23C960 */  lw          $v1, %lo(Te2)($at)
/* 005C14 9FC05C14 00A22826 */  xor         $a1, $a1, $v0
/* 005C18 9FC05C18 000A1382 */  srl         $v0, $t2, 0xe
/* 005C1C 9FC05C1C 304203FC */  andi        $v0, $v0, 0x3fc
/* 005C20 9FC05C20 00A77826 */  xor         $t7, $a1, $a3
/* 005C24 9FC05C24 3C019FC1 */  lui         $at, %hi(Te1)
/* 005C28 9FC05C28 00220821 */  addu        $at, $at, $v0
/* 005C2C 9FC05C2C 8C22C560 */  lw          $v0, %lo(Te1)($at)
/* 005C30 9FC05C30 3C059FC1 */  lui         $a1, %hi(Te2)
/* 005C34 9FC05C34 24A5C960 */  addiu       $a1, $a1, %lo(Te2)
/* 005C38 9FC05C38 00822026 */  xor         $a0, $a0, $v0
/* 005C3C 9FC05C3C 318200FF */  andi        $v0, $t4, 0xff
/* 005C40 9FC05C40 00021080 */  sll         $v0, $v0, 2
/* 005C44 9FC05C44 00832026 */  xor         $a0, $a0, $v1
/* 005C48 9FC05C48 000A1E02 */  srl         $v1, $t2, 0x18
/* 005C4C 9FC05C4C 00031880 */  sll         $v1, $v1, 2
/* 005C50 9FC05C50 3C019FC1 */  lui         $at, %hi(Te3)
/* 005C54 9FC05C54 00220821 */  addu        $at, $at, $v0
/* 005C58 9FC05C58 8C22CD60 */  lw          $v0, %lo(Te3)($at)
/* 005C5C 9FC05C5C 3C019FC1 */  lui         $at, %hi(Te0)
/* 005C60 9FC05C60 00230821 */  addu        $at, $at, $v1
/* 005C64 9FC05C64 8C23C160 */  lw          $v1, %lo(Te0)($at)
/* 005C68 9FC05C68 00822026 */  xor         $a0, $a0, $v0
/* 005C6C 9FC05C6C 000D1382 */  srl         $v0, $t5, 0xe
/* 005C70 9FC05C70 304203FC */  andi        $v0, $v0, 0x3fc
/* 005C74 9FC05C74 3C019FC1 */  lui         $at, %hi(Te1)
/* 005C78 9FC05C78 00220821 */  addu        $at, $at, $v0
/* 005C7C 9FC05C7C 8C22C560 */  lw          $v0, %lo(Te1)($at)
/* 005C80 9FC05C80 3C079FC1 */  lui         $a3, %hi(Te3)
/* 005C84 9FC05C84 24E7CD60 */  addiu       $a3, $a3, %lo(Te3)
/* 005C88 9FC05C88 00621826 */  xor         $v1, $v1, $v0
/* 005C8C 9FC05C8C 000C1182 */  srl         $v0, $t4, 6
/* 005C90 9FC05C90 304203FC */  andi        $v0, $v0, 0x3fc
/* 005C94 9FC05C94 3C019FC1 */  lui         $at, %hi(Te2)
/* 005C98 9FC05C98 00220821 */  addu        $at, $at, $v0
/* 005C9C 9FC05C9C 8C22C960 */  lw          $v0, %lo(Te2)($at)
/* 005CA0 9FC05CA0 0088C826 */  xor         $t9, $a0, $t0
/* 005CA4 9FC05CA4 00621826 */  xor         $v1, $v1, $v0
/* 005CA8 9FC05CA8 316200FF */  andi        $v0, $t3, 0xff
/* 005CAC 9FC05CAC 00021080 */  sll         $v0, $v0, 2
/* 005CB0 9FC05CB0 3C019FC1 */  lui         $at, %hi(Te3)
/* 005CB4 9FC05CB4 00220821 */  addu        $at, $at, $v0
/* 005CB8 9FC05CB8 8C22CD60 */  lw          $v0, %lo(Te3)($at)
/* 005CBC 9FC05CBC 3C089FC1 */  lui         $t0, %hi(Te0)
/* 005CC0 9FC05CC0 2508C160 */  addiu       $t0, $t0, %lo(Te0)
/* 005CC4 9FC05CC4 00621826 */  xor         $v1, $v1, $v0
/* 005CC8 9FC05CC8 1660FF3C */  bnez        $s3, .L9FC059BC
/* 005CCC 9FC05CCC 00694826 */   xor        $t1, $v1, $t1
/* 005CD0 9FC05CD0 00101602 */  srl         $v0, $s0, 0x18
/* 005CD4 9FC05CD4 00021080 */  sll         $v0, $v0, 2
/* 005CD8 9FC05CD8 3C06FF00 */  lui         $a2, 0xff00
/* 005CDC 9FC05CDC 3C039FC1 */  lui         $v1, %hi(Te4)
/* 005CE0 9FC05CE0 00621821 */  addu        $v1, $v1, $v0
/* 005CE4 9FC05CE4 8C63D160 */  lw          $v1, %lo(Te4)($v1)
/* 005CE8 9FC05CE8 000F1382 */  srl         $v0, $t7, 0xe
/* 005CEC 9FC05CEC 304203FC */  andi        $v0, $v0, 0x3fc
/* 005CF0 9FC05CF0 3C0500FF */  lui         $a1, 0xff
/* 005CF4 9FC05CF4 3C049FC1 */  lui         $a0, %hi(Te4)
/* 005CF8 9FC05CF8 00822021 */  addu        $a0, $a0, $v0
/* 005CFC 9FC05CFC 8C84D160 */  lw          $a0, %lo(Te4)($a0)
/* 005D00 9FC05D00 00191182 */  srl         $v0, $t9, 6
/* 005D04 9FC05D04 304203FC */  andi        $v0, $v0, 0x3fc
/* 005D08 9FC05D08 3C019FC1 */  lui         $at, %hi(Te4)
/* 005D0C 9FC05D0C 00220821 */  addu        $at, $at, $v0
/* 005D10 9FC05D10 8C22D160 */  lw          $v0, %lo(Te4)($at)
/* 005D14 9FC05D14 00661824 */  and         $v1, $v1, $a2
/* 005D18 9FC05D18 00852024 */  and         $a0, $a0, $a1
/* 005D1C 9FC05D1C 00641826 */  xor         $v1, $v1, $a0
/* 005D20 9FC05D20 3042FF00 */  andi        $v0, $v0, 0xff00
/* 005D24 9FC05D24 00621826 */  xor         $v1, $v1, $v0
/* 005D28 9FC05D28 312200FF */  andi        $v0, $t1, 0xff
/* 005D2C 9FC05D2C 00021080 */  sll         $v0, $v0, 2
/* 005D30 9FC05D30 3C019FC1 */  lui         $at, %hi(Te4 + 3)
/* 005D34 9FC05D34 00220821 */  addu        $at, $at, $v0
/* 005D38 9FC05D38 9022D163 */  lbu         $v0, %lo(Te4 + 3)($at)
/* 005D3C 9FC05D3C 8F040000 */  lw          $a0, ($t8)
/* 005D40 9FC05D40 00621826 */  xor         $v1, $v1, $v0
/* 005D44 9FC05D44 00646826 */  xor         $t5, $v1, $a0
/* 005D48 9FC05D48 000D1602 */  srl         $v0, $t5, 0x18
/* 005D4C 9FC05D4C A2220000 */  sb          $v0, ($s1)
/* 005D50 9FC05D50 000D1402 */  srl         $v0, $t5, 0x10
/* 005D54 9FC05D54 A2220001 */  sb          $v0, 1($s1)
/* 005D58 9FC05D58 000D1202 */  srl         $v0, $t5, 8
/* 005D5C 9FC05D5C 000F1E02 */  srl         $v1, $t7, 0x18
/* 005D60 9FC05D60 00031880 */  sll         $v1, $v1, 2
/* 005D64 9FC05D64 A2220002 */  sb          $v0, 2($s1)
/* 005D68 9FC05D68 00191382 */  srl         $v0, $t9, 0xe
/* 005D6C 9FC05D6C 304203FC */  andi        $v0, $v0, 0x3fc
/* 005D70 9FC05D70 3C049FC1 */  lui         $a0, %hi(Te4)
/* 005D74 9FC05D74 00822021 */  addu        $a0, $a0, $v0
/* 005D78 9FC05D78 8C84D160 */  lw          $a0, %lo(Te4)($a0)
/* 005D7C 9FC05D7C 00091182 */  srl         $v0, $t1, 6
/* 005D80 9FC05D80 304203FC */  andi        $v0, $v0, 0x3fc
/* 005D84 9FC05D84 3C019FC1 */  lui         $at, %hi(Te4)
/* 005D88 9FC05D88 00230821 */  addu        $at, $at, $v1
/* 005D8C 9FC05D8C 8C23D160 */  lw          $v1, %lo(Te4)($at)
/* 005D90 9FC05D90 3C019FC1 */  lui         $at, %hi(Te4)
/* 005D94 9FC05D94 00220821 */  addu        $at, $at, $v0
/* 005D98 9FC05D98 8C22D160 */  lw          $v0, %lo(Te4)($at)
/* 005D9C 9FC05D9C A22D0003 */  sb          $t5, 3($s1)
/* 005DA0 9FC05DA0 00661824 */  and         $v1, $v1, $a2
/* 005DA4 9FC05DA4 00852024 */  and         $a0, $a0, $a1
/* 005DA8 9FC05DA8 00641826 */  xor         $v1, $v1, $a0
/* 005DAC 9FC05DAC 3042FF00 */  andi        $v0, $v0, 0xff00
/* 005DB0 9FC05DB0 00621826 */  xor         $v1, $v1, $v0
/* 005DB4 9FC05DB4 320200FF */  andi        $v0, $s0, 0xff
/* 005DB8 9FC05DB8 00021080 */  sll         $v0, $v0, 2
/* 005DBC 9FC05DBC 3C019FC1 */  lui         $at, %hi(Te4 + 3)
/* 005DC0 9FC05DC0 00220821 */  addu        $at, $at, $v0
/* 005DC4 9FC05DC4 9022D163 */  lbu         $v0, %lo(Te4 + 3)($at)
/* 005DC8 9FC05DC8 8F040004 */  lw          $a0, 4($t8)
/* 005DCC 9FC05DCC 00621826 */  xor         $v1, $v1, $v0
/* 005DD0 9FC05DD0 00646026 */  xor         $t4, $v1, $a0
/* 005DD4 9FC05DD4 000C1602 */  srl         $v0, $t4, 0x18
/* 005DD8 9FC05DD8 A2220004 */  sb          $v0, 4($s1)
/* 005DDC 9FC05DDC 000C1402 */  srl         $v0, $t4, 0x10
/* 005DE0 9FC05DE0 A2220005 */  sb          $v0, 5($s1)
/* 005DE4 9FC05DE4 000C1202 */  srl         $v0, $t4, 8
/* 005DE8 9FC05DE8 00191E02 */  srl         $v1, $t9, 0x18
/* 005DEC 9FC05DEC 00031880 */  sll         $v1, $v1, 2
/* 005DF0 9FC05DF0 A2220006 */  sb          $v0, 6($s1)
/* 005DF4 9FC05DF4 00091382 */  srl         $v0, $t1, 0xe
/* 005DF8 9FC05DF8 304203FC */  andi        $v0, $v0, 0x3fc
/* 005DFC 9FC05DFC 3C049FC1 */  lui         $a0, %hi(Te4)
/* 005E00 9FC05E00 00822021 */  addu        $a0, $a0, $v0
/* 005E04 9FC05E04 8C84D160 */  lw          $a0, %lo(Te4)($a0)
/* 005E08 9FC05E08 00101182 */  srl         $v0, $s0, 6
/* 005E0C 9FC05E0C 304203FC */  andi        $v0, $v0, 0x3fc
/* 005E10 9FC05E10 3C019FC1 */  lui         $at, %hi(Te4)
/* 005E14 9FC05E14 00230821 */  addu        $at, $at, $v1
/* 005E18 9FC05E18 8C23D160 */  lw          $v1, %lo(Te4)($at)
/* 005E1C 9FC05E1C 3C019FC1 */  lui         $at, %hi(Te4)
/* 005E20 9FC05E20 00220821 */  addu        $at, $at, $v0
/* 005E24 9FC05E24 8C22D160 */  lw          $v0, %lo(Te4)($at)
/* 005E28 9FC05E28 A22C0007 */  sb          $t4, 7($s1)
/* 005E2C 9FC05E2C 00661824 */  and         $v1, $v1, $a2
/* 005E30 9FC05E30 00852024 */  and         $a0, $a0, $a1
/* 005E34 9FC05E34 00641826 */  xor         $v1, $v1, $a0
/* 005E38 9FC05E38 3042FF00 */  andi        $v0, $v0, 0xff00
/* 005E3C 9FC05E3C 00621826 */  xor         $v1, $v1, $v0
/* 005E40 9FC05E40 31E200FF */  andi        $v0, $t7, 0xff
/* 005E44 9FC05E44 00021080 */  sll         $v0, $v0, 2
/* 005E48 9FC05E48 3C019FC1 */  lui         $at, %hi(Te4 + 3)
/* 005E4C 9FC05E4C 00220821 */  addu        $at, $at, $v0
/* 005E50 9FC05E50 9022D163 */  lbu         $v0, %lo(Te4 + 3)($at)
/* 005E54 9FC05E54 8F040008 */  lw          $a0, 8($t8)
/* 005E58 9FC05E58 00621826 */  xor         $v1, $v1, $v0
/* 005E5C 9FC05E5C 00645826 */  xor         $t3, $v1, $a0
/* 005E60 9FC05E60 000B1602 */  srl         $v0, $t3, 0x18
/* 005E64 9FC05E64 A2220008 */  sb          $v0, 8($s1)
/* 005E68 9FC05E68 000B1402 */  srl         $v0, $t3, 0x10
/* 005E6C 9FC05E6C A2220009 */  sb          $v0, 9($s1)
/* 005E70 9FC05E70 000B1202 */  srl         $v0, $t3, 8
/* 005E74 9FC05E74 00091E02 */  srl         $v1, $t1, 0x18
/* 005E78 9FC05E78 00031880 */  sll         $v1, $v1, 2
/* 005E7C 9FC05E7C A222000A */  sb          $v0, 0xa($s1)
/* 005E80 9FC05E80 00101382 */  srl         $v0, $s0, 0xe
/* 005E84 9FC05E84 304203FC */  andi        $v0, $v0, 0x3fc
/* 005E88 9FC05E88 3C049FC1 */  lui         $a0, %hi(Te4)
/* 005E8C 9FC05E8C 00822021 */  addu        $a0, $a0, $v0
/* 005E90 9FC05E90 8C84D160 */  lw          $a0, %lo(Te4)($a0)
/* 005E94 9FC05E94 000F1182 */  srl         $v0, $t7, 6
/* 005E98 9FC05E98 304203FC */  andi        $v0, $v0, 0x3fc
/* 005E9C 9FC05E9C 3C019FC1 */  lui         $at, %hi(Te4)
/* 005EA0 9FC05EA0 00230821 */  addu        $at, $at, $v1
/* 005EA4 9FC05EA4 8C23D160 */  lw          $v1, %lo(Te4)($at)
/* 005EA8 9FC05EA8 3C019FC1 */  lui         $at, %hi(Te4)
/* 005EAC 9FC05EAC 00220821 */  addu        $at, $at, $v0
/* 005EB0 9FC05EB0 8C22D160 */  lw          $v0, %lo(Te4)($at)
/* 005EB4 9FC05EB4 A22B000B */  sb          $t3, 0xb($s1)
/* 005EB8 9FC05EB8 00661824 */  and         $v1, $v1, $a2
/* 005EBC 9FC05EBC 00852024 */  and         $a0, $a0, $a1
/* 005EC0 9FC05EC0 00641826 */  xor         $v1, $v1, $a0
/* 005EC4 9FC05EC4 3042FF00 */  andi        $v0, $v0, 0xff00
/* 005EC8 9FC05EC8 00621826 */  xor         $v1, $v1, $v0
/* 005ECC 9FC05ECC 332200FF */  andi        $v0, $t9, 0xff
/* 005ED0 9FC05ED0 00021080 */  sll         $v0, $v0, 2
/* 005ED4 9FC05ED4 3C019FC1 */  lui         $at, %hi(Te4 + 3)
/* 005ED8 9FC05ED8 00220821 */  addu        $at, $at, $v0
/* 005EDC 9FC05EDC 9022D163 */  lbu         $v0, %lo(Te4 + 3)($at)
/* 005EE0 9FC05EE0 8F04000C */  lw          $a0, 0xc($t8)
/* 005EE4 9FC05EE4 00621826 */  xor         $v1, $v1, $v0
/* 005EE8 9FC05EE8 00645026 */  xor         $t2, $v1, $a0
/* 005EEC 9FC05EEC 000A1602 */  srl         $v0, $t2, 0x18
/* 005EF0 9FC05EF0 A222000C */  sb          $v0, 0xc($s1)
/* 005EF4 9FC05EF4 000A1402 */  srl         $v0, $t2, 0x10
/* 005EF8 9FC05EF8 A222000D */  sb          $v0, 0xd($s1)
/* 005EFC 9FC05EFC 8FB3000C */  lw          $s3, 0xc($sp)
/* 005F00 9FC05F00 8FB20008 */  lw          $s2, 8($sp)
/* 005F04 9FC05F04 000A1202 */  srl         $v0, $t2, 8
/* 005F08 9FC05F08 A222000E */  sb          $v0, 0xe($s1)
/* 005F0C 9FC05F0C A22A000F */  sb          $t2, 0xf($s1)
/* 005F10 9FC05F10 8FB10004 */  lw          $s1, 4($sp)
/* 005F14 9FC05F14 8FB00000 */  lw          $s0, ($sp)
/* 005F18 9FC05F18 03E00008 */  jr          $ra
/* 005F1C 9FC05F1C 27BD0010 */   addiu      $sp, $sp, 0x10
