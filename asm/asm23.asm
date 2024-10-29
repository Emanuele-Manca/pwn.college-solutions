global _start
section .text

_start:
most_common_byte :
;rdi = scr_ass , rsi = size

    xor rbx,rbx ; b=0
    xor rcx,rcx ; i = 0

    xor rax,rax 
    xor rdx,rdx
    xor r8,r8

    mov rbp,rsp ; salvo lo stack
    ;sub rsp, 0x128
    sub rsp, rsi

loop_1 :
    cmp rcx,rsi ; i<=size
    je end_1
    xor rdx,rdx
    mov dl, byte [rdi+rcx] ;curr_byte = [src_addr+i]
    neg rdx ; -curr_byte
    add byte [rbp+rdx],1 ; inc [stack-base-curr_byte]
    add rcx, 1 ;inc i
    jmp loop_1

end_1:

    xor rbx, rbx ;b=0
    xor rcx,rcx ;max_freq
    xor rbx,rbx ;max_freq_byte

    add rbx, 0x1

loop_2:
    cmp rbx,0xff
    jg end_2

    mov r8,rbx
    neg r8 ; -b
    cmp byte [rbp+r8],cl
    jle if
    mov cl, byte [rbp+r8]
    mov rax ,rbx ; valore di ritorno
if:
    add rbx,1
    jmp loop_2

end_2:
    mov rsp,rbp
    ret