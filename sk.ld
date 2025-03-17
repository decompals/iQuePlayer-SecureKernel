OUTPUT_ARCH(mips)
ENTRY(entrypoint)

SECTIONS {

    .text 0x9FC00000 : AT(0)
    {
        PROVIDE(entrypoint = .);

        KEEP(build/src/entry.o(.text*));
        build/src/cache.o(.text*)
        build/src/invaldcache.o(.text*)
        build/src/9FC00B40.o(.text*)
        build/src/9FC01B60.o(.text*)
        build/src/9FC02700.o(.text*)
        build/src/9FC02980.o(.text*)
        build/src/9FC031D0.o(.text*)
        build/src/9FC03ED0.o(.text*)
        build/src/9FC03F10.o(.text*)
        build/src/9FC043B0.o(.text*)
        build/src/9FC04780.o(.text*)
        build/src/root_pubkey.o(.text*)
        build/src/libcrypto/aes.o(.text*)
        build/src/libcrypto/aes_api.o(.text*)
        build/src/libcrypto/aes_imp.o(.text*)
        build/src/libcrypto/sha1.o(.text*)
        build/src/libcrypto/bb_nn.o(.text*)
        build/src/libcrypto/poly_math.o(.text*)
        build/src/libcrypto/algorithms.o(.text*)
        build/src/libcrypto/elliptic_math.o(.text*)
    }

    .rodata :
    {
        build/src/entry.o(.rodata*)
        build/src/cache.o(.rodata*)
        build/src/invaldcache.o(.rodata*)
        build/src/9FC00B40.o(.rodata*)
        build/src/9FC01B60.o(.rodata*)
        build/src/9FC02700.o(.rodata*)
        build/src/9FC02980.o(.rodata*)
        build/src/9FC031D0.o(.rodata*)
        build/src/9FC03ED0.o(.rodata*)
        build/src/9FC03F10.o(.rodata*)
        build/src/9FC043B0.o(.rodata*)
        build/src/9FC04780.o(.rodata*)
        build/src/root_pubkey.o(.rodata*)
        build/src/libcrypto/aes.o(.rodata*)
        build/src/libcrypto/aes_api.o(.rodata*)
        build/src/libcrypto/aes_imp.o(.rodata*)
        build/src/libcrypto/sha1.o(.rodata*)
        build/src/libcrypto/bb_nn.o(.rodata*)
        build/src/libcrypto/poly_math.o(.rodata*)
        build/src/libcrypto/algorithms.o(.rodata*)
        build/src/libcrypto/elliptic_math.o(.rodata*)

    }

    .data :
    {
        build/src/entry.o(.data*)
        build/src/cache.o(.data*)
        build/src/invaldcache.o(.data*)
        build/src/9FC00B40.o(.data*)
        build/src/9FC01B60.o(.data*)
        build/src/9FC02700.o(.data*)
        build/src/9FC02980.o(.data*)
        build/src/9FC031D0.o(.data*)
        build/src/9FC03ED0.o(.data*)
        build/src/9FC03F10.o(.data*)
        build/src/9FC043B0.o(.data*)
        build/src/9FC04780.o(.data*)
        build/src/root_pubkey.o(.data*)
        build/src/libcrypto/aes.o(.data*)
        build/src/libcrypto/aes_api.o(.data*)
        build/src/libcrypto/aes_imp.o(.data*)
        build/src/libcrypto/sha1.o(.data*)
        build/src/libcrypto/bb_nn.o(.data*)
        build/src/libcrypto/poly_math.o(.data*)
        build/src/libcrypto/algorithms.o(.data*)
        build/src/libcrypto/elliptic_math.o(.data*)
    }

    .bss :
    {
        __bss_start = .;
#ifndef NON_MATCHING
        /* force a matching bss order for COMMON symbols */
        *build/__bss.o(.bss*)
#endif
        build/src/entry.o(.bss*)
        build/src/cache.o(.bss*)
        build/src/invaldcache.o(.bss*)
        build/src/9FC00B40.o(.bss*)
        build/src/9FC01B60.o(.bss*)
        build/src/9FC02700.o(.bss*)
        build/src/9FC02980.o(.bss*)
        build/src/9FC031D0.o(.bss*)
        build/src/9FC03ED0.o(.bss*)
        build/src/9FC03F10.o(.bss*)
        build/src/9FC043B0.o(.bss*)
        build/src/9FC04780.o(.bss*)
        build/src/root_pubkey.o(.bss*)
        build/src/libcrypto/aes.o(.bss*)
        build/src/libcrypto/aes_api.o(.bss*)
        build/src/libcrypto/aes_imp.o(.bss*)
        build/src/libcrypto/sha1.o(.bss*)
        build/src/libcrypto/bb_nn.o(.bss*)
        build/src/libcrypto/poly_math.o(.bss*)
        build/src/libcrypto/algorithms.o(.bss*)
        build/src/libcrypto/elliptic_math.o(.bss*)
        __bss_end = .;
    }

    _gp = __bss_start + 0x8000 - 0x10;

    .note                 : { *(*.note*) }
    .comment              : { *(*.comment*) }

    /* mdebug sections */
    .pdr                  : { *(.pdr) }
    .mdebug               : { *(.mdebug) }
    .mdebug.abi32         : { *(.mdebug.abi32) }
    /* DWARF debug sections */
    /* Symbols in the DWARF debugging sections are relative to the beginning of the section so we begin them at 0. */
    /* DWARF 1 */
    .debug              0 : { *(.debug) }
    .line               0 : { *(.line) }
    /* GNU DWARF 1 extensions */
    .debug_srcinfo      0 : { *(.debug_srcinfo) }
    .debug_sfnames      0 : { *(.debug_sfnames) }
    /* DWARF 1.1 and DWARF 2 */
    .debug_aranges      0 : { *(.debug_aranges) }
    .debug_pubnames     0 : { *(.debug_pubnames) }
    /* DWARF 2 */
    .debug_info         0 : { *(.debug_info .gnu.linkonce.wi.*) }
    .debug_abbrev       0 : { *(.debug_abbrev) }
    .debug_line         0 : { *(.debug_line .debug_line.* .debug_line_end ) }
    .debug_frame        0 : { *(.debug_frame) }
    .debug_str          0 : { *(.debug_str) }
    .debug_loc          0 : { *(.debug_loc) }
    .debug_macinfo      0 : { *(.debug_macinfo) }
    /* SGI/MIPS DWARF 2 extensions */
    .debug_weaknames    0 : { *(.debug_weaknames) }
    .debug_funcnames    0 : { *(.debug_funcnames) }
    .debug_typenames    0 : { *(.debug_typenames) }
    .debug_varnames     0 : { *(.debug_varnames) }
    /* DWARF 3 */
    .debug_pubtypes     0 : { *(.debug_pubtypes) }
    .debug_ranges       0 : { *(.debug_ranges) }
    /* DWARF 5 */
    .debug_addr         0 : { *(.debug_addr) }
    .debug_line_str     0 : { *(.debug_line_str) }
    .debug_loclists     0 : { *(.debug_loclists) }
    .debug_macro        0 : { *(.debug_macro) }
    .debug_names        0 : { *(.debug_names) }
    .debug_rnglists     0 : { *(.debug_rnglists) }
    .debug_str_offsets  0 : { *(.debug_str_offsets) }
    .debug_sup          0 : { *(.debug_sup) }
    /* gnu attributes */
    .gnu.attributes     0 : { KEEP (*(.gnu.attributes)) }

    /DISCARD/ :
    {
        *(*);
    }
}
