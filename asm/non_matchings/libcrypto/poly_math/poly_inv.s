## poly_elliptic_sum
## poly_elliptic_double
glabel poly_inv
/* 008720 9FC08720 27BDFF60 */  addiu       $sp, $sp, -0xa0
/* 008724 9FC08724 AFB00090 */  sw          $s0, 0x90($sp)
/* 008728 9FC08728 00808021 */  addu        $s0, $a0, $zero
/* 00872C 9FC0872C 27A40050 */  addiu       $a0, $sp, 0x50
/* 008730 9FC08730 AFB20098 */  sw          $s2, 0x98($sp)
/* 008734 9FC08734 00A09021 */  addu        $s2, $a1, $zero
/* 008738 9FC08738 AFBF009C */  sw          $ra, 0x9c($sp)
/* 00873C 9FC0873C 0FF01EE0 */  jal         null
/* 008740 9FC08740 AFB10094 */   sw         $s1, 0x94($sp)
/* 008744 9FC08744 0FF01EE0 */  jal         null
/* 008748 9FC08748 27A40030 */   addiu      $a0, $sp, 0x30
/* 00874C 9FC0874C 02002021 */  addu        $a0, $s0, $zero
/* 008750 9FC08750 0FF01F08 */  jal         copy
/* 008754 9FC08754 27A50010 */   addiu      $a1, $sp, 0x10
/* 008758 9FC08758 3C049FC1 */  lui         $a0, %hi(poly_prime)
/* 00875C 9FC0875C 2484E990 */  addiu       $a0, $a0, %lo(poly_prime)
/* 008760 9FC08760 0FF01F08 */  jal         copy
/* 008764 9FC08764 27A50070 */   addiu      $a1, $sp, 0x70
/* 008768 9FC08768 240D0007 */  addiu       $t5, $zero, 7
/* 00876C 9FC0876C 00005821 */  addu        $t3, $zero, $zero
/* 008770 9FC08770 24100007 */  addiu       $s0, $zero, 7
/* 008774 9FC08774 93A2002F */  lbu         $v0, 0x2f($sp)
/* 008778 9FC08778 3C0C9FC1 */  lui         $t4, %hi(shift_by)
/* 00877C 9FC0877C 258CEAB0 */  addiu       $t4, $t4, %lo(shift_by)
/* 008780 9FC08780 3C079FC1 */  lui         $a3, %hi(shift_by)
/* 008784 9FC08784 00E23821 */  addu        $a3, $a3, $v0
/* 008788 9FC08788 90E7EAB0 */  lbu         $a3, %lo(shift_by)($a3)
/* 00878C 9FC0878C 24020001 */  addiu       $v0, $zero, 1
/* 008790 9FC08790 AFA2004C */  sw          $v0, 0x4c($sp)
/* 008794 9FC08794 10E00025 */  beqz        $a3, .L9FC0882C
/* 008798 9FC08798 00E08821 */   addu       $s1, $a3, $zero
.L9FC0879C:
/* 00879C 9FC0879C 00004021 */  addu        $t0, $zero, $zero
/* 0087A0 9FC087A0 00003021 */  addu        $a2, $zero, $zero
/* 0087A4 9FC087A4 3C090001 */  lui         $t1, 1
/* 0087A8 9FC087A8 01201821 */  addu        $v1, $t1, $zero
.L9FC087AC:
/* 0087AC 9FC087AC 3C020001 */  lui         $v0, 1
/* 0087B0 9FC087B0 01224821 */  addu        $t1, $t1, $v0
/* 0087B4 9FC087B4 00062080 */  sll         $a0, $a2, 2
/* 0087B8 9FC087B8 00033403 */  sra         $a2, $v1, 0x10
/* 0087BC 9FC087BC 27AA0010 */  addiu       $t2, $sp, 0x10
/* 0087C0 9FC087C0 01442021 */  addu        $a0, $t2, $a0
/* 0087C4 9FC087C4 24030020 */  addiu       $v1, $zero, 0x20
/* 0087C8 9FC087C8 00671823 */  subu        $v1, $v1, $a3
/* 0087CC 9FC087CC 8C850000 */  lw          $a1, ($a0)
/* 0087D0 9FC087D0 00681804 */  sllv        $v1, $t0, $v1
/* 0087D4 9FC087D4 00051400 */  sll         $v0, $a1, 0x10
/* 0087D8 9FC087D8 00024403 */  sra         $t0, $v0, 0x10
/* 0087DC 9FC087DC 00E51006 */  srlv        $v0, $a1, $a3
/* 0087E0 9FC087E0 00431025 */  or          $v0, $v0, $v1
/* 0087E4 9FC087E4 AC820000 */  sw          $v0, ($a0)
/* 0087E8 9FC087E8 0206102B */  sltu        $v0, $s0, $a2
/* 0087EC 9FC087EC 1040FFEF */  beqz        $v0, .L9FC087AC
/* 0087F0 9FC087F0 01201821 */   addu       $v1, $t1, $zero
/* 0087F4 9FC087F4 24020008 */  addiu       $v0, $zero, 8
/* 0087F8 9FC087F8 14E2000C */  bne         $a3, $v0, .L9FC0882C
/* 0087FC 9FC087FC 00101080 */   sll        $v0, $s0, 2
/* 008800 9FC08800 01421021 */  addu        $v0, $t2, $v0
/* 008804 9FC08804 8C430000 */  lw          $v1, ($v0)
/* 008808 9FC08808 30620001 */  andi        $v0, $v1, 1
/* 00880C 9FC0880C 14400007 */  bnez        $v0, .L9FC0882C
/* 008810 9FC08810 306200FF */   andi       $v0, $v1, 0xff
/* 008814 9FC08814 004C1021 */  addu        $v0, $v0, $t4
/* 008818 9FC08818 90470000 */  lbu         $a3, ($v0)
/* 00881C 9FC0881C 02271021 */  addu        $v0, $s1, $a3
/* 008820 9FC08820 00021400 */  sll         $v0, $v0, 0x10
/* 008824 9FC08824 14E0FFDD */  bnez        $a3, .L9FC0879C
/* 008828 9FC08828 00028C03 */   sra        $s1, $v0, 0x10
.L9FC0882C:
/* 00882C 9FC0882C 00003021 */  addu        $a2, $zero, $zero
/* 008830 9FC08830 3C040001 */  lui         $a0, 1
.L9FC08834:
/* 008834 9FC08834 00061080 */  sll         $v0, $a2, 2
/* 008838 9FC08838 27A50010 */  addiu       $a1, $sp, 0x10
/* 00883C 9FC0883C 00A21021 */  addu        $v0, $a1, $v0
/* 008840 9FC08840 8C420000 */  lw          $v0, ($v0)
/* 008844 9FC08844 14400006 */  bnez        $v0, .L9FC08860
/* 008848 9FC08848 00801021 */   addu       $v0, $a0, $zero
/* 00884C 9FC0884C 3C030001 */  lui         $v1, 1
/* 008850 9FC08850 00023403 */  sra         $a2, $v0, 0x10
/* 008854 9FC08854 2CC20007 */  sltiu       $v0, $a2, 7
/* 008858 9FC08858 1440FFF6 */  bnez        $v0, .L9FC08834
/* 00885C 9FC0885C 00832021 */   addu       $a0, $a0, $v1
.L9FC08860:
/* 008860 9FC08860 2CC20007 */  sltiu       $v0, $a2, 7
/* 008864 9FC08864 14400008 */  bnez        $v0, .L9FC08888
/* 008868 9FC08868 000B2080 */   sll        $a0, $t3, 2
/* 00886C 9FC0886C 00101080 */  sll         $v0, $s0, 2
/* 008870 9FC08870 00A21021 */  addu        $v0, $a1, $v0
/* 008874 9FC08874 8C430000 */  lw          $v1, ($v0)
/* 008878 9FC08878 24020001 */  addiu       $v0, $zero, 1
/* 00887C 9FC0887C 10620168 */  beq         $v1, $v0, .L9FC08E20
/* 008880 9FC08880 27A40030 */   addiu      $a0, $sp, 0x30
/* 008884 9FC08884 000B2080 */  sll         $a0, $t3, 2
.L9FC08888:
/* 008888 9FC08888 27A70010 */  addiu       $a3, $sp, 0x10
/* 00888C 9FC0888C 00E41821 */  addu        $v1, $a3, $a0
/* 008890 9FC08890 8C620000 */  lw          $v0, ($v1)
/* 008894 9FC08894 14400017 */  bnez        $v0, .L9FC088F4
/* 008898 9FC08898 000B1080 */   sll        $v0, $t3, 2
/* 00889C 9FC0889C 27A20070 */  addiu       $v0, $sp, 0x70
/* 0088A0 9FC088A0 00442021 */  addu        $a0, $v0, $a0
/* 0088A4 9FC088A4 8C820000 */  lw          $v0, ($a0)
/* 0088A8 9FC088A8 14400012 */  bnez        $v0, .L9FC088F4
/* 0088AC 9FC088AC 000B1080 */   sll        $v0, $t3, 2
/* 0088B0 9FC088B0 00803021 */  addu        $a2, $a0, $zero
/* 0088B4 9FC088B4 00602821 */  addu        $a1, $v1, $zero
/* 0088B8 9FC088B8 000B1C00 */  sll         $v1, $t3, 0x10
/* 0088BC 9FC088BC 3C020001 */  lui         $v0, 1
/* 0088C0 9FC088C0 00622021 */  addu        $a0, $v1, $v0
/* 0088C4 9FC088C4 24C60004 */  addiu       $a2, $a2, 4
.L9FC088C8:
/* 0088C8 9FC088C8 24A50004 */  addiu       $a1, $a1, 4
/* 0088CC 9FC088CC 00801021 */  addu        $v0, $a0, $zero
/* 0088D0 9FC088D0 3C030001 */  lui         $v1, 1
/* 0088D4 9FC088D4 00832021 */  addu        $a0, $a0, $v1
/* 0088D8 9FC088D8 8CA30000 */  lw          $v1, ($a1)
/* 0088DC 9FC088DC 14600004 */  bnez        $v1, .L9FC088F0
/* 0088E0 9FC088E0 00025C03 */   sra        $t3, $v0, 0x10
/* 0088E4 9FC088E4 8CC20000 */  lw          $v0, ($a2)
/* 0088E8 9FC088E8 5040FFF7 */  beql        $v0, $zero, .L9FC088C8
/* 0088EC 9FC088EC 24C60004 */   addiu      $a2, $a2, 4
.L9FC088F0:
/* 0088F0 9FC088F0 000B1080 */  sll         $v0, $t3, 2
.L9FC088F4:
/* 0088F4 9FC088F4 00E21821 */  addu        $v1, $a3, $v0
/* 0088F8 9FC088F8 03A22021 */  addu        $a0, $sp, $v0
/* 0088FC 9FC088FC 8C620000 */  lw          $v0, ($v1)
/* 008900 9FC08900 8C830070 */  lw          $v1, 0x70($a0)
/* 008904 9FC08904 0043102B */  sltu        $v0, $v0, $v1
/* 008908 9FC08908 144000B4 */  bnez        $v0, .L9FC08BDC
/* 00890C 9FC0890C 020B102B */   sltu       $v0, $s0, $t3
.L9FC08910:
/* 008910 9FC08910 020B102B */  sltu        $v0, $s0, $t3
/* 008914 9FC08914 14400013 */  bnez        $v0, .L9FC08964
/* 008918 9FC08918 01603821 */   addu       $a3, $t3, $zero
/* 00891C 9FC0891C 000B1C00 */  sll         $v1, $t3, 0x10
/* 008920 9FC08920 3C020001 */  lui         $v0, 1
/* 008924 9FC08924 00623021 */  addu        $a2, $v1, $v0
/* 008928 9FC08928 00C02821 */  addu        $a1, $a2, $zero
.L9FC0892C:
/* 00892C 9FC0892C 3C020001 */  lui         $v0, 1
/* 008930 9FC08930 00C23021 */  addu        $a2, $a2, $v0
/* 008934 9FC08934 00071080 */  sll         $v0, $a3, 2
/* 008938 9FC08938 27A30010 */  addiu       $v1, $sp, 0x10
/* 00893C 9FC0893C 00621821 */  addu        $v1, $v1, $v0
/* 008940 9FC08940 03A22021 */  addu        $a0, $sp, $v0
/* 008944 9FC08944 8C620000 */  lw          $v0, ($v1)
/* 008948 9FC08948 8C840070 */  lw          $a0, 0x70($a0)
/* 00894C 9FC0894C 00053C03 */  sra         $a3, $a1, 0x10
/* 008950 9FC08950 00441026 */  xor         $v0, $v0, $a0
/* 008954 9FC08954 AC620000 */  sw          $v0, ($v1)
/* 008958 9FC08958 0207102B */  sltu        $v0, $s0, $a3
/* 00895C 9FC0895C 1040FFF3 */  beqz        $v0, .L9FC0892C
/* 008960 9FC08960 00C02821 */   addu       $a1, $a2, $zero
.L9FC08964:
/* 008964 9FC08964 01A03821 */  addu        $a3, $t5, $zero
/* 008968 9FC08968 0207102B */  sltu        $v0, $s0, $a3
/* 00896C 9FC0896C 5440001B */  bnel        $v0, $zero, .L9FC089DC
/* 008970 9FC08970 00106080 */   sll        $t4, $s0, 2
/* 008974 9FC08974 00071C00 */  sll         $v1, $a3, 0x10
/* 008978 9FC08978 3C020001 */  lui         $v0, 1
/* 00897C 9FC0897C 00623021 */  addu        $a2, $v1, $v0
/* 008980 9FC08980 00C02821 */  addu        $a1, $a2, $zero
.L9FC08984:
/* 008984 9FC08984 3C020001 */  lui         $v0, 1
/* 008988 9FC08988 00C23021 */  addu        $a2, $a2, $v0
/* 00898C 9FC0898C 00071080 */  sll         $v0, $a3, 2
/* 008990 9FC08990 27A30030 */  addiu       $v1, $sp, 0x30
/* 008994 9FC08994 00621821 */  addu        $v1, $v1, $v0
/* 008998 9FC08998 03A22021 */  addu        $a0, $sp, $v0
/* 00899C 9FC0899C 8C620000 */  lw          $v0, ($v1)
/* 0089A0 9FC089A0 8C840050 */  lw          $a0, 0x50($a0)
/* 0089A4 9FC089A4 00053C03 */  sra         $a3, $a1, 0x10
/* 0089A8 9FC089A8 00441026 */  xor         $v0, $v0, $a0
/* 0089AC 9FC089AC AC620000 */  sw          $v0, ($v1)
/* 0089B0 9FC089B0 0207102B */  sltu        $v0, $s0, $a3
/* 0089B4 9FC089B4 1040FFF3 */  beqz        $v0, .L9FC08984
/* 0089B8 9FC089B8 00C02821 */   addu       $a1, $a2, $zero
/* 0089BC 9FC089BC 0BF02277 */  j           .L9FC089DC
/* 0089C0 9FC089C0 00106080 */   sll        $t4, $s0, 2
.L9FC089C4:
/* 0089C4 9FC089C4 03AC1021 */  addu        $v0, $sp, $t4
/* 0089C8 9FC089C8 8C420010 */  lw          $v0, 0x10($v0)
/* 0089CC 9FC089CC 30420001 */  andi        $v0, $v0, 1
/* 0089D0 9FC089D0 14400046 */  bnez        $v0, .L9FC08AEC
/* 0089D4 9FC089D4 2CC20007 */   sltiu      $v0, $a2, 7
/* 0089D8 9FC089D8 00106080 */  sll         $t4, $s0, 2
.L9FC089DC:
/* 0089DC 9FC089DC 27AA0010 */  addiu       $t2, $sp, 0x10
/* 0089E0 9FC089E0 014C1021 */  addu        $v0, $t2, $t4
/* 0089E4 9FC089E4 90420003 */  lbu         $v0, 3($v0)
/* 0089E8 9FC089E8 3C079FC1 */  lui         $a3, %hi(shift_by)
/* 0089EC 9FC089EC 00E23821 */  addu        $a3, $a3, $v0
/* 0089F0 9FC089F0 90E7EAB0 */  lbu         $a3, %lo(shift_by)($a3)
/* 0089F4 9FC089F4 02003021 */  addu        $a2, $s0, $zero
/* 0089F8 9FC089F8 02271021 */  addu        $v0, $s1, $a3
/* 0089FC 9FC089FC 00021400 */  sll         $v0, $v0, 0x10
/* 008A00 9FC08A00 00028C03 */  sra         $s1, $v0, 0x10
/* 008A04 9FC08A04 00CD102A */  slt         $v0, $a2, $t5
/* 008A08 9FC08A08 14400016 */  bnez        $v0, .L9FC08A64
/* 008A0C 9FC08A0C 00004021 */   addu       $t0, $zero, $zero
/* 008A10 9FC08A10 00061C00 */  sll         $v1, $a2, 0x10
/* 008A14 9FC08A14 3C02FFFF */  lui         $v0, 0xffff
/* 008A18 9FC08A18 00624821 */  addu        $t1, $v1, $v0
.L9FC08A1C:
/* 008A1C 9FC08A1C 01201821 */  addu        $v1, $t1, $zero
/* 008A20 9FC08A20 3C02FFFF */  lui         $v0, 0xffff
/* 008A24 9FC08A24 01224821 */  addu        $t1, $t1, $v0
/* 008A28 9FC08A28 00061080 */  sll         $v0, $a2, 2
/* 008A2C 9FC08A2C 27A40050 */  addiu       $a0, $sp, 0x50
/* 008A30 9FC08A30 00822021 */  addu        $a0, $a0, $v0
/* 008A34 9FC08A34 00033403 */  sra         $a2, $v1, 0x10
/* 008A38 9FC08A38 24020020 */  addiu       $v0, $zero, 0x20
/* 008A3C 9FC08A3C 8C850000 */  lw          $a1, ($a0)
/* 008A40 9FC08A40 00471023 */  subu        $v0, $v0, $a3
/* 008A44 9FC08A44 00E51804 */  sllv        $v1, $a1, $a3
/* 008A48 9FC08A48 00681825 */  or          $v1, $v1, $t0
/* 008A4C 9FC08A4C 00451006 */  srlv        $v0, $a1, $v0
/* 008A50 9FC08A50 00021400 */  sll         $v0, $v0, 0x10
/* 008A54 9FC08A54 00024403 */  sra         $t0, $v0, 0x10
/* 008A58 9FC08A58 00CD102A */  slt         $v0, $a2, $t5
/* 008A5C 9FC08A5C 1040FFEF */  beqz        $v0, .L9FC08A1C
/* 008A60 9FC08A60 AC830000 */   sw         $v1, ($a0)
.L9FC08A64:
/* 008A64 9FC08A64 11000004 */  beqz        $t0, .L9FC08A78
/* 008A68 9FC08A68 00061080 */   sll        $v0, $a2, 2
/* 008A6C 9FC08A6C 00C06821 */  addu        $t5, $a2, $zero
/* 008A70 9FC08A70 03A21021 */  addu        $v0, $sp, $v0
/* 008A74 9FC08A74 AC480050 */  sw          $t0, 0x50($v0)
.L9FC08A78:
/* 008A78 9FC08A78 01603021 */  addu        $a2, $t3, $zero
/* 008A7C 9FC08A7C 0206102B */  sltu        $v0, $s0, $a2
/* 008A80 9FC08A80 14400016 */  bnez        $v0, .L9FC08ADC
/* 008A84 9FC08A84 00004021 */   addu       $t0, $zero, $zero
/* 008A88 9FC08A88 00061C00 */  sll         $v1, $a2, 0x10
/* 008A8C 9FC08A8C 3C020001 */  lui         $v0, 1
/* 008A90 9FC08A90 00624821 */  addu        $t1, $v1, $v0
/* 008A94 9FC08A94 01201821 */  addu        $v1, $t1, $zero
.L9FC08A98:
/* 008A98 9FC08A98 3C020001 */  lui         $v0, 1
/* 008A9C 9FC08A9C 01224821 */  addu        $t1, $t1, $v0
/* 008AA0 9FC08AA0 00062080 */  sll         $a0, $a2, 2
/* 008AA4 9FC08AA4 00033403 */  sra         $a2, $v1, 0x10
/* 008AA8 9FC08AA8 01442021 */  addu        $a0, $t2, $a0
/* 008AAC 9FC08AAC 24030020 */  addiu       $v1, $zero, 0x20
/* 008AB0 9FC08AB0 00671823 */  subu        $v1, $v1, $a3
/* 008AB4 9FC08AB4 8C850000 */  lw          $a1, ($a0)
/* 008AB8 9FC08AB8 00681804 */  sllv        $v1, $t0, $v1
/* 008ABC 9FC08ABC 00051400 */  sll         $v0, $a1, 0x10
/* 008AC0 9FC08AC0 00024403 */  sra         $t0, $v0, 0x10
/* 008AC4 9FC08AC4 00E51006 */  srlv        $v0, $a1, $a3
/* 008AC8 9FC08AC8 00431025 */  or          $v0, $v0, $v1
/* 008ACC 9FC08ACC AC820000 */  sw          $v0, ($a0)
/* 008AD0 9FC08AD0 0206102B */  sltu        $v0, $s0, $a2
/* 008AD4 9FC08AD4 1040FFF0 */  beqz        $v0, .L9FC08A98
/* 008AD8 9FC08AD8 01201821 */   addu       $v1, $t1, $zero
.L9FC08ADC:
/* 008ADC 9FC08ADC 24020008 */  addiu       $v0, $zero, 8
/* 008AE0 9FC08AE0 10E2FFB8 */  beq         $a3, $v0, .L9FC089C4
/* 008AE4 9FC08AE4 01603021 */   addu       $a2, $t3, $zero
/* 008AE8 9FC08AE8 2CC20007 */  sltiu       $v0, $a2, 7
.L9FC08AEC:
/* 008AEC 9FC08AEC 10400010 */  beqz        $v0, .L9FC08B30
/* 008AF0 9FC08AF0 00061C00 */   sll        $v1, $a2, 0x10
/* 008AF4 9FC08AF4 3C020001 */  lui         $v0, 1
/* 008AF8 9FC08AF8 00622021 */  addu        $a0, $v1, $v0
.L9FC08AFC:
/* 008AFC 9FC08AFC 00061080 */  sll         $v0, $a2, 2
/* 008B00 9FC08B00 03A21021 */  addu        $v0, $sp, $v0
/* 008B04 9FC08B04 8C420010 */  lw          $v0, 0x10($v0)
/* 008B08 9FC08B08 14400006 */  bnez        $v0, .L9FC08B24
/* 008B0C 9FC08B0C 00801021 */   addu       $v0, $a0, $zero
/* 008B10 9FC08B10 3C030001 */  lui         $v1, 1
/* 008B14 9FC08B14 00023403 */  sra         $a2, $v0, 0x10
/* 008B18 9FC08B18 2CC20007 */  sltiu       $v0, $a2, 7
/* 008B1C 9FC08B1C 1440FFF7 */  bnez        $v0, .L9FC08AFC
/* 008B20 9FC08B20 00832021 */   addu       $a0, $a0, $v1
.L9FC08B24:
/* 008B24 9FC08B24 2CC20007 */  sltiu       $v0, $a2, 7
/* 008B28 9FC08B28 5440FF57 */  bnel        $v0, $zero, .L9FC08888
/* 008B2C 9FC08B2C 000B2080 */   sll        $a0, $t3, 2
.L9FC08B30:
/* 008B30 9FC08B30 00101080 */  sll         $v0, $s0, 2
/* 008B34 9FC08B34 03A21021 */  addu        $v0, $sp, $v0
/* 008B38 9FC08B38 8C430010 */  lw          $v1, 0x10($v0)
/* 008B3C 9FC08B3C 24020001 */  addiu       $v0, $zero, 1
/* 008B40 9FC08B40 1462FF51 */  bne         $v1, $v0, .L9FC08888
/* 008B44 9FC08B44 000B2080 */   sll        $a0, $t3, 2
/* 008B48 9FC08B48 1CC000B5 */  bgtz        $a2, .L9FC08E20
/* 008B4C 9FC08B4C 27A40030 */   addiu      $a0, $sp, 0x30
/* 008B50 9FC08B50 000B2080 */  sll         $a0, $t3, 2
.L9FC08B54:
/* 008B54 9FC08B54 27A70070 */  addiu       $a3, $sp, 0x70
/* 008B58 9FC08B58 00E41821 */  addu        $v1, $a3, $a0
/* 008B5C 9FC08B5C 8C620000 */  lw          $v0, ($v1)
/* 008B60 9FC08B60 14400017 */  bnez        $v0, .L9FC08BC0
/* 008B64 9FC08B64 000B1080 */   sll        $v0, $t3, 2
/* 008B68 9FC08B68 27A20010 */  addiu       $v0, $sp, 0x10
/* 008B6C 9FC08B6C 00442021 */  addu        $a0, $v0, $a0
/* 008B70 9FC08B70 8C820000 */  lw          $v0, ($a0)
/* 008B74 9FC08B74 14400012 */  bnez        $v0, .L9FC08BC0
/* 008B78 9FC08B78 000B1080 */   sll        $v0, $t3, 2
/* 008B7C 9FC08B7C 00803021 */  addu        $a2, $a0, $zero
/* 008B80 9FC08B80 00602821 */  addu        $a1, $v1, $zero
/* 008B84 9FC08B84 000B1C00 */  sll         $v1, $t3, 0x10
/* 008B88 9FC08B88 3C020001 */  lui         $v0, 1
/* 008B8C 9FC08B8C 00622021 */  addu        $a0, $v1, $v0
/* 008B90 9FC08B90 24C60004 */  addiu       $a2, $a2, 4
.L9FC08B94:
/* 008B94 9FC08B94 24A50004 */  addiu       $a1, $a1, 4
/* 008B98 9FC08B98 00801021 */  addu        $v0, $a0, $zero
/* 008B9C 9FC08B9C 3C030001 */  lui         $v1, 1
/* 008BA0 9FC08BA0 00832021 */  addu        $a0, $a0, $v1
/* 008BA4 9FC08BA4 8CA30000 */  lw          $v1, ($a1)
/* 008BA8 9FC08BA8 14600004 */  bnez        $v1, .L9FC08BBC
/* 008BAC 9FC08BAC 00025C03 */   sra        $t3, $v0, 0x10
/* 008BB0 9FC08BB0 8CC20000 */  lw          $v0, ($a2)
/* 008BB4 9FC08BB4 5040FFF7 */  beql        $v0, $zero, .L9FC08B94
/* 008BB8 9FC08BB8 24C60004 */   addiu      $a2, $a2, 4
.L9FC08BBC:
/* 008BBC 9FC08BBC 000B1080 */  sll         $v0, $t3, 2
.L9FC08BC0:
/* 008BC0 9FC08BC0 00E21821 */  addu        $v1, $a3, $v0
/* 008BC4 9FC08BC4 03A22021 */  addu        $a0, $sp, $v0
/* 008BC8 9FC08BC8 8C620000 */  lw          $v0, ($v1)
/* 008BCC 9FC08BCC 8C830010 */  lw          $v1, 0x10($a0)
/* 008BD0 9FC08BD0 0043102B */  sltu        $v0, $v0, $v1
/* 008BD4 9FC08BD4 1440FF4E */  bnez        $v0, .L9FC08910
/* 008BD8 9FC08BD8 020B102B */   sltu       $v0, $s0, $t3
.L9FC08BDC:
/* 008BDC 9FC08BDC 14400013 */  bnez        $v0, .L9FC08C2C
/* 008BE0 9FC08BE0 01603821 */   addu       $a3, $t3, $zero
/* 008BE4 9FC08BE4 000B1C00 */  sll         $v1, $t3, 0x10
/* 008BE8 9FC08BE8 3C020001 */  lui         $v0, 1
/* 008BEC 9FC08BEC 00623021 */  addu        $a2, $v1, $v0
/* 008BF0 9FC08BF0 00C02821 */  addu        $a1, $a2, $zero
.L9FC08BF4:
/* 008BF4 9FC08BF4 3C020001 */  lui         $v0, 1
/* 008BF8 9FC08BF8 00C23021 */  addu        $a2, $a2, $v0
/* 008BFC 9FC08BFC 00071080 */  sll         $v0, $a3, 2
/* 008C00 9FC08C00 27A30070 */  addiu       $v1, $sp, 0x70
/* 008C04 9FC08C04 00621821 */  addu        $v1, $v1, $v0
/* 008C08 9FC08C08 03A22021 */  addu        $a0, $sp, $v0
/* 008C0C 9FC08C0C 8C620000 */  lw          $v0, ($v1)
/* 008C10 9FC08C10 8C840010 */  lw          $a0, 0x10($a0)
/* 008C14 9FC08C14 00053C03 */  sra         $a3, $a1, 0x10
/* 008C18 9FC08C18 00441026 */  xor         $v0, $v0, $a0
/* 008C1C 9FC08C1C AC620000 */  sw          $v0, ($v1)
/* 008C20 9FC08C20 0207102B */  sltu        $v0, $s0, $a3
/* 008C24 9FC08C24 1040FFF3 */  beqz        $v0, .L9FC08BF4
/* 008C28 9FC08C28 00C02821 */   addu       $a1, $a2, $zero
.L9FC08C2C:
/* 008C2C 9FC08C2C 01A03821 */  addu        $a3, $t5, $zero
/* 008C30 9FC08C30 0207102B */  sltu        $v0, $s0, $a3
/* 008C34 9FC08C34 5440001B */  bnel        $v0, $zero, .L9FC08CA4
/* 008C38 9FC08C38 00106080 */   sll        $t4, $s0, 2
/* 008C3C 9FC08C3C 00071C00 */  sll         $v1, $a3, 0x10
/* 008C40 9FC08C40 3C020001 */  lui         $v0, 1
/* 008C44 9FC08C44 00623021 */  addu        $a2, $v1, $v0
/* 008C48 9FC08C48 00C02821 */  addu        $a1, $a2, $zero
.L9FC08C4C:
/* 008C4C 9FC08C4C 3C020001 */  lui         $v0, 1
/* 008C50 9FC08C50 00C23021 */  addu        $a2, $a2, $v0
/* 008C54 9FC08C54 00071080 */  sll         $v0, $a3, 2
/* 008C58 9FC08C58 27A30050 */  addiu       $v1, $sp, 0x50
/* 008C5C 9FC08C5C 00621821 */  addu        $v1, $v1, $v0
/* 008C60 9FC08C60 03A22021 */  addu        $a0, $sp, $v0
/* 008C64 9FC08C64 8C620000 */  lw          $v0, ($v1)
/* 008C68 9FC08C68 8C840030 */  lw          $a0, 0x30($a0)
/* 008C6C 9FC08C6C 00053C03 */  sra         $a3, $a1, 0x10
/* 008C70 9FC08C70 00441026 */  xor         $v0, $v0, $a0
/* 008C74 9FC08C74 AC620000 */  sw          $v0, ($v1)
/* 008C78 9FC08C78 0207102B */  sltu        $v0, $s0, $a3
/* 008C7C 9FC08C7C 1040FFF3 */  beqz        $v0, .L9FC08C4C
/* 008C80 9FC08C80 00C02821 */   addu       $a1, $a2, $zero
/* 008C84 9FC08C84 0BF02329 */  j           .L9FC08CA4
/* 008C88 9FC08C88 00106080 */   sll        $t4, $s0, 2
.L9FC08C8C:
/* 008C8C 9FC08C8C 03AC1021 */  addu        $v0, $sp, $t4
/* 008C90 9FC08C90 8C420070 */  lw          $v0, 0x70($v0)
/* 008C94 9FC08C94 30420001 */  andi        $v0, $v0, 1
/* 008C98 9FC08C98 14400046 */  bnez        $v0, .L9FC08DB4
/* 008C9C 9FC08C9C 2CC20007 */   sltiu      $v0, $a2, 7
/* 008CA0 9FC08CA0 00106080 */  sll         $t4, $s0, 2
.L9FC08CA4:
/* 008CA4 9FC08CA4 27AA0070 */  addiu       $t2, $sp, 0x70
/* 008CA8 9FC08CA8 014C1021 */  addu        $v0, $t2, $t4
/* 008CAC 9FC08CAC 90420003 */  lbu         $v0, 3($v0)
/* 008CB0 9FC08CB0 3C079FC1 */  lui         $a3, %hi(shift_by)
/* 008CB4 9FC08CB4 00E23821 */  addu        $a3, $a3, $v0
/* 008CB8 9FC08CB8 90E7EAB0 */  lbu         $a3, %lo(shift_by)($a3)
/* 008CBC 9FC08CBC 02003021 */  addu        $a2, $s0, $zero
/* 008CC0 9FC08CC0 02271021 */  addu        $v0, $s1, $a3
/* 008CC4 9FC08CC4 00021400 */  sll         $v0, $v0, 0x10
/* 008CC8 9FC08CC8 00028C03 */  sra         $s1, $v0, 0x10
/* 008CCC 9FC08CCC 00CD102A */  slt         $v0, $a2, $t5
/* 008CD0 9FC08CD0 14400016 */  bnez        $v0, .L9FC08D2C
/* 008CD4 9FC08CD4 00004021 */   addu       $t0, $zero, $zero
/* 008CD8 9FC08CD8 00061C00 */  sll         $v1, $a2, 0x10
/* 008CDC 9FC08CDC 3C02FFFF */  lui         $v0, 0xffff
/* 008CE0 9FC08CE0 00624821 */  addu        $t1, $v1, $v0
.L9FC08CE4:
/* 008CE4 9FC08CE4 01201821 */  addu        $v1, $t1, $zero
/* 008CE8 9FC08CE8 3C02FFFF */  lui         $v0, 0xffff
/* 008CEC 9FC08CEC 01224821 */  addu        $t1, $t1, $v0
/* 008CF0 9FC08CF0 00061080 */  sll         $v0, $a2, 2
/* 008CF4 9FC08CF4 27A40030 */  addiu       $a0, $sp, 0x30
/* 008CF8 9FC08CF8 00822021 */  addu        $a0, $a0, $v0
/* 008CFC 9FC08CFC 00033403 */  sra         $a2, $v1, 0x10
/* 008D00 9FC08D00 24020020 */  addiu       $v0, $zero, 0x20
/* 008D04 9FC08D04 8C850000 */  lw          $a1, ($a0)
/* 008D08 9FC08D08 00471023 */  subu        $v0, $v0, $a3
/* 008D0C 9FC08D0C 00E51804 */  sllv        $v1, $a1, $a3
/* 008D10 9FC08D10 00681825 */  or          $v1, $v1, $t0
/* 008D14 9FC08D14 00451006 */  srlv        $v0, $a1, $v0
/* 008D18 9FC08D18 00021400 */  sll         $v0, $v0, 0x10
/* 008D1C 9FC08D1C 00024403 */  sra         $t0, $v0, 0x10
/* 008D20 9FC08D20 00CD102A */  slt         $v0, $a2, $t5
/* 008D24 9FC08D24 1040FFEF */  beqz        $v0, .L9FC08CE4
/* 008D28 9FC08D28 AC830000 */   sw         $v1, ($a0)
.L9FC08D2C:
/* 008D2C 9FC08D2C 11000004 */  beqz        $t0, .L9FC08D40
/* 008D30 9FC08D30 00061080 */   sll        $v0, $a2, 2
/* 008D34 9FC08D34 00C06821 */  addu        $t5, $a2, $zero
/* 008D38 9FC08D38 03A21021 */  addu        $v0, $sp, $v0
/* 008D3C 9FC08D3C AC480030 */  sw          $t0, 0x30($v0)
.L9FC08D40:
/* 008D40 9FC08D40 01603021 */  addu        $a2, $t3, $zero
/* 008D44 9FC08D44 0206102B */  sltu        $v0, $s0, $a2
/* 008D48 9FC08D48 14400016 */  bnez        $v0, .L9FC08DA4
/* 008D4C 9FC08D4C 00004021 */   addu       $t0, $zero, $zero
/* 008D50 9FC08D50 00061C00 */  sll         $v1, $a2, 0x10
/* 008D54 9FC08D54 3C020001 */  lui         $v0, 1
/* 008D58 9FC08D58 00624821 */  addu        $t1, $v1, $v0
/* 008D5C 9FC08D5C 01201821 */  addu        $v1, $t1, $zero
.L9FC08D60:
/* 008D60 9FC08D60 3C020001 */  lui         $v0, 1
/* 008D64 9FC08D64 01224821 */  addu        $t1, $t1, $v0
/* 008D68 9FC08D68 00062080 */  sll         $a0, $a2, 2
/* 008D6C 9FC08D6C 00033403 */  sra         $a2, $v1, 0x10
/* 008D70 9FC08D70 01442021 */  addu        $a0, $t2, $a0
/* 008D74 9FC08D74 24030020 */  addiu       $v1, $zero, 0x20
/* 008D78 9FC08D78 00671823 */  subu        $v1, $v1, $a3
/* 008D7C 9FC08D7C 8C850000 */  lw          $a1, ($a0)
/* 008D80 9FC08D80 00681804 */  sllv        $v1, $t0, $v1
/* 008D84 9FC08D84 00051400 */  sll         $v0, $a1, 0x10
/* 008D88 9FC08D88 00024403 */  sra         $t0, $v0, 0x10
/* 008D8C 9FC08D8C 00E51006 */  srlv        $v0, $a1, $a3
/* 008D90 9FC08D90 00431025 */  or          $v0, $v0, $v1
/* 008D94 9FC08D94 AC820000 */  sw          $v0, ($a0)
/* 008D98 9FC08D98 0206102B */  sltu        $v0, $s0, $a2
/* 008D9C 9FC08D9C 1040FFF0 */  beqz        $v0, .L9FC08D60
/* 008DA0 9FC08DA0 01201821 */   addu       $v1, $t1, $zero
.L9FC08DA4:
/* 008DA4 9FC08DA4 24020008 */  addiu       $v0, $zero, 8
/* 008DA8 9FC08DA8 10E2FFB8 */  beq         $a3, $v0, .L9FC08C8C
/* 008DAC 9FC08DAC 01603021 */   addu       $a2, $t3, $zero
/* 008DB0 9FC08DB0 2CC20007 */  sltiu       $v0, $a2, 7
.L9FC08DB4:
/* 008DB4 9FC08DB4 10400010 */  beqz        $v0, .L9FC08DF8
/* 008DB8 9FC08DB8 00061C00 */   sll        $v1, $a2, 0x10
/* 008DBC 9FC08DBC 3C020001 */  lui         $v0, 1
/* 008DC0 9FC08DC0 00622021 */  addu        $a0, $v1, $v0
.L9FC08DC4:
/* 008DC4 9FC08DC4 00061080 */  sll         $v0, $a2, 2
/* 008DC8 9FC08DC8 03A21021 */  addu        $v0, $sp, $v0
/* 008DCC 9FC08DCC 8C420070 */  lw          $v0, 0x70($v0)
/* 008DD0 9FC08DD0 14400006 */  bnez        $v0, .L9FC08DEC
/* 008DD4 9FC08DD4 00801021 */   addu       $v0, $a0, $zero
/* 008DD8 9FC08DD8 3C030001 */  lui         $v1, 1
/* 008DDC 9FC08DDC 00023403 */  sra         $a2, $v0, 0x10
/* 008DE0 9FC08DE0 2CC20007 */  sltiu       $v0, $a2, 7
/* 008DE4 9FC08DE4 1440FFF7 */  bnez        $v0, .L9FC08DC4
/* 008DE8 9FC08DE8 00832021 */   addu       $a0, $a0, $v1
.L9FC08DEC:
/* 008DEC 9FC08DEC 2CC20007 */  sltiu       $v0, $a2, 7
/* 008DF0 9FC08DF0 1440FF58 */  bnez        $v0, .L9FC08B54
/* 008DF4 9FC08DF4 000B2080 */   sll        $a0, $t3, 2
.L9FC08DF8:
/* 008DF8 9FC08DF8 00101080 */  sll         $v0, $s0, 2
/* 008DFC 9FC08DFC 03A21021 */  addu        $v0, $sp, $v0
/* 008E00 9FC08E00 8C430070 */  lw          $v1, 0x70($v0)
/* 008E04 9FC08E04 24020001 */  addiu       $v0, $zero, 1
/* 008E08 9FC08E08 1462FF52 */  bne         $v1, $v0, .L9FC08B54
/* 008E0C 9FC08E0C 000B2080 */   sll        $a0, $t3, 2
/* 008E10 9FC08E10 27A40050 */  addiu       $a0, $sp, 0x50
/* 008E14 9FC08E14 0FF01F08 */  jal         copy
/* 008E18 9FC08E18 27A50030 */   addiu      $a1, $sp, 0x30
/* 008E1C 9FC08E1C 27A40030 */  addiu       $a0, $sp, 0x30
.L9FC08E20:
/* 008E20 9FC08E20 02202821 */  addu        $a1, $s1, $zero
/* 008E24 9FC08E24 0FF0212F */  jal         cus_times_u_to_n
/* 008E28 9FC08E28 02403021 */   addu       $a2, $s2, $zero
/* 008E2C 9FC08E2C 8FBF009C */  lw          $ra, 0x9c($sp)
/* 008E30 9FC08E30 8FB20098 */  lw          $s2, 0x98($sp)
/* 008E34 9FC08E34 8FB10094 */  lw          $s1, 0x94($sp)
/* 008E38 9FC08E38 8FB00090 */  lw          $s0, 0x90($sp)
/* 008E3C 9FC08E3C 03E00008 */  jr          $ra
/* 008E40 9FC08E40 27BD00A0 */   addiu      $sp, $sp, 0xa0
