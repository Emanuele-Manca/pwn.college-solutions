.intel_syntax noprefix

.section .text
	cmp rdi, 3
    jg default
    jmp [rsi+rdi*8]
default:
    jmp [rsi+0x20]