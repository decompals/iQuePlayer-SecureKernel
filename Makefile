TARGET := build/sk.bin
ELF := $(TARGET:.bin=.elf)

COMPARE ?= 1

CROSS := mips-linux-gnu-

export COMPILER_PATH := tools/egcs/
CC      := $(COMPILER_PATH)gcc

AS      := $(CROSS)as
LD      := $(CROSS)ld
OBJCOPY := $(CROSS)objcopy
OBJDUMP := $(CROSS)objdump
STRIP   := $(CROSS)strip

INC := -I include -I include/PR -I include/sys -I src
CFLAGS := $(INC) -D_MIPS_SZLONG=32 -D_LANGUAGE_C -nostdinc -fno-builtin -fno-PIC -mno-abicalls -mcpu=4300 -G 0 -mgp32 -mips2 -Wall
ASFLAGS := $(INC) -D_MIPS_SZLONG=32 -D_LANGUAGE_ASSEMBLY -nostdinc -fno-PIC -mno-abicalls -mcpu=4300 -G 0 -mips2
OPTFLAGS := -Os -g3

# Source dirs
SRC_DIRS := $(shell find src -type d)
ASM_DIRS := $(shell find asm -type d -not -path "asm/non_matchings*")
# Source files
C_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
S_FILES := $(foreach dir,$(SRC_DIRS) $(ASM_DIRS),$(wildcard $(dir)/*.s))
O_FILES := $(foreach f,$(C_FILES:.c=.o),build/$f) \
           $(foreach f,$(S_FILES:.s=.o),build/$f)

# Create build directories
$(shell mkdir -p build $(foreach dir,$(SRC_DIRS) $(ASM_DIRS),build/$(dir)))

.PHONY: all clean distclean setup

all: $(TARGET)
ifeq ($(COMPARE),1)
	@sha1sum $(TARGET)
	@sha1sum -c sk.sha1
endif

clean:
	$(RM) -r build
	$(MAKE) -C tools clean

distclean: clean
	$(RM) -r expected
	$(MAKE) -C tools distclean

setup:
	$(MAKE) -C tools
	$(MAKE) all COMPARE=1
ifeq (,$(wildcard sk.bin))
	cp $(TARGET) sk.bin
endif
	mkdir -p expected && cp -r build expected/build

$(TARGET): $(ELF)
	$(OBJCOPY) -O binary $< $(@:.bin=.tmp)
	dd if=$(@:.bin=.tmp) of=$@ bs=16K conv=sync status=none
	@$(RM) $(@:.bin=.tmp)

$(ELF): $(O_FILES) sk.lcf undefined_syms.txt
	$(LD) -T sk.lcf -T undefined_syms.txt --defsym start=0x9FC00000 -o $@ -Map $(@:.elf=.map)

build/asm/%.o: asm/%.s
	$(AS) -march=vr4300 --no-pad-sections -I include $< -o $@

build/src/%.o: src/%.s
	$(CC) -x assembler-with-cpp $(ASFLAGS) -c $< -o $@
	@$(STRIP) -N dummy_symbol_ $@
	@$(OBJDUMP) -drz $@ > $(@:.o=.s)

build/src/%.o: src/%.c
	$(CC) $(CFLAGS) $(OPTFLAGS) -c $< -o $@
	@$(STRIP) -N dummy_symbol_ $@
	@$(OBJDUMP) -drz $@ > $(@:.o=.s)
