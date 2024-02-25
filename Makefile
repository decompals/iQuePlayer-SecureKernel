TARGET := build/sk.bin
ELF := $(TARGET:.bin=.elf)

COMPARE ?= 1
ORIG_COMPILER ?= 1 # switch to 0 for modern GCC

CROSS := mips-linux-gnu-

INC := -I include -I include/PR -I include/sys -I src

# use env so we can use host cpp instead of ancient egcs cpp that doesn't work
CPP := env COMPILER_PATH= cpp
CPPFLAGS := -x c -fno-dollars-in-identifiers -P

ifeq ($(ORIG_COMPILER), 0)
  COMPARE := 0
  CC      := $(CROSS)gcc
  CFLAGS  := $(INC) -G 0 -nostdinc -DNON_MATCHING -std=gnu99 -march=vr4300 -mtune=vr4300 -fno-PIC -mno-abicalls -mips3 -ffunction-sections -fdata-sections -mgp32 -fno-common -fno-builtin -ffreestanding
  ASFLAGS := $(INC) -G 0 -nostdinc -DNON_MATCHING -std=gnu99 -march=vr4300 -mtune=vr4300 -fno-PIC -mno-abicalls -mips3

  CFLAGS  += -Wall -Wextra -pedantic
  CPPFLAGS += -DNON_MATCHING

  LD      := $(CC)
  LDFLAGS  = -nostdlib -Wl,--gc-sections -Wl,-Map,$(@:.elf=.map)# -Wl,--print-gc-sections
else
  export COMPILER_PATH := tools/egcs/
  CC      := $(COMPILER_PATH)gcc
  CFLAGS  := $(INC) -G 0 -nostdinc -D_MIPS_SZLONG=32 -mcpu=4300 -fno-PIC -mno-abicalls -mips2 -mgp32 -fno-builtin
  ASFLAGS := $(INC) -G 0 -nostdinc -D_MIPS_SZLONG=32 -mcpu=4300 -fno-PIC -mno-abicalls -mips2

  CFLAGS  += -Wall

  LD      := $(CROSS)ld
  LDFLAGS  = -Map $(@:.elf=.map)
endif

CFLAGS += -D_LANGUAGE_C
ASFLAGS += -D_LANGUAGE_ASSEMBLY

OPTFLAGS := -Os -g3

AS      := $(CROSS)as
OBJCOPY := $(CROSS)objcopy
OBJDUMP := $(CROSS)objdump
STRIP   := $(CROSS)strip

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
	dd if=$(@:.bin=.tmp) of=$@ bs=64K conv=sync status=none
	@$(RM) $(@:.bin=.tmp)

build/sk.lcf: sk.lcf
	$(CPP) $(CPPFLAGS) $< -o $@

$(ELF): $(O_FILES) build/sk.lcf
	$(LD) $(LDFLAGS) -T build/sk.lcf -o $@

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
