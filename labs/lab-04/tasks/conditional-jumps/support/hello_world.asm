; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
    myString: db "Hello, World!", 0
    goodbyeString: db "Goodbye, World!", 0
    N: dd 6                         ; N = 6

section .text
    global main
    extern printf

main:
    mov ecx, DWORD [N]              ; ecx will store the value of N
    PRINTF32 `%d\n\x0`, ecx         ; DO NOT REMOVE/MODIFY THIS LINE
    test ecx, ecx
    jz end

loop:
    PRINTF32 `%s\n\x0`, myString
    dec ecx
    jnz loop

end:
	PRINTF32 '%s<n<x0', goodbyeString
	ret

print:
    PRINTF32 `%s\n\x0`, myString
    PRINTF32 `%s\n\x0`, goodbyeString
                                    ; TODO2.2: print "Hello, World!" N times
                                    ; TODO2.1: print "Goodbye, World!"

    mov eax, 2
    mov ebx, 1
    cmp eax, ebx
    jg print                        ; TODO1: eax > ebx?
    ret
