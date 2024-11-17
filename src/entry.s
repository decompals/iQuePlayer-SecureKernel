#include "asm.h"
#include "regdef.h"
#include "bcp.h"

.rdata

DATA(skc_table)
    .word skGetId
    .word skLaunchSetup
    .word skLaunch
    .word skRecryptListValid
    .word skRecryptBegin
    .word skRecryptData
    .word skRecryptComputeState
    .word skRecryptEnd
    .word skSignHash
    .word skVerifyHash
    .word skGetConsumption
    .word skAdvanceTicketWindow
    .word skSetLimit
    .word skExit
    .word skKeepAlive
skc_table_end:
ENDDATA(skc_table)

DATA(skc_table_size)
    .word (skc_table_end - skc_table) / 4
ENDDATA(skc_table_size)

.text

.set mips3

LEAF(entrypoint)
    // either coming from the bootrom, soft reset, or various interrupt causes, this can be entered either
    // in the cached or uncached address space
.set noreorder
.set noat
    // since execution could've come here from a timer interrupt firing halfway through interrupt handling,
    // take care to save the (lower 32 bits of the) userspace kernel registers until the check for timer
    // interrupt completes

    // [0xXXXXXXXX,         k0]    [0xXXXXXXXX,         k1]
    dsll32  k0, k0, 0
    // [        k0, 0x00000000]    [0xXXXXXXXX,         k1]
    dsrl32  k0, k0, 0
    // [0x00000000,         k0]    [0xXXXXXXXX,         k1]
    dsll32  k1, k1, 0
    // [0x00000000,         k0]    [        k1, 0x00000000]
    daddu   k1, k1, k0
    // [0x00000000,         k0]    [        k1,         k0]

    // check for timer expiry
    lw      k0, PHYS_TO_K1(MI_SK_EXCEPTION_REG)
    and     k0, 8
    bgtz    k0, __handle_timer_expiry
     nop

    // check for SKC
    lw      k0, PHYS_TO_K1(MI_SK_EXCEPTION_REG)
    move    k1, k0
    and     k0, 4
    bgtz    k0, __handle_skc
     nop

    // check for other causes except reset
    move    k0, k1
    and     k0, 0xF0
    bgtz    k0, __handle_other
     nop

    // Fallthrough into startup for resets/bootup
.set at
.set reorder
END(entrypoint)

LEAF(startup)
    // clear bss via uncached memory
    la      t0, __bss_start
    la      t1, __bss_end - 4
    or      t0, K1BASE
    or      t1, K1BASE
1:
    sw      zero, (t0)
.set noreorder
    bge     t1, t0, 1b
     add    t0, 4
.set reorder
    // set up stack with a cached pointer
    la      sp, PHYS_TO_K0(0x1FC48000)
    addu    sp, -0x138

    // hardware init and load system app, runs cached
    // returns the entrypoint function pointer
    la      t0, setup_system
    jalr    t0

    // launch system app
    j       launch_app_trampoline
END(startup)

.fill 0x380 - (. - entrypoint)  /* General Exception Vector (BEV=1) */
LEAF(__skException)
    // Secure mode faults end up here. Load the fault handler and jump to it
    // in uncached memory.
    la      k0, func_9FC03ED0
    la      a0, func_9FC00A7C

    or      k0, K1BASE
    or      a0, K1BASE

    la      sp, PHYS_TO_K0(0x1FC48000)
    addu    sp, -0x138
    or      sp, K1BASE

    nop
    jr      k0
    nop
END(__skException)

LEAF(launch_app_trampoline)
    // enters launch_app in cached address space regardless of how SK was entered
    la      t0, launch_app
    and     t0, t0, ~K1BASE
    or      t0, t0, K0BASE
    jr      t0
END(launch_app_trampoline)

