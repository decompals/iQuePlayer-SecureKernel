#ifndef INCLUDE_ASM_H
#define INCLUDE_ASM_H

#if !defined(SPLAT) && !defined(M2CTX) && !defined(PERMUTER)

# ifndef INCLUDE_ASM
# define INCLUDE_ASM(FOLDER, NAME)                  \
    __asm__(                                        \
       ".section .text"                         "\n"\
       "  .set noat"                            "\n"\
       "  .set noreorder"                       "\n"\
       "  .align 2"                             "\n"\
       "  .globl " #NAME                        "\n"\
       "  .type " #NAME ", @function"           "\n"\
       #NAME ":"                                "\n"\
       "  .ent " #NAME                          "\n"\
       "    .include \"" FOLDER "/" #NAME ".s\"  \n"\
       "  .end " #NAME                          "\n"\
       "  .size " #NAME ", . - " #NAME          "\n"\
       "  .globl " #NAME ".NON_MATCHING"        "\n"\
       "  " #NAME ".NON_MATCHING" " = " #NAME   "\n"\
       "  .set reorder"                         "\n"\
       "  .set at"                              "\n"\
    )
# endif

# ifndef INCLUDE_RODATA
# define INCLUDE_RODATA(FOLDER, NAME)               \
    __asm__(                                        \
       ".section .rodata"                       "\n"\
       "    .include \"" FOLDER "/" #NAME ".s\"  \n"\
       ".section .text"                         "\n"\
    )
# endif

__asm__(".include \"include/macro.inc\""        "\n");

#else

# ifndef INCLUDE_ASM
#  define INCLUDE_ASM(FOLDER, NAME)
# endif

# ifndef INCLUDE_RODATA
#  define INCLUDE_RODATA(FOLDER, NAME)
# endif

#endif

#endif
