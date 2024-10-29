.intel_syntax noprefix

.section .text
    mov rax, 1
	cmp rdi, 0
    je exit
loop:
    mov cl, [rdi+rax-1]
    cmp cl, 0
    je exit
    inc rax
    jmp loop

exit:
    dec rax
