## skLaunch
## skRecryptBegin
## func_9FC020C4
## func_9FC02488
## rsa_verify_signature
## func_9FC03410
## hash_to_integer
/* 0067FC 9FC067FC 3C076745 */  lui         $a3, (0x67452301 >> 16)
/* 006800 9FC06800 34E72301 */  ori         $a3, $a3, (0x67452301 & 0xFFFF)
/* 006804 9FC06804 3C06EFCD */  lui         $a2, (0xEFCDAB89 >> 16)
/* 006808 9FC06808 34C6AB89 */  ori         $a2, $a2, (0xEFCDAB89 & 0xFFFF)
/* 00680C 9FC0680C 3C0598BA */  lui         $a1, (0x98BADCFE >> 16)
/* 006810 9FC06810 34A5DCFE */  ori         $a1, $a1, (0x98BADCFE & 0xFFFF)
/* 006814 9FC06814 3C031032 */  lui         $v1, (0x10325476 >> 16)
/* 006818 9FC06818 34635476 */  ori         $v1, $v1, (0x10325476 & 0xFFFF)
/* 00681C 9FC0681C 3C02C3D2 */  lui         $v0, (0xC3D2E1F0 >> 16)
/* 006820 9FC06820 3442E1F0 */  ori         $v0, $v0, (0xC3D2E1F0 & 0xFFFF)
/* 006824 9FC06824 AC820010 */  sw          $v0, 0x10($a0)
/* 006828 9FC06828 00001021 */  addu        $v0, $zero, $zero
/* 00682C 9FC0682C AC870000 */  sw          $a3, ($a0)
/* 006830 9FC06830 AC860004 */  sw          $a2, 4($a0)
/* 006834 9FC06834 AC850008 */  sw          $a1, 8($a0)
/* 006838 9FC06838 AC83000C */  sw          $v1, 0xc($a0)
/* 00683C 9FC0683C AC800014 */  sw          $zero, 0x14($a0)
/* 006840 9FC06840 03E00008 */  jr          $ra
/* 006844 9FC06844 AC800018 */   sw         $zero, 0x18($a0)
