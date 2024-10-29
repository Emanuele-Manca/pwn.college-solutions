.intel_syntax noprefix

.section .text
    mov rax, [rdi]
    mov rbx, [rdi+8]
    add rax, rbx
    mov [rsi], rax