#include "asm.h"
#include "regdef.h"
#include "bcp.h"

.set mips3

LEAF(osInvalDCache)
    blez    a1, 3f
    li      t3, DCACHE_SIZE
    bgeu    a1, t3, 4f

    move    t0, a0
    addu    t1, a0, a1
    bgeu    t0, t1, 3f

    addiu   t1, t1, -DCACHE_LINESIZE
    andi    t2, t0, DCACHE_LINEMASK
    beqz    t2, 1f

    subu    t0, t0, t2
    cache   (CACH_PD | C_HWBINV), (t0)
    bgeu    t0, t1, 3f

    addiu   t0, t0, DCACHE_LINESIZE
1:
    andi    t2, t1, DCACHE_LINEMASK
    beqz    t2, 2f

    subu    t1, t1, t2
    cache   (CACH_PD | C_HWBINV), DCACHE_LINESIZE(t1)
    bltu    t1, t0, 3f

2:
    cache   (CACH_PD | C_HINV), (t0)
.set noreorder
    bltu    t0, t1, 2b
     addiu  t0, t0, DCACHE_LINESIZE
.set reorder
3:
    jr ra

4:
    li      t0, K0BASE
    addu    t1, t0, t3
    addiu   t1, t1, -DCACHE_LINESIZE
5:
    cache   (CACH_PD | C_IINV), (t0)
.set noreorder
    bltu    t0, t1, 5b
     addiu  t0, t0, DCACHE_LINESIZE
.set reorder

    jr ra
END(osInvalDCache)
