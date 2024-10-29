.intel_syntax noprefix
.section .text

    jmp salto

    .skip 0x4f,144

    salto:
        pop rdi
        mov rax, 0x403000
        jmp rax
