#include <stdio.h>

int main() {

// stop GPIO code
__asm__ ("set	0x00000000, %o1\n\t"
	 "set	0x80000b00, %o2\n\t"
	 "st	%o1, [%o2 + 0x04]\n\t");

printf("\nHello\n");
return 0;
}
