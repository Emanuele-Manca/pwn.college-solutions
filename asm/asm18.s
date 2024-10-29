.intel_syntax noprefix

.section .text
    mov ebx, [rdi]
    mov eax, [rdi+4]
    cmp ebx, 0x7f454c46
    jne second
    add eax, [rdi+8]
    add eax, [rdi+12]
    jmp exit
second:
    cmp ebx, 0x00005A4D
    jne third
    sub eax, [rdi+8]
    sub eax, [rdi+12]
    jmp exit
third:
    imul eax, [rdi+8]
    imul eax, [rdi+12]
exit:
    nop