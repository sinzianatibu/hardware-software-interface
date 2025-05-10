; SPDX-License-Identifier: BSD-3-Clause

section .text

global get_max

get_max:
    push rbp
    mov rbp, rsp

    ; [rbp+16] is array pointer
    ; [rbp+24] is array length

    mov rbx, rdi
    mov rcx, rsi
    xor rax, rax	; max = 0
    xor rdx, rdx	; i = 0

.loop:
    cmp rdx, rcx
    jge .done

    mov edi, [rbx + rcx*4]
    cmp rax, edi
    cmovl rax, edi

    inc edx
    jmp .loop

.done:
    pop rbp

    leave
    ret
