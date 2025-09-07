// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "rotate.h"

void rotate_left(unsigned int *number, int bits)
{
	unsigned int mask = -1;

	mask <<= (sizeof(*number) * 8 - bits);
	mask &= (*number);
	mask >>= (sizeof(*number) * 8 - bits);
	(*number) <<= bits;
	(*number) |= mask;
}

void rotate_right(unsigned int *number, int bits)
{
	unsigned int mask = -1;

        mask >>= (sizeof(*number) * 8 - bits);
        mask &= (*number);
        mask <<= (sizeof(*number) * 8 - bits);
        (*number) >>= bits;
        (*number) |= mask;

}
