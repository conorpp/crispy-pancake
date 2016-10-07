#include <system.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/alt_stdio.h>

#include "small_printing.h"
#include "app.h"

#define PLL_RECONFIG_BASE PLL_RECONFIG_0_BASE
#define PLL_RECONFIG(x)   (*((volatile uint32_t *)(PLL_RECONFIG_BASE + (x<<2))))
#define PLL_RESET         *((volatile uint8_t *) 0x0)


uint32_t ntohl(uint32_t l)
{
    return
        ((l & 0xff) << 24) |
        ((l & 0xff00) << 8) |
        ((l & 0xff0000) >> 8) |
        ((l & 0xff000000) >> 24);
}

#define htonl(l) ntohl(l)

void cg_write(void * buf, int len)
{
    write(STDOUT_FILENO,buf,len);
}

void cg_read(void * buf, int len)
{
    int i;
    for (i = 0; i < len; i++)
    {
        ((uint8_t*)buf)[i] = getchar();
    }
}

struct cg_transaction
{
    uint32_t op;
    uint32_t arg1;
    uint32_t arg2;
};

void handle_transaction()
{
    struct cg_transaction a;
    uint32_t ret = 0;
    uint32_t readval, address, data;

    cg_read(&a.op, 4);
    a.op = ntohl(a.op);

    cg_read(&a.arg1, 4);
    a.arg1 = ntohl(a.arg1);

    cg_read(&a.arg2, 4);
    a.arg2 = ntohl(a.arg2);

    s_printx("recv op: ",1,a.op);
    s_printx("recv arg1: ",1,a.arg1);
    s_printx("recv arg2: ",1,a.arg2);

    s_prints("here\r\n");

    address = a.arg1;
    data = a.arg2;


    s_printd("line ",1,__LINE__);
    switch(a.op)
    {
        case CG_RESET_RECONFIG:
            s_prints("CG_START_RECONFIG\r\n");
            // bring PLL to start up
            PLL_RESET = 1;
            PLL_RESET = 0;
            // put in polling mode
            PLL_RECONFIG(0) = 1;
            break;
        case CG_WRITE:
            s_printx("writing ___ to addr ",2,data, PLL_RECONFIG_BASE + address);
            PLL_RECONFIG(address) = data;
            break;
        case CG_READ:

            s_printx("about to read from addr ",1,PLL_RECONFIG_BASE + address);
            readval = PLL_RECONFIG(address);

            s_printx("read ___ from addr ",2,readval, address);
            readval = ntohl(readval);

            cg_write(&ret, 4);
            cg_write(&readval, 4);
            return;

            break;
        default:
            s_prints("error: unknown op\r\n");
            ret = 1;
    }
    s_printd("line ",1,__LINE__);

    ret = htonl(ret);
    cg_write(&ret, 4);
    return;

}

int main()
{

    s_prints("init cg\r\n");
    while(1)
    {
        handle_transaction();
    }
    return 0;
}