LEAF(launch_app)
    // read and clear flags to pass to app
    lw      t3, D_9FC0EBB8
    sw      zero, D_9FC0EBB8
    // clear the SK stack memory
    la      t0, wipe_sk_stack
    jalr    t0

    // Unset SR, BEV and disable interrupts
    mfc0    t4, C0_SR
    and     t4, ~SR_SR
    and     t4, ~SR_BEV
    and     t4, ~(SR_ERL | SR_EXL | SR_IE)
    mtc0    t4, C0_SR

    // add the contents of MI_SK_EXCEPTION_REG to the flags to pass to the app
    la      t1, PHYS_TO_K1(MI_SK_EXCEPTION_REG)
    lw      t0, (t1)
    move    a0, t0
    or      a0, a0, t3

    // unset the lower 8 bits of MI_SK_EXCEPTION_REG except bit 1
    and     t0, t0, ~0xFD
.set noreorder
.balign 32
exit1:
    // Exit secure mode. Exiting secure mode means this memory is no longer readable so the jump
    // must be within the same cache line as the store that exits secure mode.
    sw      t0, (t1)
    lw      t1, -4(t1)
    jr      v0
     nop
.if . - exit1 > ICACHE_LINESIZE
  .error "Exit code too large"
.endif
.set reorder
END(launch_app)

LEAF(__handle_skc)
.set noat
    // set up stack in uncached address space
    move    k0, sp
    la      sp, PHYS_TO_K0(0x1FC48000)
    addiu   sp, -0x138
    la      k1, K1BASE
    or      sp, k1

    // Save registers according to the O32 ABI. Since SKCs are assumed to come from a
    // function call this only saves the callee-saved registers rather than the full set.
    sd      AT, 0x18(sp)
.set at
    sd      s0, 0x90(sp)
    sd      s1, 0x98(sp)
    sd      s2, 0xa0(sp)
    sd      s3, 0xa8(sp)
    sd      s4, 0xb0(sp)
    sd      s5, 0xb8(sp)
    sd      s6, 0xc0(sp)
    sd      s7, 0xc8(sp)
    sd      fp, 0x100(sp)
    sd      gp, 0xf0(sp)
    sw      k0, 0xf8(sp)
    sd      ra, 0x108(sp)

    mfc0    t0, C0_TAGLO
    sd      t0, 0x110(sp)
    mfc0    t0, C0_TAGHI
    sd      t0, 0x118(sp)
    mflo    t0
    sd      t0, 0x128(sp)
    mfhi    t0
    sd      t0, 0x130(sp)

    la      gp, _gp

    // Security feature: execution is coming from untrusted user code, so before executing any
    // cached code the instruction cache must be re-initialized. This is to avoid malicious user
    // code reprogramming cache tags which would enable secure mode code execution.
    // Here the instruction cache init function is manually loaded into cache and ran to clear
    // the rest of the icache.
    la      t2, icache_reset
    cache   (CACH_PI | C_FILL), (t2)
    addiu   t2, t2, ICACHE_LINESIZE
    cache   (CACH_PI | C_FILL), (t2)
    addi    t2, t2, -ICACHE_LINESIZE
    jalr    t2

    // Enter the skc handler in cached address space
    la      t0, skc_handler
    and     t0, t0, ~K1BASE
    or      t0, t0, K0BASE
    jr      t0
END(__handle_skc)

LEAF(skc_handler)
    la      t0, dcache_reset
    jalr    t0

    and     sp, ~K1BASE
    or      sp, K0BASE

    // load the number of valid SKCs
    la      t2, skc_table_size
    lw      t3, (t2)

    //! @bug eSKape, this should have been an unsigned comparison e.g. bgeu
    //! Negative SKCs load a function pointer from out-of-bounds of the table, potentially in user-controlled space.
    bge     v0, t3, .bad_skc_num

    // check if this SKC is allowed to be called by the current process
    la      t2, cur_proc_allowed_skc_bitmask
    lw      t3, (t2)
    addiu   t2, zero, 1
    sllv    t2, t2, v0
    and     t3, t3, t2
    bgtz    t3, .call_skc
.bad_skc_num:
    addiu   v0, zero, -11
    nop
    j           1f
.call_skc:
    // load the function pointer and call it
    sll     t0, v0, 2
    la      t1, skc_table
    addu    t1, t1, t0
    lw      t0, (t1)
    jalr    t0
