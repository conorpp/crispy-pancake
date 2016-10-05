#include <system.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/alt_stdio.h>

#include "small_printing.h"

uint32_t ntohl(uint32_t l)
{
    return 
        ((l & 0xff) << 24) |
        ((l & 0xff00) << 8) |
        ((l & 0xff0000) >> 8) |
        ((l & 0xff000000) >> 24);
}

void cg_write(uint8_t * buf, int len)
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

struct ava_transaction
{
    uint32_t address;
    uint32_t data;
};

void handle_uart2ava()
{
    struct ava_transaction a;
    cg_read(&a.address, 4);
    a.address = ntohl(a.address);
    cg_read(&a.data, 4);
    a.data = ntohl(a.data);

    s_printx("recv addr: ",1,a.address);
    s_printx("recv data: ",1,a.data);
}

int main()
{
    while(1)
    {
        handle_uart2ava();
    }
    return 0;
}

