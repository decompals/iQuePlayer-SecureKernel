# COMMON symbol ordering linker plugin

This repository contains a plugin for linkers that support the External Linker Plugin API that allows providing a manual specification for COMMON symbol ordering, intended to support matching decompilations that must reproduce an order for COMMON symbols whose names are unknown. Currently only 32-bit Big-Endian MIPS ELF object files are supported.

## How it works

The plugin expects a symbol order txt file listing the COMMON symbols in order on each line. The plugin searches each input file for the symbol definitions for these and emits a new ELF file containing BSS definitions for each COMMON symbol found with the appropriate size and alignment. This ELF file is then added as an extra input file to the linker, overriding the COMMON definitions in the other input files.

## Usage

Add `-plugin common-plugin.so -plugin-opt order=bss_order.txt -plugin-opt file=bss.o` to the linker invocation, replacing `bss_order.txt` and `bss.o` with alternative paths if desired.

Also add `*bss.o(.bss*)` to the linker script so that the additional input file is not discarded, if required.

### **Options details**
- **order**: Path to the symbol order file.
- **file**: Path to the bss ELF file that will be written by the plugin and read back by the linker.

## Building

Run `make` to build `common-plugin.so`.
