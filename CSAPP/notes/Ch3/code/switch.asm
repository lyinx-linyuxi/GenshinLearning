	.file	"switch.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"hello world"
.LC1:
	.string	"hello"
.LC2:
	.string	"world"
	.text
	.globl	swtch
	.type	swtch, @function
swtch:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testl	%edi, %edi
	je	.L2
	cmpl	$1000, %edi
	je	.L3
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L1
.L2:
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L1
	.cfi_endproc
.LFE24:
	.size	swtch, .-swtch
	.section	.rodata.str1.1
.LC3:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	leaq	.LC3(%rip), %rdi
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %edi
	call	swtch
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L11
	movl	$0, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
