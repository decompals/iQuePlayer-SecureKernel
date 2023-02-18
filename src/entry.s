#include "asm.h"
#include "regdef.h"
#include "bcp.h"

.set mips3

LEAF(entrypoint)
.set noreorder
.set noat
    dsll32  k0, k0, 0
    dsrl32  k0, k0, 0
    dsll32  k1, k1, 0
    daddu   k1, k1, k0
    
    lw      k0, PHYS_TO_K1(MI_14_REG)
    and     k0, 8
    bgtz    k0, func_9FC0068C
     nop

    lw      k0, PHYS_TO_K1(MI_14_REG)
    move    k1, k0
    and     k0, 4
    bgtz    k0, func_9FC00470
     nop

    move    k0, k1
    and     k0, 0xF0
    bgtz    k0, func_9FC008D8
     nop

.set at
.set reorder
    /* Fallthrough into startup */
END(entrypoint)

LEAF(startup)
    la      t0, __bss_start
    la      t1, __bss_end

    or      t0, K1BASE
    or      t1, K1BASE

1:
    sw      zero, (t0)
.set noreorder
    bge     t1, t0, 1b
     add    t0, 4
.set reorder

    li      sp, PHYS_TO_K0(0x1FC48000)
    addu    sp, -0x138

    la      t0, func_9FC022A8
    jalr    t0

    j       launch_app_trampoline

.fill 0x380 - (. - entrypoint)  /* General Exception Vector (BEV=1) */

    la      k0, func_9FC03ED0
    la      a0, func_9FC00A7C

    or      k0, K1BASE
    or      a0, K1BASE

    li      sp, PHYS_TO_K0(0x1FC48000)
    addu    sp, -0x138
    or      sp, K1BASE

    nop
    jr      k0
    nop
END(startup)

LEAF(launch_app_trampoline)
    la      t0, launch_app
    and     t0, t0, ~K1BASE
    or      t0, t0, K0BASE
    jr      t0
END(launch_app_trampoline)

LEAF(launch_app)
    lw      t3, D_9FC0EBB8
    sw      zero, D_9FC0EBB8
    la      t0, dcache_invalidate_all
    jalr    t0

    mfc0    t4, C0_SR
    and     t4, ~SR_SR
    and     t4, ~SR_BEV
    and     t4, ~(SR_ERL | SR_EXL | SR_IE)
    mtc0    t4, C0_SR

    la      t1, PHYS_TO_K1(MI_14_REG)
    lw      t0, (t1)

    move    a0, t0
    or      a0, a0, t3
    and     t0, t0, ~0xFD
.set noreorder
.balign 32
exit1:
    sw      t0, (t1)
    lw      t1, -4(t1)
    jr      v0
     nop
.if . - exit1 > ICACHE_LINESIZE
  .error "Exit code too large"
.endif
.set reorder
END(launch_app)

LEAF(func_9FC00470)
.set noat
    move    k0, sp
    la      sp, PHYS_TO_K0(0x1FC48000)
    addiu   sp, -0x138

    li      k1, K1BASE
    or      sp, k1

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

    la      gp, D_9FC16D20

    la      t2, icache_init
    cache   (CACH_PI | C_FILL), (t2)
    addiu   t2, t2, ICACHE_LINESIZE
    cache   (CACH_PI | C_FILL), (t2)
    addi    t2, t2, -ICACHE_LINESIZE
    jalr    t2

    la      t0, skc_handler
    and     t0, t0, ~K1BASE
    or      t0, t0, K0BASE
    jr      t0
END(func_9FC00470)

LEAF(skc_handler)
    la      t0, dcache_init
    jalr    t0

    and     sp, ~K1BASE
    or      sp, K0BASE

    la      t2, skc_table_size
    lw      t3, (t2)

    /* BUG: eSKape, this should have been an unsigned comparison e.g. bgeu */
    bge     v0, t3, .L9FC0059C

    la      t2, cur_proc_allowed_skc_bitmask
    lw      t3, (t2)
    addiu   t2, zero, 1
    sllv    t2, t2, v0
    and     t3, t3, t2
    bgtz    t3, .L9FC005A8
.L9FC0059C:
    addiu   v0, zero, -11
    nop
    j           .L9FC005C4