1:
    // clear the SK stack
    la      t0, wipe_sk_stack
    jalr    t0

    or      sp, K1BASE

    la      t1, PHYS_TO_K1(MI_SK_EXCEPTION_REG)
    lw      t0, (t1)
    // deassert SKC bit and ?
    and     t0, t0, ~((1 << 6) | (1 << 2))
    // prepare secure mode exit but don't store yet
    and     t0, t0, ~(1 << 0)

    // reload registers
    mfc0    t4, C0_SR
    and     t4, t4, ~SR_SR
    and     t4, t4, ~SR_BEV
    mtc0    t4, C0_SR

    ld      t5, 0x110(sp)
    mtc0    t5, C0_TAGLO
    ld      t5, 0x118(sp)
    mtc0    t5, C0_TAGHI
    ld      t5, 0x128(sp)
    mtlo    t5
    ld      t5, 0x130(sp)
    mthi    t5
.set noat
    ld      AT, 0x18(sp)
    ld      s0, 0x90(sp)
    ld      s1, 0x98(sp)
    ld      s2, 0xa0(sp)
    ld      s3, 0xa8(sp)
    ld      s4, 0xb0(sp)
    ld      s5, 0xb8(sp)
    ld      s6, 0xc0(sp)
    ld      s7, 0xc8(sp)
    ld      fp, 0x100(sp)
    ld      gp, 0xf0(sp)
    ld      ra, 0x108(sp)
    lw      sp, 0xf8(sp)

    // exit secure mode, eret must be within the same cache line
.set noreorder
.balign 32
exit2:
    sw      t0, (t1)
    lw      t1, -4(t1)
    eret
.if . - exit2 > ICACHE_LINESIZE
  .error "Exit code too large"
.endif
.set reorder
.set at
END(skc_handler)

LEAF(__handle_timer_expiry)
.set noat
    // set up stack
    move    k0, sp
    la      sp, PHYS_TO_K1(0x1FC48000)
    addu    sp, -0x138

    // save registers, unlike the SKC handler this saves a full set as the
    // timer interrupt could occur at any time
    sw      k1, 0xe0(sp)
    dsrl32  k1, k1, 0
    sw      k1, 0xe8(sp)
    mfc0    k1, C0_TAGLO
    sd      k1, 0x110(sp)
    mfc0    k1, C0_TAGHI
    sd      k1, 0x118(sp)
    mflo    k1
    sd      k1, 0x128(sp)
    mfhi    k1
    sd      k1, 0x130(sp)
    mfc0    k1, C0_COUNT
    sd      k1, 0x120(sp)
    sd      AT, 0x18(sp)
.set at
    sd      s0, 0x90(sp)
    sd      s1, 0x98(sp)
    sd      s2, 0xa0(sp)
    sd      s3, 0xa8(sp)
    sd      s4, 0xb0(sp)
    sd      s5, 0xb8(sp)
    sd      s6, 0xc0(sp)
    sd      s7, 0xc8(sp)
    sd      fp, 0x100(sp)
    sd      gp, 0xf0(sp)
    sw      k0, 0xf8(sp)
    sd      ra, 0x108(sp)
    sd      t0, 0x50(sp)
    sd      t1, 0x58(sp)
    sd      t2, 0x60(sp)
    sd      t3, 0x68(sp)
    sd      t4, 0x70(sp)
    sd      t5, 0x78(sp)
    sd      t6, 0x80(sp)
    sd      t7, 0x88(sp)
    sd      t8, 0xd0(sp)
    sd      t9, 0xd8(sp)
    sd      v0, 0x20(sp)
    sd      v1, 0x28(sp)
    sd      a0, 0x30(sp)
    sd      a1, 0x38(sp)
    sd      a2, 0x40(sp)
    sd      a3, 0x48(sp)

    la      gp, _gp

    // reset the icache, see SKC handler for explanation
    la      t2, icache_reset
    cache   (CACH_PI | C_FILL), (t2)
    addiu   t2, t2, ICACHE_LINESIZE
    cache   (CACH_PI | C_FILL), (t2)
    addi    t2, t2, -ICACHE_LINESIZE
    jalr    t2

    // jump to cached code
    la      t0, __handle_timer_expiry_2
    and     t0, ~K1BASE
    or      t0, K0BASE
    jr      t0
