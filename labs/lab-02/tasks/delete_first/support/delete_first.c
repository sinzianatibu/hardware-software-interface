// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "delete_first.h"

char* delete_first(char *s, char *pattern)
{
	char *p = strstr(s, pattern);
	if(p) {
		size_t pattern_len = strlen(pattern);
		memcpy(p, p + pattern_len, strlen(p + pattern_len));

	}
	
}