.L9FC005A8:
    sll     t0, v0, 2
    la      t1, skc_table
    addu    t1, t1, t0
    lw      t0, (t1)
    jalr    t0

.L9FC005C4:
    la      t0, dcache_invalidate_all
    jalr    t0

    or      sp, K1BASE

    la      t1, PHYS_TO_K1(MI_14_REG)
    lw      t0, (t1)
    and     t0, t0, ~0x44
    and     t0, t0, ~1

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

LEAF(func_9FC0068C)
.set noat
    move    k0, sp

    li      sp, PHYS_TO_K1(0x1FC48000)
    addu    sp, -0x138

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

    la      gp, D_9FC16D20

    la      t2, icache_init
    cache   (CACH_PI | C_FILL), (t2)
    addiu   t2, t2, ICACHE_LINESIZE
    cache   (CACH_PI | C_FILL), (t2)
    addi    t2, t2, -ICACHE_LINESIZE
    jalr    t2

    la      t0, func_9FC0079C
    and     t0, ~K1BASE
    or      t0, K0BASE
    jr      t0
END(func_9FC0068C)

LEAF(func_9FC0079C)
    la      t0, dcache_init
    jalr    t0

    and     sp, ~K1BASE
    or      sp, K0BASE
    
    la      t0, check_trial_timer
    jalr    t0

    la      t0, dcache_invalidate_all
    jalr    t0

    la      k1, PHYS_TO_K1(MI_14_REG)
    lw      k0, (k1)
    and     k0, k0, ~8
    and     k0, k0, ~1

    mfc0    t4, C0_SR
    and     t4, ~(SR_SR | SR_BEV)
    mtc0    t4, C0_SR

    lw          t4, 0xe0(sp)
    lw          t4, 0xe8(sp)
    lw          t4, 0xf8(sp)
    ld          t0, 0x50(sp)
    ld          t1, 0x58(sp)
    ld          t2, 0x60(sp)
    ld          t3, 0x68(sp)
    ld          t4, 0x70(sp)
    ld          t5, 0x78(sp)
    ld          t6, 0x80(sp)
    ld          t7, 0x88(sp)
    ld          t8, 0xd0(sp)
    ld          t9, 0xd8(sp)
    ld          a0, 0x30(sp)
    ld          a1, 0x38(sp)
    ld          a2, 0x40(sp)
    ld          a3, 0x48(sp)
    ld          v0, 0x20(sp)
.set noat
    ld          AT, 0x18(sp)
    ld          s0, 0x90(sp)
    ld          s1, 0x98(sp)
    ld          s2, 0xa0(sp)
    ld          s3, 0xa8(sp)
    ld          s4, 0xb0(sp)
    ld          s5, 0xb8(sp)
    ld          s6, 0xc0(sp)
    ld          s7, 0xc8(sp)
    ld          fp, 0x100(sp)
    ld          gp, 0xf0(sp)
    ld          ra, 0x108(sp)
    ld          v1, 0x110(sp)
    mtc0        v1, C0_TAGLO
    ld          v1, 0x118(sp)
    mtc0        v1, C0_TAGHI
    ld          v1, 0x128(sp)
    mtlo        v1
    ld          v1, 0x130(sp)
    mthi        v1
    ld          v1, 0x120(sp)
    mtc0        v1, C0_COUNT
    ld          v1, 0x28(sp)

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
END(func_9FC0079C)

LEAF(func_9FC008D8)
    move    k0, sp
    la      sp, PHYS_TO_K0(0x1FC48000)
    addu    sp, -0x138

    li      k1, K1BASE
    or      sp, k1

    la      gp, D_9FC16D20

    la      t2, icache_init
    cache   (CACH_PI | C_FILL), (t2)
    addiu   t2, t2, ICACHE_LINESIZE
    cache   (CACH_PI | C_FILL), (t2)
    addi    t2, t2, -ICACHE_LINESIZE
    jalr    t2

    la      t0, func_9FC00948
    and     t0, t0, ~K1BASE
    or      t0, t0, K0BASE
    jr      t0
END(func_9FC008D8)

LEAF(func_9FC00948)
    la      t0, dcache_init
    jalr    t0

    and     sp, ~K1BASE
    or      sp, K0BASE

    la      t2, PHYS_TO_K1(MI_18_REG)
    sw      zero, (t2)
    nop
    j       startup
END(func_9FC00948)
