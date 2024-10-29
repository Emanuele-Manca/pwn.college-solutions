.intel_syntax noprefix

.section .text
    mov rax, 0
    cmp rdi, 0
    mov r10, 0x403000
    je exit

loop:
    mov bl, [rdi]
    cmp bl, 0
    je exit         # while [src_addr] != 0
    cmp bl, 90
    jg next         # if [src_addr] <= 90

    push rax
    push rdi
    mov dil, bl
    call r10
    pop rdi
    mov [rdi], al
    pop rax
    inc rax

next:
    inc rdi
    jmp loop

exit:
    ret
