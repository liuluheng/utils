#include <stdio.h>
#include <stdlib.h>

char *itoa(int d, char *buf, int base)
{
    int a = d / base;
    int b = d % base;

    if (a) 
        buf = itoa(a, buf, base);

    *buf++ = b < 10 ? b + '0' : b + '0' + 7;
    *buf = '\0';

    return buf;
}

int main( int argc, char **argv )
{
    if ( argc < 2 ) {
        printf("Usage: %s Decimal\n", argv[0]);
        return -1;
    }
    int d = atoi(argv[1]);

    char buf[12];
    itoa(d, buf, 16);
    printf("0x%s\n", buf);

    return 0;
}

