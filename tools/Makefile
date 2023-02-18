
.PHONY: all clean distclean

EGCS_DIR := egcs
EGCS-AS := $(EGCS_DIR)/as
EGCS-1.1.2 := $(EGCS_DIR)/gcc

all: $(EGCS-AS) $(EGCS-1.1.2)

clean:
distclean: clean
	$(RM) -rf $(GCC_DIR) $(EGCS_DIR)

# EGCS

$(EGCS-AS): | $(EGCS_DIR)
	wget https://github.com/decompals/mips-binutils-egcs-2.9.5/releases/latest/download/mips-binutils-egcs-2.9.5-linux.tar.gz
	tar xf mips-binutils-egcs-2.9.5-linux.tar.gz -C $(EGCS_DIR)
	$(RM) mips-binutils-egcs-2.9.5-linux.tar.gz

$(EGCS-1.1.2): | $(EGCS_DIR)
	wget https://github.com/decompals/mips-gcc-egcs-2.91.66/releases/latest/download/mips-gcc-egcs-2.91.66-linux.tar.gz
	tar xf mips-gcc-egcs-2.91.66-linux.tar.gz -C $(EGCS_DIR)
	$(RM) mips-gcc-egcs-2.91.66-linux.tar.gz

$(EGCS_DIR):
	mkdir -p $@
