## check_ticket_bundle_ranges
## skGetId
## func_9FC00DCC
## skLaunch
## skRecryptListValid
## skRecryptData
## skRecryptComputeState
## skRecryptEnd
## skSignHash
## skVerifyHash
## skGetConsumption
## func_9FC01FBC
## check_crlbundle_ranges
## check_cert_ranges
/* 003D94 9FC03D94 3C078000 */  lui         $a3, 0x8000
/* 003D98 9FC03D98 00871021 */  addu        $v0, $a0, $a3
/* 003D9C 9FC03D9C 3C030080 */  lui         $v1, 0x80
/* 003DA0 9FC03DA0 0062102B */  sltu        $v0, $v1, $v0
/* 003DA4 9FC03DA4 38420001 */  xori        $v0, $v0, 1
/* 003DA8 9FC03DA8 00852821 */  addu        $a1, $a0, $a1
/* 003DAC 9FC03DAC 00A72821 */  addu        $a1, $a1, $a3
/* 003DB0 9FC03DB0 0065182B */  sltu        $v1, $v1, $a1
/* 003DB4 9FC03DB4 38630001 */  xori        $v1, $v1, 1
/* 003DB8 9FC03DB8 00431024 */  and         $v0, $v0, $v1
/* 003DBC 9FC03DBC 24C6FFFF */  addiu       $a2, $a2, -1
/* 003DC0 9FC03DC0 00862024 */  and         $a0, $a0, $a2
/* 003DC4 9FC03DC4 2C840001 */  sltiu       $a0, $a0, 1
/* 003DC8 9FC03DC8 03E00008 */  jr          $ra
/* 003DCC 9FC03DCC 00441024 */   and        $v0, $v0, $a0
