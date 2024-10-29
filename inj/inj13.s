.intel_syntax noprefix
.section .text

    push 0x62
    mov rdi, rsp
    xor esi, esi
    cdq
    mov al, 0x3b
    syscall