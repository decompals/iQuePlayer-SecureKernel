.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .bss

.balign 16

glabel D_9FC0ED30
/* 9FC0ED30 0000ED30 000004 */
# [rwi ] word
## startup
## skKeepAlive
    .skip 4

glabel contentMetaDataHead
/* 9FC0ED34 0000ED34 00000C */
# [  i ] word array?
## func_9FC00BAC
## skLaunch
    .skip 0xC

glabel D_9FC0ED40
/* 9FC0ED40 0000ED40 000018 */
# [  i ] word array?
## func_9FC0134C
    .skip 0x18

glabel D_9FC0ED58
/* 9FC0ED58 0000ED58 000014 */
# [  i ] word array?
## skRecryptEnd
    .skip 0x14

glabel D_9FC0ED6C
/* 9FC0ED6C 0000ED6C 000010 */
# [  i ] word array?
## skRecryptData
    .skip 0x10

glabel D_9FC0ED7C
/* 9FC0ED7C 0000ED7C 000050 */
# [  i ] word array?
## skLaunchSetup
## skLaunch
    .skip 0x50

glabel D_9FC0EDCC
/* 9FC0EDCC 0000EDCC 000004 */
# [  i ] word
## skRecryptBegin
    .skip 4

glabel D_9FC0EDD0
/* 9FC0EDD0 0000EDD0 000110 */
# [  i ] word array?
## skRecryptData
    .skip 0x110

glabel ticketHead
/* 9FC0EEE0 0000EEE0 000004 */
# [  i ] word
## skLaunchSetup
## skRecryptBegin
    .skip 4

glabel D_9FC0EEE4
/* 9FC0EEE4 0000EEE4 000002 */
# [r   ] halfword
## skLaunch
    .skip 2
    .balign 4

glabel D_9FC0EEE8
/* 9FC0EEE8 0000EEE8 000058 */
# [  i ] word array
## skLaunch
    .skip 0x58

glabel D_9FC0EF40
/* 9FC0EF40 0000EF40 000140 */
# [  i ] word array
## skSetLimit
    .skip 0x140

glabel sha1_ctx
/* 9FC0F080 0000F080 00005C */
# [  i ] word array
## skLaunch
## skRecryptBegin
## func_9FC0134C
## skRecryptEnd
    .skip 0x5C

glabel D_9FC0F0DC
/* 9FC0F0DC 0000F0DC 000004 */
# [rw  ] word
## skRecryptBegin
## func_9FC0134C
    .skip 4

glabel D_9FC0F0E0
/* 9FC0F0E0 0000F0E0 0001E8 */
# [  i ] word array
## skRecryptBegin
## func_9FC0134C
    .skip 0x1E8

glabel D_9FC0F2C8
/* 9FC0F2C8 0000F2C8 000014 */
# [  i ] word array
## skRecryptBegin
## func_9FC0134C
## skRecryptData
    .skip 0x14

glabel D_9FC0F2DC
/* 9FC0F2DC 0000F2DC 000004 */
# [rw  ] word
## skRecryptBegin
## skRecryptData
    .skip 4

glabel D_9FC0F2E0
/* 9FC0F2E0 0000F2E0 000004 */
# [rw  ] word
## skRecryptBegin
## func_9FC0134C
## skRecryptData
    .skip 4

glabel D_9FC0F2E4
/* 9FC0F2E4 0000F2E4 00001C */
# [  i ] word array
## skRecryptData
## skRecryptComputeState
    .skip 0x1C

glabel g_trial_time_elapsed
/* 9FC0F300 0000F300 000004 */
# [rw  ] word
## skLaunch
## skKeepAlive
## check_trial_timer
    .skip 4

glabel D_9FC0F304
/* 9FC0F304 0000F304 000002 */
# [rw  ] word
## skLaunch
## skKeepAlive
## check_trial_timer
    .skip 4

glabel D_9FC0F308
/* 9FC0F308 0000F308 000001 */
# [r i ] byte
## skLaunch
## func_9FC022A8
## get_expected_revocation_list_version
## check_crlbundle_version
    .skip 1

glabel D_9FC0F309
/* 9FC0F309 0000F309 000001 */
# [r i ] byte
## skVerifyHash
## get_expected_revocation_list_version
## check_crlbundle_version
    .skip 1

glabel D_9FC0F30A
/* 9FC0F30A 0000F30A 000001 */
# [r i ] byte
## get_expected_revocation_list_version
## check_crlbundle_version
    .skip 1

glabel D_9FC0F30B
/* 9FC0F30B 0000F30B 000003 */
# [    ] 
    .skip 3

glabel minimum_ticket_id
/* 9FC0F30E 0000F30E 000002 */
# [  i ]
## skGetConsumption
## getTrialConsumptionByCid
    .skip 2

glabel D_9FC0F310
/* 9FC0F310 0000F310 000038 */
# [  i ] word array
## skAdvanceTicketWindow
    .skip 0x38

glabel cur_proc_allowed_skc_bitmask
/* 9FC0F348 0000F348 000004 */
# [ wi ] word
## skc_handler
## set_proc_permissions
    .skip 4

# (elliptic_math.c)

glabel named_curve
/* 9FC0F34C 0000F34C 000044 */
# [  i ] word
## eccGenAesKey
## eccGenPublicKey
## Init_233_bit
## Init_233_bit_ECDSA
    .skip 0x44

glabel precomputed_bp
/* 9FC0F390 0000F390 000400 */
# [  i ] word array
## Init_233_bit
## poly_elliptic_mul_four
    .skip 0x400

glabel named_point
/* 9FC0F790 0000F790 00003C */
# [  i ] word array
## eccGenAesKey
## eccGenPublicKey
## Init_233_bit_ECDSA
## Init_233_bit
    .skip 0x3C
