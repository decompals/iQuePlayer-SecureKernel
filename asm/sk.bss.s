.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .bss

.balign 16

glabel D_9FC0ED30
/* 9FC0ED30 0000ED30 000004 */
# File: 9FC00B40.c
# [rwi ] word
## skKeepAlive
    .skip 4

glabel contentMetaDataHead
/* 9FC0ED34 0000ED34 0001AC */
# File: 9FC00B40.c
# [  i ] BbContentMetaDataHead
## func_9FC00BAC
## func_9FC0134C
## skLaunchSetup
## skLaunch
## skRecryptBegin
## skRecryptData
## skRecryptEnd
    .skip 0x1AC

glabel ticketHead
/* 9FC0EEE0 0000EEE0 0001A0 */
# File: 9FC00B40.c
# [  i ] BbTicketHead
## skLaunchSetup
## skRecryptBegin
## skLaunch
## skSetLimit
    .skip 0x1A0

glabel sha1_ctx
/* 9FC0F080 0000F080 00005C */
# File: 9FC00B40.c
# [  i ] SHA1Context
## skLaunch
## skRecryptBegin
## func_9FC0134C
## skRecryptEnd
    .skip 0x5C

glabel D_9FC0F0DC
/* 9FC0F0DC 0000F0DC 000004 */
# File: 9FC00B40.c
# [rw  ] word
## skRecryptBegin
## func_9FC0134C
    .skip 4

glabel D_9FC0F0E0
/* 9FC0F0E0 0000F0E0 0001E8 */
# File: 9FC00B40.c
# [  i ] AesKeyInstance
## skRecryptBegin
## func_9FC0134C
    .skip 0x1E8

glabel D_9FC0F2C8
/* 9FC0F2C8 0000F2C8 000014 */
# File: 9FC00B40.c
# [  i ] AesCipherInstance
## skRecryptBegin
## func_9FC0134C
## skRecryptData
    .skip 0x14

glabel D_9FC0F2DC
/* 9FC0F2DC 0000F2DC 000004 */
# File: 9FC00B40.c
# [rw  ] word
## skRecryptBegin
## skRecryptData
    .skip 4

glabel D_9FC0F2E0
/* 9FC0F2E0 0000F2E0 000004 */
# File: 9FC00B40.c
# [rw  ] word
## skRecryptBegin
## func_9FC0134C
## skRecryptData
    .skip 4

glabel D_9FC0F2E4
/* 9FC0F2E4 0000F2E4 00001C */
# File: 9FC00B40.c
# [  i ] word array
## skRecryptData
## skRecryptComputeState
    .skip 0x1C # aes key IV? should be 0x10 size?

glabel g_trial_time_elapsed
/* 9FC0F300 0000F300 000004 */
# File: One of [9FC00B40.c, 9FC01B60.c]
# [rw  ] word
## skLaunch
## skKeepAlive
## check_trial_timer
    .skip 4

glabel D_9FC0F304
/* 9FC0F304 0000F304 000004 */
# File: One of [9FC00B40.c, 9FC01B60.c]
# [rw  ] word
## skLaunch
## skKeepAlive
## check_trial_timer
    .skip 4

glabel D_9FC0F308
/* 9FC0F308 0000F308 000040 */
# File: One of [9FC00B40.c, 9FC01B60.c, 9FC02700.c, 9FC031D0.c]
# [r i ] BbVirage01
## skLaunch
## skGetConsumption
## func_9FC022A8
## get_expected_revocation_list_version
## check_crlbundle_version
## getTrialConsumptionByCid
    .skip 0x40

glabel cur_proc_allowed_skc_bitmask
/* 9FC0F348 0000F348 000004 */
# File: 9FC031D0.c
# [ wi ] word
## skc_handler
## set_proc_permissions
    .skip 4

glabel named_curve
/* 9FC0F34C 0000F34C 000044 */
# File: elliptic_math.c
# [  i ] curve
## eccGenAesKey
## eccGenPublicKey
## Init_233_bit
## Init_233_bit_ECDSA
    .skip 0x44

glabel precomputed_bp
/* 9FC0F390 0000F390 000400 */
# File: elliptic_math.c
# [  i ] point [16]
## Init_233_bit
## poly_elliptic_mul_four
    .skip 0x400

glabel named_point
/* 9FC0F790 0000F790 00003C */
# File: elliptic_math.c
# [  i ] point
## eccGenAesKey
## eccGenPublicKey
## Init_233_bit_ECDSA
## Init_233_bit
    .skip 0x40