END(__handle_timer_expiry)

LEAF(__handle_timer_expiry_2)
    la      t0, dcache_reset
    jalr    t0

    and     sp, ~K1BASE
    or      sp, K0BASE

    // check trial timer, if the timer has run out this function does not
    // return here and instead reboots SK to reload the system app
    la      t0, check_trial_timer
    jalr    t0

    // wipe SK stack
    la      t0, wipe_sk_stack
    jalr    t0

    la      k1, PHYS_TO_K1(MI_SK_EXCEPTION_REG)
    lw      k0, (k1)
    and     k0, k0, ~(1 << 3) // clear timer expiry?
    and     k0, k0, ~(1 << 0) // exit secure mode

    // unset SR, BEV
    mfc0    t4, C0_SR
    and     t4, ~(SR_SR | SR_BEV)
    mtc0    t4, C0_SR

    // restore registers
    lw      t4, 0xe0(sp)
    lw      t4, 0xe8(sp)
    lw      t4, 0xf8(sp)
    ld      t0, 0x50(sp)
    ld      t1, 0x58(sp)
    ld      t2, 0x60(sp)
    ld      t3, 0x68(sp)
    ld      t4, 0x70(sp)
    ld      t5, 0x78(sp)
    ld      t6, 0x80(sp)
    ld      t7, 0x88(sp)
    ld      t8, 0xd0(sp)
    ld      t9, 0xd8(sp)
    ld      a0, 0x30(sp)
    ld      a1, 0x38(sp)
    ld      a2, 0x40(sp)
    ld      a3, 0x48(sp)
    ld      v0, 0x20(sp)
.set noat
    ld      AT, 0x18(sp)
    ld      s0, 0x90(sp)
    ld      s1, 0x98(sp)
    ld      s2, 0xa0(sp)
    ld      s3, 0xa8(sp)
    ld      s4, 0xb0(sp)
    ld      s5, 0xb8(sp)
    ld      s6, 0xc0(sp)
    ld      s7, 0xc8(sp)
    ld      fp, 0x100(sp)
    ld      gp, 0xf0(sp)
    ld      ra, 0x108(sp)
    ld      v1, 0x110(sp)
    mtc0    v1, C0_TAGLO
    ld      v1, 0x118(sp)
    mtc0    v1, C0_TAGHI
    ld      v1, 0x128(sp)
    mtlo    v1
    ld      v1, 0x130(sp)
    mthi    v1
    ld      v1, 0x120(sp)
    mtc0    v1, C0_COUNT
    ld      v1, 0x28(sp)

    // exit secure mode, eret must be in the same cache line
.set noreorder
.balign 32
exit3:
    sw      k0, (k1)
    lw      k0, -4(k1)
    lw      k0, 0xe0(sp)
    lw      k1, 0xe8(sp)
    lw      sp, 0xf8(sp)
    eret
.if . - exit3 > ICACHE_LINESIZE
  .error "Exit code too large"
.endif
.set reorder
.set at
END(__handle_timer_expiry_2)

LEAF(__handle_other)
    # set up stack
    move    k0, sp
    la      sp, PHYS_TO_K0(0x1FC48000)
    addu    sp, -0x138
    la      k1, K1BASE
    or      sp, k1

    la      gp, _gp

    // reset the icache, see SKC handler for explanation
    la      t2, icache_reset
    cache   (CACH_PI | C_FILL), (t2)
    addiu   t2, t2, ICACHE_LINESIZE
    cache   (CACH_PI | C_FILL), (t2)
    addi    t2, t2, -ICACHE_LINESIZE
    jalr    t2

    // enter cached code
    la      t0, __handle_other_2
    and     t0, t0, ~K1BASE
    or      t0, t0, K0BASE
    jr      t0
END(__handle_other)

LEAF(__handle_other_2)
    la      t0, dcache_reset
    jalr    t0

    and     sp, ~K1BASE
    or      sp, K0BASE

    la      t2, PHYS_TO_K1(MI_18_REG)
    sw      zero, (t2)
    nop

    // reboot SK
    j       startup
END(__handle_other_2)
