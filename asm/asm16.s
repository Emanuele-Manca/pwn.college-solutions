.intel_syntax noprefix

.section .text
    xor rax, rax
	add rax, [rsp]
    add rax, [rsp+8]
    add rax, [rsp+8*2]
    add rax, [rsp+8*3]
    mov rbx, 4
    div rbx
    mov [rsp-8], rax

