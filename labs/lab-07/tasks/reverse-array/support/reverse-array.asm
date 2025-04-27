%include "printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:

	push ARRAY_LEN
	push ARRAY_LEN
	pop ebx
	pop ecx
push_elem:
	dec ebx
	push dword [input + 4 * ebx]
	dec ecx
	jnz push_elem

	push ARRAY_LEN
	push ARRAY_LEN
	pop ebx
	pop ecx
pop_elem:
	dec ebx
	pop dword [input + 4 * ebx]
	dec ebx
	jnz pop_elem

    ; TODO push the elements of the array on the stack
    ; TODO retrieve the elements (pop) from the stack into the output array

    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
