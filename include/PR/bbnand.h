#ifndef BB_NAND_H
#define BB_NAND_H

#include "bcp.h"

#define NAND_BYTES_PER_PAGE     0x200
#define NAND_PAGE_SPARE_SIZE    0x10
#define NAND_PAGES_PER_BLOCK    32
#define NAND_BYTES_PER_BLOCK    (NAND_PAGES_PER_BLOCK * NAND_BYTES_PER_PAGE)

#define NAND_BLOCK_TO_PAGE(blockNum) ((blockNum) * NAND_PAGES_PER_BLOCK)
#define NAND_PAGE_TO_ADDR(pageNum) ((pageNum) * NAND_BYTES_PER_PAGE)
#define NAND_BLOCK_TO_ADDR(pageNum) ((pageNum) * NAND_BYTES_PER_BLOCK)

/* NAND Command IDs */
#define NAND_CMD_READ_0         0x00
#define NAND_CMD_READ_1         0x01
#define NAND_CMD_READ_2         0x50
#define NAND_CMD_READ_ID        0x90
#define NAND_CMD_RESET          0xFF
#define NAND_CMD_FILL_PAGE      0x80
#define NAND_CMD_WRITE_PAGE     0x10
#define NAND_CMD_DUMMY_PAGE     0x11
#define NAND_CMD_DUMMY_READ     0x03
#define NAND_CMD_COPY_BACK      0x8A
#define NAND_CMD_ERASE_PAGE     0x60
#define NAND_CMD_EXEC_ERASE     0xD0
#define NAND_CMD_READ_STATUS    0x70
#define NAND_CMD_READ_STATUS_MP 0x71

#define NAND_READ_0(nBytes, bufSelect, device, doEcc, intrDone)                               \
   (NAND_CTRL_EXEC | ((intrDone) ? NAND_CTRL_INTR : 0) |                                      \
    NAND_CTRL_UNK28 | NAND_CTRL_UNK27 | NAND_CTRL_UNK26 | NAND_CTRL_UNK25 | NAND_CTRL_UNK24 | \
    NAND_CTRL_CMD(NAND_CMD_READ_0) |                                                          \
    NAND_CTRL_UNK15 | NAND_CTRL_BUFSEL(bufSelect) | NAND_CTRL_DEVICE(device) |                \
    ((doEcc) ? NAND_CTRL_ECC : 0) | NAND_CTRL_XFER_LEN(nBytes))

#endif
