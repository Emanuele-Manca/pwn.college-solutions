global _start
section .text

_start:
    push      rbp
    mov       rbp, rsp
    sub       rsp, 0xffff
    mov       rbx, -1
    add       rbx, 1
    cmp       rbx, rsi
    je        0x400024
    mov       cl, [rdi + rbx]
    add        [rsp + rcx], 1
    jmp       0x400012
    mov       rbx, -1
    xor       rcx, rcx
    xor       rdx, rdx
    add       rbx, 1
    cmp       rbx, 0xffff
    je        0x40004b
    cmp       [rsp + rbx], cl
    jle       0x400031
    mov       cl,[rsp + rbx]
    mov       rdx, rbx
    jmp       0x400031
    mov       rax, rdx
    mov       rsp, rbp
    pop       rbp
    ret