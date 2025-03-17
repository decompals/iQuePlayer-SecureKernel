#include "bbtypes.h"
#include "bcp.h"

char enter_exception_str[] = "ENTERING_EXCEPTION HANDLER!!!\n";

typedef void (*ExceptionCallback)(const char*);

void exception_handler_trampoline(ExceptionCallback cb) {
    cb((char*)PHYS_TO_K1(enter_exception_str));
    // Power off
    IO_WRITE(PI_GPIO_REG, (PI_GPIO_O_PWR | PI_GPIO_PWR_OFF) | (PI_GPIO_O_LED | PI_GPIO_LED_ON));
    while (1) {
        ;
    }
}
