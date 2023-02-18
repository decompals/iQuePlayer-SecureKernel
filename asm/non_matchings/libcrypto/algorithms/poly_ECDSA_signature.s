## bsl_compute_ecc_sig
/* 0095D0 9FC095D0 27BDFE00 */  addiu       $sp, $sp, -0x200
/* 0095D4 9FC095D4 AFB701F4 */  sw          $s7, 0x1f4($sp)
/* 0095D8 9FC095D8 0080B821 */  addu        $s7, $a0, $zero
/* 0095DC 9FC095DC AFBE01F8 */  sw          $fp, 0x1f8($sp)
/* 0095E0 9FC095E0 8FBE0210 */  lw          $fp, 0x210($sp)
/* 0095E4 9FC095E4 27A40018 */  addiu       $a0, $sp, 0x18
/* 0095E8 9FC095E8 AFB601F0 */  sw          $s6, 0x1f0($sp)
/* 0095EC 9FC095EC 00A0B021 */  addu        $s6, $a1, $zero
/* 0095F0 9FC095F0 AFB501EC */  sw          $s5, 0x1ec($sp)
/* 0095F4 9FC095F4 8FB50218 */  lw          $s5, 0x218($sp)
/* 0095F8 9FC095F8 24050008 */  addiu       $a1, $zero, 8
/* 0095FC 9FC095FC AFB001D8 */  sw          $s0, 0x1d8($sp)
/* 009600 9FC09600 00C08021 */  addu        $s0, $a2, $zero
/* 009604 9FC09604 AFBF01FC */  sw          $ra, 0x1fc($sp)
/* 009608 9FC09608 AFB401E8 */  sw          $s4, 0x1e8($sp)
/* 00960C 9FC0960C AFB301E4 */  sw          $s3, 0x1e4($sp)
/* 009610 9FC09610 AFB201E0 */  sw          $s2, 0x1e0($sp)
/* 009614 9FC09614 AFB101DC */  sw          $s1, 0x1dc($sp)
/* 009618 9FC09618 0FF01BD0 */  jal         bigint_zero
/* 00961C 9FC0961C AFA7020C */   sw         $a3, 0x20c($sp)
/* 009620 9FC09620 27B20038 */  addiu       $s2, $sp, 0x38
/* 009624 9FC09624 02402021 */  addu        $a0, $s2, $zero
/* 009628 9FC09628 0FF01BD0 */  jal         bigint_zero
/* 00962C 9FC0962C 24050008 */   addiu      $a1, $zero, 8
/* 009630 9FC09630 27A40058 */  addiu       $a0, $sp, 0x58
/* 009634 9FC09634 0FF01BD0 */  jal         bigint_zero
/* 009638 9FC09638 24050008 */   addiu      $a1, $zero, 8
/* 00963C 9FC0963C 27A400B8 */  addiu       $a0, $sp, 0xb8
/* 009640 9FC09640 0FF01BD0 */  jal         bigint_zero
/* 009644 9FC09644 24050010 */   addiu      $a1, $zero, 0x10
/* 009648 9FC09648 27B400F8 */  addiu       $s4, $sp, 0xf8
/* 00964C 9FC0964C 02802021 */  addu        $a0, $s4, $zero
/* 009650 9FC09650 0FF01BD0 */  jal         bigint_zero
/* 009654 9FC09654 24050008 */   addiu      $a1, $zero, 8
/* 009658 9FC09658 27A40078 */  addiu       $a0, $sp, 0x78
/* 00965C 9FC0965C 0FF01BD0 */  jal         bigint_zero
/* 009660 9FC09660 24050008 */   addiu      $a1, $zero, 8
/* 009664 9FC09664 27B30098 */  addiu       $s3, $sp, 0x98
/* 009668 9FC09668 02602021 */  addu        $a0, $s3, $zero
/* 00966C 9FC0966C 0FF01BD0 */  jal         bigint_zero
/* 009670 9FC09670 24050008 */   addiu      $a1, $zero, 8
/* 009674 9FC09674 27B10138 */  addiu       $s1, $sp, 0x138
/* 009678 9FC09678 02202021 */  addu        $a0, $s1, $zero
/* 00967C 9FC0967C 0FF01BD0 */  jal         bigint_zero
/* 009680 9FC09680 24050008 */   addiu      $a1, $zero, 8
/* 009684 9FC09684 27A40158 */  addiu       $a0, $sp, 0x158
/* 009688 9FC09688 0FF01BD0 */  jal         bigint_zero
/* 00968C 9FC0968C 24050008 */   addiu      $a1, $zero, 8
/* 009690 9FC09690 27A40118 */  addiu       $a0, $sp, 0x118
/* 009694 9FC09694 0FF01BD0 */  jal         bigint_zero
/* 009698 9FC09698 24050008 */   addiu      $a1, $zero, 8
/* 00969C 9FC0969C 02E02021 */  addu        $a0, $s7, $zero
/* 0096A0 9FC096A0 02C02821 */  addu        $a1, $s6, $zero
/* 0096A4 9FC096A4 27A60018 */  addiu       $a2, $sp, 0x18
/* 0096A8 9FC096A8 240700E9 */  addiu       $a3, $zero, 0xe9
/* 0096AC 9FC096AC 0FF024F5 */  jal         hash_to_integer
/* 0096B0 9FC096B0 AFB50010 */   sw         $s5, 0x10($sp)
/* 0096B4 9FC096B4 02002021 */  addu        $a0, $s0, $zero
/* 0096B8 9FC096B8 8FA60214 */  lw          $a2, 0x214($sp)
/* 0096BC 9FC096BC 0FF024AA */  jal         poly_key_gen_primitive
/* 0096C0 9FC096C0 27A50178 */   addiu      $a1, $sp, 0x178
/* 0096C4 9FC096C4 26040084 */  addiu       $a0, $s0, 0x84
/* 0096C8 9FC096C8 02202821 */  addu        $a1, $s1, $zero
/* 0096CC 9FC096CC 0FF01E48 */  jal         field_to_bigint
/* 0096D0 9FC096D0 24060008 */   addiu      $a2, $zero, 8
/* 0096D4 9FC096D4 27A40198 */  addiu       $a0, $sp, 0x198
/* 0096D8 9FC096D8 02402821 */  addu        $a1, $s2, $zero
/* 0096DC 9FC096DC 0FF01E48 */  jal         field_to_bigint
/* 0096E0 9FC096E0 24060008 */   addiu      $a2, $zero, 8
/* 0096E4 9FC096E4 02402021 */  addu        $a0, $s2, $zero
/* 0096E8 9FC096E8 0FF01C0B */  jal         bigint_digits
/* 0096EC 9FC096EC 24050008 */   addiu      $a1, $zero, 8
/* 0096F0 9FC096F0 02202021 */  addu        $a0, $s1, $zero
/* 0096F4 9FC096F4 24050008 */  addiu       $a1, $zero, 8
/* 0096F8 9FC096F8 0FF01C0B */  jal         bigint_digits
/* 0096FC 9FC096FC 00408021 */   addu       $s0, $v0, $zero
/* 009700 9FC09700 02802021 */  addu        $a0, $s4, $zero
/* 009704 9FC09704 02602821 */  addu        $a1, $s3, $zero
/* 009708 9FC09708 02403021 */  addu        $a2, $s2, $zero
/* 00970C 9FC0970C 02003821 */  addu        $a3, $s0, $zero
/* 009710 9FC09710 0040A821 */  addu        $s5, $v0, $zero
/* 009714 9FC09714 AFB10010 */  sw          $s1, 0x10($sp)
/* 009718 9FC09718 0FF01C9B */  jal         bigint_div
/* 00971C 9FC0971C AFB50014 */   sw         $s5, 0x14($sp)
/* 009720 9FC09720 02602021 */  addu        $a0, $s3, $zero
/* 009724 9FC09724 03C02821 */  addu        $a1, $fp, $zero
/* 009728 9FC09728 0FF01E5A */  jal         bigint_to_field
/* 00972C 9FC0972C 24060008 */   addiu      $a2, $zero, 8
/* 009730 9FC09730 00002821 */  addu        $a1, $zero, $zero
/* 009734 9FC09734 00001821 */  addu        $v1, $zero, $zero
/* 009738 9FC09738 03C02021 */  addu        $a0, $fp, $zero
.L9FC0973C:
/* 00973C 9FC0973C 8C820000 */  lw          $v0, ($a0)
/* 009740 9FC09740 24630001 */  addiu       $v1, $v1, 1
/* 009744 9FC09744 00A22825 */  or          $a1, $a1, $v0
/* 009748 9FC09748 2C620008 */  sltiu       $v0, $v1, 8
/* 00974C 9FC0974C 1440FFFB */  bnez        $v0, .L9FC0973C
/* 009750 9FC09750 24840004 */   addiu      $a0, $a0, 4
/* 009754 9FC09754 10A00048 */  beqz        $a1, .L9FC09878
/* 009758 9FC09758 27B10118 */   addiu      $s1, $sp, 0x118
/* 00975C 9FC0975C 02202821 */  addu        $a1, $s1, $zero
/* 009760 9FC09760 8FA4020C */  lw          $a0, 0x20c($sp)
/* 009764 9FC09764 0FF01E48 */  jal         field_to_bigint
/* 009768 9FC09768 24060008 */   addiu      $a2, $zero, 8
/* 00976C 9FC0976C 27B000B8 */  addiu       $s0, $sp, 0xb8
/* 009770 9FC09770 02002021 */  addu        $a0, $s0, $zero
/* 009774 9FC09774 02202821 */  addu        $a1, $s1, $zero
/* 009778 9FC09778 27A60098 */  addiu       $a2, $sp, 0x98
/* 00977C 9FC0977C 0FF01C17 */  jal         bigint_mult
/* 009780 9FC09780 24070008 */   addiu      $a3, $zero, 8
/* 009784 9FC09784 02002021 */  addu        $a0, $s0, $zero
/* 009788 9FC09788 27A50018 */  addiu       $a1, $sp, 0x18
/* 00978C 9FC0978C 02003021 */  addu        $a2, $s0, $zero
/* 009790 9FC09790 0FF01BD9 */  jal         bigint_add
/* 009794 9FC09794 24070008 */   addiu      $a3, $zero, 8
/* 009798 9FC09798 02002021 */  addu        $a0, $s0, $zero
/* 00979C 9FC0979C 0FF01C0B */  jal         bigint_digits
/* 0097A0 9FC097A0 24050010 */   addiu      $a1, $zero, 0x10
/* 0097A4 9FC097A4 27B400F8 */  addiu       $s4, $sp, 0xf8
/* 0097A8 9FC097A8 02802021 */  addu        $a0, $s4, $zero
/* 0097AC 9FC097AC 27B30058 */  addiu       $s3, $sp, 0x58
/* 0097B0 9FC097B0 02602821 */  addu        $a1, $s3, $zero
/* 0097B4 9FC097B4 02003021 */  addu        $a2, $s0, $zero
/* 0097B8 9FC097B8 00403821 */  addu        $a3, $v0, $zero
/* 0097BC 9FC097BC 27B20138 */  addiu       $s2, $sp, 0x138
/* 0097C0 9FC097C0 AFB20010 */  sw          $s2, 0x10($sp)
/* 0097C4 9FC097C4 0FF01C9B */  jal         bigint_div
/* 0097C8 9FC097C8 AFB50014 */   sw         $s5, 0x14($sp)
/* 0097CC 9FC097CC 27A40178 */  addiu       $a0, $sp, 0x178
/* 0097D0 9FC097D0 02002821 */  addu        $a1, $s0, $zero
/* 0097D4 9FC097D4 0FF01E48 */  jal         field_to_bigint
/* 0097D8 9FC097D8 24060008 */   addiu      $a2, $zero, 8
/* 0097DC 9FC097DC 27B10158 */  addiu       $s1, $sp, 0x158
/* 0097E0 9FC097E0 02202021 */  addu        $a0, $s1, $zero
/* 0097E4 9FC097E4 02002821 */  addu        $a1, $s0, $zero
/* 0097E8 9FC097E8 02403021 */  addu        $a2, $s2, $zero
/* 0097EC 9FC097EC 0FF01E79 */  jal         bigint_mod_inv
/* 0097F0 9FC097F0 24070008 */   addiu      $a3, $zero, 8
/* 0097F4 9FC097F4 02002021 */  addu        $a0, $s0, $zero
/* 0097F8 9FC097F8 02202821 */  addu        $a1, $s1, $zero
/* 0097FC 9FC097FC 02603021 */  addu        $a2, $s3, $zero
/* 009800 9FC09800 0FF01C17 */  jal         bigint_mult
/* 009804 9FC09804 24070008 */   addiu      $a3, $zero, 8
/* 009808 9FC09808 02002021 */  addu        $a0, $s0, $zero
/* 00980C 9FC0980C 0FF01C0B */  jal         bigint_digits
/* 009810 9FC09810 24050010 */   addiu      $a1, $zero, 0x10
/* 009814 9FC09814 02802021 */  addu        $a0, $s4, $zero
/* 009818 9FC09818 27B10078 */  addiu       $s1, $sp, 0x78
/* 00981C 9FC0981C 02202821 */  addu        $a1, $s1, $zero
/* 009820 9FC09820 02003021 */  addu        $a2, $s0, $zero
/* 009824 9FC09824 00403821 */  addu        $a3, $v0, $zero
/* 009828 9FC09828 AFB20010 */  sw          $s2, 0x10($sp)
/* 00982C 9FC0982C 0FF01C9B */  jal         bigint_div
/* 009830 9FC09830 AFB50014 */   sw         $s5, 0x14($sp)
/* 009834 9FC09834 02202021 */  addu        $a0, $s1, $zero
/* 009838 9FC09838 27D00020 */  addiu       $s0, $fp, 0x20
/* 00983C 9FC0983C 02002821 */  addu        $a1, $s0, $zero
/* 009840 9FC09840 0FF01E5A */  jal         bigint_to_field
/* 009844 9FC09844 24060008 */   addiu      $a2, $zero, 8
/* 009848 9FC09848 00002821 */  addu        $a1, $zero, $zero
/* 00984C 9FC0984C 00001821 */  addu        $v1, $zero, $zero
/* 009850 9FC09850 00031080 */  sll         $v0, $v1, 2
.L9FC09854:
/* 009854 9FC09854 02021021 */  addu        $v0, $s0, $v0
/* 009858 9FC09858 8C420000 */  lw          $v0, ($v0)
/* 00985C 9FC0985C 24630001 */  addiu       $v1, $v1, 1
/* 009860 9FC09860 00A22825 */  or          $a1, $a1, $v0
/* 009864 9FC09864 2C620008 */  sltiu       $v0, $v1, 8
/* 009868 9FC09868 1440FFFA */  bnez        $v0, .L9FC09854
/* 00986C 9FC0986C 00031080 */   sll        $v0, $v1, 2
/* 009870 9FC09870 14A00002 */  bnez        $a1, .L9FC0987C
/* 009874 9FC09874 00001021 */   addu       $v0, $zero, $zero
.L9FC09878:
/* 009878 9FC09878 24020002 */  addiu       $v0, $zero, 2
.L9FC0987C:
/* 00987C 9FC0987C 8FBF01FC */  lw          $ra, 0x1fc($sp)
/* 009880 9FC09880 8FBE01F8 */  lw          $fp, 0x1f8($sp)
/* 009884 9FC09884 8FB701F4 */  lw          $s7, 0x1f4($sp)
/* 009888 9FC09888 8FB601F0 */  lw          $s6, 0x1f0($sp)
/* 00988C 9FC0988C 8FB501EC */  lw          $s5, 0x1ec($sp)
/* 009890 9FC09890 8FB401E8 */  lw          $s4, 0x1e8($sp)
/* 009894 9FC09894 8FB301E4 */  lw          $s3, 0x1e4($sp)
/* 009898 9FC09898 8FB201E0 */  lw          $s2, 0x1e0($sp)
/* 00989C 9FC0989C 8FB101DC */  lw          $s1, 0x1dc($sp)
/* 0098A0 9FC098A0 8FB001D8 */  lw          $s0, 0x1d8($sp)
/* 0098A4 9FC098A4 03E00008 */  jr          $ra
/* 0098A8 9FC098A8 27BD0200 */   addiu      $sp, $sp, 0x200
