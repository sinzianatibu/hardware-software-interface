// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "find_max.h"

void *find_max(void *arr, int n, size_t element_size,
				int (*compare)(const void *, const void *))
{
	void *max_elem = arr;

	for (int i = 0; i < n; i++) {
		void *current_elem = (char *)arr + i * element_size;
		if (compare(current_elem, max_elem) > 0) {
			max_elem = current_elem;
		}
	}

	return max_elem;
}

int compare(const void *a, const void *b)
{
	return (*(int *)a - *(int *)b);
}
