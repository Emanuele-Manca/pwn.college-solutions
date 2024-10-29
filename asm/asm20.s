.intel_syntax noprefix

.section .text
	mov rax, 0
    mov rbx, 0
loop:
    cmp rbx, rsi
    je exit
    add rax, [rdi+rbx*8]
    inc rbx
    jmp loop
exit:
    div rsi
