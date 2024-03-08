	.file	"ArrayvsPointer.c"
	.text
	.section	.rodata
.LC0:
	.string	"%p\n"
.LC1:
	.string	"Arrays"
.LC2:
	.string	"arr[0] at %p\n"
.LC3:
	.string	"arr[1] at %p\n"
.LC4:
	.string	"arr[2] at %p\n"
.LC5:
	.string	"Pointers"
.LC6:
	.string	"ptr at %p\n"
.LC7:
	.string	"%dth int is %X\n"
.LC8:
	.string	"ptr[0] at %p\n"
.LC9:
	.string	"ptr[1] at %p\n"
.LC10:
	.string	"ptr[2] at %p\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$1, -64(%rbp)
	movl	$2, -60(%rbp)
	movl	$3, -56(%rbp)
	movl	$4, -52(%rbp)
	movl	$5, -48(%rbp)
	movl	$6, -44(%rbp)
	movl	$7, -40(%rbp)
	movl	$8, -36(%rbp)
	movl	$9, -32(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	addq	$36, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	addq	$12, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	addq	$12, %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L2
.L3:
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	$12, %edi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -88(%rbp)
.L2:
	cmpl	$2, -88(%rbp)
	jle	.L3
	movq	-72(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -84(%rbp)
	jmp	.L4
.L5:
	movq	-80(%rbp), %rax
	movq	(%rax), %rdx
	movl	-84(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$8, -80(%rbp)
	addl	$1, -84(%rbp)
.L4:
	cmpl	$2, -84(%rbp)
	jle	.L5
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-72(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-72(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
