.text
.globl main
main:
    movq %rsp, %rax
    pushq %rsp
    popq %rdx
    subq %rdx, %rax
    ret
