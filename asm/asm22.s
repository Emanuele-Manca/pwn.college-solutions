.intel_syntax noprefix

.section .text
    xor rax, rax      
    mov r13, 0x403000
    cmp rdi, 0
    je end
    
lab3:
    mov bl, [rdi]
    cmp       bl, 0
    je        end
    cmp       bl, 0x5a
    jg        lab1

    push rax
    push rdi
    mov       dil, bl
    call      r13
    pop rdi
    mov       [rdi], al
    pop rax
    inc       rax

lab1:
    inc       rdi
    jmp       lab3
end:
    nop
    ret