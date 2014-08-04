#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <string.h>

int atod( char* s ) {
    int v = 0;
    int sign = 0;

    while ( ( *s == ' ' ) || ( ( unsigned int )( *s - 9 ) < 5u ) ) {
        ++s;
    }

    switch ( *s ) {
        case '-' : sign = -1;
        case '+' : ++s;
    }

tag:

    while ( ( unsigned int )( *s - '0' ) < 10u ) {
        v = v * 16 + *s - '0';
        ++s;
    }

    if ( isalpha(*s) ) {
        if ( isupper(*s) ) {
            *s -= 7;
            v = v * 16 + *s - '0';
            ++s;
            goto tag;
        }
        else {
            *s -= 39;
            v = v * 16 + *s - '0';
            ++s;
            goto tag;
        }
    }

    return sign ? -v : v;
}

int main( int argc, char **argv )
{
    if ( argc < 2 ) {
        printf("Usage: %s Hex\n", argv[0]);
        return -1;
    }
    char *h = argv[1];
    int num = atod(h);

    /*
    int i = 0;
    int record = len;

    while (record--) {
        char c = h[len - i];
        if ( isalpha(c) ) {
            if ( isupper(c) ) {
                char cb = c - 7;
                num += atoi(&cb) * pow(16, i);
            }
            else {
                char cb = c - 39; 
                num += atoi(&c) * pow(16, i);
            }

            i++;
            continue;
        }
        num += atoi(c) * pow(16, i);
        i++;
    }
    */

    printf("%d\n", num);

    return 0;
}

