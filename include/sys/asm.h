#ifndef __ASM_H__
#define __ASM_H__

#ifdef __cplusplus
extern "C" {
#endif

#define _MIPS_ISA_MIPS1 1   /* R2/3K */
#define _MIPS_ISA_MIPS2 2   /* R4K/6K */
#define _MIPS_ISA_MIPS3 3   /* R4K */
#define _MIPS_ISA_MIPS4 4   /* TFP */

#define _MIPS_SIM_ABI32     1   /* MIPS MSIG calling convention */
#define _MIPS_SIM_NABI32    2   /* MIPS new 32-bit abi */
        /* NABI32 is 64bit calling convention but 32bit type sizes) */
#define _MIPS_SIM_ABI64     3   /* MIPS 64 calling convention */

#define LEAF(x)     \
    .globl  x;      \
    .ent    x,0;    \
x:;                 \
    .frame  sp,0,ra

#define XLEAF(x)    \
    .global x;

#define END(proc)   \
    .end    proc

#define ABS(x, y)   \
    .globl  x;      \
    x   =   y

#define EXPORT(x)   \
    .globl  x;      \
x:

#ifdef BBPLAYER
#define WEAK(x, y) \
    .weak x; \
    .equ x, y;
#else
#define WEAK(x, y)
#endif

#define STAY1(stmnt) .set noreorder; stmnt; .set reorder;
#define STAY2(stmnt, arg1) .set noreorder; stmnt, arg1; .set reorder;
#define STAY3(stmnt, arg1, arg2) .set noreorder; stmnt, arg1, arg2; .set reorder;
#define NOP .set noreorder; nop; .set reorder;
#define CACHE(op, reg) .set noreorder; cache op, reg; .set reorder;

/**
 *  Stack Alignment
 */
#if   (_MIPS_SIM == _MIPS_SIM_ABI32)
#define SZREG 4
#define NARGSAVE 4      // space for 4 args must be allocated
#define ALSZ    (8-1)
#define ALMASK ~(8-1)
#elif (_MIPS_SIM == _MIPS_SIM_NABI32 || _MIPS_SIM == _MIPS_SIM_ABI64)
#define SZREG 8
#define NARGSAVE 0      // no caller responsibilities
#define ALSZ    (16-1)
#define ALMASK ~(16-1)
#endif

#define FRAMESZ(size) (((size) + ALSZ) & ALMASK)

#ifdef __cplusplus
}
#endif

#endif /* !__ASM_H__ */
