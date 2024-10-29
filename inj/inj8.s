.intel_syntax noprefix

.section .text
    push 0x61                # saving to stack
    mov rdi, rsp
    push 0x7
    pop rsi
    push 90
    pop rax
    syscall

