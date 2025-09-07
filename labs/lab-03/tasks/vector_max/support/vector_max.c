// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "vector_max.h"

int vector_max(int *v, int len)
{
	int max;
	unsigned int i=0;
	
	if (len <= 0) goto end;

	max = v[0];
	i = 1;

	loop:
		if (i >= len) goto end;
		if (v[i] <= max) goto next;
		max = v[i];

	next:
		i++;
		goto loop;
	end:
		return max;

	return -1;
}
