.intel_syntax noprefix

.section .text
    xor rax, rax
    or rax, 0x1
    and rax, rdi
    xor rax, 0x1