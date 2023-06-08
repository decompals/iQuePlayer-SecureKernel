#include "bbtypes.h"
#include "bcp.h"

char aEntering_excep[] = "ENTERING_EXCEPTION HANDLER!!!\n";

typedef void (*ExceptionCallback)(const char*);

void func_9FC03ED0(ExceptionCallback cb) {
    cb((char*)PHYS_TO_K1(aEntering_excep));
    IO_WRITE(PI_MISC_REG, 0x30);
    while(1);
}
