#include <system.h>
#include <stdio.h>
#include <stdint.h>
#include <sys/alt_stdio.h>

#include "small_printing.h"

int main()
{

    s_prints("hello, world s \r\n");
    s_printl("hello, world d ",1,5320);
    s_printd("hello, world d ",1,5320);
    s_printx("hello, world x ",1,0x5320);
    s_printb("hello, world b ",2,0x53,0x20);
    while(1)
    {
        char c = getchar();
        putf(c);
    }
    return 0;
}

