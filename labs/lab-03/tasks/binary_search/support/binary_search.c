// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "binary_search.h"

int binary_search(int *v, int len, int dest)
{
	int start = 0;
	int end = len - 1;
	int middle;

	loop:
	middle = start + (end - start) / 2;
	if (v[middle] == dest) goto found;
	if (v[middle] < dest) goto search;
	end = middle - 1;
	goto loop;

	search:
		start = middle + 1;
		goto loop;

	found:
		return middle;

	return -1;
}
