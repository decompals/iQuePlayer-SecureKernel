## skLaunchSetup
## skRecryptBegin
## skRecryptData
## func_9FC020C4
/* 0037FC 9FC037FC 27BDFF38 */  addiu       $sp, $sp, -0xc8
/* 003800 9FC03800 AFB000C0 */  sw          $s0, 0xc0($sp)
/* 003804 9FC03804 00A08021 */  addu        $s0, $a1, $zero
/* 003808 9FC03808 AFBF00C4 */  sw          $ra, 0xc4($sp)
/* 00380C 9FC0380C 0FF01294 */  jal         aes_HwKeyExpand
/* 003810 9FC03810 27A50010 */   addiu      $a1, $sp, 0x10
/* 003814 9FC03814 3C04A461 */  lui         $a0, (0xA4610420 >> 16)
/* 003818 9FC03818 34840420 */  ori         $a0, $a0, (0xA4610420 & 0xFFFF)
/* 00381C 9FC0381C 27A50010 */  addiu       $a1, $sp, 0x10
/* 003820 9FC03820 0FF00EAB */  jal         wordcopy
/* 003824 9FC03824 2406002C */   addiu      $a2, $zero, 0x2c
/* 003828 9FC03828 3C04A461 */  lui         $a0, (0xA46104D0 >> 16)
/* 00382C 9FC0382C 348404D0 */  ori         $a0, $a0, (0xA46104D0 & 0xFFFF)
/* 003830 9FC03830 02002821 */  addu        $a1, $s0, $zero
/* 003834 9FC03834 0FF00EAB */  jal         wordcopy
/* 003838 9FC03838 24060004 */   addiu      $a2, $zero, 4
/* 00383C 9FC0383C 8FBF00C4 */  lw          $ra, 0xc4($sp)
/* 003840 9FC03840 8FB000C0 */  lw          $s0, 0xc0($sp)
/* 003844 9FC03844 03E00008 */  jr          $ra
/* 003848 9FC03848 27BD00C8 */   addiu      $sp, $sp, 0xc8
