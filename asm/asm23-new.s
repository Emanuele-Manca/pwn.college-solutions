.intel_syntax noprefix
.section .text

    mov rbp, rsp
    sub rsp, 0xffff

    mov rcx, 0  # assegno b
    mov rdx, 0  # assegno i 
    dec si

loop:
    cmp dx, si
    jg end_loop
    mov r8, 0   # azzero r8 per sicurezza
    mov r8b, [rdi+rdx]   # assegno curr_byte
    mov r10, rbp
    shl r8  # molt per 2
    sub r10, r8
    inc word ptr [r10]
    inc rdx
    jmp loop

end_loop:
    mov rcx, 0
    mov r8, 0   # max_freq
    mov r9, 0   # max_f_b

loop_2:
    cmp rcx, 0xff
    jg exit 
    mov r10, rbp
    shl rcx
    sub r10, rcx
    shr rcx
    cmp word ptr [r10], r8w
    jle exit_if
    mov r8w, [r10]
    mov r9b, cl

exit_if:
    inc rcx
    jmp loop_2

exit:
    mov rax, 0
    mov al, r9b

    mov rsp, rbp
    ret
