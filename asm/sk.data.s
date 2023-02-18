.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .data

# FILE SPLIT

.balign 16

glabel D_9FC0EBB0
/* 9FC0EBB0 0000EBB0 000002 */
# [rw  ] halfword
## skLaunch
## func_9FC022A8
    .half 0xFFFF

glabel D_9FC0EBB2
/* 9FC0EBB2 0000EBB2 000002 */
# [rw  ] halfword
## skLaunch
## skKeepAlive
## func_9FC022A8
## check_trial_timer
    .half 0x0000

glabel g_cur_proc_trial_type
/* 9FC0EBB4 0000EBB4 000002 */
# [rw  ] halfword
## skLaunch
## skKeepAlive
## func_9FC022A8
## check_trial_timer
    .half 0xFFFF

glabel D_9FC0EBB8
/* 9FC0EBB8 0000EBB8 000004 */
# [rw  ] word
## launch_app
## skKeepAlive
    .word 0x00000000

# FILE SPLIT

.balign 16

glabel virage2_offset
/* 9FC0EBC0 0000EBC0 000004 */
# [r   ] word
## func_9FC00BAC
## skGetId
## skSignHash
## func_9FC01D54
## write_virage2
## virage2_gen_public_key
## func_9FC03410
## recrypt_list_sign
## recrypt_list_decrypt_entry
## recrypt_list_add_entry
    .word 0xBFCA0000

glabel D_9FC0EBC4
/* 9FC0EBC4 0000EBC4 000001 */
# [rw  ] byte
## write_virage01_data
## set_virage01_selector
    .byte 0xFF

# FILE SPLIT

.balign 16

glabel aEntering_excep
/* 9FC0EBD0 0000EBD0 000020 */
# [  i ] string("ENTERING_EXCEPTION HANDLER!!!\n", len=0x20)
## func_9FC03ED0
    .asciz "ENTERING_EXCEPTION HANDLER!!!\n"
    .balign 4

# FILE SPLIT (elliptic_math.c)

.balign 16

glabel precomputed_signer
/* 9FC0EBF0 0000EBF0 000040 */
# [r i ] word array?
## poly_elliptic_mul
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF

glabel precomputed_pk
/* 9FC0EC30 0000EC30 000100 */
# [  i ] word array?
## poly_elliptic_mul
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
