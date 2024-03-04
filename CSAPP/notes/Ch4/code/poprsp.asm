.text
.globl main
main:
    movq %rsp, %rdi
    pushq $0xabcd
    popq %rsp
    movq %rsp, %rax
    movq %rdi, %rsp
    ret
